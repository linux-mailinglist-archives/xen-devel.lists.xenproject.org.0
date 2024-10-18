Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901759A4560
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 20:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822118.1236090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1rHp-0007k7-R4; Fri, 18 Oct 2024 18:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822118.1236090; Fri, 18 Oct 2024 18:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1rHp-0007hf-Nm; Fri, 18 Oct 2024 18:01:17 +0000
Received: by outflank-mailman (input) for mailman id 822118;
 Fri, 18 Oct 2024 18:01:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1rHo-0007hV-0Z; Fri, 18 Oct 2024 18:01:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1rHn-0001kW-RG; Fri, 18 Oct 2024 18:01:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1rHn-0003Ax-JQ; Fri, 18 Oct 2024 18:01:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1rHn-0007Lv-Iv; Fri, 18 Oct 2024 18:01:15 +0000
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
	bh=0LK1uzFDL59ocoCAeRD2irfKxDX6x+zbIFO6S2OuCtY=; b=CzznvVj6ZKE3XmSXZOep/OUhM/
	kGj2+nyvBsM2/FlHLgg7ITTf4+IFiBQ04f3RekMVw/E+ozxGSpgbMEFyhpC6u9zGbGUqYYSNJBsLf
	UC66Prd1L8m+4JCOPftjZUhjesP40H30OSVB+qDK0WTlYMlncDMO+/jaNou8Ek/paUr8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188253-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188253: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=6e197a8ba5e349e511850fc52457992de88c8795
X-Osstest-Versions-That:
    ovmf=e19cc32bce466fb1c175f7d44708c2ebb45802a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Oct 2024 18:01:15 +0000

flight 188253 ovmf real [real]
flight 188264 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/188253/
http://logs.test-lab.xenproject.org/osstest/logs/188264/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 188152

version targeted for testing:
 ovmf                 6e197a8ba5e349e511850fc52457992de88c8795
baseline version:
 ovmf                 e19cc32bce466fb1c175f7d44708c2ebb45802a7

Last test of basis   188152  2024-10-17 07:11:33 Z    1 days
Failing since        188156  2024-10-17 09:14:11 Z    1 days    8 attempts
Testing same since   188188  2024-10-17 17:12:12 Z    1 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  jack Hsieh <v-chhsieh@microsoft.com>
  Jeremy Compostella <jeremy.compostella@intel.com>
  Kun Qin <kuqin12@gmail.com>
  Kun Qin <kuqin@microsoft.com>
  Sienski Piotr <piotr.sienski@intel.com>
  v-chhsieh <v-chhsieh@microsoft.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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
commit 6e197a8ba5e349e511850fc52457992de88c8795
Author: v-chhsieh <v-chhsieh@microsoft.com>
Date:   Mon Sep 30 14:43:39 2024 +0800

    MdePkg: Add Google Test Library and Protocol
    
    Mock Libraries:
     MdePkg\Test\Mock\Library\GoogleTest\MockCpuLib
     MdePkg\Test\Mock\Library\GoogleTest\MockPciSegmentLib
     MdePkg\Test\Mock\Library\GoogleTest\MockReportStatusCodeLib
     MdePkg\Test\Mock\Library\GoogleTest\MockSmmServicesTableLib
    
    Mock Protocol:
     MdePkg\Test\Mock\Include\GoogleTest\Protocol\MockMpService.h
    
    Signed-off-by: jack Hsieh <v-chhsieh@microsoft.com>
    Cc: Maintainer Shruti Gupta <shrugupt@microsoft.com>
    Cc: Reviewer   Shruti Gupta <shrugupt@microsoft.com>

commit 866abb233817eb349fa5fe2b32283e990a8e5056
Author: Jeremy Compostella <jeremy.compostella@intel.com>
Date:   Wed Oct 9 15:03:13 2024 -0700

    MdeModulePkg: Replace right bit shift operator with RShiftU64
    
    Instead of using bit shift operations, it is preferable to use BaseLib
    bit shift functions to prevent compilers from inserting intrinsics.
    
    Signed-off-by: Jeremy Compostella <jeremy.compostella@intel.com>

commit 996e740cc83aa499d91b3ab3ae857dab7578e05c
Author: Jeremy Compostella <jeremy.compostella@intel.com>
Date:   Tue Oct 8 16:55:51 2024 -0700

    MdeModulePkg: Fix PeiAllocatePages() corner case
    
    I recently ran into an AllocatePages() hang. It turns out that
    AllocatePages() does not account for the Memory Allocation HOB when it
    makes the decision of allocating out of free memory.
    
    Here is the scenario:
    
      FreeMemoryTop    - 0x71C03000
      FreeMemoryBottom - 0x71BDBFD8
      => We have 159,784 bytes left => ~39.0098 pages left.
    
    We attempt to allocate 39 pages. There are enough pages left but
    allocating those pages requires to allocate a Memory Allocation HOB
    which needs an extra 48 bytes. But once the pages are allocated,
    there are only 40 bytes left.
    
    In addition to taking into account the Memory Allocation HOB size,
    this commit reverses the condition to keep it simple.
    
    Signed-off-by: Jeremy Compostella <jeremy.compostella@intel.com>

commit 1b70dcd375765d293f57fe546710b98525e6a46d
Author: Sienski Piotr <piotr.sienski@intel.com>
Date:   Mon Oct 14 12:24:14 2024 +0200

    MdePkg/Include/Guid: Add missing CXL definitions to Cper.h
    
    [Issue Description]
    In MdePkg/Include/Guid/Cper.h there are missing multiple definitions
    regarding CXL that can be found in UEFI 2.10 spec
    chapters N.2.13 and N.2.14
    
    [Resolution]
    Add these definitions to MdePkg/Include/Guid/Cper.h
    
    Signed-off-by: Sienski Piotr <piotr.sienski@intel.com>

commit 79598f34fa024ad2491b46b95c3189c5a7f159d2
Author: Kun Qin <kuqin12@gmail.com>
Date:   Wed Aug 10 22:56:34 2022 -0700

    MdeModulePkg: PeiMain: Updated dispatcher for delayed dispatch
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
    
    This change adds a check for PEI dispatcher to continue dispatching when
    there are still pending delayed dispatch requests, to be compatible with
    newly integrated Delayed Dispatcher PPI interface.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Cc: Debkumar De <debkumar.de@intel.com>
    Cc: Catharine West <catharine.west@intel.com>
    
    Co-authored-by: John Schock <joschock@microsoft.com>
    Signed-off-by: Kun Qin <kuqin12@gmail.com>

commit d64d1e195ceb003c824786bfd817227c7ae81f06
Author: Kun Qin <kuqin@microsoft.com>
Date:   Thu Sep 19 14:11:37 2024 -0700

    MdeModulePkg: PeiMain: Introduce implementation of delayed dispatch
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
    
    This change adds the implementation that fits the needs and description
    of PI spec defined Delayed Dispatch PPI in Pei Core.
    
    The PPI would allow minimal delay for registered callbacks. As well as
    allowing other functions to wait for GUIDed delayed dispatch callbacks.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Debkumar De <debkumar.de@intel.com>
    Cc: Catharine West <catharine.west@intel.com>
    
    Co-authored-by: Mike Turner <mikeyt@pobox.com>
    Co-authored-by: Sachin Ganesh <sachinganesh@ami.com>
    Signed-off-by: Kun Qin <kuqin12@gmail.com>

commit b3f36e151d8b014cac5c6a833e2270c14d998739
Author: Kun Qin <kuqin@microsoft.com>
Date:   Thu Sep 19 14:09:03 2024 -0700

    MdePkg: Update Delayed Dispatch PPI as per PI 1.8 A Spec
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
    
    PI spec defined the `Register` function input argument `Delay` as output.
    However, this parameter should be used to define the minmal time delay
    the callback should fire. Thus it should be an input parameter.
    
    This change fixed the argument type.
    
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>
    
    Co-authored-by: Mike Turner <mikeyt@pobox.com>
    Co-authored-by: Sachin Ganesh <sachinganesh@ami.com>
    Signed-off-by: Kun Qin <kuqin12@gmail.com>

