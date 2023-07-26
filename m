Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F4764243
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 00:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570722.892832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOnGw-0000Ba-KO; Wed, 26 Jul 2023 22:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570722.892832; Wed, 26 Jul 2023 22:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOnGw-00009B-Gb; Wed, 26 Jul 2023 22:46:22 +0000
Received: by outflank-mailman (input) for mailman id 570722;
 Wed, 26 Jul 2023 22:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQ2z=DM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qOnGu-000093-Nq
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 22:46:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2ad4c1-2c06-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 00:46:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC1E261BAF;
 Wed, 26 Jul 2023 22:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715FBC433C7;
 Wed, 26 Jul 2023 22:46:13 +0000 (UTC)
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
X-Inumbo-ID: 3a2ad4c1-2c06-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690411574;
	bh=OJau1cjSjo6ZzIQjr32LB/ViHqrF1ZecQ6sE0m5nOC4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uXBUbj1fyosaGU/PgiM8elnhFM6PbZzU3pqz3SSW7uowN/VEGZp6AsV/NCCApWjnc
	 RHWtz6XJdbIvljAAbSAmKO6Nst1Kk7ZGMtquLWkMbm8TeSt6Sxd3co2lDvKFKcvorN
	 BbNvG12cf5NyXu3IdzFxfOA55vz3+/7E4ugVJHLnaZtj0Xu4bovRrFypcrhkbYPa/o
	 EhZE0ErcMeMbv1+GrwlLsdktVJxOMvnS5mXS5klVEij6M71Qu+sZNtFxDVF1Qz8LxW
	 pmcqS+eA2eP17H9t5A9GLSQFEJ2gj/7iwLmg7jWy/S6OXBXGxiGcCt8Xc33MBkRCcI
	 fRb5ezzE48JfQ==
Date: Wed, 26 Jul 2023 15:46:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v4 3/4] automation: Add ECLAIR pipelines
In-Reply-To: <4da07f65cf6f2e2d9ccffa479f3cb8165f273fdc.1690387393.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307261512360.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690387393.git.simone.ballarin@bugseng.com> <4da07f65cf6f2e2d9ccffa479f3cb8165f273fdc.1690387393.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jul 2023, Simone Ballarin wrote:
> Add two pipelines that analyze an ARM64 and a X86_64 build with the
> ECLAIR static analyzer on the guidelines contained in Set1.
> 
> The analysis configuration is stored in automation/eclair_analysis.
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
> variable named ECLAIR_BOT_TOKEN is set with the impersonation token of
> an account with enough privileges to write on all repositories.
> 
> Additionaly any repository should be able to read a masked variable
> named WTOKEN with the token provided by BUGSENG.
> 
> The analysis fails if it contains violations of guidelines tagged as
> clean:added. The list of clean guidelines are maintained in
> automation/eclair_analysis/ECLAIR/tagging.ecl.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I committed the series with one change:

> --

This needs to be exactly --- so that git am will remove the content
below on commit. In this case I removed it manually.


> Changes in v4:
> - move link to the analysis results at the end of the console log
> 
> Changes in v3:
> - split definitions of the ECLAIR pipelines in a separate patch;
> - if the WTOKEN variable is missing now the analysis fails immediately.
> 
> Changes in v2:
> - add ECLAIR configuration files (before they were fetched from a separate
>     repository);
> - now the pipeline fails if there are new violations of guidelines tagged
>     with clean:added.
> ---
>  .gitlab-ci.yml                    |  2 ++
>  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
>  automation/gitlab-ci/build.yaml   |  1 +
>  automation/scripts/eclair         | 34 +++++++++++++++++++++++++++
>  4 files changed, 75 insertions(+)
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
> index 0000000000..3d8166572b
> --- /dev/null
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -0,0 +1,38 @@
> +.eclair-analysis:
> +  stage: analyze
> +  tags:
> +    - eclair-analysis
> +  variables:
> +    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
> +    ANALYSIS_KIND: "normal"
> +    ENABLE_ECLAIR_BOT: "n"
> +    AUTO_PR_BRANCH: "staging"
> +    AUTO_PR_REPOSITORY: "xen-project/xen"
> +  artifacts:
> +    when: always
> +    paths:
> +      - "${ECLAIR_OUTPUT_DIR}/*.log"
> +      - "${ECLAIR_OUTPUT_DIR}/*.txt"
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
> +  allow_failure: true
> +
> +eclair-ARM64:
> +  extends: .eclair-analysis
> +  variables:
> +    LOGFILE: "eclair-ARM64.log"
> +    VARIANT: "ARM64"
> +    RULESET: "Set1"
> +  script:
> +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
> +  allow_failure: true
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index c401f62d61..f01e2c32bb 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -11,6 +11,7 @@
>        - '*.log'
>        - '*/*.log'
>      when: always
> +  needs: []
>    except:
>      - master
>      - smoke
> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> new file mode 100755
> index 0000000000..813a56eb6a
> --- /dev/null
> +++ b/automation/scripts/eclair
> @@ -0,0 +1,34 @@
> +#!/bin/sh -eu
> +
> +ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
> +ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
> +ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
> +
> +if [ -z "${WTOKEN:-}" ]; then
> +    echo "Failure: the WTOKEN variable is not defined." >&2
> +    exit 1
> +fi
> +
> +"${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"
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
> +
> +# Fail in case of new reports
> +"${ECLAIR_DIR}/action_clean_added.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
> +"${ECLAIR_DIR}/action_log.sh" DIFF_CHECK_LOG \
> +                             "ECLAIR diff check" \
> +                             "${ECLAIR_OUTPUT_DIR}/clean_added.log" \
> +                             "${ex}"
> +
> +"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> +[ "${ex}" = 0 ] || exit "${ex}"
> -- 
> 2.34.1
> 

