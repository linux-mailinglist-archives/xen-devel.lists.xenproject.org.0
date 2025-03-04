Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB840A4ED51
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 20:28:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901485.1309439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXwQ-0004iI-9s; Tue, 04 Mar 2025 19:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901485.1309439; Tue, 04 Mar 2025 19:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXwQ-0004gO-7O; Tue, 04 Mar 2025 19:28:34 +0000
Received: by outflank-mailman (input) for mailman id 901485;
 Tue, 04 Mar 2025 19:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpXwP-0004gI-8z
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 19:28:33 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dacd255e-f92e-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 20:28:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 676F8A45D78;
 Tue,  4 Mar 2025 19:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E67C4CEE5;
 Tue,  4 Mar 2025 19:28:28 +0000 (UTC)
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
X-Inumbo-ID: dacd255e-f92e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741116509;
	bh=/3o8auFt1sWvUS1B8s/IHpX31EECddFu1Dn2vfs2NAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s3gsTpFNmXu5/YU/c7WBqPd2DkkpGulLP45plxQnab9epaRojAY5/RSf6Z2JW4ScV
	 YDQv7gHjIid0FjaOhKLB+ArZNI3d9wPMur6V4HNhv8UpPd9KFMUFiGFFgfCjZREFAr
	 +yVgz6jKUjA9pkCKXY/CwWub3i6cMInKGjett3V8j7Ls57KvSkYqDqchvRv2gmVdki
	 NeasTi68isG7JNQvXL2ywqbdEHh48L5TVUCXw96f3Nz+QofEgvp1hoq6/pLqeapxaf
	 Iom33Y7tTvFyFzTAlr9VuiakFuQPaKE6S5nwAzyn75R6y/YIodY4xdZ+lgnE6mHRi6
	 d1dHfqSThls2w==
Date: Tue, 4 Mar 2025 11:28:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair: Reduce verbosity of ECLAIR
 logs.
In-Reply-To: <cd3fadd6c9c2f3737902acb5a543c5479f616144.1741110491.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2503041050200.1303386@ubuntu-linux-20-04-desktop>
References: <cd3fadd6c9c2f3737902acb5a543c5479f616144.1741110491.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Mar 2025, Nicola Vetrini wrote:
> While activating verbose logging simplifies debugging, this causes
> GitLab logs to be truncated, preventing the links to the ECLAIR
> analysis database to be shown.
> 
> No functional change.
> 
> Fixes: c4392ec83244 ("automation: Add ECLAIR utilities and settings")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 2 --
>  automation/eclair_analysis/ECLAIR/analyze.sh   | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index 824283a989c1..29409a9af0eb 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -10,8 +10,6 @@ setq(analysis_kind,getenv("ANALYSIS_KIND"))
>  # strings_map("scheduled-analysis",500,"","^.*$",0)
>  # map_strings("scheduled-analysis",analysis_kind)
>  
> --verbose
> -
>  -enable=B.REPORT.ECB
>  -config=B.REPORT.ECB,output=join_paths(data_dir,"FRAME.@FRAME@.ecb")
>  -config=B.REPORT.ECB,preprocessed=show
> diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
> index 1dc63c1bc2d0..2356fc4007dd 100755
> --- a/automation/eclair_analysis/ECLAIR/analyze.sh
> +++ b/automation/eclair_analysis/ECLAIR/analyze.sh
> @@ -91,11 +91,13 @@ find "${ECLAIR_DATA_DIR}" -maxdepth 1 -name "FRAME.*.ecb" |
>    sort | xargs cat |
>    "${ECLAIR_BIN_DIR}eclair_report" \
>      "-create_db='${PROJECT_ECD}'" \
> +    -quiet \
>      -load=/dev/stdin > "${ECLAIR_REPORT_LOG}" 2>&1
>  
>  # Create the Jenkins reports file.
>  "${ECLAIR_BIN_DIR}eclair_report" \
>    "-db='${PROJECT_ECD}'" \
> +  -quiet \
>    "-eval_file='${SCRIPT_DIR}/report.ecl'" \
>    >> "${ECLAIR_REPORT_LOG}" 2>&1
>  
> -- 
> 2.43.0
> 

