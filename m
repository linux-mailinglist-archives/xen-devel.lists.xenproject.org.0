Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DF7622EB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569917.891115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOGU-0008Mt-RI; Tue, 25 Jul 2023 20:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569917.891115; Tue, 25 Jul 2023 20:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOGU-0008JK-OG; Tue, 25 Jul 2023 20:04:14 +0000
Received: by outflank-mailman (input) for mailman id 569917;
 Tue, 25 Jul 2023 20:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qOOGU-0007eJ-4Q
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:04:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b414cfa-2b26-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 22:04:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D51B618C8;
 Tue, 25 Jul 2023 20:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D79C433C7;
 Tue, 25 Jul 2023 20:04:08 +0000 (UTC)
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
X-Inumbo-ID: 6b414cfa-2b26-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315449;
	bh=r7943TNMVTwSC/B1IcUyjTt6hjhXpZgyfnjfNW39iTg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BvF4xksihg2woe3slUinRA9hWccA5u+qETcT4gDz/TvD1Fe5ISKqL/vc3TTXebE+9
	 L8/nL6qfc8bYXeU3kMMVBDqMn0XiUsFaV/h6fEc6UiE0UjRp72rO5mP4nMnaxFgyqq
	 8cKj/x/kOun2A8uDLZCc5MIDM7JhyAuTQzkO9MQvM3LU4RzrjJKix9QLWmbYea2Emp
	 8Z3x0S/heaKF3tBzvrSGIaed3mDlsU6WyT4Hux+OY4mQrIMNf0U6r42I5f2rEQmYux
	 W1cjFGrgB97jIg3qolfyKpEGpqXjw0Ovb/TkTnrPj+3pxap5C5Hek430Ys/JCUVpmr
	 lgE8cRfHg6Pxw==
Date: Tue, 25 Jul 2023 13:04:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/4] automation: Add ECLAIR pipelines
In-Reply-To: <5e0b4afa229e29914392ffee736129f5ec2462cd.1690294965.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307251247360.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690294965.git.simone.ballarin@bugseng.com> <5e0b4afa229e29914392ffee736129f5ec2462cd.1690294965.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Simone Ballarin wrote:
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

This patch looks good to me, just one question before I give my
acked-by.


> --
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

How do I access "gl-code-quality-report.json" or otherwise any other
meaningful ECLAIR output? If I browse the job artifacts I see all the
various logs but no gl-code-quality-report.json.

Scrolling up from the bottom of the job console output I see:

Browse analysis: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/4732041018/index.html

And if I click on the link, I can access a web interface with the
results. Is that the intended way to access the job output?

If so, would it be possible to print out the message "Browse
analysis:..." as the very last message to make it easier to spot? After
it at the moment I can see:

From https://gitlab.com:443/xen-project/xen
 * [new branch]            4.10.0-shim-comet   -> autoPRRemote/4.10.0-shim-comet
 [...]

The long list of branch names hides the "Browse analysis" link.


BTW I really like the graphics output, e.g.:
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/4732041018/PROJECT.ecd;/by_service.html#service/first_file&kind

Very nice and clear!


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
> index 0000000000..55888617b3
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
> +"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> +
> +# Fail in case of new reports
> +"${ECLAIR_DIR}/action_clean_added.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
> +"${ECLAIR_DIR}/action_log.sh" DIFF_CHECK_LOG \
> +                             "ECLAIR diff check" \
> +                             "${ECLAIR_OUTPUT_DIR}/clean_added.log" \
> +                             "${ex}"
> +
> +[ "${ex}" = 0 ] || exit "${ex}"
> -- 
> 2.34.1
> 

