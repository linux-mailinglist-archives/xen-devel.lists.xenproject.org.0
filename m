Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9797FAB4D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642658.1002297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7iAa-0003lh-8N; Mon, 27 Nov 2023 20:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642658.1002297; Mon, 27 Nov 2023 20:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7iAa-0003kn-4H; Mon, 27 Nov 2023 20:25:28 +0000
Received: by outflank-mailman (input) for mailman id 642658;
 Mon, 27 Nov 2023 20:25:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7iAZ-0003kd-0x; Mon, 27 Nov 2023 20:25:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7iAY-0005xK-P7; Mon, 27 Nov 2023 20:25:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7iAY-0005aj-A5; Mon, 27 Nov 2023 20:25:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r7iAY-0008J2-9k; Mon, 27 Nov 2023 20:25:26 +0000
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
	bh=xHb+dMLr7MnzEZ379oioKQ0nGUOz/jrPJkg1Djzh6wA=; b=wJ/RI5Rp+1Jo0xJCkglG/cfgHt
	hHxtNtLpko85GXVoHPRONanZ3nyavL30ZytSIaZ2/WjtY6dpskNmNroP3N2vBXadzamBk3t1st1ZL
	64r7Dq7fzOv2VjUddHAEdjS+du35MeBxPviCcnKKh03iv2ufeDSbVaSQLSrRUlDsv5vk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183870-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183870: trouble: blocked/broken
X-Osstest-Failures:
    ovmf:build-amd64:<job status>:broken:regression
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-amd64-xsm:<job status>:broken:regression
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-amd64:host-install(4):broken:regression
    ovmf:build-amd64-pvops:host-install(4):broken:regression
    ovmf:build-amd64-xsm:host-install(4):broken:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=33e31c289cc7b417f110d6da70dc8224443d32d3
X-Osstest-Versions-That:
    ovmf=8736b8fdca85e02933cdb0a13309de14c9799ece
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 Nov 2023 20:25:26 +0000

flight 183870 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183870/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 183825
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 183825
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 183825
 build-amd64                   4 host-install(4)        broken REGR. vs. 183825
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 183825
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 183825

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 33e31c289cc7b417f110d6da70dc8224443d32d3
baseline version:
 ovmf                 8736b8fdca85e02933cdb0a13309de14c9799ece

Last test of basis   183825  2023-11-22 13:41:06 Z    5 days
Testing same since   183867  2023-11-27 05:41:07 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  xieyuanh <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

jobs:
 build-amd64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit 33e31c289cc7b417f110d6da70dc8224443d32d3
Author: xieyuanh <yuanhao.xie@intel.com>
Date:   Mon Nov 20 12:09:14 2023 +0800

    UefiCpuPkg/MpInitLib: Update the comments of _CPU_MP_DATA.
    
    No functional changes in this patch.
    
    Updates the comments of _CPU_MP_DATA to delcared that duplications in
    CpuMpData are present to avoid to be direct accessed and comprehended
     in assembly code. CpuMpData: Intended for use in C code while
     ExchangeInfo are used in assembly code in this module.
    
    This patch deletes the unnecessary comments in CpuMpData, since
    CpuMpData is no longer responsible for passing information from PEI to
    DXE.
    
    Signed-off-by: Yuanhao Xie <yuanhao.xie@intel.com>
    Cc: Laszlo Ersek lersek@redhat.com
    Cc: Eric Dong <eric.dong@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>

commit cb3f41a9378822a0bcf0febf898af254b4994b8d
Author: Yuanhao Xie <yuanhao.xie@intel.com>
Date:   Fri Nov 10 16:03:02 2023 +0800

    UefiCpuPkg/MpInitLib: Enable execute disable bit.
    
    This patch synchronizes the No-Execute bit in the IA32_EFER
    register for the APs before the RestoreVolatileRegisters operation.
    
    The commit 964a4f0, titled "Eliminate the second INIT-SIPI-SIPI
    sequence," replaces the second INIT-SIPI-SIPI sequence with the BSP
    calling the SwitchApContext function to initiate a specialized start-up
    signal, waking up APs in the DXE instead of using INIT-SIPI-SIPI.
    
    Due to this change, the logic for "Enable execute disable bit" in
    MpFuncs.nasm is no longer executed. However, to ensure the proper setup
    of the page table, it is necessary to synchronize the IA32_EFER.NXE for
    APs before executing RestoreVolatileRegisters .
    
    Based on SDM:
    If IA32_EFER.NXE is set to 1, it signifies execute-disable, meaning
    instruction fetches are not allowed from the 4-KByte page controlled by
    this entry. Conversely, if it is set to 0, it is reserved.
    
    Signed-off-by: Yuanhao Xie <yuanhao.xie@intel.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Laszlo Ersek lersek@redhat.com
    Cc: Eric Dong <eric.dong@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>

