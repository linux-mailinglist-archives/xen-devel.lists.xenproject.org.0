Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07C91AC01
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 17:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750235.1158491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMrU0-0005PS-DN; Thu, 27 Jun 2024 15:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750235.1158491; Thu, 27 Jun 2024 15:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMrU0-0005NC-Ag; Thu, 27 Jun 2024 15:56:24 +0000
Received: by outflank-mailman (input) for mailman id 750235;
 Thu, 27 Jun 2024 15:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCyE=N5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMrTz-0005N6-16
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 15:56:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc5a54c2-349d-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 17:56:21 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2480F4EE073C;
 Thu, 27 Jun 2024 17:56:21 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cc5a54c2-349d-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Thu, 27 Jun 2024 17:56:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 402e4732
In-Reply-To: <5be12b37-ddc6-4bce-a25d-758682d8f0fe@suse.com>
References: <667d6d349798_2fbca341149a@gitlab-sidekiq-catchall-v2-57c8c99f7-ll4tl.mail>
 <5be12b37-ddc6-4bce-a25d-758682d8f0fe@suse.com>
Message-ID: <a1f8694a25db131fe20aded06651841b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-27 17:07, Jan Beulich wrote:
> On 27.06.2024 15:46, GitLab wrote:
>> 
>> 
>> Pipeline #1350627221 has failed!
>> 
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging 
>> )
>> 
>> Commit: 402e4732 ( 
>> https://gitlab.com/xen-project/xen/-/commit/402e473249cf62dd4c6b3b137aa845db0fe1453a 
>> )
>> Commit Message: x86/traps: address violations of MISRA C Rule 2...
>> Commit Author: Nicola Vetrini
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>> 
>> 
>> Pipeline #1350627221 ( 
>> https://gitlab.com/xen-project/xen/-/pipelines/1350627221 ) triggered 
>> by Ganis ( https://gitlab.com/ganis )
>> had 1 failed job.
>> 
>> Job #7202274595 ( 
>> https://gitlab.com/xen-project/xen/-/jobs/7202274595/raw )
>> 
>> Stage: analyze
>> Name: eclair-x86_64
> 
> Without any earlier errors that I could spot the build log ends in
> 
> section_end:1719492504:step_script
> [0Ksection_start:1719492504:upload_artifacts_on_failure
> [0K[0K[36;1mUploading artifacts for failed job[0;m[0;m
> [32;1mUploading artifacts...[0;m
> ECLAIR_out/*.log: found 2 matching artifact files and directories[0;m
> [0;33mWARNING: ECLAIR_out/*.txt: no matching files. Ensure that the 
> artifact path is relative to the working directory 
> (/builds/xen-project/xen)[0;m
> *.log: found 2 matching artifact files and directories[0;m
> Uploading artifacts as "archive" to coordinator... 201 Created[0;m  
> id[0;m=7202274595 responseStatus[0;m=201 Created token[0;m=glcbt-66
> [32;1mUploading artifacts...[0;m
> [0;33mWARNING: gl-code-quality-report.json: no matching files. Ensure 
> that the artifact path is relative to the working directory 
> (/builds/xen-project/xen)[0;m
> [31;1mERROR: No files to upload                         [0;m
> section_end:1719492506:upload_artifacts_on_failure
> [0Ksection_start:1719492506:cleanup_file_variables
> [0K[0K[36;1mCleaning up project directory and file based 
> variables[0;m[0;m
> section_end:1719492506:cleanup_file_variables
> [0K[31;1mERROR: Job failed: exit code 137
> [0;m
> 
> IOW - some failure somewhere, but nothing noticeable in the log file. 
> Is
> this an expected thing for this specific job?
> 

No, and and I noticed no failure on our end either.
I saved the logs, so I would try running it again to see if it 
reproduces.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

