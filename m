Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B352369164F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 02:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493026.762833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQINE-0006yn-Sz; Fri, 10 Feb 2023 01:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493026.762833; Fri, 10 Feb 2023 01:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQINE-0006x9-O7; Fri, 10 Feb 2023 01:38:48 +0000
Received: by outflank-mailman (input) for mailman id 493026;
 Fri, 10 Feb 2023 01:38:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQINC-0006wx-NX; Fri, 10 Feb 2023 01:38:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQINC-0005Qw-C3; Fri, 10 Feb 2023 01:38:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQINB-0002qw-Qo; Fri, 10 Feb 2023 01:38:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQINB-0004Ic-P0; Fri, 10 Feb 2023 01:38:45 +0000
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
	bh=ajV6BI1AUDwHxOTkgpcswrjiYSFXFvlthP8VAVd8gy8=; b=mzjghI2alV+0fdBQR2G02aHqef
	S0rjlsU8zWLmPVAAebn6RJ+Rz5m2408bpWmZNoy1U/V2Mw00i5y+8D0zZWR5C/BhNnGf792FdkGKr
	FS4oEjlGoBSk/1XZutD/JukF0jJw+Fi7RsLBOewWu++475ai8kxfVr9XO7kespO02Al8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176756-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 176756: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-4.17-testing:test-amd64-i386-pair:xen-install/dst_host:fail:regression
    xen-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-4.17-testing:build-armhf:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=587823eca162d063027faf1826ec3544f0a06e78
X-Osstest-Versions-That:
    xen=3dae50283d9819c691a97f15b133124c00d39a2f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Feb 2023 01:38:45 +0000

flight 176756 xen-4.17-testing real [real]
flight 176796 xen-4.17-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/176756/
http://logs.test-lab.xenproject.org/osstest/logs/176796/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-pair         11 xen-install/dst_host     fail REGR. vs. 176459

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176459
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176459
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176459
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 176459
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176459
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176459
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 176459
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176459
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176459
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  587823eca162d063027faf1826ec3544f0a06e78
baseline version:
 xen                  3dae50283d9819c691a97f15b133124c00d39a2f

Last test of basis   176459  2023-02-07 16:39:55 Z    2 days
Testing same since   176756  2023-02-09 16:07:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Edwin Török <edwin.torok@cloud.com>
  Pau Ruiz Safont <pau.safont@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       pass    


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
commit 587823eca162d063027faf1826ec3544f0a06e78
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Feb 1 11:27:42 2023 +0000

    tools/ocaml/libs: Fix memory/resource leaks with caml_alloc_custom()
    
    All caml_alloc_*() functions can throw exceptions, and longjump out of
    context.  If this happens, we leak the xch/xce handle.
    
    Reorder the logic to allocate the the Ocaml object first.
    
    Fixes: 8b3c06a3e545 ("tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free")
    Fixes: 22d5affdf0ce ("tools/ocaml/evtchn: OCaml 5 support, fix potential resource leak")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit d69ccf52ad467ccc22029172a8e61dc621187889)

commit bf935b1ff7cc76b2d25f877e56a359afaafcac1f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 31 17:19:30 2023 +0000

    tools/ocaml/xc: Don't reference Abstract_Tag objects with the GC lock released
    
    The intf->{addr,len} references in the xc_map_foreign_range() call are unsafe.
    From the manual:
    
      https://ocaml.org/manual/intfc.html#ss:parallel-execution-long-running-c-code
    
    "After caml_release_runtime_system() was called and until
    caml_acquire_runtime_system() is called, the C code must not access any OCaml
    data, nor call any function of the run-time system, nor call back into OCaml
    code."
    
    More than what the manual says, the intf pointer is (potentially) invalidated
    by caml_enter_blocking_section() if another thread happens to perform garbage
    collection at just the right (wrong) moment.
    
    Rewrite the logic.  There's no need to stash data in the Ocaml object until
    the success path at the very end.
    
    Fixes: 8b7ce06a2d34 ("ocaml: Add XC bindings.")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit 9e7c74e6f9fd2e44df1212643b80af9032b45b07)

commit afdcc108566e5a4ee352b6427c98ebad6885a81d
Author: Edwin Török <edwin.torok@cloud.com>
Date:   Thu Jan 12 11:38:38 2023 +0000

    tools/ocaml/xc: Fix binding for xc_domain_assign_device()
    
    The patch adding this binding was plain broken, and unreviewed.  It modified
    the C stub to add a 4th parameter without an equivalent adjustment in the
    Ocaml side of the bindings.
    
    In 64bit builds, this causes us to dereference whatever dead value is in %rcx
    when trying to interpret the rflags parameter.
    
    This has gone unnoticed because Xapi doesn't use this binding (it has its
    own), but unbreak the binding by passing RDM_RELAXED unconditionally for
    now (matching the libxl default behaviour).
    
    Fixes: 9b34056cb4 ("tools: extend xc_assign_device() to support rdm reservation policy")
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit 4250683842104f02996428f93927a035c8e19266)

commit 021b82cc0c71ba592439f175c1ededa800b172a9
Author: Edwin Török <edwin.torok@cloud.com>
Date:   Thu Jan 12 17:48:29 2023 +0000

    tools/ocaml/evtchn: Don't reference Custom objects with the GC lock released
    
    The modification to the _H() macro for Ocaml 5 support introduced a subtle
    bug.  From the manual:
    
      https://ocaml.org/manual/intfc.html#ss:parallel-execution-long-running-c-code
    
    "After caml_release_runtime_system() was called and until
    caml_acquire_runtime_system() is called, the C code must not access any OCaml
    data, nor call any function of the run-time system, nor call back into OCaml
    code."
    
    Previously, the value was a naked C pointer, so dereferencing it wasn't
    "accessing any Ocaml data", but the fix to avoid naked C pointers added a
    layer of indirection through an Ocaml Custom object, meaning that the common
    pattern of using _H() in a blocking section is unsafe.
    
    In order to fix:
    
     * Drop the _H() macro and replace it with a static inline xce_of_val().
     * Opencode the assignment into Data_custom_val() in the two constructors.
     * Rename "value xce" parameters to "value xce_val" so we can consistently
       have "xenevtchn_handle *xce" on the stack, and obtain the pointer with the
       GC lock still held.
    
    Fixes: 22d5affdf0ce ("tools/ocaml/evtchn: OCaml 5 support, fix potential resource leak")
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit 2636d8ff7a670c4d2485757dbe966e36c259a960)

commit 5797b798a542a7e5be34698463152cb92f18776f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 31 10:59:42 2023 +0000

    tools/ocaml/libs: Allocate the correct amount of memory for Abstract_tag
    
    caml_alloc() takes units of Wsize (word size), not bytes.  As a consequence,
    we're allocating 4 or 8 times too much memory.
    
    Ocaml has a helper, Wsize_bsize(), but it truncates cases which aren't an
    exact multiple.  Use a BUILD_BUG_ON() to cover the potential for truncation,
    as there's no rounding-up form of the helper.
    
    Fixes: 8b7ce06a2d34 ("ocaml: Add XC bindings.")
    Fixes: d3e649277a13 ("ocaml: add mmap bindings implementation.")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit 36eb2de31b6ecb8787698fb1a701bd708c8971b2)

commit 2c21e1bee6d62cbd523069e839086addf35da9f2
Author: Edwin Török <edwin.torok@cloud.com>
Date:   Thu Jan 12 11:28:29 2023 +0000

    tools/ocaml/libs: Don't declare stubs as taking void
    
    There is no such thing as an Ocaml function (C stub or otherwise) taking no
    parameters.  In the absence of any other parameters, unit is still passed.
    
    This doesn't explode with any ABI we care about, but would malfunction for an
    ABI environment such as stdcall.
    
    Fixes: c3afd398ba7f ("ocaml: Add XS bindings.")
    Fixes: 8b7ce06a2d34 ("ocaml: Add XC bindings.")
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit ff8b560be80b9211c303d74df7e4b3921d2bb8ca)

commit e74d868b48d55dfb20f5a41ec20fbec93d8e5deb
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Tue May 11 15:56:50 2021 +0000

    tools/oxenstored: validate config file before live update
    
    The configuration file can contain typos or various errors that could prevent
    live update from succeeding (e.g. a flag only valid on a different version).
    Unknown entries in the config file would be ignored on startup normally,
    add a strict --config-test that live-update can use to check that the config file
    is valid *for the new binary*.
    
    For compatibility with running old code during live update recognize
    --live --help as an equivalent to --config-test.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit e6f07052ce4a0f0b7d4dc522d87465efb2d9ee86)

commit f0e653fb4aea77210b8096c170e82de3c2039d89
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:20 2022 +0000

    tools/ocaml/xb: Drop Xs_ring.write
    
    This function is unusued (only Xs_ring.write_substring is used), and the
    bytes/string conversion here is backwards: the C stub implements the bytes
    version and then we use a Bytes.unsafe_of_string to convert a string into
    bytes.
    
    However the operation here really is read-only: we read from the string and
    write it to the ring, so the C stub should implement the read-only string
    version, and if needed we could use Bytes.unsafe_to_string to be able to send
    'bytes'. However that is not necessary as the 'bytes' version is dropped above.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit 01f139215e678c2dc7d4bb3f9f2777069bb1b091)

commit 7d516fc87637dc551494f8eca08f106f578f7112
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:10 2022 +0000

    tools/ocaml/xb,mmap: Use Data_abstract_val wrapper
    
    This is not strictly necessary since it is essentially a no-op currently: a
    cast to void * and value *, even in OCaml 5.0.
    
    However it does make it clearer that what we have here is not a regular OCaml
    value, but one allocated with Abstract_tag or Custom_tag, and follows the
    example from the manual more closely:
    https://v2.ocaml.org/manual/intfc.html#ss:c-outside-head
    
    It also makes it clearer that these modules have been reviewed for
    compat with OCaml 5.0.
    
    We cannot use OCaml finalizers here, because we want exact control over when
    to unmap these pages from remote domains.
    
    No functional change.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit d2ccc637111d6dbcf808aaffeec7a46f0b1e1c81)

commit 5d8f9cfa166c55a308856e7b021d778350edbd6c
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Tue Nov 1 17:59:17 2022 +0000

    tools/ocaml/xenctrl: Use larger chunksize in domain_getinfolist
    
    domain_getinfolist() is quadratic with the number of domains, because of the
    behaviour of the underlying hypercall.  Nevertheless, getting domain info in
    blocks of 1024 is far more efficient than blocks of 2.
    
    In a scalability testing scenario with ~1000 VMs, a combination of this and
    the previous change takes xenopsd's wallclock time in domain_getinfolist()
    down from 88% to 0.02%
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Tested-by: Pau Ruiz Safont <pau.safont@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit 95db09b1b154fb72fad861815ceae1f3fa49fc4e)

commit 03f545b6cf3220b4647677b588e5525a781a4813
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Tue Nov 1 17:59:16 2022 +0000

    tools/ocaml/xenctrl: Make domain_getinfolist tail recursive
    
    domain_getinfolist() is quadratic with the number of domains, because of the
    behaviour of the underlying hypercall.  xenopsd was further observed to be
    wasting excessive quantites of time manipulating the list of already-obtained
    domains.
    
    Implement a tail recursive `rev_concat` equivalent to `concat |> rev`, and use
    it instead of calling `@` multiple times.
    
    An incidental benefit is that the list of domains will now be in domid order,
    instead of having pairs of 2 domains changing direction every time.
    
    In a scalability testing scenario with ~1000 VMs, a combination of this and
    the subsequent change takes xenopsd's wallclock time in domain_getinfolist()
    down from 88% to 0.02%
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Tested-by: Pau Ruiz Safont <pau.safont@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    (cherry picked from commit c3b6be714c64aa62b56d0bce96f4b6a10b5c2078)
(qemu changes not included)

