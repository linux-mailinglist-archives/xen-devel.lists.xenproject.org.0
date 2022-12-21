Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5D652B05
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 02:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467508.726574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7nxG-0006gO-Dn; Wed, 21 Dec 2022 01:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467508.726574; Wed, 21 Dec 2022 01:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7nxG-0006d4-8F; Wed, 21 Dec 2022 01:31:34 +0000
Received: by outflank-mailman (input) for mailman id 467508;
 Wed, 21 Dec 2022 01:31:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7nxE-0006cu-8c; Wed, 21 Dec 2022 01:31:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7nxE-0000zD-2y; Wed, 21 Dec 2022 01:31:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7nxD-0006L0-Fp; Wed, 21 Dec 2022 01:31:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7nxD-0005Fo-Ep; Wed, 21 Dec 2022 01:31:31 +0000
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
	bh=nKHu36aUOSOtdS4QGZBBGd2ObdsYrfwLsqEmP5iH+/k=; b=BpeTwjl+mAkmNQuAwNVYONxtQK
	rVjCzbTyGjVroa0sxMEwmkA9QfaMzs3r6NMUVrsedinLvaVWTSF2QAtsEIWOXJFOi5jCnF6IUSvhW
	sN8EorlNi5QYrmh1I7ITRCOG5rGPEkhOr1iJ7X5H0lbz33Qoqg3uwmD29Kh78X2ti8Cg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175421-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 175421: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-migrupgrade:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-pvshim:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-migrupgrade:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-examine-uefi:host-install:broken:regression
    xen-unstable:test-amd64-i386-libvirt:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-examine-uefi:memdisk-try-append:fail:allowable
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f1b9a28922d2913dda76fd82b0b79f3651d3fc8d
X-Osstest-Versions-That:
    xen=12b593ca0d61ef884c2f2de15ed36b4900fc92b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Dec 2022 01:31:31 +0000

flight 175421 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175421/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-migrupgrade     <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>    broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-i386-xl-pvshim     5 host-install(5)        broken REGR. vs. 175399
 test-amd64-i386-migrupgrade 6 host-install/src_host(6) broken REGR. vs. 175399
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 175399
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 175399
 test-amd64-amd64-examine-uefi  5 host-install          broken REGR. vs. 175399
 test-amd64-i386-libvirt       7 xen-install              fail REGR. vs. 175399
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 175399

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-examine-uefi  4 memdisk-try-append      fail REGR. vs. 175399

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175399
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175399
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175399
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175399
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175399
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175399
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175399
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175399
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175399
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175399
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175399
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175399
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  f1b9a28922d2913dda76fd82b0b79f3651d3fc8d
baseline version:
 xen                  12b593ca0d61ef884c2f2de15ed36b4900fc92b2

Last test of basis   175399  2022-12-19 01:53:26 Z    1 days
Failing since        175408  2022-12-19 15:38:33 Z    1 days    2 attempts
Testing same since   175421  2022-12-20 06:43:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Edwin Török <edwin.torok@cloud.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Neowutran <xen@neowutran.ovh>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         broken  
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
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  broken  
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    broken  
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                fail    
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

broken-job test-amd64-i386-migrupgrade broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-step test-amd64-i386-xl-pvshim host-install(5)
broken-step test-amd64-i386-migrupgrade host-install/src_host(6)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-examine-uefi host-install

Not pushing.

------------------------------------------------------------
commit f1b9a28922d2913dda76fd82b0b79f3651d3fc8d
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Fri Dec 16 14:30:12 2022 +0100

    automation: Add test jobs to run XTF hypercall xen_version test
    
    Add test jobs in both debug and non-debug versions to run hyp-xen-version
    XTF test as a dom0less domU on arm64. The purpose of this test is to
    validate the functional behavior of xen_version hypercall.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 99ba7abbda7d42156f9ed70224750244ed42d120
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Fri Dec 16 14:30:11 2022 +0100

    automation: Add support for using XTF for arm64 testing
    
    Introduce support for using XTF on Arm to perform low-level testing.
    For the purpose of the CI testing, let's use the fork [1] from upstream
    XTF with implemented support for arm64 (the upstream XTF only supports
    x86).
    
    Add a new script under automation/scripts to be used by the CI XTF test
    jobs to perform the following tasks:
     - Compiling XTF,
     - Generating u-boot script using ImageBuilder,
     - Running Xen with XTF as domU in pure dom0less configuration using Qemu,
     - Checking test result.
    
    The script takes the name of the XTF test to run as a first parameter.
    
    [1] https://gitlab.com/xen-project/fusa/xtf.git (branch xtf-arm)
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 01f139215e678c2dc7d4bb3f9f2777069bb1b091
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

commit 2e173b8383928e8d98d67ce57ec069eb612def60
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:16 2022 +0000

    tools/ocaml/xenctrl: Fix unused value warning
    
    Fixes: 8b3c06a3e5 ("tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free")
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4a259353238d308a41541370ea7cc222a879ddd3
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:11 2022 +0000

    tools/ocaml/xenstored: Use ocamldep -sort for linking order
    
    The manually established link order is fragile to code changes.  Use ocamldep
    to calculate the appropriate link order.
    
    No functional change.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit d2ccc637111d6dbcf808aaffeec7a46f0b1e1c81
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

commit 5f05b229319e25aa7f35735bba060ddbeb325872
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Dec 16 10:46:42 2022 +0000

    tools/golang: Refresh bindings following virtio changes
    
    Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>

commit 68b2672a63280fa180f4e52c5dab54b04b1369ad
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Dec 6 19:16:23 2021 +0000

    x86/boot: Relocate Xen using memcpy() directly
    
    We can relocate Xen by reading out of the virtual mapping that we're executing
    on, and write directly into the directmap.  In fact, this removes one
    dependency on Xen being "at 0" (the XEN_IMG_OFFSET passed as src) for
    relocation to occur.
    
    This removes all the temporary pagetable handling under the covers of
    move_memory(), and results in a forward copy rather than a chunked backwards
    copy (caused by move_memory() always constructing src and dst in a way to
    trigger memmove() to copy backwards).
    
    With the penultimate caller of move_memory() dropped, clean up the API.  Drop
    the keep boolean, folding in 0 from the final caller, and drop the return
    address which has been unused since c/s 0b76ce20de85 ("x86/setup: don't
    relocate the VGA hole.") in 2007.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit da5092e7d6ed4714b5dc63ed2cd7f6c93dd6efd4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 19 11:35:25 2022 +0100

    NUMA: replace phys_to_nid()
    
    All callers convert frame numbers (perhaps in turn derived from struct
    page_info pointers) to an address, just for the function to convert it
    back to a frame number (as the first step of paddr_to_pdx()). Replace
    the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
    call sites by the respectively most suitable one.
    
    While there also
    - introduce a !NUMA stub, eliminating the need for Arm (and potentially
      other ports) to carry one individually,
    - drop the (strictly speaking wrong) "pure" attribute from the function,
    - extend a condition in dump_numa() to make sure that none of the
      assertions would trigger for empty or (unlikely) single-page nodes (at
      the same time this also prevents the warning printk() to be issued for
      every empty [e.g. CPU-only] node).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit ad15a0a8ca2515d8ac58edfc0bc1d3719219cb77
Author: Neowutran <xen@neowutran.ovh>
Date:   Mon Dec 19 11:34:16 2022 +0100

    x86/time: prevent overflow with high frequency TSCs
    
    Make sure tsc_khz is promoted to a 64-bit type before multiplying by
    1000 to avoid an 'overflow before widen' bug. Otherwise just above
    4.294GHz the value will overflow. Processors with clocks this high are
    now in production and require this to work correctly.
    
    Signed-off-by: Neowutran <xen@neowutran.ovh>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 573279cde1c4e752d4df34bc65ffafa17573148e
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Dec 19 11:24:14 2022 +0100

    x86/vmx: implement Notify VM Exit
    
    Under certain conditions guests can get the CPU stuck in an unbounded
    loop without the possibility of an interrupt window to occur on
    instruction boundary.  This was the case with the scenarios described
    in XSA-156.
    
    Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
    if no interrupt window occurs for a specified amount of time.  Note
    that using the Notify VM Exit avoids having to trap #AC and #DB
    exceptions, as Xen is guaranteed to get a VM Exit even if the guest
    puts the CPU in a loop without an interrupt window, as such disable
    the intercepts if the feature is available and enabled.
    
    Setting the notify VM exit window to 0 is safe because there's a
    threshold added by the hardware in order to have a sane window value.
    
    Note the handling of EXIT_REASON_NOTIFY in the nested virtualization
    case is passed to L0, and hence a nested guest being able to trigger a
    notify VM exit with an invalid context would be able to crash the L1
    hypervisor (by L0 destroying the domain).  Since we don't expose VM
    Notify support to L1 it should already enable the required
    protections in order to prevent VM Notify from triggering in the first
    place.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit d329b37d12132164c3894d0b6284be72576ef950
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Dec 19 11:23:34 2022 +0100

    x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
    
    Introduce a small helper to OR VMX_INTR_SHADOW_NMI in
    GUEST_INTERRUPTIBILITY_INFO in order to help dealing with the NMI
    unblocked by IRET case.  Replace the existing usage in handling
    EXIT_REASON_EXCEPTION_NMI and also add such handling to EPT violations
    and page-modification log-full events.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit f7d07619d2ae0382e2922e287fbfbb27722f3f0b
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Dec 19 11:22:43 2022 +0100

    x86/vmx: implement VMExit based guest Bus Lock detection
    
    Add support for enabling guest Bus Lock Detection on Intel systems.
    Such detection works by triggering a vmexit, which ought to be enough
    of a pause to prevent a guest from abusing of the Bus Lock.
    
    Add an extra Xen perf counter to track the number of Bus Locks detected.
    This is done because Bus Locks can also be reported by setting the bit
    26 in the exit reason field, so also account for those.
    
    Note EXIT_REASON_BUS_LOCK VMExits will always have bit 26 set in
    exit_reason, and hence the performance counter doesn't need to be
    increased for EXIT_REASON_BUS_LOCK handling.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
(qemu changes not included)

