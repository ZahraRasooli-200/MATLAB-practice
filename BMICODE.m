classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure              matlab.ui.Figure
        Label_2               matlab.ui.control.Label
        yourstatusLabel       matlab.ui.control.Label
        Label                 matlab.ui.control.Label
        yourBMILabel          matlab.ui.control.Label
        Button                matlab.ui.control.Button
        unitweight            matlab.ui.control.DropDown
        unitsDropDown_2Label  matlab.ui.control.Label
        unitheight            matlab.ui.control.DropDown
        unitsDropDownLabel    matlab.ui.control.Label
        WeightEditField       matlab.ui.control.NumericEditField
        WeightEditFieldLabel  matlab.ui.control.Label
        heightEditField       matlab.ui.control.NumericEditField
        heightEditFieldLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button
        function ButtonPushed(app, event)
            height = app.heightEditField.Value;
            heightunit = app.unitheight.Value;
            weight = app.WeightEditField.Value;
            weightunit = app.unitweight.Value;

            switch heightunit
                case 'm'
                    height_m = height;
                case 'cm'
                    height_m = height/100;
                case 'in'
                    height_m = height*0.0254; % in = 0.0254m
            end

            switch weightunit
                case 'lb'
                    weight_kg = weight/2.20462;
                case 'kg'
                    weight_kg = weight;
            end

            BMI = weight_kg/height_m^2;
            
            if BMI < 18.5
                status = 'Underweight';
            elseif BMI >= 18.5 && BMI < 25
                status = 'Normal';
            elseif BMI >= 25 && BMI < 30 
                status = 'Overweight';
            else 
                status = 'Obese';
            end
            app.Label.Text = sprintf('%2f',BMI);
            app.Label_2.Text = status;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create heightEditFieldLabel
            app.heightEditFieldLabel = uilabel(app.UIFigure);
            app.heightEditFieldLabel.HorizontalAlignment = 'right';
            app.heightEditFieldLabel.Position = [58 409 38 22];
            app.heightEditFieldLabel.Text = 'height';

            % Create heightEditField
            app.heightEditField = uieditfield(app.UIFigure, 'numeric');
            app.heightEditField.Limits = [0 Inf];
            app.heightEditField.Position = [121 408 100 22];

            % Create WeightEditFieldLabel
            app.WeightEditFieldLabel = uilabel(app.UIFigure);
            app.WeightEditFieldLabel.HorizontalAlignment = 'right';
            app.WeightEditFieldLabel.Position = [64 373 42 22];
            app.WeightEditFieldLabel.Text = 'Weight';

            % Create WeightEditField
            app.WeightEditField = uieditfield(app.UIFigure, 'numeric');
            app.WeightEditField.Position = [121 373 100 22];

            % Create unitsDropDownLabel
            app.unitsDropDownLabel = uilabel(app.UIFigure);
            app.unitsDropDownLabel.HorizontalAlignment = 'right';
            app.unitsDropDownLabel.Position = [386 408 30 22];
            app.unitsDropDownLabel.Text = 'units';

            % Create unitheight
            app.unitheight = uidropdown(app.UIFigure);
            app.unitheight.Items = {'m', 'cm', 'in'};
            app.unitheight.Position = [431 408 100 22];
            app.unitheight.Value = 'm';

            % Create unitsDropDown_2Label
            app.unitsDropDown_2Label = uilabel(app.UIFigure);
            app.unitsDropDown_2Label.HorizontalAlignment = 'right';
            app.unitsDropDown_2Label.Position = [386 373 30 22];
            app.unitsDropDown_2Label.Text = 'units';

            % Create unitweight
            app.unitweight = uidropdown(app.UIFigure);
            app.unitweight.Items = {'kg', 'lb'};
            app.unitweight.Position = [431 373 100 22];
            app.unitweight.Value = 'kg';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [271 289 100 22];

            % Create yourBMILabel
            app.yourBMILabel = uilabel(app.UIFigure);
            app.yourBMILabel.Position = [238 230 56 22];
            app.yourBMILabel.Text = 'your BMI:';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.Position = [370 230 48 22];
            app.Label.Text = '.............';

            % Create yourstatusLabel
            app.yourstatusLabel = uilabel(app.UIFigure);
            app.yourstatusLabel.Position = [232 188 67 22];
            app.yourstatusLabel.Text = 'your status:';

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.Position = [358 188 141 22];
            app.Label_2.Text = '........................';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end