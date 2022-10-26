Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBECF60E8E5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 21:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430747.682773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onlw0-0000hD-Jz; Wed, 26 Oct 2022 19:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430747.682773; Wed, 26 Oct 2022 19:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onlw0-0000fC-Gf; Wed, 26 Oct 2022 19:19:28 +0000
Received: by outflank-mailman (input) for mailman id 430747;
 Wed, 26 Oct 2022 19:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1onlvy-0000f6-SD
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 19:19:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a92c879-5563-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 21:19:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B52D1B8241E;
 Wed, 26 Oct 2022 19:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7499AC433D6;
 Wed, 26 Oct 2022 19:19:22 +0000 (UTC)
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
X-Inumbo-ID: 1a92c879-5563-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666811963;
	bh=qI3fTCewS7KVbEY+3VrAXb+svFxvbLAAcucZ9EWRHFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YTB8sz2vt99z0Hsu2Oy7nIJivr/0CmeNx5y8X4eBaLfBFb/2sQnoGhmKzSNUHhjTx
	 pOs9Rdan0nozxb8WdLTSIhmiXEZWs2M749z3nKy+ktfSobcIc368Bu4q20RMIyIz9y
	 J2rWWuO3ibVzgfa0XXaJ5gZfn5Yn0Xl/JxTdQGaMRmp+N4N8ZsdOlgBlFDqgY/ylPu
	 NroHu23GP/cUXmpW8a8tOyhHRqYkVlmLut4+DaQkTdh8L+86k6eY5AXtFFXB3Az1Uq
	 W/6oPRJk62ObKJ++ugF3zRj80w6Stb9VosXtE1ZSLFjuIVdGuADEcIvicwkQ5ee0xB
	 9Uev+YMzuumLg==
Date: Wed, 26 Oct 2022 12:19:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH] CI: Drop more TravisCI remnants
In-Reply-To: <20221026123906.10421-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2210261219120.4028@ubuntu-linux-20-04-desktop>
References: <20221026123906.10421-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Oct 2022, Andrew Cooper wrote:
> This was missed from previous attempts to remove Travis.
> 
> Fixes: e0dc9b095e7c ("CI: Drop TravisCI")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> Preforably for 4.17.  Not a bugfix, but this does reduce the amount of
> irrelevant junk in the tree.
> ---
>  MAINTAINERS          |  1 -
>  scripts/travis-build | 32 --------------------------------
>  2 files changed, 33 deletions(-)
>  delete mode 100755 scripts/travis-build
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 816656950ae2..175f10f33fc9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -274,7 +274,6 @@ W:	https://gitlab.com/xen-project/xen
>  S:	Supported
>  F:	.gitlab-ci.yml
>  F:	automation/
> -F:	scripts/travis-build
>  
>  CPU POOLS
>  M:	Juergen Gross <jgross@suse.com>
> diff --git a/scripts/travis-build b/scripts/travis-build
> deleted file mode 100755
> index 84d74266a01f..000000000000
> --- a/scripts/travis-build
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -#!/bin/bash -ex
> -
> -$CC --version
> -
> -# random config or default config
> -if [[ "${RANDCONFIG}" == "y" ]]; then
> -    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> -else
> -    make -C xen defconfig
> -fi
> -
> -# build up our configure options
> -cfgargs=()
> -cfgargs+=("--disable-stubdom") # more work needed into building this
> -cfgargs+=("--disable-rombios")
> -cfgargs+=("--enable-docs")
> -cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
> -
> -# Qemu requires Python 3.5 or later
> -if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))"; then
> -    cfgargs+=("--with-system-qemu=/bin/false")
> -fi
> -
> -if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
> -    cfgargs+=("--enable-tools")
> -else
> -    cfgargs+=("--disable-tools") # we don't have the cross depends installed
> -fi
> -
> -./configure "${cfgargs[@]}"
> -
> -make dist
> -- 
> 2.11.0
> 

