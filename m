Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5675BA9C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566767.886059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMc9b-000397-7i; Thu, 20 Jul 2023 22:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566767.886059; Thu, 20 Jul 2023 22:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMc9b-00036x-4g; Thu, 20 Jul 2023 22:29:47 +0000
Received: by outflank-mailman (input) for mailman id 566767;
 Thu, 20 Jul 2023 22:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMc9a-00035M-8T
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:29:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec812541-274c-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 00:29:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF47661C9A;
 Thu, 20 Jul 2023 22:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15B8C433C8;
 Thu, 20 Jul 2023 22:29:41 +0000 (UTC)
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
X-Inumbo-ID: ec812541-274c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689892182;
	bh=TgyheFyvYk5JtANtG7a6wM/AyLXdTH8s9ZGsYiArDgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cGJYLG+orZdFB8yJGw+Jov/Kt+4F/klCMsA7uH+21JxZw+E/PXqV5T+8RHX/Y/5mN
	 o+EI9mJIYCabtN4gDvxh8GiASv/jznHhbOFBMMSIX21jxtdFgQWWhgpm+xgjBl2Ssz
	 VxmGF10e4AfaY2jkOoNmhE1UFazEaBPtqeXOVkXNlUJg5mWWMTitYqZigBXKKqJhlv
	 SCdBjahwU2JqBV4JKQ1pK3AiyWzdfZ6rnhysIeNgKCPLv1iCWy2YzmD6e4bgywhzxV
	 Ug+R7jUzM1lMC/N1v12fBzFiUIsqSbRVPZ7SlkSzR4T4Kvy+6iKKu5u6PXcz8S7aPo
	 T/06nU+YXLCDQ==
Date: Thu, 20 Jul 2023 15:29:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: add ECLAIR pipeline
In-Reply-To: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307201507070.3118466@ubuntu-linux-20-04-desktop>
References: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jul 2023, Simone Ballarin wrote:
> Add two pipelines that analyze an ARM64 and a X86_64 build with the
> ECLAIR static analyzer on the guidelines contained in Set1.
> 
> The tool configuration is kept external to the xen repository for
> practical reasons, it will be included in a subsequent phase.
> 
> All commits on the xen-project/xen:staging branch will be analyzed
> and their artifacts will be stored indefinitely; the integration will
> report differential information with respect to the previous analysis.
> 
> All commits on other branches or repositories will be analyzed and
> only the last ten artifacts will be kept; the integration will report
> differential information with respect to the analysis done on the common
> ancestor with xen-project/xen:staging (if available).
> 
> Currently the pipeline variable ENABLE_ECLAIR_BOT is set to "n".
> Doing so disables the generation of comments with the analysis summary
> on the commit threads. The variable can be set to "y" if the a masked
> variable named ECLAIRIT_TOKEN is set with the impersonation token of
> an account with enough privileges to write on all repositories.
> 
> Additionaly any repository should be able to read a masked variable
> named WTOKEN with the token provided by BUGSENG.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Thanks for the patch!

Patchew automatically picked it up from xen-devel and started a pipeline
here:

https://gitlab.com/xen-project/patchew/xen/-/pipelines/939440592

However the eclair-x86_64 job failed with:

ERROR: Uploading artifacts as "archive" to coordinator... 413 Payload
Too Large

Also the eclair-ARM64 job failed but it is not clear to me why.

I think at least initially we should mark the two Eclair jobs with:

  allow_failure: true

until we are sure they work reliably all the time. Otherwise we end up
blocking the whole Xen staging pipeline if we make any mistakes here. We
can remove "allow_failure: true" once we are sure it works well all the
time.


The second thing I noticed is that the build phase didn't start until
the analyze phase was concluded. This is not good because it would
increase the overall time significantly. We need the build/test phases
to start in parallel. To do that you need to add the following change to
this patch:


diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c401f62d61..f01e2c32bb 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -11,6 +11,7 @@
       - '*.log'
       - '*/*.log'
     when: always
+  needs: []
   except:
     - master
     - smoke



> ---
>  .gitlab-ci.yml                    |  2 ++
>  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
>  automation/scripts/eclair         | 26 +++++++++++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 automation/gitlab-ci/analyze.yaml
>  create mode 100755 automation/scripts/eclair
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index c8bd7519d5..ee5430b8b7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,7 +1,9 @@
>  stages:
> +  - analyze
>    - build
>    - test
>  
>  include:
> +  - 'automation/gitlab-ci/analyze.yaml'
>    - 'automation/gitlab-ci/build.yaml'
>    - 'automation/gitlab-ci/test.yaml'
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> new file mode 100644
> index 0000000000..be96d96e71
> --- /dev/null
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -0,0 +1,38 @@
> +.eclair-analysis:
> +  stage: analyze
> +  tags:
> +    - eclair-analysis
> +    - eclair
> +    - misrac

I would only use 1 tag, eclair-analysis or eclair, up to you


> +  variables:
> +    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
> +    ANALYSIS_KIND: "normal"
> +    ECLAIR_REPORT_URL: "saas.eclairit.com"
> +    ENABLE_ECLAIR_BOT: "n"
> +    AUTOPRBRANCH: "staging"
> +    AUTOPRREPOSITORY: "xen-project/xen"
> +  artifacts:
> +    when: always
> +    paths:
> +      - "${ECLAIR_OUTPUT_DIR}"
> +      - '*.log'
> +    reports:
> +      codequality: gl-code-quality-report.json
> +
> +eclair-x86_64:
> +  extends: .eclair-analysis
> +  variables:
> +    LOGFILE: "eclair-x86_64.log"
> +    VARIANT: "X86_64"
> +    RULESET: "Set1"
> +  script:
> +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"

allow_failure: true


> +eclair-ARM64:
> +  extends: .eclair-analysis
> +  variables:
> +    LOGFILE: "eclair-ARM64.log"
> +    VARIANT: "ARM64"
> +    RULESET: "Set1"
> +  script:
> +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"

allow_failure: true


> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> new file mode 100755
> index 0000000000..d7f0845aec
> --- /dev/null
> +++ b/automation/scripts/eclair
> @@ -0,0 +1,26 @@
> +#!/bin/bash -eu
> +
> +# ECLAIR configuration files are maintened by BUGSENG
> +export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"
> +[ -d ECLAIR_scripts ] || git clone ssh://git@git.bugseng.com/eclair/scripts/XEN ECLAIR_scripts
> +(cd ECLAIR_scripts; git pull --rebase)
> +
> +ECLAIR_DIR=ECLAIR_scripts/ECLAIR
> +ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
> +
> +ECLAIR_scripts/prepare.sh "${VARIANT}"
> +
> +ex=0
> +"${ECLAIR_DIR}/analyze.sh" "${VARIANT}" "${RULESET}" || ex=$?
> +"${ECLAIR_DIR}/action_log.sh" ANALYSIS_LOG \
> +                             "ECLAIR analysis log" \
> +                             "${ECLAIR_OUTPUT_DIR}/ANALYSIS.log" \
> +                             "${ex}"
> +"${ECLAIR_DIR}/action_log.sh" REPORT_LOG \
> +                             "ECLAIR report log" \
> +                             "${ECLAIR_OUTPUT_DIR}/REPORT.log" \
> +                             "${ex}"
> +[ "${ex}" = 0 ] || exit "${ex}"
> +"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> +
> +rm -rf "${ECLAIR_OUTPUT_DIR}/.data"
> -- 
> 2.34.1
> 

