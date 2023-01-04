Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8265CB36
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470805.730431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsGI-0001F9-Jv; Wed, 04 Jan 2023 01:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470805.730431; Wed, 04 Jan 2023 01:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsGI-0001Cr-Gm; Wed, 04 Jan 2023 01:08:10 +0000
Received: by outflank-mailman (input) for mailman id 470805;
 Wed, 04 Jan 2023 01:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsGH-0001Cl-E2
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:08:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ef0ec07-8bcc-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:08:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7277B810A5;
 Wed,  4 Jan 2023 01:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908D2C433D2;
 Wed,  4 Jan 2023 01:08:03 +0000 (UTC)
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
X-Inumbo-ID: 3ef0ec07-8bcc-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672794484;
	bh=BMlVarPMrb1stKvQSfClz/2+qPszURvdTGuLCEAjXoQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PdY8whexeyDHkc9yR78kXhn6ArLt0hzS+qjbzyW/uk8WiBBzI0Uzp7hiwPQH6h8bE
	 XFZhPsZw+QZkGNnkeyNOhsd+bBloGR6UxIomrCVyBujXVHrxkELkXAoC1aAiaQtoQF
	 BhuzQiAM69+1SScIIhDnuB9Vf+Aagh0QzbClTXaQRHSy7lQD/tBxQhZuWrS631AtOd
	 u9LWyMlNSAL17atr6Uobw8SbrtYSPY14X6KXbGLFCUJAE7nXPMeoyErnMGBNkzMuEY
	 GyZ9aCYCfPg0/oUbrvfNp1HFMZFmtDbruOv4nQyKBDo9FmUxDB5BUcRCZ5UqIqCwHZ
	 A/EHdi2M9o9/g==
Date: Tue, 3 Jan 2023 17:08:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/6] CI: Drop automation/configs/
In-Reply-To: <20221230003848.3241-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031707540.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Dec 2022, Andrew Cooper wrote:
> Having 3 extra hypervisor builds on the end of a full build is deeply
> confusing to debug if one of them fails, because the .config file presented in
> the artefacts is not the one which caused a build failure.  Also, the log
> tends to be truncated in the UI.
> 
> PV-only is tested as part of PV-Shim in a full build anyway, so doesn't need
> repeating.  HVM-only and neither will come up frequently in randconfig, so
> drop all the logic here to simplify things.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/configs/x86/hvm_only_config  |  3 ---
>  automation/configs/x86/no_hvm_pv_config |  3 ---
>  automation/configs/x86/pv_only_config   |  3 ---
>  automation/scripts/build                | 21 ---------------------
>  4 files changed, 30 deletions(-)
>  delete mode 100644 automation/configs/x86/hvm_only_config
>  delete mode 100644 automation/configs/x86/no_hvm_pv_config
>  delete mode 100644 automation/configs/x86/pv_only_config
> 
> diff --git a/automation/configs/x86/hvm_only_config b/automation/configs/x86/hvm_only_config
> deleted file mode 100644
> index 9efbddd5353b..000000000000
> --- a/automation/configs/x86/hvm_only_config
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -CONFIG_HVM=y
> -# CONFIG_PV is not set
> -# CONFIG_DEBUG is not set
> diff --git a/automation/configs/x86/no_hvm_pv_config b/automation/configs/x86/no_hvm_pv_config
> deleted file mode 100644
> index 0bf6a8e46818..000000000000
> --- a/automation/configs/x86/no_hvm_pv_config
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# CONFIG_HVM is not set
> -# CONFIG_PV is not set
> -# CONFIG_DEBUG is not set
> diff --git a/automation/configs/x86/pv_only_config b/automation/configs/x86/pv_only_config
> deleted file mode 100644
> index e9d8b4a7c753..000000000000
> --- a/automation/configs/x86/pv_only_config
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -CONFIG_PV=y
> -# CONFIG_HVM is not set
> -# CONFIG_DEBUG is not set
> diff --git a/automation/scripts/build b/automation/scripts/build
> index a5934190634b..5dafa72ba540 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -85,24 +85,3 @@ if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
>          cp -r dist binaries/
>      fi
>  fi
> -
> -if [[ "${hypervisor_only}" == "y" ]]; then
> -    # If we are build testing a specific Kconfig exit now, there's no point in
> -    # testing all the possible configs.
> -    exit 0
> -fi
> -
> -# Build all the configs we care about
> -case ${XEN_TARGET_ARCH} in
> -    x86_64) arch=x86 ;;
> -    *) exit 0 ;;
> -esac
> -
> -cfg_dir="automation/configs/${arch}"
> -for cfg in `ls ${cfg_dir}`; do
> -    echo "Building $cfg"
> -    make -j$(nproc) -C xen clean
> -    rm -f xen/.config
> -    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} defconfig
> -    make -j$(nproc) -C xen
> -done
> -- 
> 2.11.0
> 

