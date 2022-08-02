Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87058834C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 23:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379468.612927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIz72-0001Pc-4H; Tue, 02 Aug 2022 21:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379468.612927; Tue, 02 Aug 2022 21:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIz72-0001ML-0g; Tue, 02 Aug 2022 21:07:36 +0000
Received: by outflank-mailman (input) for mailman id 379468;
 Tue, 02 Aug 2022 21:07:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIz70-0001MB-TZ; Tue, 02 Aug 2022 21:07:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIz70-0007F7-PP; Tue, 02 Aug 2022 21:07:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIz70-00063e-6i; Tue, 02 Aug 2022 21:07:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oIz70-00088V-6A; Tue, 02 Aug 2022 21:07:34 +0000
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
	bh=jbIAB8b0NVjzTr2bQXNriocddMwkNXXaZxuHEd+qPfo=; b=f/aw1xdWoicis7lBKcw8/9bG09
	6Ix/6IbqAE+lpIXcRAuFn43wTocz4Xzuy2RR5tpIeOgGXGjxs4RhK+HSQBrOZKbYydXq8sJbe1orI
	5oWOPwivHILB+u4iTZuVIIBbED6PDPcA+N4bQk8t8YDCpo0vx/i5aonHQdfIrq18+ueM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 172081: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:build-i386-libvirt:libvirt-build:fail:regression
    xen-unstable:build-amd64-libvirt:libvirt-build:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    xen-unstable:build-arm64-libvirt:libvirt-build:fail:regression
    xen-unstable:build-armhf-libvirt:libvirt-build:fail:regression
    xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:allowable
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ca45d3cb4586372909f350e54482246f994e1bc7
X-Osstest-Versions-That:
    xen=f732240fd3bac25116151db5ddeb7203b62e85ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Aug 2022 21:07:34 +0000

flight 172081 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172081/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172073
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172073
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 172073
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 172073
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 172073

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10   fail REGR. vs. 172073

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 172073
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172073
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172073
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 172073
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 172073
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 172073
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 172073
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 172073
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172073
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ca45d3cb4586372909f350e54482246f994e1bc7
baseline version:
 xen                  f732240fd3bac25116151db5ddeb7203b62e85ce

Last test of basis   172073  2022-08-02 01:51:47 Z    0 days
Testing same since   172081  2022-08-02 11:38:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@citrix.com>
  Jiamei Xie <jiamei.xie@arm.com>
  Julien Grall <julien.grall@arm.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           fail    
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  blocked 
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
 test-amd64-amd64-libvirt-vhd                                 blocked 
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
commit ca45d3cb4586372909f350e54482246f994e1bc7
Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date:   Fri Jul 15 22:20:26 2022 +0300

    libxl/arm: Create specific IOMMU node to be referred by virtio-mmio device
    
    Reuse generic IOMMU device tree bindings to communicate Xen specific
    information for the virtio devices for which the restricted memory
    access using Xen grant mappings need to be enabled.
    
    Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
    compatible to all virtio devices which backends are going to run in
    non-hardware domains (which are non-trusted by default).
    
    Based on device-tree binding from Linux:
    Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
    
    The example of generated nodes:
    
    xen_iommu {
        compatible = "xen,grant-dma";
        #iommu-cells = <0x01>;
        phandle = <0xfde9>;
    };
    
    virtio@2000000 {
        compatible = "virtio,mmio";
        reg = <0x00 0x2000000 0x00 0x200>;
        interrupts = <0x00 0x01 0xf01>;
        interrupt-parent = <0xfde8>;
        dma-coherent;
        iommus = <0xfde9 0x01>;
    };
    
    virtio@2000200 {
        compatible = "virtio,mmio";
        reg = <0x00 0x2000200 0x00 0x200>;
        interrupts = <0x00 0x02 0xf01>;
        interrupt-parent = <0xfde8>;
        dma-coherent;
        iommus = <0xfde9 0x01>;
    };
    
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 2128143c114c52c7536e37c32935fdd77f23edc1
Author: Julien Grall <julien.grall@arm.com>
Date:   Fri Jul 15 22:20:25 2022 +0300

    libxl: Introduce basic virtio-mmio support on Arm
    
    This patch introduces helpers to allocate Virtio MMIO params
    (IRQ and memory region) and create specific device node in
    the Guest device-tree with allocated params. In order to deal
    with multiple Virtio devices, reserve corresponding ranges.
    For now, we reserve 1MB for memory regions and 10 SPIs.
    
    As these helpers should be used for every Virtio device attached
    to the Guest, call them for Virtio disk(s).
    
    Please note, with statically allocated Virtio IRQs there is
    a risk of a clash with a physical IRQs of passthrough devices.
    For the first version, it's fine, but we should consider allocating
    the Virtio IRQs automatically. Thankfully, we know in advance which
    IRQs will be used for passthrough to be able to choose non-clashed
    ones.
    
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date:   Fri Jul 15 22:20:24 2022 +0300

    libxl: Add support for Virtio disk configuration
    
    This patch adds basic support for configuring and assisting virtio-mmio
    based virtio-disk backend (emulator) which is intended to run out of
    Qemu and could be run in any domain.
    Although the Virtio block device is quite different from traditional
    Xen PV block device (vbd) from the toolstack's point of view:
     - as the frontend is virtio-blk which is not a Xenbus driver, nothing
       written to Xenstore are fetched by the frontend currently ("vdev"
       is not passed to the frontend). But this might need to be revised
       in future, so frontend data might be written to Xenstore in order to
       support hotplugging virtio devices or passing the backend domain id
       on arch where the device-tree is not available.
     - the ring-ref/event-channel are not used for the backend<->frontend
       communication, the proposed IPC for Virtio is IOREQ/DM
    it is still a "block device" and ought to be integrated in existing
    "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
    logic to deal with Virtio devices as well.
    
    For the immediate purpose and an ability to extend that support for
    other use-cases in future (Qemu, virtio-pci, etc) perform the following
    actions:
    - Add new disk backend type (LIBXL_DISK_BACKEND_STANDALONE) and reflect
      that in the configuration
    - Introduce new disk "specification" and "transport" fields to struct
      libxl_device_disk. Both are written to the Xenstore. The transport
      field is only used for the specification "virtio" and it assumes
      only "mmio" value for now.
    - Introduce new "specification" option with "xen" communication
      protocol being default value.
    - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
      one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
    
    An example of domain configuration for Virtio disk:
    disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=standalone, specification=virtio']
    
    Nothing has changed for default Xen disk configuration.
    
    Please note, this patch is not enough for virtio-disk to work
    on Xen (Arm), as for every Virtio device (including disk) we need
    to allocate Virtio MMIO params (IRQ and memory region) and pass
    them to the backend, also update Guest device-tree. The subsequent
    patch will add these missing bits. For the current patch,
    the default "irq" and "base" are just written to the Xenstore.
    This is not an ideal splitting, but this way we avoid breaking
    the bisectability.
    
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Tested-by: Jiamei Xie <jiamei.xie@arm.com>
(qemu changes not included)

