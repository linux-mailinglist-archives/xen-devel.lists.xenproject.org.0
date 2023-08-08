Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF4773888
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579299.907226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGvS-0006UJ-HM; Tue, 08 Aug 2023 07:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579299.907226; Tue, 08 Aug 2023 07:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGvS-0006S6-EC; Tue, 08 Aug 2023 07:14:42 +0000
Received: by outflank-mailman (input) for mailman id 579299;
 Tue, 08 Aug 2023 07:14:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTGvQ-0006Ru-QA; Tue, 08 Aug 2023 07:14:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTGvQ-0003kg-Gk; Tue, 08 Aug 2023 07:14:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTGvQ-0005rf-0q; Tue, 08 Aug 2023 07:14:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qTGvQ-000860-0O; Tue, 08 Aug 2023 07:14:40 +0000
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
	bh=FQYVY+Id1sADrSRkNk/YmKIsSLIkLY97Poi88PNBnGY=; b=nO+zGnoRci0AHYFGftmIX2aLRr
	/2I8BHquemIzMC0ymNpyOvzsveGgCGrxgF6Z/X1VD1chlnnEp1dBzNw/b7UCm817y2wMfD7ZXnOJL
	NYG7zrDdebcUeeCoP0l2zZzr5RNzAS2ecnGh/wZDIWc0cymq8VkqqkoAk8MDDh8BnlHc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182221-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 182221: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-examine-bios:xen-install:fail:regression
    xen-unstable:test-armhf-armhf-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=65f0d6fc80cba9d79b58e6f2bfc00e36d4e66898
X-Osstest-Versions-That:
    xen=e55146071de9257d70bd157047700071d0007622
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Aug 2023 07:14:40 +0000

flight 182221 xen-unstable real [real]
flight 182226 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182221/
http://logs.test-lab.xenproject.org/osstest/logs/182226/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-examine-bios  6 xen-install              fail REGR. vs. 182210

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-raw 17 guest-start/debian.repeat fail pass in 182226-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182210
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182210
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182210
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182210
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182210
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182210
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182210
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182210
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182210
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182210
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182210
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182210
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  65f0d6fc80cba9d79b58e6f2bfc00e36d4e66898
baseline version:
 xen                  e55146071de9257d70bd157047700071d0007622

Last test of basis   182210  2023-08-07 01:52:04 Z    1 days
Testing same since   182221  2023-08-07 18:40:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Gianluca	Luparini <gianluca.luparini@bugseng.com>
  Gianluca Luparini <gianluca.luparini@bugseng.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Simone Ballarin <simone.ballarin@bugseng.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
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
 test-armhf-armhf-xl                                          pass    
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
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
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
commit 65f0d6fc80cba9d79b58e6f2bfc00e36d4e66898
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 20 18:01:46 2023 +0100

    x86: Drop opt_pku entirely
    
    This option is particularly dubious as Xen does not use Protection Keys, owing
    to the sharing of pagetables with PV guests.  All this option does is hide PKU
    by default from HVM guests, and is therefore redundant with the more generic
    cpuid=no-pku.
    
    The variable ought to be in __initdata given it's single user, but deleting it
    entirely looks to be a better course of action.
    
    Visibility of PKU to guests should be handled via its vm.cfg file.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Henry Wang <Henry.Wang@arm.com>

commit 767d1a2cfdca962f4ae3f9f620e5c5f94db5f3e9
Author: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date:   Fri Jul 28 08:58:59 2023 +0100

    arm/mm: Document the differences between arm32 and arm64 directmaps
    
    arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
    the frame table. These comments highlight why arm32 doesn't need to account for PDX
    compression in its __va() implementation while arm64 does.
    
    Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit d63ea6c46b89bffb99647871c788c236a8286646
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Mon Aug 7 11:25:02 2023 +0200

    libelf: address MISRA C:2012 Rule 5.3
    
    The types u{8,16,32,64} defined in 'xen/arch/x86/include/asm/types.h'
    shadow the variables in the modified function, hence violating Rule 5.3.
    Therefore, the rename takes care of the shadowing.
    
    No functional changes.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 202a341fd41d281d08846136289d93a5425520f6
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Aug 7 11:24:28 2023 +0200

    x86: Address violations of MISRA C:2012 by replacing bool_t uses
    
    Give a name to unnamed parameters to address violations of
    MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
    named parameters").
    Keep consistency between object and function declarations thus
    addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
    object or function shall use the same names and type qualifiers").
    Replace the occurrences of bool_t with bool.
    
    No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 0c8d77e117126ffd15aa63fe7617c4fd64b3ad77
Author: Gianluca Luparini <gianluca.luparini@bugseng.com>
Date:   Mon Aug 7 11:23:54 2023 +0200

    xen/include: address violations of MISRA C:2012 Rule 7.3
    
    From: Gianluca Luparini <gianluca.luparini@bugseng.com>
    
    The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
    states:
    "The lowercase character 'l' shall not be used in a literal suffix".
    
    Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
    If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
    
    The changes in this patch are mechanical.
    
    Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
    Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 6ad7563727ab383396e7932e5f2005f032f4eb59
Author: Gianluca Luparini <gianluca.luparini@bugseng.com>
Date:   Mon Aug 7 11:23:29 2023 +0200

    xen/common: address violations of MISRA C:2012 Rule 7.3
    
    From: Gianluca Luparini <gianluca.luparini@bugseng.com>
    
    The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
    states:
    "The lowercase character 'l' shall not be used in a literal suffix".
    
    Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
    If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
    
    The changes in this patch are mechanical.
    
    Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
    Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit b89d204ee0fec0c4c2c639b9f37ef431d3b66100
Author: Gianluca	Luparini <gianluca.luparini@bugseng.com>
Date:   Mon Aug 7 11:22:58 2023 +0200

    xen/arm: address violations of MISRA C:2012 Rule 7.3
    
    The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
    states:
    "The lowercase character 'l' shall not be used in a literal suffix".
    
    Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
    If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
    
    The changes in this patch are mechanical.
    
    Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
    Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 680e66544caa5cf5dbb55e0b160733f61d9157c1
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Aug 7 11:22:24 2023 +0200

    xen/sched: address violations of MISRA C:2012 Rules 8.2 and 8.3
    
    Give a name to unnamed parameters to address violations of
    MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
    named parameters").
    Keep consistency between parameter names and types used in function
    declarations and the ones used in the corresponding function
    definitions, thus addressing violations of MISRA C:2012 Rule 8.3
    ("All declarations of an object or function shall use the same names
    and type qualifiers").
    
    No functional changes.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Dario Faggioli <dfaggioli@suse.com>

commit e26230a34982d8b771734cf43dbdc87864329d5a
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Mon Aug 7 11:21:24 2023 +0200

    xen/sched: mechanical renaming to address MISRA C:2012 Rule 5.3
    
    Rule 5.3 has the following headline:
    "An identifier declared in an inner scope shall not hide an
    identifier declared in an outer scope"
    
    The renaming s/sched_id/scheduler_id/ of the function defined in
    'xen/common/sched/core.c' prevents any hiding of that function
    by the instances of homonymous function parameters that
    are defined in inner scopes.
    
    Similarly, the renames
    - s/ops/operations/ for the static variable in 'xen/common/sched/core.c'
    - s/do_softirq/needs_softirq/
    are introduced for variables, to avoid any conflict with homonymous
    parameters or function identifiers.
    
    Moreover, the variable 'loop' defined at 'xen/common/sched/credit2.c:3887'
    has been dropped, in favour of the homonymous variable declared in the
    outer scope. This in turn requires a modification of the printk call that
    involves it.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Dario Faggioli <dfaggioli@suse.com>

commit a628e73de1f4839b58f3ef4026ade3e06f7e54ea
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Aug 7 11:20:15 2023 +0200

    x86/HVM: drop dead assignments from hvmemul_rep_{movs,stos}()
    
    In the latter case the variable altogether is then unused and hence gets
    dropped, eliminating a Misra Rule 5.3 violation. I'm afraid I mistakenly
    introduced both assignments in 57a57465daaf ("x86/HVM: use available
    linear->phys translations in REP MOVS/STOS handling"), likely as a
    result of some re-work on the patch.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Paul Durrant <paul@xen.org>
(qemu changes not included)

