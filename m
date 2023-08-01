Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379D76C09D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574579.899993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyH1-00075j-Mx; Tue, 01 Aug 2023 22:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574579.899993; Tue, 01 Aug 2023 22:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyH1-00072x-JG; Tue, 01 Aug 2023 22:55:27 +0000
Received: by outflank-mailman (input) for mailman id 574579;
 Tue, 01 Aug 2023 22:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j6MK=DS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQyH0-0006a5-2l
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:55:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5b4dfd-30be-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 00:55:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 157C76175E;
 Tue,  1 Aug 2023 22:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8B4C433C9;
 Tue,  1 Aug 2023 22:55:21 +0000 (UTC)
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
X-Inumbo-ID: 7f5b4dfd-30be-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690930522;
	bh=Zq4j4sA91c4fjlF94qx8L1rfRV34WFvbrKGFOAGpuOE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SqPd81tUzhEYU06GHVrfqv34VqnwxjkevKZZIf8vgeSoZav/gjZEYvyIem3nnnicN
	 kAHuJYw1LpZePHRn8R9czN3ka4WASvRRKXD+5uiU8mvAXApaIJmcLJZHw2sfyGpEye
	 ZeJCsUdctWBZ/wiG0UTa5VOzKLuG3inmLk6FQWVb4ivcvuR5Ik6xkedl4u7oq1yUnq
	 fWcdedj1wwNIIB2zsaCLH0xpkMq+t4YD3a0XUw70GKVL9TjN8gYJD8PSjQZNubsME1
	 0f5VeN7WEiPPSHLEUgCaVQ6hYYbOhGhldlJrsNQrfFc9/8k0oTOQTdd+uvGxllBhT/
	 RaAD+DYheUnSA==
Date: Tue, 1 Aug 2023 15:55:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/4] automation/eclair: add scheduled pipelines
In-Reply-To: <76f3cdddcba485e8124659566b2f992b3b14da17.1690881495.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308011545350.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com> <76f3cdddcba485e8124659566b2f992b3b14da17.1690881495.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Simone Ballarin wrote:
> This patch introduces six new ECLAIR jobs that run only
> when triggered by a GitLab scheduled pipeline.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  .../eclair_analysis/ECLAIR/action.settings    |  2 +-
>  automation/gitlab-ci/analyze.yaml             | 65 +++++++++++++++++--
>  2 files changed, 62 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
> index 71c10d5141..528bc24c72 100644
> --- a/automation/eclair_analysis/ECLAIR/action.settings
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -73,7 +73,7 @@ gitlab)
>          headCommitId="${CI_COMMIT_SHA}"
>          baseCommitId="${CI_MERGE_REQUEST_DIFF_BASE_SHA}"
>          ;;
> -    push | pipeline | web)
> +    push | pipeline | web | schedule)
>          event=push
>          if [ -n "${CI_COMMIT_BRANCH:-}" ]; then
>              ref_kind=branch
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 3d8166572b..3325ef9d9a 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -8,6 +8,8 @@
>      ENABLE_ECLAIR_BOT: "n"
>      AUTO_PR_BRANCH: "staging"
>      AUTO_PR_REPOSITORY: "xen-project/xen"
> +  script:
> +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>    artifacts:
>      when: always
>      paths:
> @@ -23,8 +25,6 @@ eclair-x86_64:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "Set1"
> -  script:
> -    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>    allow_failure: true
>  
>  eclair-ARM64:
> @@ -33,6 +33,63 @@ eclair-ARM64:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "Set1"
> -  script:
> -    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
> +  allow_failure: true
> +
> +.eclair-analysis:on-schedule:
> +  extends: .eclair-analysis
> +  rules:
> +    - if: $CI_PIPELINE_SOURCE == "schedule"

If I understand this right, the idea is that someone would schedule a
pipeline (Build -> "Pipeline Schedules") and as part of that, they would
also define the variable "CI_PIPELINE_SOURCE" to schedule.

Is that correct?

If so, please add a good in-code comments here on top of
.eclair-analysis:on-schedule to explain it. So that someone reading this
might know how what to do with the Gitlab CI settings.


> +eclair-x86_64-Set1:on-schedule:
> +  extends: .eclair-analysis:on-schedule
> +  variables:
> +    VARIANT: "X86_64"
> +    RULESET: "Set1"
> +    ANALYSIS_KIND: "${RULESET}-scheduled"
> +    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
> +  allow_failure: true
> +
> +eclair-x86_64-Set2:on-schedule:
> +  extends: .eclair-analysis:on-schedule
> +  variables:
> +    VARIANT: "X86_64"
> +    RULESET: "Set2"
> +    ANALYSIS_KIND: "${RULESET}-scheduled"
> +    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
> +  allow_failure: true
> +
> +eclair-x86_64-Set3:on-schedule:
> +  extends: .eclair-analysis:on-schedule
> +  variables:
> +    VARIANT: "X86_64"
> +    RULESET: "Set3"
> +    ANALYSIS_KIND: "${RULESET}-scheduled"
> +    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
> +  allow_failure: true
> +
> +eclair-ARM64-Set1:on-schedule:
> +  extends: .eclair-analysis:on-schedule
> +  variables:
> +    VARIANT: "ARM64"
> +    RULESET: "Set1"
> +    ANALYSIS_KIND: "${RULESET}-scheduled"
> +    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
> +  allow_failure: true
> +
> +eclair-ARM64-Set2:on-schedule:
> +  extends: .eclair-analysis:on-schedule
> +  variables:
> +    VARIANT: "ARM64"
> +    RULESET: "Set2"
> +    ANALYSIS_KIND: "${RULESET}-scheduled"
> +    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
> +  allow_failure: true
> +
> +eclair-ARM64-Set3:on-schedule:
> +  extends: .eclair-analysis:on-schedule
> +  variables:
> +    VARIANT: "ARM64"
> +    RULESET: "Set3"
> +    ANALYSIS_KIND: "${RULESET}-scheduled"
> +    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
>    allow_failure: true
> -- 
> 2.34.1
> 

