Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D8411892
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 17:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190998.340848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLT3-0007e1-Rm; Mon, 20 Sep 2021 15:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190998.340848; Mon, 20 Sep 2021 15:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLT3-0007bJ-Oe; Mon, 20 Sep 2021 15:44:29 +0000
Received: by outflank-mailman (input) for mailman id 190998;
 Mon, 20 Sep 2021 15:44:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSLT2-0007bD-0O
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 15:44:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSLT1-0001oW-Uw
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 15:44:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSLT1-0002MQ-Tr
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 15:44:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSLSy-0006C3-EV; Mon, 20 Sep 2021 16:44:24 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=h3YRUvAwKt79Fbvv83uHFMpcbe7bIspjTspKr5hz528=; b=x/4KDNmxU1MeUTbLwMrlibeDw5
	oanBbsXAlchMaSlV2fr9mKHDDnhL0Vap2jOXy9yXsXSZmPlCIph0gi01wwDyr8j68D3Wq1i055TEJ
	P6BKr54feEXA7L6q1vXJpbxdpHcjA/pUFi2/ytsAPHXQ0OCAbvcKIbuDFdtEWr5HonDc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.44119.940679.241639@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 16:44:23 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
References: <osstest-164996-mainreport@xen.org>
	<d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> As per
> 
> Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
> Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
> Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
> Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
> Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
> Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
> Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650
> 
> the system doesn't look to really be out of memory; as per
> 
> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
> 
> there even look to be a number of higher order pages available (albeit
> without digging I can't tell what "(C)" means). Nevertheless order-4
> allocations aren't really nice.

The host history suggests this may possibly be related to a qemu update.

http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html

> What I can't see is why this may have started triggering recently. Was
> the kernel updated in osstest? Is 512Mb of memory perhaps a bit too
> small for a Dom0 on this system (with 96 CPUs)? Going through the log
> I haven't been able to find crucial information like how much memory
> the host has or what the hypervisor command line was.

Logs from last host examination, including a dmesg:

http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.examine/

Re the command line, does Xen not print it ?

The bootloader output seems garbled in the serial log.

Anyway, I think Xen is being booted EFI judging by the grub cfg:

http://logs.test-lab.xenproject.org/osstest/logs/165002/test-arm64-arm64-libvirt-raw/rochester0--grub.cfg.1

which means that it is probaly reading this:

http://logs.test-lab.xenproject.org/osstest/logs/165002/test-arm64-arm64-libvirt-raw/rochester0--xen.cfg

which gives this specification of the command line:

  options=placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  

The grub cfg has this:

 multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}

It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".

Ian

