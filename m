Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A17B5D2E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611794.951373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRSm-0003zM-ND; Mon, 02 Oct 2023 22:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611794.951373; Mon, 02 Oct 2023 22:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRSm-0003x4-JP; Mon, 02 Oct 2023 22:32:28 +0000
Received: by outflank-mailman (input) for mailman id 611794;
 Mon, 02 Oct 2023 22:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRSk-0003Uh-Qi
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:32:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ef7ecaf-6173-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 00:32:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0407061003;
 Mon,  2 Oct 2023 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E5C433C8;
 Mon,  2 Oct 2023 22:32:21 +0000 (UTC)
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
X-Inumbo-ID: 8ef7ecaf-6173-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285943;
	bh=Igo/faXy6SB8wWtOOpqnjsPZ2Q8FysqRf06N4tG0Dx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RcsVPmYDYN+Ie30HJ1a/Mo/cgUPU5tM2PfKwETQ4mvqpYcTBcw+woTIPpgeIZEUtc
	 3pSEz03SunXhFXy5DtORBywldWpbS1Zq11XWRaSo7NSIzi+0bcOsyffDD56X+lHWWd
	 e84Uvqrq/FNZNtmwB8TmZdwfGwSYFduAN2nf77mfcG/vg4J9X1K8lxF7PykQdIUOOX
	 LdpUHjWP+X371XMOlJy3a+xNI5b+p/+++YxTJIKYHwtb57aHNKsH8zqFmk93HawF8Q
	 n4mrHz6n/Wj9k53xF6gujy+LNxpOJQBW/JIxfQZCpqTw5/Kt9/XIyUYOAB0Nu0hCsf
	 EfVRVhLdKC5Fg==
Date: Mon, 2 Oct 2023 15:32:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v3 3/3] automation/eclair: build docs/misra to address
 MISRA C:2012 Dir 4.1
In-Reply-To: <ac00d0259530ac895e7260ff7f64833c58053983.1696231870.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021532140.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com> <ac00d0259530ac895e7260ff7f64833c58053983.1696231870.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> The documentation pertaining Directive 4.1 is contained in docs/misra.
> The build script driving the analysis is amended to allow ECLAIR to
> analyze such file.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - amended prepare script.
> ---
>  automation/eclair_analysis/build.sh   | 6 +++---
>  automation/eclair_analysis/prepare.sh | 7 ++++---
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
> index ec087dd822fa..ea7a1e5a59b0 100755
> --- a/automation/eclair_analysis/build.sh
> +++ b/automation/eclair_analysis/build.sh
> @@ -34,11 +34,11 @@ else
>  fi
>  
>  (
> -  cd xen
> -
> +  make -C docs misra
>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>         "CC=${CROSS_COMPILE}gcc-12"              \
>         "CXX=${CROSS_COMPILE}g++-12"             \
> -       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> +       -C xen
>  )
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> index 0cac5eba00ae..fe9d16e48ecc 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -35,11 +35,12 @@ else
>  fi
>  
>  (
> -    cd xen
> -    cp "${CONFIG_FILE}" .config
> +    ./configure
> +    cp "${CONFIG_FILE}" xen/.config
>      make clean
>      find . -type f -name "*.safparse" -print -delete
> -    make -f ${script_dir}/Makefile.prepare prepare
> +    cd xen
> +    make -f "${script_dir}/Makefile.prepare" prepare
>      # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
>      scripts/xen-analysis.py --run-eclair --no-build --no-clean
>  )
> -- 
> 2.34.1
> 

