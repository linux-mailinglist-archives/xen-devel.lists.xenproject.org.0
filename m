Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78314810AF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 08:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252294.433304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2TP4-0003H8-DT; Wed, 29 Dec 2021 07:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252294.433304; Wed, 29 Dec 2021 07:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2TP4-0003FL-9J; Wed, 29 Dec 2021 07:29:42 +0000
Received: by outflank-mailman (input) for mailman id 252294;
 Wed, 29 Dec 2021 07:29:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n2TP2-0003FB-8D; Wed, 29 Dec 2021 07:29:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n2TP2-000234-2R; Wed, 29 Dec 2021 07:29:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n2TP1-0005Eu-Mu; Wed, 29 Dec 2021 07:29:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n2TP1-0007O4-MU; Wed, 29 Dec 2021 07:29:39 +0000
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
	bh=S7VlE/Hh9vJxhoF23k6asqTXpy2ZjlvnYfF4SCA3n+0=; b=Mr3TCdBL7guR1wAikmNUbY/UbF
	EvBQwpvnZkOBbSdiWQ8OWUNSBbMEmyJsnPFfb1H6qkiDu1fCMlDLa9ifeBYM+3ZrbUL56CbH1qekf
	vLJOMSlLvd2UneiqgOlI754q+7ReI+TQtSlNlb5P0SERLZN4RRbvOsRWrpwffLqzDj90=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167553-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167553: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-arndale:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-xl-credit2:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-libvirt-raw:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-xl:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ecf71de775a049cbfa6298deceb8ba2083331171
X-Osstest-Versions-That:
    linux=a8ad9a2434dc7967ab285437f443cae633b6fc1c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Dec 2021 07:29:39 +0000

flight 167553 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167553/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-libvirt-qcow2    <job status>                 broken
 test-armhf-armhf-libvirt-raw    <job status>                 broken
 test-armhf-armhf-xl-arndale   5 host-install(5)        broken REGR. vs. 167548
 test-armhf-armhf-xl-credit2   5 host-install(5)        broken REGR. vs. 167548
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 167548
 test-armhf-armhf-libvirt-raw  5 host-install(5)        broken REGR. vs. 167548
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 167548
 test-armhf-armhf-xl-cubietruck  5 host-install(5)      broken REGR. vs. 167548
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 167548

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167548
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167548
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167548
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167548
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167548
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167548
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ecf71de775a049cbfa6298deceb8ba2083331171
baseline version:
 linux                a8ad9a2434dc7967ab285437f443cae633b6fc1c

Last test of basis   167548  2021-12-27 17:12:14 Z    1 days
Testing same since   167553  2021-12-28 20:40:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Torvalds <torvalds@linux-foundation.org>
  Luiz Sampaio <sampaio.ime@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Miguel Ojeda <ojeda@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               broken  
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    


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
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-armhf-armhf-libvirt-qcow2 broken
broken-job test-armhf-armhf-libvirt-raw broken
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-xl-cubietruck host-install(5)

Not pushing.

------------------------------------------------------------
commit ecf71de775a049cbfa6298deceb8ba2083331171
Merge: f651faaaba5f 4daa9ff89ef2
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Dec 28 11:46:15 2021 -0800

    Merge tag 'auxdisplay-for-linus-v5.16' of git://github.com/ojeda/linux
    
    Pull auxdisplay fixes from Miguel Ojeda:
     "A couple of improvements for charlcd:
    
       - check pointer before dereferencing
    
       - fix coding style issue"
    
    * tag 'auxdisplay-for-linus-v5.16' of git://github.com/ojeda/linux:
      auxdisplay: charlcd: checking for pointer reference before dereferencing
      auxdisplay: charlcd: fixing coding style issue

commit f651faaaba5f41ffac195e64f58483721e60eafc
Merge: a8ad9a2434dc 8d84fca4375e
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Dec 28 11:42:01 2021 -0800

    Merge tag 'powerpc-5.16-5' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
    
    Pull powerpc fix from Michael Ellerman:
     "Fix DEBUG_WX never reporting any WX mappings, due to use of an
      incorrect config symbol since we converted to using generic ptdump"
    
    * tag 'powerpc-5.16-5' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux:
      powerpc/ptdump: Fix DEBUG_WX since generic ptdump conversion

commit 8d84fca4375e3c35dadc16b8c7eee6821b2a575c
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Fri Dec 3 23:41:12 2021 +1100

    powerpc/ptdump: Fix DEBUG_WX since generic ptdump conversion
    
    In note_prot_wx() we bail out without reporting anything if
    CONFIG_PPC_DEBUG_WX is disabled.
    
    But CONFIG_PPC_DEBUG_WX was removed in the conversion to generic ptdump,
    we now need to use CONFIG_DEBUG_WX instead.
    
    Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
    Cc: stable@vger.kernel.org # v5.15+
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
    Link: https://lore.kernel.org/r/20211203124112.2912562-1-mpe@ellerman.id.au

commit 4daa9ff89ef27be43c15995412d6aee393a78200
Author: Luiz Sampaio <sampaio.ime@gmail.com>
Date:   Tue Nov 9 19:07:32 2021 -0300

    auxdisplay: charlcd: checking for pointer reference before dereferencing
    
    Check if the pointer lcd->ops->init_display exists before dereferencing it.
    If a driver called charlcd_init() without defining the ops, this would
    return segmentation fault, as happened to me when implementing a charlcd
    driver.  Checking the pointer before dereferencing protects from
    segmentation fault.
    
    Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
    Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

commit 94047df12fec0e51e860b5317223f67a3ea4eb07
Author: Luiz Sampaio <sampaio.ime@gmail.com>
Date:   Tue Nov 9 19:07:31 2021 -0300

    auxdisplay: charlcd: fixing coding style issue
    
    Removing 'int' from 'unsigned long int' declaration, which is unnecessary.
    
    Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
    Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

