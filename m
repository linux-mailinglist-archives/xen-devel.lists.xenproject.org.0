Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC0598738
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 17:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389650.626725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhH1-0007AD-VE; Thu, 18 Aug 2022 15:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389650.626725; Thu, 18 Aug 2022 15:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhH1-00076m-S4; Thu, 18 Aug 2022 15:17:31 +0000
Received: by outflank-mailman (input) for mailman id 389650;
 Thu, 18 Aug 2022 15:17:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOhH0-00076c-UT; Thu, 18 Aug 2022 15:17:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOhH0-0001vk-Qn; Thu, 18 Aug 2022 15:17:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOhH0-0002AG-Db; Thu, 18 Aug 2022 15:17:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oOhH0-0002qn-DD; Thu, 18 Aug 2022 15:17:30 +0000
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
	bh=xOf1Bj3IgPvuab1UwV1dmq+cICvEk6m66NN0AT+G9kM=; b=qBGaFyU96486gXAC2aga1J32af
	LdelAEDCdL4Li9/mWjfVzaecsDEpu5fEOSRKnGvp6CuL6Nn87xuJxhFVJPUbEdZBA6CqZdOafToGH
	ezHrz6+IUCOhpjtSJ9otmdaRd6Z+lL0U/7NaQgvDKVrBarult17FsnQ2P9OHJdAkaBII=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172620-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 172620: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:host-install(5):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6c987150cf71976b5dd16b5f736dd5b0c6f6aee8
X-Osstest-Versions-That:
    xen=f2beaf876dce590ee9937b79cd3498f2fe9f661c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Aug 2022 15:17:30 +0000

flight 172620 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172620/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 172605

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 172605
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6c987150cf71976b5dd16b5f736dd5b0c6f6aee8
baseline version:
 xen                  f2beaf876dce590ee9937b79cd3498f2fe9f661c

Last test of basis   172605  2022-08-17 17:00:27 Z    0 days
Testing same since   172620  2022-08-18 08:01:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Tim Deegan <tim@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          broken  
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit 6c987150cf71976b5dd16b5f736dd5b0c6f6aee8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 18 09:30:41 2022 +0200

    x86: rework hypercall argument count table instantiation & use
    
    The initial observation were duplicate symbols that our checking warns
    about. Instead of merely renaming one or both pair(s) of symbols,
    reduce #ifdef-ary at the same time by moving the instantiation of the
    arrays into a macro. While doing the conversion also stop open-coding
    array_access_nospec().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit fe3f50726e878c81985e28282927d151a0d49de5
Author: Jane Malalane <jane.malalane@citrix.com>
Date:   Thu Aug 18 09:30:10 2022 +0200

    x86/entry: move .init.text section higher up in the code for readability
    
    .init.text is a small section currently located amongst .text.entry
    code. Move it above .text.entry.
    
    This has no functional change but makes the code a bit more readable.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit f2d947ac0738098ec2f52a17448df7e2acd64ff9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 18 09:29:34 2022 +0200

    x86/P2M: allow 2M superpage use for shadowed guests
    
    For guests in shadow mode the P2M table gets used only by software. The
    only place where it matters whether superpages in the P2M can be dealt
    with is sh_unshadow_for_p2m_change(): The table is never made accessible
    to hardware for address translation, and the only checks of _PAGE_PSE in
    P2M entries in shadow code are in this function (all others are against
    guest page table entries). That function has been capable of handling
    them even before commit 0ca1669871f8a ("P2M: check whether hap mode is
    enabled before using 2mb pages") disabled 2M use in this case for
    dubious reasons ("potential errors when hap is disabled").
    
    While doing this, move "order" into more narrow scope and replace the
    local variable "d" by a new "hap" one.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 6270081c57978ff32d76d8eb11196fd217f7af2d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 18 09:29:04 2022 +0200

    x86/shadow: slightly consolidate sh_unshadow_for_p2m_change() (part III)
    
    In preparation for reactivating the presently dead 2M page path of the
    function, also deal with the case of replacing an L1 page table all in
    one go. Note that the prior comparing of MFNs to bypass the removal of
    shadows was insufficient (but kind of benign, for being dead code so
    far) - at the very least the R/W bit also needs considering there (to be
    on the safe side, compare the full [virtual] PTEs).
    
    While adjusting the first conditional in the loop for the use of the new
    local variable "nflags", also drop mfn_valid(): If anything we'd need to
    compare against INVALID_MFN, but that won't come out of l1e_get_mfn().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 241702e064604dbb3e0d9b731aa8f45be448243b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 18 09:28:38 2022 +0200

    x86/shadow: slightly consolidate sh_unshadow_for_p2m_change() (part II)
    
    Pull common checks out of the switch(). This includes extending a
    _PAGE_PRESENT check to L1 as well, which presumably was deemed redundant
    with p2m_is_valid() || p2m_is_grant(), but I think we are better off
    being explicit in all cases. Note that for L2 (or higher) the grant
    check isn't strictly necessary, as grants are only ever single pages.
    Leave a respective assertion.
    
    With _PAGE_PRESENT checked uniformly, the suspicious mfn_valid(omfn)
    checks can be dropped rather than moved/folded - if anything we'd need
    to compare against INVALID_MFN, but that won't come out of l1e_get_mfn().
    
    For L1 replace the moved out condition with a PTE comparison: There's
    no need for any update or flushing when the two match.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 0caf699e69d79f54b94191e2f84956713c4be0da
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 18 09:28:05 2022 +0200

    x86/shadow: slightly consolidate sh_unshadow_for_p2m_change() (part I)
    
    Replace a p2m_is_ram() check in the 2M case by an explicit _PAGE_PRESENT
    one, to make more obvious that the subsequent l1e_get_mfn() actually
    retrieves something that really is an MFN. It doesn't really matter
    whether it's RAM, as the subsequent comparison with the original MFN is
    going to lead to zapping of everything except the "same MFN again" case.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 62ca138c2c052187783aca3957d3f47c4dcfd683
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Thu Aug 18 09:25:50 2022 +0200

    tools/libxl: Replace deprecated -soundhw on QEMU command line
    
    -soundhw is deprecated since 825ff02911c9 ("audio: add soundhw
    deprecation notice"), QEMU v5.1, and is been remove for upcoming v7.1
    by 039a68373c45 ("introduce -audio as a replacement for -soundhw").
    
    Instead we can just add the sound card with "-device", for most option
    that "-soundhw" could handle. "-device" is an option that existed
    before QEMU 1.0, and could already be used to add audio hardware.
    
    The list of possible option for libxl's "soundhw" is taken the list
    from QEMU 7.0.
    
    The list of options for "soundhw" are listed in order of preference in
    the manual. The first three (hda, ac97, es1370) are PCI devices and
    easy to test on Linux, and the last four are ISA devices which doesn't
    seems to work out of the box on linux.
    
    The sound card 'pcspk' isn't listed even if it used to be accepted by
    '-soundhw' because QEMU crash when trying to add it to a Xen domain.
    Also, it wouldn't work with "-device" might need to be "-machine
    pcspk-audiodev=default" instead.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
(qemu changes not included)

