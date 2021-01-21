#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# get active source.
clip2 = GetActiveSource()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [844, 369]

# hide data in view
Hide(clip2, renderView1)

# find source
deformed_Plot_ = FindSource('Deformed_Plot_*')

# set active source
SetActiveSource(deformed_Plot_)

# get color transfer function/color map for 'materials'
materialsLUT = GetColorTransferFunction('materials')

# get opacity transfer function/opacity map for 'materials'
materialsPWF = GetOpacityTransferFunction('materials')

# show data in view
deformed_Plot_Display = Show(deformed_Plot_, renderView1)
# trace defaults for the display properties.
deformed_Plot_Display.Representation = 'Point Gaussian'
deformed_Plot_Display.ColorArrayName = ['POINTS', 'materials']
deformed_Plot_Display.LookupTable = materialsLUT
deformed_Plot_Display.OSPRayScaleArray = 'landmarks'
deformed_Plot_Display.OSPRayScaleFunction = 'PiecewiseFunction'
deformed_Plot_Display.SelectOrientationVectors = 'None'
deformed_Plot_Display.ScaleFactor = 33.194880000000005
deformed_Plot_Display.SelectScaleArray = 'None'
deformed_Plot_Display.GlyphType = 'Arrow'
deformed_Plot_Display.GlyphTableIndexArray = 'None'
deformed_Plot_Display.DataAxesGrid = 'GridAxesRepresentation'
deformed_Plot_Display.PolarAxes = 'PolarAxesRepresentation'
deformed_Plot_Display.ScalarOpacityFunction = materialsPWF
deformed_Plot_Display.ScalarOpacityUnitDistance = 562.3912189228064
deformed_Plot_Display.GaussianRadius = 8.298720000000001
deformed_Plot_Display.SetScaleArray = ['POINTS', 'landmarks']
deformed_Plot_Display.ScaleTransferFunction = 'PiecewiseFunction'
deformed_Plot_Display.OpacityArray = ['POINTS', 'landmarks']
deformed_Plot_Display.OpacityTransferFunction = 'PiecewiseFunction'

# show color bar/color legend
deformed_Plot_Display.SetScalarBarVisibility(renderView1, True)

# reset view to fit data
renderView1.ResetCamera()

# set active source
SetActiveSource(deformed_Plot_)

# hide data in view
Hide(deformed_Plot_, renderView1)

# set active source
SetActiveSource(deformed_Plot_)

# show data in view
deformed_Plot_Display = Show(deformed_Plot_, renderView1)

# show color bar/color legend
deformed_Plot_Display.SetScalarBarVisibility(renderView1, True)

# reset view to fit data
renderView1.ResetCamera()

# show data in view
deformed_Plot_Display = Show(deformed_Plot_, renderView1)

# reset view to fit data
renderView1.ResetCamera()

# show color bar/color legend
deformed_Plot_Display.SetScalarBarVisibility(renderView1, True)

# find source
clip1 = FindSource('Clip1')

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Clip'
clip3 = Clip(Input=deformed_Plot_)
clip3.ClipType = 'Plane'
clip3.Scalars = ['POINTS', 'landmarks']
clip3.Value = 0.5

# Properties modified on clip3.ClipType
clip3.ClipType.Normal = [0.0, 1.0, 0.0]

# Properties modified on clip3.ClipType
clip3.ClipType.Normal = [0.0, 1.0, 0.0]

# show data in view
clip3Display = Show(clip3, renderView1)
# trace defaults for the display properties.
clip3Display.Representation = 'Surface'
clip3Display.ColorArrayName = ['POINTS', 'materials']
clip3Display.LookupTable = materialsLUT
clip3Display.OSPRayScaleArray = 'landmarks'
clip3Display.OSPRayScaleFunction = 'PiecewiseFunction'
clip3Display.SelectOrientationVectors = 'None'
clip3Display.ScaleFactor = 33.149840000000005
clip3Display.SelectScaleArray = 'None'
clip3Display.GlyphType = 'Arrow'
clip3Display.GlyphTableIndexArray = 'None'
clip3Display.DataAxesGrid = 'GridAxesRepresentation'
clip3Display.PolarAxes = 'PolarAxesRepresentation'
clip3Display.ScalarOpacityFunction = materialsPWF
clip3Display.ScalarOpacityUnitDistance = 25.326629224949492
clip3Display.GaussianRadius = 16.574920000000002
clip3Display.SetScaleArray = ['POINTS', 'landmarks']
clip3Display.ScaleTransferFunction = 'PiecewiseFunction'
clip3Display.OpacityArray = ['POINTS', 'landmarks']
clip3Display.OpacityTransferFunction = 'PiecewiseFunction'

# show color bar/color legend
clip3Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# hide data in view
Hide(deformed_Plot_, renderView1)

# create a new 'Clip'
clip4 = Clip(Input=clip3)
clip4.ClipType = 'Plane'
clip4.Scalars = ['POINTS', 'landmarks']
clip4.Value = 0.5

# init the 'Plane' selected for 'ClipType'
clip4.ClipType.Origin = [-0.05119999999999436, 80.13712771850001, 0.2744]

# Properties modified on clip4.ClipType
clip4.ClipType.Origin = [-0.05119999999999436, 32.570687546706864, 0.2744]
clip4.ClipType.Normal = [0.0, 1.0, 0.0]

# Properties modified on clip4.ClipType
clip4.ClipType.Origin = [-0.05119999999999436, 32.570687546706864, 0.2744]
clip4.ClipType.Normal = [0.0, 1.0, 0.0]

# show data in view
clip4Display = Show(clip4, renderView1)
# trace defaults for the display properties.
clip4Display.Representation = 'Surface'
clip4Display.ColorArrayName = ['POINTS', 'materials']
clip4Display.LookupTable = materialsLUT
clip4Display.OSPRayScaleArray = 'landmarks'
clip4Display.OSPRayScaleFunction = 'PiecewiseFunction'
clip4Display.SelectOrientationVectors = 'None'
clip4Display.ScaleFactor = 32.07164
clip4Display.SelectScaleArray = 'None'
clip4Display.GlyphType = 'Arrow'
clip4Display.GlyphTableIndexArray = 'None'
clip4Display.DataAxesGrid = 'GridAxesRepresentation'
clip4Display.PolarAxes = 'PolarAxesRepresentation'
clip4Display.ScalarOpacityFunction = materialsPWF
clip4Display.ScalarOpacityUnitDistance = 27.01719488823173
clip4Display.GaussianRadius = 16.03582
clip4Display.SetScaleArray = ['POINTS', 'landmarks']
clip4Display.ScaleTransferFunction = 'PiecewiseFunction'
clip4Display.OpacityArray = ['POINTS', 'landmarks']
clip4Display.OpacityTransferFunction = 'PiecewiseFunction'

# hide data in view
Hide(clip3, renderView1)

# show color bar/color legend
clip4Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# Properties modified on clip4
clip4.InsideOut = 1

# update the view to ensure updated data information
renderView1.Update()

# change representation type
clip4Display.SetRepresentationType('Point Gaussian')

# Properties modified on clip4Display
clip4Display.GaussianRadius = 8.287460000000001

# Properties modified on clip4Display
clip4Display.GaussianRadius = 5.801222

# set active source
SetActiveSource(clip3)

# show data in view
clip3Display = Show(clip3, renderView1)

# show color bar/color legend
clip3Display.SetScalarBarVisibility(renderView1, True)

# hide data in view
Hide(clip3, renderView1)

# set active source
SetActiveSource(clip2)

# show data in view
clip2Display = Show(clip2, renderView1)
# trace defaults for the display properties.
clip2Display.Representation = 'Point Gaussian'
clip2Display.ColorArrayName = ['POINTS', 'materials']
clip2Display.LookupTable = materialsLUT
clip2Display.OSPRayScaleArray = 'landmarks'
clip2Display.OSPRayScaleFunction = 'PiecewiseFunction'
clip2Display.SelectOrientationVectors = 'None'
clip2Display.ScaleFactor = 31.623440000000002
clip2Display.SelectScaleArray = 'None'
clip2Display.GlyphType = 'Arrow'
clip2Display.GlyphTableIndexArray = 'None'
clip2Display.DataAxesGrid = 'GridAxesRepresentation'
clip2Display.PolarAxes = 'PolarAxesRepresentation'
clip2Display.ScalarOpacityFunction = materialsPWF
clip2Display.ScalarOpacityUnitDistance = 26.247163511048097
clip2Display.GaussianRadius = 8.820501250000001
clip2Display.SetScaleArray = ['POINTS', 'landmarks']
clip2Display.ScaleTransferFunction = 'PiecewiseFunction'
clip2Display.OpacityArray = ['POINTS', 'landmarks']
clip2Display.OpacityTransferFunction = 'PiecewiseFunction'

# show color bar/color legend
clip2Display.SetScalarBarVisibility(renderView1, True)

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-66.89791218874055, 262.23647242359795, -1052.209210803708]
renderView1.CameraViewUp = [0.16987533022226858, 0.9586964627848904, 0.22813036717108567]
renderView1.CameraParallelScale = 281.1956094614032

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).