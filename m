Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BDE585743
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 01:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377909.611224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHZFj-0004js-A1; Fri, 29 Jul 2022 23:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377909.611224; Fri, 29 Jul 2022 23:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHZFj-0004h3-6b; Fri, 29 Jul 2022 23:18:43 +0000
Received: by outflank-mailman (input) for mailman id 377909;
 Fri, 29 Jul 2022 23:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HszZ=YC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHZFh-0004gx-M1
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 23:18:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6dd01bd-0f94-11ed-924f-1f966e50362f;
 Sat, 30 Jul 2022 01:18:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2266B82A03;
 Fri, 29 Jul 2022 23:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E83C433D6;
 Fri, 29 Jul 2022 23:18:36 +0000 (UTC)
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
X-Inumbo-ID: c6dd01bd-0f94-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659136716;
	bh=jtHLFyKfdY3ue4JKCqia6DITjvTxcpbDfVaMgahK0Rc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dNFlC95rvD91Z50yrvdNWRyg97GHA2chnwy2vqqFs4F6pA6nTYA5io4X+i1R/jqop
	 Ht9S0NRvd6EVRmtanHspu8xDCucfGKAHVxG3lnDI7upfMockgaOGA53+p2eu2GpyI6
	 3cVMUXv3LTY25Htq1rQHczk6JOK1L//Jwvcg0jw17ZHLDNolmsUTnv3QC6QARLQMcs
	 n5OpsPVgkZ4T6LGwuSPhM89qsXwNm+k7/46XT9NxYNB7tjSnBnHX7Os4mIvofgmcPC
	 5yrqA18OYIts18IvEOdjEFrx4YmUDLy3S65OeQkc2sPzcF7nSA+BJcmZ4uv0Fn8Rw7
	 bO6xo2Qj6NmVA==
Date: Fri, 29 Jul 2022 16:18:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] automation: qemu-smoke-arm64.sh: Remove some stale
 comments
In-Reply-To: <20220729145229.1250221-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207291618230.4648@ubuntu-linux-20-04-desktop>
References: <20220729145229.1250221-1-burzalodowa@gmail.com> <20220729145229.1250221-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jul 2022, Xenia Ragiadakou wrote:
> Remove comment "# Install QEMU" because qemu is not installed, it is taken
> from a test-artifacts container.
> 
> Change comment "# Busybox Dom0" to "# Busybox" because busybox is not used
> only for the Dom0 but also for the DomU.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qemu-smoke-arm64.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 898398196a..f483a2ffc1 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -21,7 +21,6 @@ fi
>  "
>  fi
>  
> -# Install QEMU
>  export DEBIAN_FRONTENT=noninteractive
>  apt-get -qy update
>  apt-get -qy install --no-install-recommends u-boot-qemu \
> @@ -44,7 +43,7 @@ sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts
>  dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
>  
>  
> -# Busybox Dom0
> +# Busybox
>  mkdir -p initrd
>  mkdir -p initrd/bin
>  mkdir -p initrd/sbin
> -- 
> 2.34.1
> 

