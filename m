Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB54D48B8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 15:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288409.489027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSJXE-0007nu-N6; Thu, 10 Mar 2022 14:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288409.489027; Thu, 10 Mar 2022 14:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSJXE-0007lp-K5; Thu, 10 Mar 2022 14:12:56 +0000
Received: by outflank-mailman (input) for mailman id 288409;
 Thu, 10 Mar 2022 14:12:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nSJXD-0007le-Jy; Thu, 10 Mar 2022 14:12:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nSJXD-0002GJ-FC; Thu, 10 Mar 2022 14:12:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nSJXC-0004B4-Ur; Thu, 10 Mar 2022 14:12:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nSJXC-00085K-UP; Thu, 10 Mar 2022 14:12:54 +0000
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
	bh=DLnJfq+yankC7BgcfhmN23p76kDMCPWeYWRP6ZIKcIw=; b=VlJRsD/sSLcE6t32gSpnpIzpRe
	9Gq48l/Nnbhp1fCtBFYSNVDha/igS6XYAMmimBRtHyd6yBU158iTs0vG6f9O4sUc5Jzi4sz3UV7aB
	PYFBqnRejOgw77UUWicyo5F5wVG3HHn5pO0o90EUe5+WPUlZ+y7gwV25AGjzbzRo8GVg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168493-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 168493: FAIL
X-Osstest-Failures:
    xen-4.14-testing:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    xen-4.14-testing:test-armhf-armhf-xl-vhd:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl:xen-boot:fail:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ca304edd3ba8c19211107fd2e898249987557ce5
X-Osstest-Versions-That:
    xen=496fb0be938a30971af05ffe0e58bb65643a0971
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Mar 2022 14:12:54 +0000

flight 168493 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168493/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-vhd         <job status>                 broken  in 168482

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd      5 host-install(5) broken in 168482 pass in 168493
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail in 168482 pass in 168493
 test-arm64-arm64-xl           8 xen-boot                   fail pass in 168482

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl         15 migrate-support-check fail in 168482 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 168482 never pass
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 168061
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168061
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168061
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168061
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168061
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168061
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168061
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 168061
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 168061
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168061
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 168061
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168061
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  ca304edd3ba8c19211107fd2e898249987557ce5
baseline version:
 xen                  496fb0be938a30971af05ffe0e58bb65643a0971

Last test of basis   168061  2022-02-08 18:37:46 Z   29 days
Testing same since   168482  2022-03-08 18:07:22 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Julien Grall <julien@xen.org>
  Rahul Singh <rahul.singh@arm.com>

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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
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
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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

broken-job test-armhf-armhf-xl-vhd broken

Not pushing.

------------------------------------------------------------
commit ca304edd3ba8c19211107fd2e898249987557ce5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Mar 7 16:35:52 2022 +0000

    x86/spec-ctrl: Cease using thunk=lfence on AMD
    
    AMD have updated their Spectre v2 guidance, and lfence/jmp is no longer
    considered safe.  AMD are recommending using retpoline everywhere.
    
    Retpoline is incompatible with CET.  All CET-capable hardware has efficient
    IBRS (specifically, not something retrofitted in microcode), so use IBRS (and
    STIBP for consistency sake).
    
    This is a logical change on AMD, but not on Intel as the default calculations
    would end up with these settings anyway.  Leave behind a message if IBRS is
    found to be missing.
    
    Also update the default heuristics to never select THUNK_LFENCE.  This causes
    AMD CPUs to change their default to retpoline.
    
    Also update the printed message to include the AMD MSR_SPEC_CTRL settings, and
    STIBP now that we set it for consistency sake.
    
    This is part of XSA-398 / CVE-2021-26401.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 8d03080d2a339840d3a59e0932a94f804e45110d)

commit 7cebd77c80ce87f84c63a6043a5ad7115ccab9d5
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Feb 17 14:52:54 2022 +0000

    xen/arm: Allow to discover and use SMCCC_ARCH_WORKAROUND_3
    
    Allow guest to discover whether or not SMCCC_ARCH_WORKAROUND_3 is
    supported and create a fastpath in the code to handle guests request to
    do the workaround.
    
    The function SMCCC_ARCH_WORKAROUND_3 will be called by the guest for
    flushing the branch history. So we want the handling to be as fast as
    possible.
    
    As the mitigation is applied on every guest exit, we can check for the
    call before saving all context and return very early.
    
    This is part of XSA-398 / CVE-2022-23960.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <julien@xen.org>
    (cherry picked from commit c0a56ea0fd92ecb471936b7355ddbecbaea3707c)

commit fc56dd212e4574c5fd77f830d077036b330dc1b5
Author: Rahul Singh <rahul.singh@arm.com>
Date:   Mon Feb 14 18:47:32 2022 +0000

    xen/arm: Add Spectre BHB handling
    
    This commit is adding Spectre BHB handling to Xen on Arm.
    The commit is introducing new alternative code to be executed during
    exception entry:
    - SMCC workaround 3 call
    - loop workaround (with 8, 24 or 32 iterations)
    - use of new clearbhb instruction
    
    Cpuerrata is modified by this patch to apply the required workaround for
    CPU affected by Spectre BHB when CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR is
    enabled.
    
    To do this the system previously used to apply smcc workaround 1 is
    reused and new alternative code to be copied in the exception handler is
    introduced.
    
    To define the type of workaround required by a processor, 4 new cpu
    capabilities are introduced (for each number of loop and for smcc
    workaround 3).
    
    When a processor is affected, enable_spectre_bhb_workaround is called
    and if the processor does not have CSV2 set to 3 or ECBHB feature (which
    would mean that the processor is doing what is required in hardware),
    the proper code is enabled at exception entry.
    
    In the case where workaround 3 is not supported by the firmware, we
    enable workaround 1 when possible as it will also mitigate Spectre BHB
    on systems without CSV2.
    
    This is part of XSA-398 / CVE-2022-23960.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Signed-off-by: Rahul Singh <rahul.singh@arm.com>
    Acked-by: Julien Grall <julien@xen.org>
    (cherry picked from commit 62c91eb66a2904eefb1d1d9642e3697a1e3c3a3c)

commit ee4b53ae1b95966fd9a491668f0eca73028925e1
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Wed Feb 23 09:42:18 2022 +0000

    xen/arm: Add ECBHB and CLEARBHB ID fields
    
    Introduce ID coprocessor register ID_AA64ISAR2_EL1.
    Add definitions in cpufeature and sysregs of ECBHB field in mmfr1 and
    CLEARBHB in isar2 ID coprocessor registers.
    
    This is part of XSA-398 / CVE-2022-23960.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <julien@xen.org>
    (cherry picked from commit 4b68d12d98b8790d8002fcc2c25a9d713374a4d7)

commit 6da7a845fb476ef7395185ec08a58c76ebd8c442
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Tue Feb 15 10:39:47 2022 +0000

    xen/arm: move errata CSV2 check earlier
    
    CSV2 availability check is done after printing to the user that
    workaround 1 will be used. Move the check before to prevent saying to the
    user that workaround 1 is used when it is not because it is not needed.
    This will also allow to reuse install_bp_hardening_vec function for
    other use cases.
    
    Code previously returning "true", now returns "0" to conform to
    enable_smccc_arch_workaround_1 returning an int and surrounding code
    doing a "return 0" if workaround is not needed.
    
    This is part of XSA-398 / CVE-2022-23960.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <julien@xen.org>
    (cherry picked from commit 599616d70eb886b9ad0ef9d6b51693ce790504ba)

commit 021466aa73caaa0c5983f02203678e649dd4d22c
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Tue Feb 15 10:37:51 2022 +0000

    xen/arm: Introduce new Arm processors
    
    Add some new processor identifiers in processor.h and sync Xen
    definitions with status of Linux 5.17 (declared in
    arch/arm64/include/asm/cputype.h).
    
    This is part of XSA-398 / CVE-2022-23960.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <julien@xen.org>
    (cherry picked from commit 35d1b85a6b43483f6bd007d48757434e54743e98)
(qemu changes not included)

