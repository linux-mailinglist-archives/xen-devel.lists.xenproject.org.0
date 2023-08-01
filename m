Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37076C09B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574576.899972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyGf-0006G9-55; Tue, 01 Aug 2023 22:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574576.899972; Tue, 01 Aug 2023 22:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyGf-0006Du-2O; Tue, 01 Aug 2023 22:55:05 +0000
Received: by outflank-mailman (input) for mailman id 574576;
 Tue, 01 Aug 2023 22:55:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j6MK=DS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQyGd-00068k-JI
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:55:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72496b3b-30be-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 00:55:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF9006170A;
 Tue,  1 Aug 2023 22:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F44C433C7;
 Tue,  1 Aug 2023 22:54:59 +0000 (UTC)
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
X-Inumbo-ID: 72496b3b-30be-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690930500;
	bh=5zn9kQv49Hcnf6MfXJ5JEWSAtAYEyHbETuWQJIOn3VM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MovoLszg0Z68inlF15OiVMeq/UlHp7SuYiSpbut4jksERd0LouU3daPTlcA/te9Hr
	 EsT9qY6Tq6XHAxiYOftnwYapkQ+kBLkiKqpJfTfx3gbijFpIJE8Mzxv49++1biuwQB
	 +ISVEQYOR53AB/4ZvnAmGeaNrlWZeoE7ukMMBfRXlbXh07H/vZAEu3Jkh9INK/89Qi
	 /4CSOvnNScTCs0wuO0N3M+gHvSS5kor+LhpY27f7BPsxKeig0QHv6aqtOmsmXSqlFI
	 Hot5ivEqyi0+tjOpx01YP6LEgcOCE75gcB+BtRZY95gk7vWGVgMaOGu/JeAk12vqKK
	 D83F9d547wRCw==
Date: Tue, 1 Aug 2023 15:54:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/4] automation/eclair: add support for tag
 pipelines
In-Reply-To: <5e79b954062385c4d765c32347bcb45896d3ed5e.1690881495.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308011542120.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com> <5e79b954062385c4d765c32347bcb45896d3ed5e.1690881495.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Simone Ballarin wrote:
> The ECLAIR jobs fail when triggered by tag pipelines (e.g.
> xen-project/patchew/xen).
> 
> This patch extends the integration to support such pipelines.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks for the fix! One good suggestion from Andrew would be to check
for required variables at the beginning, rather than at the end. As it
is now we are doing all the work just to fail at the end. It would have
been better to fail immediately saving resources. It could be another
patch :-)


> ---
>  .../eclair_analysis/ECLAIR/action.settings    | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
> index 96426811a8..71c10d5141 100644
> --- a/automation/eclair_analysis/ECLAIR/action.settings
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -41,7 +41,7 @@ github)
>      push | workflow_dispatch)
>          event=push
>          # Extract the branch name from "refs/heads/<branch>"
> -        branch="${GITHUB_REF#refs/heads/}"
> +        ref="${GITHUB_REF#refs/heads/}"
>          headCommitId="${GITHUB_SHA}"
>          pushUser="${GITHUB_ACTOR}"
>          ;;
> @@ -75,7 +75,13 @@ gitlab)
>          ;;
>      push | pipeline | web)
>          event=push
> -        branch="${CI_COMMIT_BRANCH}"
> +        if [ -n "${CI_COMMIT_BRANCH:-}" ]; then
> +            ref_kind=branch
> +            ref="${CI_COMMIT_BRANCH}"
> +        else
> +            ref_kind=tag
> +            ref="${CI_COMMIT_TAG}"
> +        fi
>          headCommitId="${CI_COMMIT_SHA}"
>          pushUser="${GITLAB_USER_NAME}"
>          ;;
> @@ -99,7 +105,7 @@ jenkins)
>      jenkinsBotToken="${ECLAIR_BOT_TOKEN:-}"
>  
>      event=push
> -    branch="${GIT_BRANCH}"
> +    ref="${GIT_BRANCH}"
>      headCommitId="${GIT_COMMIT}"
>      pushUser=$(git show --pretty='format:%aN' -s)
>      ;;
> @@ -111,7 +117,7 @@ esac
>  
>  if [ "${event}" = "push" ] && [ -n "${autoPRBranch:-}" ]; then
>      # AUTO PR Feature enabled
> -    if ! [ "${branch}" = "${autoPRBranch}" ] ||
> +    if ! [ "${ref}" = "${autoPRBranch}" ] ||
>          ! [ "${repository}" = "${autoPRRepository}" ]; then
>          event=auto_pull_request
>      fi
> @@ -123,17 +129,17 @@ pull_request)
>      jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pullRequestUser} wants to merge ${pullRequestHeadRepo}:${pullRequestHeadRef} (${headCommitId}) into ${pullRequestBaseRef} (${baseCommitId})"
>      ;;
>  push)
> -    subDir="${branch}"
> -    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: branch ${branch} (${headCommitId})"
> -    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${branch}${variantHeadline} #${jobId}"
> +    subDir="${ref}"
> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${ref_kind} ${ref} (${headCommitId})"
> +    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} #${jobId}"
>      ;;
>  auto_pull_request)
>      git remote remove autoPRRemote || true
>      git remote add autoPRRemote "${autoPRRemoteUrl}"
>      git fetch -q autoPRRemote
> -    subDir="${branch}"
> +    subDir="${ref}"
>      baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD)
> -    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${branch} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${ref} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
>      ;;
>  *)
>      echo "Unexpected event ${event}" >&2
> -- 
> 2.34.1
> 

