Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF815970222
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 14:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792214.1202188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smuDa-0005r3-NU; Sat, 07 Sep 2024 12:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792214.1202188; Sat, 07 Sep 2024 12:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smuDa-0005pX-Ks; Sat, 07 Sep 2024 12:07:06 +0000
Received: by outflank-mailman (input) for mailman id 792214;
 Sat, 07 Sep 2024 12:07:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smuDZ-0005pN-Er; Sat, 07 Sep 2024 12:07:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smuDZ-0003D1-69; Sat, 07 Sep 2024 12:07:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smuDY-0000pS-P4; Sat, 07 Sep 2024 12:07:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smuDY-0003p5-Ob; Sat, 07 Sep 2024 12:07:04 +0000
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
	bh=4vJh6gx6wt3ekN+qaWZXyEiuv0Se0TvYAwH2u+VRGW8=; b=O75euDH61UDZ/Lz2G8UxeEGvWG
	wehxGVD7I+lbuQHS/Wt39BJIlON9QCyKKUox6cjzXTHJ4T0dVrbHaAcvouf6EG9H1HO+OjrEAAdha
	dqGGfP++BJaeog4IidQ07/KsxIiDbHdVLHl8SW0/IpKT1Rn/0U4LP199U4aYDovFl6ko=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187545-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 187545: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:build-armhf:xen-build:fail:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:guest-localmigrate:fail:allowable
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=65e4bc585c28b50ec76f679e1001a81fea9d690b
X-Osstest-Versions-That:
    xen=6471badeeec92db1cb8155066551f7509cd82efd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Sep 2024 12:07:04 +0000

flight 187545 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187545/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 187498

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-qemuu-freebsd12-amd64 17 guest-localmigrate fail REGR. vs. 187498

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187498
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187498
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187498
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187498
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187498
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  65e4bc585c28b50ec76f679e1001a81fea9d690b
baseline version:
 xen                  6471badeeec92db1cb8155066551f7509cd82efd

Last test of basis   187498  2024-09-04 19:40:48 Z    2 days
Failing since        187507  2024-09-05 15:14:45 Z    1 days    3 attempts
Testing same since   187545  2024-09-06 22:40:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrii Sultanov <andrii.sultanov@cloud.com>
  Christian Lindig <christian.lindig@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Matthew Barnes <matthew.barnes@cloud.com>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
commit 65e4bc585c28b50ec76f679e1001a81fea9d690b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 4 13:27:03 2024 +0100

    x86/trampoline: Move the trampoline declarations out of <asm/config.h>
    
    asm/config.h is included in every translation unit (via xen/config.h), while
    only a handful of functions actually interact with the trampoline.
    
    Move the infrastructure into its own header, and take the opportunity to
    document everything.
    
    Change trampoline_realmode_entry() and wakeup_start() to be nocall functions,
    rather than char arrays.  Also switch to fixed width integers which are less
    likely to diverge from the asm declaration.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit b34d5e3de9df64d26457bb4808c3b809965ee16c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 4 14:48:53 2024 +0100

    x86/acpi: Drop acpi_video_flags and use bootsym(video_flags) directly
    
    This removes a level of indirection, as well as removing a somewhat misleading
    name; the variable is really "S3 video quirks".
    
    More importantly however it makes it very clear that, right now, parsing the
    cmdline and quirks depends on having already placed the trampoline; a
    dependency which is going to be gnarly to untangle.
    
    That said, fixing the quirk is easy.  The Toshiba Satellite 4030CDT has an
    Intel Celeron 300Mhz CPU (Pentium 2 era) from 1998 when MMX was the headline
    feature, sporting 64M of RAM.  Being a 32-bit processor, it hasn't been able
    to run Xen for about a decade now, so drop the quirk entirely.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

commit 81d48d857efa451ca3ed46e3d0633f54084b6f5b
Author: Andrii Sultanov <andrii.sultanov@cloud.com>
Date:   Tue Sep 3 12:44:42 2024 +0100

    tools/ocaml: Build infrastructure for OCaml dynamic libraries
    
    Dynamic libraries in OCaml require an additional compilation step on top
    of the already specified steps for static libraries. Add an appropriate
    template to Makefile.rules.
    
    Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit 8c3ab4ffa953b5ea4724e825ffa7356532814093
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 21 20:05:15 2024 +0100

    xen/ppc: Adjust ppc64_defconfig
    
    All of CONFIG_SCHED_*, and CONFIG_HYPFS build fine.
    
    Add a stub for share_xen_page_with_guest(), which is all that is necessary to
    make CONFIG_TRACEBUFFER build.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 5afb11ac409185d862f405b2509b89abc2311bf5
Author: Matthew Barnes <matthew.barnes@cloud.com>
Date:   Wed Aug 21 16:34:37 2024 +0100

    x86/cpufeatures: Add new cpuid features in SPR to featureset
    
    Upon running `xen-cpuid -v` on a host machine with Sapphire Rapids
    within Dom0, there exist unrecognised features.
    
    This patch adds these features as macros to the CPU featureset,
    disabled by default.
    
    Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 01ffbe8bcffdc5c6c98f0715bac95f3348b1c0cc
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 6 12:48:42 2024 +0200

    x86emul/test: use MSR constants
    
    msr-index.h has been in use for a while, so use the identifiers it
    provides in place of raw numbers plus comments.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d092002824a1fa675c936170d099c5646ecf8082
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 6 12:47:58 2024 +0200

    x86emul: mark new "cp" local var maybe-unused
    
    Just for the sake of the 32-bit build of the test harness. This wants
    reverting once unconditional uses of the variable appear (AMX, AVX10).
    
    Fixes: b20e3fbc3ec9 ("x86emul: introduce a struct cpu_policy * local in x86_emulate()")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 3c09288298af881ea1bb568740deb2d2a06bcd41
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 6 08:41:18 2024 +0200

    x86emul/test: fix build with gas 2.43
    
    Drop explicit {evex} pseudo-prefixes. New gas (validly) complains when
    they're used on things other than instructions. Our use was potentially
    ahead of macro invocations - see simd.h's "override" macro.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit e3b5440012721560ff48859ba8c4ea7f72f9ef20
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 6 08:40:21 2024 +0200

    x86/xstate: enable AMX components
    
    These being controlled by XCR0, enabling support is relatively
    straightforward. Note however that there won't be any use of them until
    their dependent ISA extension CPUID flags are exposed, not the least due
    to recalculate_xstate() handling the dependencies in kind of a reverse
    manner.
    
    Note that xstate_check_sizes() already covers the two new states.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a2de7dc4d845738e734b10fce6550c89c6b1092c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Sep 4 16:09:28 2024 +0200

    x86: fix UP build with gcc14
    
    The complaint is:
    
    In file included from ././include/xen/config.h:17,
                     from <command-line>:
    arch/x86/smpboot.c: In function ‘link_thread_siblings.constprop’:
    ./include/asm-generic/percpu.h:16:51: error: array subscript [0, 0] is outside array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds=]
       16 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
    ./include/xen/compiler.h:140:29: note: in definition of macro ‘RELOC_HIDE’
      140 |     (typeof(ptr)) (__ptr + (off)); })
          |                             ^~~
    arch/x86/smpboot.c:238:27: note: in expansion of macro ‘per_cpu’
      238 |     cpumask_set_cpu(cpu2, per_cpu(cpu_sibling_mask, cpu1));
          |                           ^~~~~~~
    In file included from ./arch/x86/include/generated/asm/percpu.h:1,
                     from ./include/xen/percpu.h:30,
                     from ./arch/x86/include/asm/cpuid.h:9,
                     from ./arch/x86/include/asm/cpufeature.h:11,
                     from ./arch/x86/include/asm/system.h:6,
                     from ./include/xen/list.h:11,
                     from ./include/xen/mm.h:68,
                     from arch/x86/smpboot.c:12:
    ./include/asm-generic/percpu.h:12:22: note: while referencing ‘__per_cpu_offset’
       12 | extern unsigned long __per_cpu_offset[NR_CPUS];
          |                      ^~~~~~~~~~~~~~~~
    
    Which I consider bogus in the first place ("array subscript [0, 0]" vs a
    1-element array). Yet taking the experience from 99f942f3d410 ("Arm64:
    adjust __irq_to_desc() to fix build with gcc14") I guessed that
    switching function parameters to unsigned int (which they should have
    been anyway) might help. And voilà ...
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 3117e58ce03a0aecd945abe99778407a176fe2f1
Author: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Date:   Wed Sep 4 16:08:37 2024 +0200

    x86/tboot: add Intel dependency
    
    Make the Intel-specific Trusted Boot implementation dependant on general Intel CPU support.
    
    Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit c5be91eb81403195643e8de287c86fbd728ad6cb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Sep 4 16:07:41 2024 +0200

    mktarball: only archive Xen
    
    As was basically decided already a while ago, remove - in the simplest
    possible way - the archiving of both qemu-s and mini-os from tarball
    generation.
    
    With this the subtree-force-update-all prereq isn't needed anymore in
    the top level Makefile. That goal, including the respective ones
    underneath tools/, then also are unreferenced and hence are being
    dropped, too.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b20e3fbc3ec91b4534e51f6f724c3826dac0bdf3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Sep 4 16:06:42 2024 +0200

    x86emul: introduce a struct cpu_policy * local in x86_emulate()
    
    While of little effect right here, future patches (AVX10, AMX,
    KeyLocker) will benefit more significantly.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 3c93a0da6bc201ebeb8a08d6bd339c9982985fcc
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Sep 4 16:06:21 2024 +0200

    x86emul/test: rename "cp"
    
    In preparation of introducing a const struct cpu_policy * local in
    x86_emulate(), rename that global variable to something more suitable:
    "cp" is our commonly used name for function parameters or local
    variables of type struct cpu_policy *, and the present name of the
    global could hence have interfered already.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d7c18b8720824d7efc39ffa7296751e1812865a9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Sep 4 16:05:03 2024 +0200

    SUPPORT.md: split XSM from Flask
    
    XSM is a generic framework, which in particular is also used by SILO.
    With this it can't really be experimental: Arm mandates SILO for having
    a security supported configuration.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
(qemu changes not included)

