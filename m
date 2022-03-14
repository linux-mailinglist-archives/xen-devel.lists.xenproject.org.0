Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E84D8FB5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 23:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290486.492658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTtP2-0003d0-18; Mon, 14 Mar 2022 22:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290486.492658; Mon, 14 Mar 2022 22:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTtP1-0003b1-UO; Mon, 14 Mar 2022 22:42:59 +0000
Received: by outflank-mailman (input) for mailman id 290486;
 Mon, 14 Mar 2022 22:42:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTtP1-0003ap-65; Mon, 14 Mar 2022 22:42:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTtP1-0006fd-2x; Mon, 14 Mar 2022 22:42:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTtP0-00040J-Mq; Mon, 14 Mar 2022 22:42:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nTtP0-0006cj-MQ; Mon, 14 Mar 2022 22:42:58 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=r5HqknWTJ5im0/vHXD4P5Li3/28vNTQv+rYeJlg7uEY=; b=JXOqEix0wGpjUom835lNAIh2/Q
	KFqQSrEi3lKnYSzz7vgmnxnAFFKgekqirLEADT3e22d6lfvOhxic2hkD2KzrjIUq4VDUMnag9Go5j
	CEWu03kk4ZWxPfOsx13nfGdwmfs0gJ5TMjJdV7Ge3ZSpqGb+DIkeiZDYa2/hkLcSf+aU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168589-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 168589: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=fef5531fd8f311b347970568d77e7bf4feffd7fb
X-Osstest-Versions-That:
    xen=dedb0aa42c6d1ee31805dfc61630db2c41117330
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Mar 2022 22:42:58 +0000

flight 168589 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168589/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 168580
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 168580

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  fef5531fd8f311b347970568d77e7bf4feffd7fb
baseline version:
 xen                  dedb0aa42c6d1ee31805dfc61630db2c41117330

Last test of basis   168580  2022-03-14 10:01:40 Z    0 days
Testing same since   168589  2022-03-14 19:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Not pushing.

------------------------------------------------------------
commit fef5531fd8f311b347970568d77e7bf4feffd7fb
Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Date:   Thu Mar 10 17:45:00 2022 +0000

    xen/arm64: io: Handle the abort due to access to stage1 translation table
    
    If the abort was caused due to access to stage1 translation table, Xen
    will try to set the p2m entry (assuming that the Stage 1 translation
    table is in the non MMIO region).
    If there is no such entry found, then Xen will try to map the address as
    a MMIO region (assuming that the Stage 1 translation table is in the
    direct MMIO region).
    
    If that fails as well, then there are the two following scenarios:-
    1. Stage 1 translation table being in an emulated MMIO region - Xen
    can read the region, but it has no way to return the value read to the
    CPU page table walker (which tries to go through the stage1 tables to
    resolve the translation fault).
    
    2. Stage 1 translation table address is invalid.
    
    In both the above scenarios, Xen will forward the abort to the guest.
    
    Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 9e5a68a6652cc54ce3cb3b0ce208eeed79d5aeb5
Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Date:   Thu Mar 10 17:44:59 2022 +0000

    xen/arm64: io: Support instructions (for which ISS is not valid) on emulated MMIO region using MMIO/ioreq handler
    
    When an instruction is trapped in Xen due to translation fault, Xen
    checks if the ISS is invalid (for data abort) or it is an instruction
    abort. If so, Xen tries to resolve the translation fault using p2m page
    tables. In case of data abort, Xen will try to map the mmio region to
    the guest (ie tries to emulate the mmio region).
    
    If the ISS is not valid and it is a data abort, then Xen tries to
    decode the instruction. In case of ioreq, Xen  saves the decoding state,
    rn and imm9 to vcpu_io. Whenever the vcpu handles the ioreq successfully,
    it will read the decoding state to determine if the instruction decoded
    was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING). If so, it
    uses these details to post increment rn.
    
    In case of mmio handler, if the mmio operation was successful, then Xen
    retrives the decoding state, rn and imm9. For state ==
    INSTR_LDR_STR_POSTINDEXING, Xen will update rn.
    
    If there is an error encountered while decoding/executing the instruction,
    Xen will forward the abort to the guest.
    
    Also, the logic to infer the type of instruction has been moved from
    try_handle_mmio() to try_decode_instruction() which is called before.
    try_handle_mmio() is solely responsible for handling the mmio operation.
    
    Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit f9dd8436e3b826e4ca2284effa4c0285527ea763
Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Date:   Thu Mar 10 17:44:58 2022 +0000

    xen/arm64: Decode ldr/str post increment operations
    
    At the moment, Xen does not decode any of the arm64 instructions. This
    means that when hsr_dabt.isv == 0, Xen cannot handle those instructions.
    This will lead to Xen to abort the guests (from which those instructions
    originate).
    
    With this patch, Xen is able to decode ldr/str post indexing instructions.
    These are a subset of instructions for which hsr_dabt.isv == 0.
    
    The following instructions are now supported by Xen :-
    1.      ldr     x2,    [x1],    #8
    2.      ldr     w2,    [x1],    #-4
    3.      ldr     x2,    [x1],    #-8
    4.      ldr     w2,    [x1],    #4
    5.      ldrh    w2,    [x1],    #2
    6.      ldrb    w2,    [x1],    #1
    7.      str     x2,    [x1],    #8
    8.      str     w2,    [x1],    #-4
    9.      strh    w2,    [x1],    #2
    10.     strb    w2,    [x1],    #1
    
    In the subsequent patch, decode_arm64() will get invoked when
    hsr_dabt.isv == 0.
    
    Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

