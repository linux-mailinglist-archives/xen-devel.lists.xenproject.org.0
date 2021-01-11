Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597C2F10FF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 12:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64787.114527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyvEg-0004Bd-Hv; Mon, 11 Jan 2021 11:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64787.114527; Mon, 11 Jan 2021 11:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyvEg-0004BG-En; Mon, 11 Jan 2021 11:19:46 +0000
Received: by outflank-mailman (input) for mailman id 64787;
 Mon, 11 Jan 2021 11:19:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyvEe-0004BB-5v
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:19:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyvEe-0002Q7-3P
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:19:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyvEe-0008PV-2a
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:19:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kyvEW-0003SH-GO; Mon, 11 Jan 2021 11:19:36 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=abQFr/bjbaXdVNUIugjmdexVUay4cR2FBp+VyIx50Mc=; b=F5Nv1GSuirB3DU1m5wq6JnKq6n
	mKhci1DQHbFMm+Tpo9QNy6tQ/6JQi9YxGJahM5lNT9mgYt5M5TOFEDr7053s+iEwbeBVaGq8yKhLb
	uepW+eJeLWL8mcJOkbfHsrD+YMduABswhzLWOs4cxlzmjK0XiQN0ZGfSUSIXQnghZNts=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24572.13383.933043.911224@mariner.uk.xensource.com>
Date: Mon, 11 Jan 2021 11:19:35 +0000
To: Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    xen-devel@lists.xenproject.org
Subject: Re: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm:
 Emulate ID registers) [and 2 more messages]
In-Reply-To: <094d2819-8658-d74f-e7da-c61cdeb14608@xen.org>,
	<osstest-158303-mainreport@xen.org>,
	<E1kyZKj-0000Qd-6A@osstest.test-lab.xenproject.org>
References: <E1kyZKj-0000Qd-6A@osstest.test-lab.xenproject.org>
	<osstest-158303-mainreport@xen.org>
	<cover.1608214355.git.bertrand.marquis@arm.com>
	<ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org>
	<338ef917-4b67-d839-82e4-164bbf46f85e@arm.com>
	<alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>
	<7942af32-6bae-36c4-e1ee-dd3edc85097a@xen.org>
	<alpine.DEB.2.21.2101051425360.4307@sstabellini-ThinkPad-T480s>
	<db69c99b-d7b5-fe10-b24b-2a673c7b9e28@xen.org>
	<alpine.DEB.2.21.2101061235160.7075@sstabellini-ThinkPad-T480s>
	<094d2819-8658-d74f-e7da-c61cdeb14608@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

It seems there is still something wrong with ARM in staging.  Whatever
change was made passed the smoke test but now the main flights are
failing:

osstest service owner writes:
> flight 158303 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/158303/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-thunderx  8 xen-boot             fail REGR. vs. 158290
>  test-arm64-arm64-examine      8 reboot               fail REGR. vs. 158290
>  test-arm64-arm64-xl-xsm       8 xen-boot             fail REGR. vs. 158290
>  test-arm64-arm64-xl-credit1   8 xen-boot             fail REGR. vs. 158290

The bisector has fingered the same commit in unstable as it did in the
smoke tests.  That might be because the fix made to staging, to get
the smoke tests to pass, was not complete enough.  It also might be
because something different broke the other tests and the tree was
briefly working in between.

fx: puts on Release Manager hat.  Can one of you ARM folks please take
a look at this and fix it ASAP ?

Thanks,
Ian.

osstest service owner writes ("[xen-unstable bisection] complete test-arm64-arm64-xl-xsm"):
> branch xen-unstable
> xenbranch xen-unstable
> job test-arm64-arm64-xl-xsm
> testid xen-boot
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  9cfdb489af810f71acb7dcdb87075dc7b3b313a0
>   Bug not present: a9f1f03b2710f5ce84f69c1c4516349531053fac
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158347/
> 
> 
>   commit 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
>   Author: Bertrand Marquis <bertrand.marquis@arm.com>
>   Date:   Thu Dec 17 15:38:02 2020 +0000
>   
>       xen/arm: Add ID registers and complete cpuinfo
>       
>       Add definition and entries in cpuinfo for ID registers introduced in
>       newer Arm Architecture reference manual:
>       - ID_PFR2: processor feature register 2
>       - ID_DFR1: debug feature register 1
>       - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
>       - ID_ISA6: ISA Feature register 6
>       Add more bitfield definitions in PFR fields of cpuinfo.
>       Add MVFR2 register definition for aarch32.
>       Add MVFRx_EL1 defines for aarch32.
>       Add mvfr values in cpuinfo.
>       Add some registers definition for arm64 in sysregs as some are not
>       always know by compilers.
>       Initialize the new values added in cpuinfo in identify_cpu during init.
>       
>       Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>       Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

