Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB087EEA92
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 02:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634792.990315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nKu-0003W1-HZ; Fri, 17 Nov 2023 01:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634792.990315; Fri, 17 Nov 2023 01:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nKu-0003TJ-EQ; Fri, 17 Nov 2023 01:07:56 +0000
Received: by outflank-mailman (input) for mailman id 634792;
 Fri, 17 Nov 2023 01:07:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nKt-0003Py-Dx
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 01:07:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbcc77a1-84e5-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 02:07:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3879A61C06;
 Fri, 17 Nov 2023 01:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA5FC433C8;
 Fri, 17 Nov 2023 01:07:51 +0000 (UTC)
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
X-Inumbo-ID: bbcc77a1-84e5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700183271;
	bh=w5/EfQnKHWrePueTb6/sgAdXPA85kZ/tvm7OcBCVOlg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JvzHvis2/hJSLc0tMgWkN8H+G1ranEr/jD/NhVtGhNcZ9QRs3ViLC11rzT8Zux6k4
	 FBa1IdMWHXhLCSmVadG2okKQifzrekWLi7O8ApILDWpN7W0xib80s+1x8tKtlrKbG5
	 mMEZXkCLzsjB1GKx9cuQi13l1WG+TGj5zSBGNop3laAD+JJJpEqfF2k8nMDPuwoww/
	 wbAhb0RyE1XskD+BcIZnHw7X5okhwGFFQxP4RwqIHWDdRrZ4dO0CYtNxvRsji2PvaS
	 uQWAptWqHT44D6lELZEeFsqQZB8LKNQTByl/zQ4w1J4KZxmenRSOkYt8Y9dYMg7hDV
	 uidEeRLTOhjgA==
Date: Thu, 16 Nov 2023 17:07:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/6] automation: add timestamps to QEMU non-smoke x86-64
 test
In-Reply-To: <20231116121310.72210-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311161707230.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-656700383-1700183271=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-656700383-1700183271=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Same here please apply to the other qemu-* scripts too

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/scripts/qemu-alpine-x86_64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index a1c41c030a47..8e398dcea34b 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -68,7 +68,7 @@ cd ../..
>  cat >> binaries/pxelinux.0 << EOF
>  #!ipxe
>  
> -kernel xen console=com1
> +kernel xen console=com1 console_timestamps=boot
>  module bzImage console=hvc0
>  module xen-rootfs.cpio.gz
>  boot
> -- 
> 2.42.0
> 
--8323329-656700383-1700183271=:773207--

