Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAB7A7858E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 02:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935027.1336548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlpC-0008Ji-Kq; Wed, 02 Apr 2025 00:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935027.1336548; Wed, 02 Apr 2025 00:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlpC-0008HK-HT; Wed, 02 Apr 2025 00:19:22 +0000
Received: by outflank-mailman (input) for mailman id 935027;
 Wed, 02 Apr 2025 00:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzlpB-0008HE-6u
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 00:19:21 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd265da-0f58-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 02:19:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB560435B3;
 Wed,  2 Apr 2025 00:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A36AC4CEE4;
 Wed,  2 Apr 2025 00:19:16 +0000 (UTC)
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
X-Inumbo-ID: 1dd265da-0f58-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743553157;
	bh=BXQOTDyKHPbRJToz6v568FkioxG5VeYLC1ubRR2EFVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LSZdCIV7Et1tD4JNKKgJNLQMNpog6sIaimzfMsteYP/PztqHxsvxkwWrVThw7bXgM
	 zCukqgE2PLGTGNUKCo/XGKihndLgGk+xcb68bicpz1psIXHfE2bO5H27V+xPgkYed7
	 01fn89Bq7yOCgMOHP1xVhUDVVHo2joooKCg591/od2r1N1XeEQM8aeExq+BWWgCEfL
	 lllvluOeCp577lub1mfWiz3M9cnjb5F6WNZG4gLY+oFrDFYZxR8S7T0JmqazEPvBdg
	 DqD90RjD+mLOfTFl9CqWbjByB0kCHEWSCs4Sz3Oxdd1Ms0R4cd7YUbwN473zBDUMMr
	 NxbqTbAyL2z3A==
Date: Tue, 1 Apr 2025 17:19:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] ci: create boot.ipxe for legacy boot
In-Reply-To: <d9443966db489ac14081d26ddb34f5d2f03f310b.1743464494.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504011718240.3098208@ubuntu-linux-20-04-desktop>
References: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com> <d9443966db489ac14081d26ddb34f5d2f03f310b.1743464494.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-619240473-1743553156=:3098208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-619240473-1743553156=:3098208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 1 Apr 2025, Marek Marczykowski-Górecki wrote:
> Hardware runners that use legacy boot use iPXE instead of grub2. Create
> boot.ipxe for those too - with exact same options.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Right now this applies to KBL (hw3) runner. And not many more, as newer
> systems support UEFI network boot.
> ---
>  automation/scripts/qubes-x86-64.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 7c80e0c23318..f27296445901 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -251,6 +251,14 @@ module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
>  module2 (http)/gitlab-ci/initrd-dom0
>  " > $TFTP/grub.cfg
>  
> +echo "#!ipxe
> +
> +kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts || reboot
> +module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
> +module /gitlab-ci/initrd-dom0 || reboot
> +boot
> +" > $TFTP/boot.ipxe
> +
>  cp -f binaries/xen $TFTP/xen
>  cp -f binaries/bzImage $TFTP/vmlinuz
>  cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
> -- 
> git-series 0.9.1
> 
--8323329-619240473-1743553156=:3098208--

