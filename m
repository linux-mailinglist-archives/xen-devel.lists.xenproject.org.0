Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37186569EFA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 12:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362890.593161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9OJ5-0007Xj-Rg; Thu, 07 Jul 2022 10:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362890.593161; Thu, 07 Jul 2022 10:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9OJ5-0007UF-OS; Thu, 07 Jul 2022 10:00:23 +0000
Received: by outflank-mailman (input) for mailman id 362890;
 Thu, 07 Jul 2022 10:00:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9OJ3-0007U5-Ol; Thu, 07 Jul 2022 10:00:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9OJ3-0002u6-M4; Thu, 07 Jul 2022 10:00:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9OJ3-0003im-4v; Thu, 07 Jul 2022 10:00:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o9OJ3-0001bf-41; Thu, 07 Jul 2022 10:00:21 +0000
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
	bh=UBpt17szzhW7g6au5DMp/i43pbbMELGYLrqzCXtNO7Q=; b=ObDjTWe2Cj/ER/YNhp3SrBhRuD
	w0mHSoyVmw1VfZtjfu7z0XHb8KZA16x2Cn0Ip653ULZFYiNqoW7CEmqZzTNI6IfQZAe8uk5AyZ1ln
	joyq4k6yXZI86mcQ+sNEl99MWpXR/guFBQduYbqmZMrFe8pEDgwfzo2r6hsyaNpWNU3Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171538-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 171538: FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=46cbd76faf737e9fe2d57aaf335a0203f66ba21c
X-Osstest-Versions-That:
    xen=4df2e99d731402da48afb19dc970ccab5a0814d6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Jul 2022 10:00:21 +0000

flight 171538 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171538/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair    <job status>                 broken in 171536

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken in 171536 pass in 171538
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail pass in 171536
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10     fail pass in 171536
 test-armhf-armhf-xl-credit2  14 guest-start                fail pass in 171536

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 171536 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 171536 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 171516
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171516
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171516
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171516
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 171516
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 171516
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171516
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171516
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 171516
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171516
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171516
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171516
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  46cbd76faf737e9fe2d57aaf335a0203f66ba21c
baseline version:
 xen                  4df2e99d731402da48afb19dc970ccab5a0814d6

Last test of basis   171516  2022-07-06 01:53:06 Z    1 days
Testing same since   171536  2022-07-06 18:36:51 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Charles Arnold <carnold@suse.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Chen <wei.chen@arm.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
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
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
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

broken-job test-amd64-amd64-libvirt-pair broken

Not pushing.

------------------------------------------------------------
commit 46cbd76faf737e9fe2d57aaf335a0203f66ba21c
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Wed Jul 6 13:07:43 2022 +0200

    xen/time: fix MISRA C 2012 Rule 8.7 violation
    
    The variable __mon_lengths is referenced only in time.c.
    Change its linkage from external to internal by adding the storage-class
    specifier static to its definitions.
    
    Also, this patch resolves indirectly a MISRA C 2012 Rule 8.4 violation warning.
    
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit eb40ae41b658e0421e4275c14dd18c7377b0752a
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Jul 6 13:06:57 2022 +0200

    x86/Kconfig: add option for default x2APIC destination mode
    
    Allow setting the default x2APIC destination mode from Kconfig to
    Physical.
    
    Note the default destination mode is still Logical (Cluster) mode.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 8eeae8c2b4efefda8e946461e86cf2ae9c18e5a9
Author: Charles Arnold <carnold@suse.com>
Date:   Wed Jul 6 13:06:40 2022 +0200

    libxc: fix compilation error with gcc13
    
    xc_psr.c:161:5: error: conflicting types for 'xc_psr_cmt_get_data'
    due to enum/integer mismatch;
    
    Signed-off-by: Charles Arnold <carnold@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 786049720041539409f47c6c1a1e718de490cf37
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 6 13:05:23 2022 +0200

    Revert "EFI: preserve the System Resource Table for dom0"
    
    This reverts commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95,
    for breaking booting (on at least Arm64), apparently due to
    incomplete refactoring from an earlier version.

commit 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Mon Jun 27 15:15:39 2022 +0200

    xen/common: Use unsigned int instead of plain unsigned
    
    This is just for the style and consistency reasons as the former is
    being used more often than the latter.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 54d8f27d0477937e1f99a414fc1ffd93d184b38a
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Fri Apr 8 10:21:11 2022 +0200

    tools/libxl: report trusted backend status to frontends
    
    Allow administrators to notify a frontend driver that it's backend
    counterpart is not to be trusted, so the frontend can deploy whatever
    mitigations required in order to secure itself.
    
    Allow such option for disk and network frontends only, as those are
    the only hardened ones currently supported.
    
    This is part of XSA-403
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit a4d4c541f58b378bc9d499dcb554eb9fe22312c8
Author: Wei Chen <wei.chen@arm.com>
Date:   Tue Jul 5 13:12:15 2022 +0200

    xen/arm32: avoid EFI stub wchar_t size linker warning
    
    Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
    is using stub.c of EFI common code for EFI stub functions. But
    "-fshort-wchar" CFLAG will cause a warning when build stub.c
    for Arm32:
    "arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
    2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
    wchar_t values across objects may fail"
    
    This is because the "-fshort-wchar" flag causes GCC to generate
    code that is not binary compatible with code generated without
    that flag. Why this warning hasn't been triggered in Arm64 is
    because Arm64 does not use wchar type directly in any code for
    parameters, variables and return values. And in EFI code, wchar
    has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
    CHAR16 has been specified as unsigned short type in typedef, the
    "-fshort-wchar" flag will not affect CHAR16. So Arm64 object
    files are exactly the same with "-fshort-wchar" and without
    "-fshort-wchar".
    
    We are also not using wchar in Arm32 codes, but Arm32 will embed
    ABI information in ".ARM.attributes" section. This section stores
    some object file attributes, like ABI version, CPU arch and etc.
    And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
    too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
    but for object files without "-fshort-wchar" is 4. Arm32 GCC
    ld will check this tag, and throw above warning when it finds
    the object files have different Tag_ABI_PCS_wchar_t values.
    
    Xen need to keep "-fshort-wchar" in EFI code to force wchar to use
    short integers (2 bytes) instead of integers (4 bytes), but this is
    unnecessary for code out of EFI. So in this patch, we add
    "-fno-short-wchar" to override "-fshort-wchar" for Arm architectures
    without EFI enabled to remove above warning."
    
    Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit c4184bf305dc14c3e150617904c40b120664efe6
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 5 13:11:51 2022 +0200

    public: constify xsd_errors[]
    
    While in principle this could break existing users, I think such users
    deserve to be put in trouble. After all the table should have been const
    from the very beginning.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 2b1ee386122a6e8bf66f5163cbda51084af6e0f4
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Tue Jul 5 13:11:25 2022 +0200

    tools/helpers: fix snprintf argument in init-dom0less.c
    
    Fix snprintf argument in init-dom0less.c because two instances of
    the function are using libxl_dominfo struct members that are uint64_t
    types, so change "%lu" to "%"PRIu64 to handle it properly when
    building on arm32 and arm64.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Jul 5 13:10:46 2022 +0200

    EFI: preserve the System Resource Table for dom0
    
    The EFI System Resource Table (ESRT) is necessary for fwupd to identify
    firmware updates to install.  According to the UEFI specification §23.4,
    the ESRT shall be stored in memory of type EfiBootServicesData.  However,
    memory of type EfiBootServicesData is considered general-purpose memory
    by Xen, so the ESRT needs to be moved somewhere where Xen will not
    overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
    which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
    in memory of type EfiRuntimeServicesData.
    
    Earlier versions of this patch reserved the memory in which the ESRT was
    located.  This created awkward alignment problems, and required either
    splitting the E820 table or wasting memory.  It also would have required
    a new platform op for dom0 to use to indicate if the ESRT is reserved.
    By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
    does not need to be modified, and dom0 can just check the type of the
    memory region containing the ESRT.  The copy is only done if the ESRT is
    not already in EfiRuntimeServicesData memory, avoiding memory leaks on
    repeated kexec.
    
    See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
    for details.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

