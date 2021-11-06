function edge_image = edge_detection(threshold, filtered_image)

[rr, cc] = size(filtered_image);
    % Initialization of the matrix
    edge_image = zeros(rr, cc); 
    
    % Scan along each row and coloumn, record an edge point at the location of the zerocrossing
    for i = 2:rr
        for j= 2:cc-1
            % Transition {+,-}
            if (filtered_image(i,j) > 0 && filtered_image(i, j+1) < 0)
                if (abs(filtered_image(i,j)-filtered_image(i,j+1))) > threshold
                    edge_image(i,j)=1;
                end
                % Transition {-,+}
            elseif (filtered_image(i,j) < 0 && filtered_image(i, j+1) > 0)
                if (abs(filtered_image(i,j)-filtered_image(i,j+1))) > threshold
                    edge_image(i,j)=1;
                end
            elseif(filtered_image(i,j)==0)
                %Transition{+,0,-}
                if (filtered_image(i,j-1) > 0 && filtered_image(i, j+1) < 0)
                    if (abs(filtered_image(i,j-1)-filtered_image(i,j+1))) > threshold
                        edge_image(i,j)=1;
                    end
                    
                % Transition {-,0,+}
                elseif (filtered_image(i,j-1) < 0 && filtered_image(i, j+1) > 0)
                    if (abs(filtered_image(i,j-1)-filtered_image(i,j+1))) > threshold
                        edge_image(i,j)=1;
                    end
                end
            end
        end
    end
    
    
    for i = 2:rr-1
        for j= 2:cc
            % Transition {+,-}
            if (filtered_image(i,j) > 0 && filtered_image(i+1, j) < 0)
                if (abs(filtered_image(i,j)-filtered_image(i+1,j))) > threshold
                    edge_image(i,j)=1;
                end
                % Transition {-,+}
            elseif (filtered_image(i,j) < 0 && filtered_image(i+1, j) > 0)
                if (abs(filtered_image(i,j)-filtered_image(i+1,j))) > threshold
                    edge_image(i,j)=1;
                end
            elseif(filtered_image(i,j)==0)
                %Transition{+,0,-}
                if (filtered_image(i,j-1) > 0 && filtered_image(i+1, j) < 0)
                    if (abs(filtered_image(i-1,j)-filtered_image(i+1,j))) > 0
                        edge_image(i,j)=1;
                    end
                    
                % Transition {-,0,+}
                elseif (filtered_image(i-1,j) < 0 && filtered_image(i+1, j) > 0)
                    if (abs(filtered_image(i-1,j)-filtered_image(i+1,j))) > threshold
                        edge_image(i,j)=1;
                    end
                end
            end
        end
    end
end