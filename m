Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB8514367
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 09:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316985.536110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLKz-0006Ve-KC; Fri, 29 Apr 2022 07:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316985.536110; Fri, 29 Apr 2022 07:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLKz-0006Sm-H2; Fri, 29 Apr 2022 07:46:49 +0000
Received: by outflank-mailman (input) for mailman id 316985;
 Fri, 29 Apr 2022 07:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLKy-0006Sc-13; Fri, 29 Apr 2022 07:46:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLKx-0001Xn-SM; Fri, 29 Apr 2022 07:46:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLKx-00007g-Fn; Fri, 29 Apr 2022 07:46:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLKx-0004TT-FM; Fri, 29 Apr 2022 07:46:47 +0000
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
	bh=t4HUCZzIf3hZpr3dLo27S+3RwJEUARso85VllNE12t8=; b=ZQx69VV2FUwqYAGS1eAuagJJnA
	HCQvFkTE+m2DGkH+3FaSJx6J5eM+EEAgw90I7GxDLnPpH8VgIXQI2Fwpe6C++lt0yvIbLBLzo5puU
	soM4pxM9TuY4ZSD9W9+64v/xnucJWDkBNBalOoDMJ5xSeFrJvRJU2YJ3+xi30xltdYA8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169819-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 169819: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-arm64-arm64-examine:reboot:fail:regression
    xen-unstable:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    xen-unstable:test-arm64-arm64-libvirt-raw:xen-boot:fail:regression
    xen-unstable:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    xen-unstable:test-arm64-arm64-xl-thunderx:xen-boot:fail:regression
    xen-unstable:test-arm64-arm64-xl:xen-boot:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=da28439ba55b8a571032b3358af567cff749f612
X-Osstest-Versions-That:
    xen=3f5d61466345ed2213de2d7e391b6cd6d4b86015
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Apr 2022 07:46:47 +0000

flight 169819 xen-unstable real [real]
flight 169843 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169819/
http://logs.test-lab.xenproject.org/osstest/logs/169843/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 169775
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 169775
 test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 169775
 test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 169775
 test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 169775
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 169775

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 169843-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169775
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 169775
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 169775
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 169775
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 169775
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 169775
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 169775
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 169775
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 169775
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 169775
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 169775
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 169775
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  da28439ba55b8a571032b3358af567cff749f612
baseline version:
 xen                  3f5d61466345ed2213de2d7e391b6cd6d4b86015

Last test of basis   169775  2022-04-27 08:15:40 Z    1 days
Failing since        169798  2022-04-27 22:39:22 Z    1 days    2 attempts
Testing same since   169819  2022-04-28 15:28:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
  Dario Faggioli <dfaggioli@suse.com>
  David Vrabel <dvrabel@amazon.co.uk>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
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
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
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
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 fail    
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
commit da28439ba55b8a571032b3358af567cff749f612
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:41 2022 +0200

    drivers/exynos4210: Remove unused-but-set variable
    
    Function exynos4210_uart_init_preirq defines and sets a variable
    divisor but does not make use of it. Remove the definition and comment
    out the assignment as this function already has some TODOs.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 1f71c11b882ac2b6d32260e929a3f9f19d97fdf7
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:40 2022 +0200

    platforms/omap: Remove unused-but-set variable
    
    Function omap5_init_time defines and sets the variable den but does not
    make use of it. Remove this variable.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 1afe55905427b7e25936388c65a29c2bbb280bc8
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:39 2022 +0200

    platforms/xgene: Make use of dt_device_get_address return value
    
    Currently function xgene_check_pirq_eoi assigns the return value of
    dt_device_get_address to a variable res but does not make use of it.
    Fix it by making use of res in the condition checking the result of a
    call to dt_device_get_address instead of checking the address stored in
    dbase.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 4026c0d4c4811b8337b4eab3cdea7037cbfb0eb4
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:38 2022 +0200

    xen/sched: Remove unused-but-set variable
    
    Function schedule_cpu_add defines and sets a variable old_unit but
    does not make use of it. Remove this variable.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Dario Faggioli <dfaggioli@suse.com>

commit 2845588e398d8e631f08d304e80c5f94f52c3643
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:37 2022 +0200

    xen/arm: smmu.c: Remove unused-but-set variable
    
    Function arm_smmu_init_context_bank defines and sets a variable
    gr0_base but does not make use of it. Remove this variable.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 9b4f9b9af235e21568f8882e8137397af7f86414
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:35 2022 +0200

    efi/boot.c: Remove unused-but-set variable
    
    Function efi_start defines and sets a variable size but does not
    make use of it. Remove this variable.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 2a2de68a60f4ff8f322c0ad7873c1e6048c6fca4
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Apr 27 11:49:34 2022 +0200

    xen/arm: bootfdt.c: Remove unused-but-set variable
    
    Function device_tree_node_compatible defines and sets a variable
    mlen but does not make use of it. Remove this variable.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 53b705d02cec03861044e673536586bd1b2443bd
Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Date:   Thu Mar 24 13:37:05 2022 +0000

    xen/arm64: io: Handle data abort due to cache maintenance instructions
    
    When the data abort is caused due to cache maintenance for an address,
    there are three scenarios:-
    
    1. Address belonging to a non emulated region - For this, Xen should
    set the corresponding bit in the translation table entry to valid and
    return to the guest to retry the instruction. This can happen sometimes
    as Xen need to set the translation table entry to invalid. (for eg
    'Break-Before-Make' sequence). Xen returns to the guest to retry the
    instruction.
    
    2. Address belongs to an emulated region - Xen should ignore the
    instruction (ie increment the PC) and return to the guest.
    
    3. Address is invalid - Xen should forward the data abort to the guest.
    
    Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
    [julien: Don't initialize p.size to 1 << info->dabt.size]
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
Author: David Vrabel <dvrabel@amazon.co.uk>
Date:   Tue Apr 26 10:33:01 2022 +0200

    page_alloc: assert IRQs are enabled in heap alloc/free
    
    Heap pages can only be safely allocated and freed with interrupts
    enabled as they may require a TLB flush which may send IPIs (on x86).
    
    Normally spinlock debugging would catch calls from the incorrect
    context, but not from stop_machine_run() action functions as these are
    called with spin lock debugging disabled.
    
    Enhance the assertions in alloc_xenheap_pages() and
    alloc_domheap_pages() to check interrupts are enabled. For consistency
    the same asserts are used when freeing heap pages.
    
    As an exception, when only 1 PCPU is online, allocations are permitted
    with interrupts disabled as any TLB flushes would be local only. This
    is necessary during early boot.
    
    Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit fbd2445558beff90eb9607308f0845b18a7a2b5a
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Apr 26 21:06:29 2022 +0100

    xen/arm: alternative: Don't call vmap() within stop_machine_run()
    
    Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
    alloc/free" extended the checks in the buddy allocator to catch
    any use of the helpers from context with interrupts disabled.
    
    Unfortunately, the rule is not followed in the alternative code and
    this will result to crash at boot with debug enabled:
    
    (XEN) Xen call trace:
    (XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
    (XEN)    [<00000000>] 00000000 (LR)
    (XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
    (XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
    (XEN)    [<00236864>] __vmap+0x400/0x4a4
    (XEN)    [<0026aee8>] arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
    (XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
    (XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
    (XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
    (XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c
    
    The interrupts will be disabled by the state machine in stop_machine_run(),
    hence why the ASSERT is hit.
    
    For now the patch extending the checks has been reverted, but it would
    be good to re-introduce it (allocation with interrupts disabled is not
    desirable).
    
    So move the re-mapping of Xen to the caller of stop_machine_run().
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Cc: David Vrabel <dvrabel@amazon.co.uk>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 163071b1800304c962756789b4ef0ddb978059ba
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 27 09:15:03 2022 +0200

    EFI: don't mistakenly delete a file we never installed
    
    Just like for "install", make dealing with xen.efi on the EFI partition
    dependent upon mount point and vendor directory being known.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 0f4fd6b6d805c89d19843c7ad70adc772a7d1203
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Apr 27 09:14:30 2022 +0200

    libxl: retry QMP PCI device_add
    
    PCI device assignment to an HVM with stubdom is potentially racy.  First
    the PCI device is assigned to the stubdom via the PV PCI protocol.  Then
    QEMU is sent a QMP command to attach the PCI device to QEMU running
    within the stubdom.  However, the sysfs entries within the stubdom may
    not have appeared by the time QEMU receives the device_add command
    resulting in errors like:
    
    libxl_qmp.c:1838:qmp_ev_parse_error_messages:Domain 10:Could not open '/sys/bus/pci/devices/0000:00:1f.3/config': No such file or directory
    
    This patch retries the device assignment up to 10 times with a 1 second
    delay between.  That roughly matches the overall hotplug timeout for
    pci_add_timeout.  pci_add_timeout's initialization is moved to
    do_pci_add since retries call into pci_add_qmp_device_add again.
    
    The qmp_ev_parse_error_messages error is still printed since it happens
    at a lower level than the pci code controlling the retries.  With that,
    the "Retrying PCI add %d" message is also printed at ERROR level to
    clarify what is happening.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 010bc50adaf58c78db4ad1329b0130d96e13f8e2
Author: Tamas K Lengyel <tamas.lengyel@intel.com>
Date:   Wed Apr 27 09:13:39 2022 +0200

    x86/vmx: add hvm functions to get/set non-register state
    
    During VM forking and resetting a failed vmentry has been observed due
    to the guest non-register state going out-of-sync with the guest register
    state. For example, a VM fork reset right after a STI instruction can trigger
    the failed entry. This is due to the guest non-register state not being saved
    from the parent VM, thus the reset operation only copies the register state.
    
    Fix this by adding a new pair of hvm functions to get/set the guest
    non-register state so that the overall vCPU state remains in sync.
    
    Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

