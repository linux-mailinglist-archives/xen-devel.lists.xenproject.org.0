Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E03885FAE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696537.1087529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMAI-00033C-L5; Thu, 21 Mar 2024 17:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696537.1087529; Thu, 21 Mar 2024 17:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMAI-00030j-HD; Thu, 21 Mar 2024 17:25:18 +0000
Received: by outflank-mailman (input) for mailman id 696537;
 Thu, 21 Mar 2024 17:25:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnMAG-00030Z-KK; Thu, 21 Mar 2024 17:25:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnMAG-0006Z5-EX; Thu, 21 Mar 2024 17:25:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnMAG-0000cx-5B; Thu, 21 Mar 2024 17:25:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rnMAG-0002Jb-4i; Thu, 21 Mar 2024 17:25:16 +0000
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
	bh=8guZZjlH0GJPfModEouOTDAyxBmoVrLUmwILUBUpVnA=; b=KqKUU5XPX6KO7yG4S/gBy4P32i
	ZGRogLONhCcm0N6H1sSbN1zQDhWLVX57+K9UeDDe0DPNj1h09W/b9KVXuwbEJh33kiAn34mTJD4g8
	K6F9WhKxrFCEYHlOCBMmOZbMPAgrsFVhxRiIJmM+9NzFZsQL+gIxmJwp7bzofE03iYPA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185125-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185125: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ee973396f008ff0de2836b7ca100ce822740fa41
X-Osstest-Versions-That:
    xen=eaafbd11344a8ec32309fe58a6e529fe1c34d62e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Mar 2024 17:25:16 +0000

flight 185125 xen-unstable-smoke real [real]
flight 185130 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185125/
http://logs.test-lab.xenproject.org/osstest/logs/185130/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 185109

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ee973396f008ff0de2836b7ca100ce822740fa41
baseline version:
 xen                  eaafbd11344a8ec32309fe58a6e529fe1c34d62e

Last test of basis   185109  2024-03-20 09:03:31 Z    1 days
Failing since        185120  2024-03-21 09:03:04 Z    0 days    2 attempts
Testing same since   185125  2024-03-21 13:00:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Carlo Nonato <carlo.nonato@minervasys.tech>
  Elliott Mitchell <ehem+xen@m5p.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     pass    


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
commit ee973396f008ff0de2836b7ca100ce822740fa41
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Mar 18 18:07:05 2024 +0000

    x86/cpuid: More AMD features
    
    All of these are informational and require no further logic changes in Xen to
    support.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 5205bda5f11cc03ca62ad2bb6c34bf738bbb3247
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Oct 22 14:53:26 2018 +0100

    x86/p2m: Coding style cleanup
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 97b90f9bf2e5c93e0f61c927fa2bc8a56a213faa
Author: Shawn Anastasio <sanastasio@raptorengineering.com>
Date:   Thu Mar 21 09:49:20 2024 +0100

    xen/ppc: Ensure ELF sections' physical load addresses start at 0x0
    
    Some boot mechanisms, including the new linux file_load kexec systemcall
    used by system firmware v2.10 on RaptorCS systems will try to honor the
    physical address field of the ELF LOAD section header, which will fail
    when the address is based off of XEN_VIRT_START (0xc000000000000000).
    
    To ensure that the physical address of the LOAD section header starts at
    0x0, move x86's DECL_SECTION macro to xen.lds.h and use it to declare
    all sections.
    
    Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 10e8d824b76f55dde7c1793f48d76d4ff9df5e0a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 21 09:48:49 2024 +0100

    AMD/IOMMU: drop remaining guest-IOMMU bits too
    
    With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
    functions") having removed the sole place where d->g_iommu would be set
    to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
    latest from its 2nd if(). With it dropped, all other stuff in the file
    is unused, too. Delete iommu_guest.c altogether.
    
    Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
    struct mmio_reg for being unused with the unused g_iommu also dropped
    from struct arch_iommu.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit cc950c49ae6a6690f7fc3041a1f43122c250d250
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 21 09:48:10 2024 +0100

    x86/PoD: tie together P2M update and increment of entry count
    
    When not holding the PoD lock across the entire region covering P2M
    update and stats update, the entry count - if to be incorrect at all -
    should indicate too large a value in preference to a too small one, to
    avoid functions bailing early when they find the count is zero. However,
    instead of moving the increment ahead (and adjust back upon failure),
    extend the PoD-locked region.
    
    Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit f5c2b6da26d9becd5a1a03fcd3e5c950301030a2
Author: Carlo Nonato <carlo.nonato@minervasys.tech>
Date:   Thu Mar 21 09:47:21 2024 +0100

    xen/page_alloc: introduce page flag to stop buddy merging
    
    Add a new PGC_no_buddy_merge flag that prevents the buddy algorithm in
    free_heap_pages() from merging pages that have it set. As of now, only
    PGC_static has this feature, but future work can extend it easier than
    before.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 75214d5e53f60a7b19e90ebdb090c20044a052ca
Author: Carlo Nonato <carlo.nonato@minervasys.tech>
Date:   Thu Mar 21 09:46:42 2024 +0100

    xen/page_alloc: introduce preserved page flags macro
    
    PGC_static and PGC_extra needs to be preserved when assigning a page.
    Define a new macro that groups those flags and use it instead of or'ing
    every time.
    
    To make preserved flags even more meaningful, they are kept also when
    switching state in mark_page_free().
    
    Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6eb13b6b1d984af87460f60f2c0cbc5c059b8402
Author: Elliott Mitchell <ehem+xen@m5p.com>
Date:   Thu Mar 21 09:46:13 2024 +0100

    tools/xl_parse: remove message for tsc mode string
    
    Normal behavior is to be silent.  Generating a message for the preferred
    input can be mistaken for an error.  As such remove this message to match
    other conditions.
    
    Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

