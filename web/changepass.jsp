<div class="col-md-4 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <s:form action="changePass" onsubmit="return checkChangePass()">
                                        <s:hidden name="username" value="%{#session.USERNAME}"/>
                                        
                                        <span class="text-success"><s:property value="%{#request.SUCCESS}"/></span>
                                        
                                        <div class="form-group">
                                            <s:password name="oldpassword" cssClass="form-control" 
                                                        placeholder="Old Password"/>
                                            <span class="text-danger"><s:property value="%{#request.ERROR}"/></span>
                                        </div>
                                        <div class="form-group">
                                            <s:password name="newpassword" cssClass="form-control" 
                                                        placeholder="New Password"/>
                                        </div>
                                        <div class="form-group">
                                            <s:password name="confirm" cssClass="form-control" 
                                                        placeholder="Confirm Password"/>
                                        </div>
                                        <button type="submit" class="btn btn-info btn-block">
                                            Change
                                        </button>
                                    </s:form>
                                </div>
                            </div>
                        </div>