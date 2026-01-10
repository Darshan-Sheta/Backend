package com.spring.codeamigosbackend.analysis.controller;

import com.spring.codeamigosbackend.analysis.dto.DeveloperEvaluation;
import com.spring.codeamigosbackend.analysis.service.GithubAnalysisService;
import com.spring.codeamigosbackend.registration.model.User;
import com.spring.codeamigosbackend.registration.repository.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/analysis")
@RequiredArgsConstructor
public class GithubAnalysisController {

    private final GithubAnalysisService githubAnalysisService;
    private final UserRepository userRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @GetMapping("/github/{username}")
    public ResponseEntity<?> analyzeGithubProfile(@PathVariable String username) {
        try {
            // First, check if analysis exists in database
            Optional<User> userOpt = userRepository.findByGithubUsername(username);
            
            if (userOpt.isPresent() && userOpt.get().getGeminiAnalysis() != null 
                    && !userOpt.get().getGeminiAnalysis().trim().isEmpty()) {
                // Return cached analysis from database
                System.out.println("Returning cached Gemini analysis for: " + username);
                DeveloperEvaluation cachedEval = objectMapper.readValue(
                    userOpt.get().getGeminiAnalysis(), 
                    DeveloperEvaluation.class
                );
                return ResponseEntity.ok(cachedEval);
            }

            // If not found in DB, generate new analysis
            System.out.println("Generating new Gemini analysis for: " + username);
            DeveloperEvaluation evaluation = githubAnalysisService.analyzeDeveloper(username);
            
            // Store in database if user exists
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                String analysisJson = objectMapper.writeValueAsString(evaluation);
                user.setGeminiAnalysis(analysisJson);
                userRepository.save(user);
                System.out.println("Stored Gemini analysis in database for: " + username);
            }
            
            return ResponseEntity.ok(evaluation);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Analysis failed: " + e.getMessage());
        }
    }
}
