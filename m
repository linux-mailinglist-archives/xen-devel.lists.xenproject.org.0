Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB658B32F
	for <lists+xen-devel@lfdr.de>; Sat,  6 Aug 2022 03:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381653.616409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK8Sh-0000mK-6o; Sat, 06 Aug 2022 01:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381653.616409; Sat, 06 Aug 2022 01:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK8Sh-0000kV-47; Sat, 06 Aug 2022 01:18:43 +0000
Received: by outflank-mailman (input) for mailman id 381653;
 Sat, 06 Aug 2022 01:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBGG=YK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oK8Sf-0000kP-VJ
 for xen-devel@lists.xenproject.org; Sat, 06 Aug 2022 01:18:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b430fa96-1525-11ed-924f-1f966e50362f;
 Sat, 06 Aug 2022 03:18:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7848DB82A2A;
 Sat,  6 Aug 2022 01:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124F5C433D6;
 Sat,  6 Aug 2022 01:18:37 +0000 (UTC)
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
X-Inumbo-ID: b430fa96-1525-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659748718;
	bh=tOPc8jqwQzeGntxejPsnkylEqSahnrjGmg1D5U59qWo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PZAYivHP8DFbj3Q3TAxRRsGwcfLcZF5O5g4RaaGTCs5Jyd2WRdTH/GVNygvfs7y/g
	 YkZWveqWW+pQ5rCDYFtVDOhQOBlHftFPNdwVk82P503c4low1fZZ/FuV8m8HzDEI91
	 qAhSksgXDUbDJWlOBj/9/pdLapMhBzHD+wE75fcjc13WKDpISHtKNeaHHMtpzf64tw
	 K/LkijI/DqBf5dO6o6wbOE2sSiMzPoIr1zDQ1exueK09aHfaGJX/1xdX4cvCZxR1Q2
	 CvvQAA7ZttrjLDazHEMtcUx4NtejRFGNwh0EkAsY/FYfNjCGnqG3YE8H5XiERjgKyx
	 U7BX+jLLNAnkA==
Date: Fri, 5 Aug 2022 18:18:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: qemu-smoke-arm64: Run ping test over a
 pv network interface
In-Reply-To: <alpine.DEB.2.22.394.2208051453020.3147284@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2208051501510.3147284@ubuntu-linux-20-04-desktop>
References: <20220805211741.1869068-1-burzalodowa@gmail.com> <20220805211741.1869068-3-burzalodowa@gmail.com> <alpine.DEB.2.22.394.2208051453020.3147284@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Aug 2022, Stefano Stabellini wrote:
> On Sat, 6 Aug 2022, Xenia Ragiadakou wrote:
> > This patch modified the test in the following way
> > - Dom0 is booted with an alpine linux rootfs with the xen tools.
> > - Once Dom0 is booted, it starts xenstored, calls init-dom0less to setup
> > the xenstore interface for the dom0less Dom1, setups the bridged network
> > and attaches a pv network interface to Dom1.
> > - In the meantime, Dom1 in its init script tries to assign an ip to eth0
> > and ping Dom0,
> > - If Dom1 manages to ping Dom0, it prints 'passed'.
> > 
> > Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

[...]

> > @@ -113,5 +148,5 @@ timeout -k 1 240 \
> >      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
> >  
> >  set -e
> > -(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
> > +(grep -q "^Welcome to Alpine Linux 3.12" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
> >  exit 0
> 
> This patch looks great! One minor comment: Should we great only for
> "^Welcome to Alpine Linux" without the version (3.12) to make it easier
> to upgrade in the future?
> 
> If you are OK with it, I can remove "3.12" on commit.

We also need to remove DOMU_ENHANCED[0] from the ImageBuilder config
otherwise this is not going to work.

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index a79401fd81..0d19ad52cc 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -118,7 +118,6 @@ NUM_DOMUS=1
 DOMU_KERNEL[0]="Image"
 DOMU_RAMDISK[0]="initrd"
 DOMU_MEM[0]="256"
-DOMU_ENHANCED[0]=0
 
 LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"

