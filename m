Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452576EFBA8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 22:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526833.818847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prlod-0001eb-Us; Wed, 26 Apr 2023 20:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526833.818847; Wed, 26 Apr 2023 20:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prlod-0001c6-RN; Wed, 26 Apr 2023 20:32:39 +0000
Received: by outflank-mailman (input) for mailman id 526833;
 Wed, 26 Apr 2023 20:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1prloc-0001c0-Vr
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 20:32:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aa760bb-e471-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 22:32:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1747463012;
 Wed, 26 Apr 2023 20:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95051C433D2;
 Wed, 26 Apr 2023 20:32:33 +0000 (UTC)
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
X-Inumbo-ID: 7aa760bb-e471-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682541154;
	bh=19qsQm6n48p1+w0nyOWsAYHO53X8Qf94yVNlgYZx24s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NXaS/3f5+a0FDcjbEXrJDCZfK+PxzA6Zph6PWRbGN0ha3DXsQEav32WtPY4iHu+KC
	 w4iJKaCU6kzslk7/WbR+ZuwBwQefu7s/H5lXcpbYj1fBA9kGVhCO4tjBe19mOeSsZF
	 HF+83tFidfdsCf6IQT8IaLu+cThlDmlnil0DXGIOUPm72MUIgPa/uBoyxS2OYeJM2D
	 XZOuX9HLTuFuNuYNY3sHo1IVtb9OaXkj64A7fOf3NCu8hU1iaM5WsXcaMtuX//ENer
	 0Ii14R+nzm1QOfi5GdE8bloJ++lBYB5yoUPmdr/1WPskDCuE8fh1GHIaeMuuRBpltO
	 uO9bL1siMBCzQ==
Date: Wed, 26 Apr 2023 13:32:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Remove all use of /bin/false as a ROM
In-Reply-To: <20230426144748.1236385-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2304261332020.3419@ubuntu-linux-20-04-desktop>
References: <20230426144748.1236385-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1372857357-1682541154=:3419"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1372857357-1682541154=:3419
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Apr 2023, Andrew Cooper wrote:
> As the recent work to get PCI Passthrough testing working shows, putting
> `/bin/false` as a ROM into guest context doesn't work so well.
> 
> For all ROM paths where we're skipping the build, use a slightly-plausible but
> likely non-existent path instead.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Assuming you (or patchew) tested it:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/scripts/build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index d830cff7b7c7..197d085f3e07 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -67,9 +67,9 @@ else
>  
>      if [[ "${cc_is_clang}" == "y" ]]; then
>          # SeaBIOS cannot be built with clang
> -        cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
> +        cfgargs+=("--with-system-seabios=/usr/share/no-seabios.bin")
>          # iPXE cannot be built with clang
> -        cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
> +        cfgargs+=("--with-system-ipxe=/usr/share/no-ipxe.pxe")
>          # newlib cannot be built with clang so we cannot build stubdoms
>          cfgargs+=("--disable-stubdom")
>      fi
> @@ -87,7 +87,7 @@ else
>  
>      # SeaBIOS requires GCC 4.6 or later
>      if [[ "${cc_is_gcc}" == "y" && "${cc_ver}" -lt 0x040600 ]]; then
> -        cfgargs+=("--with-system-seabios=/bin/false")
> +        cfgargs+=("--with-system-seabios=/usr/share/no-seabios.bin")
>      fi
>  
>      ./configure "${cfgargs[@]}"
> -- 
> 2.30.2
> 
--8323329-1372857357-1682541154=:3419--

