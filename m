Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616A770BF2
	for <lists+xen-devel@lfdr.de>; Sat,  5 Aug 2023 00:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577369.904474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS3IG-00013E-RR; Fri, 04 Aug 2023 22:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577369.904474; Fri, 04 Aug 2023 22:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS3IG-00011V-OF; Fri, 04 Aug 2023 22:29:12 +0000
Received: by outflank-mailman (input) for mailman id 577369;
 Fri, 04 Aug 2023 22:29:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qS3IE-00011J-Kz; Fri, 04 Aug 2023 22:29:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qS3IE-0008SY-Gt; Fri, 04 Aug 2023 22:29:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qS3IE-00007U-3l; Fri, 04 Aug 2023 22:29:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qS3IE-0007rI-1W; Fri, 04 Aug 2023 22:29:10 +0000
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
	bh=jiYv/zXEarmXpIyGCuGZ9vZlBNrHA5jU49ckT5SIMKY=; b=KpFsX07g+T62IraWIeFw1sICnz
	vOmxlYa4wAL1SXoKfpRTnTEikWStPd6QO/8YDFsYgEKSpAooP6nWYz+0SxPKcBozlFRoj4eS8om6P
	4WEj8AkWLWboUwUIaTeaHFUCJ7eVG3QWffZmgtGZbDhFxCLtOoLueM7/NTo4rw2zNN30=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182174-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 182174: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:guest-localmigrate/x10:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=092cae024ab6cd9bd5788eb6ca3ae1a05e796c0a
X-Osstest-Versions-That:
    xen=51588938e0cd0e02dbc1d6d8c697c577135ff666
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Aug 2023 22:29:10 +0000

flight 182174 xen-unstable real [real]
flight 182186 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182174/
http://logs.test-lab.xenproject.org/osstest/logs/182186/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 182128

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 182186-retest
 test-amd64-amd64-qemuu-freebsd11-amd64 19 guest-localmigrate/x10 fail pass in 182186-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail blocked in 182128
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182128
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182128
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182128
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182128
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182128
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182128
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182128
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182128
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182128
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182128
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182128
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  092cae024ab6cd9bd5788eb6ca3ae1a05e796c0a
baseline version:
 xen                  51588938e0cd0e02dbc1d6d8c697c577135ff666

Last test of basis   182128  2023-08-02 18:03:55 Z    2 days
Testing same since   182174  2023-08-04 01:17:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Khem Raj <raj.khem@gmail.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
commit 092cae024ab6cd9bd5788eb6ca3ae1a05e796c0a
Author: Julien Grall <jgrall@amazon.com>
Date:   Wed Aug 2 16:47:05 2023 +0100

    xen/x86: Constify the vCPU parameter for expand_xsave_states()
    
    expand_xsave_states() is not meant to modify the vCPU. So the parameter
    can be const.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 1aa5acbbec3f37bf38d78fa96d210053f8e8efd5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 3 17:35:39 2023 +0200

    libxl: allow building with old gcc again
    
    We can't use initializers of unnamed struct/union members just yet.
    
    Fixes: d638fe233cb3 ("libxl: use the cpuid feature names from cpufeatureset.h")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4f6afde88be3e8960eb311d16ac41d44ab71ed10
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 3 17:35:26 2023 +0200

    libxl: avoid shadowing of index()
    
    Because of -Wshadow the build otherwise fails with old enough glibc.
    
    While there also obey line length limits for msr_add().
    
    Fixes: 6d21cedbaa34 ("libxl: add support for parsing MSR features")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit dfc490a3740bb7d6889939934afadcb58891fbce
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Aug 1 10:49:30 2023 -0700

    arm: Avoid using solaris syntax for .section directive
    
    Assembler from binutils 2.41 will rejects ([1], [2]) the following
    syntax
    
    .section "name", #alloc
    
    for any other any target other than ELF SPARC. This means we can't use
    it in the Arm code.
    
    So switch to the GNU syntax
    
    .section name [, "flags"[, @type]]
    
    [1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
    [2] https://sourceware.org/binutils/docs-2.41/as.html#Section
    
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    [jgrall: Reword commit message]
    Acked-by: Julien Grall <jgrall@amazon.com>

commit da55d9dc919752e092e591a74ab54c2f7d5adfab
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 2 13:44:30 2023 +0100

    x86/gen-cpuid: Avoid violations of Misra rule 1.3
    
    Add the script to the X86 section in ./MAINTAINERS.
    
    Structures or unions without any named members aren't liked by Misra
    (nor the C standard). Avoid emitting such for leaves without any known
    bits.
    
    The placeholders are affected similarly, but are only visible to MISRA in the
    middle of a patch series adding a new leaf.  The absence of a name was
    intentional as these defines need to not duplicate names.
    
    As that's not deemed acceptable any more, move placeholder processing into the
    main loop and append the the word number to generate unique names.
    
      $ diff cpuid-autogen-{before,after}.h
      @@ -1034,7 +1034,7 @@
           bool intel_psfd:1, ipred_ctrl:1, rrsba_ctrl:1, ddp_ctrl:1,     ...
    
       #define CPUID_BITFIELD_14 \$
      -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
      +    uint32_t _placeholder_14
    
       #define CPUID_BITFIELD_15 \$
           bool :1, :1, :1, :1, avx_vnni_int8:1, avx_ne_convert:1, :1,    ...
      @@ -1043,19 +1043,19 @@
           bool rdcl_no:1, eibrs:1, rsba:1, skip_l1dfl:1, intel_ssb_no:1, ...
    
       #define CPUID_BITFIELD_17 \$
      -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
      +    uint32_t _placeholder_17
    
       #define CPUID_BITFIELD_18 \$
      -    uint32_t :32 /* placeholder */
      +    uint32_t _placeholder_18
    
       #define CPUID_BITFIELD_19 \$
      -    uint32_t :32 /* placeholder */
      +    uint32_t _placeholder_19
    
       #define CPUID_BITFIELD_20 \$
      -    uint32_t :32 /* placeholder */
      +    uint32_t _placeholder_20
    
       #define CPUID_BITFIELD_21 \$
      -    uint32_t :32 /* placeholder */
      +    uint32_t _placeholder_21
    
       #endif /* __XEN_X86__FEATURESET_DATA__ */
    
    No functional change.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 73aea9ada87f804f6b56efda13aead3b950f8657
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jul 28 20:27:01 2023 +0100

    x86: Delete str()
    
    This is used in an assertion only, which is somewhat dubious to begin with and
    isn't expected to surivive the x86-S work (where TR is expected to become
    become be a NUL selector).
    
    Delete it now.  This avoids many cases where as a global symbol, it shadows
    local string variables.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

commit abe93fc8aafaecabb2ffbad1b29f049ca02ab8cb
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 17 14:10:58 2023 +0000

    x86/entry: Rename the exception entrypoints
    
    This makes the names match the architectural short names that we use
    elsewhere.  This avoids 'debug' in particular from being a global symbol
    shadowed by many local parameter names.
    
    Remove the DECLARE_TRAP_HANDLER{,_CONST}() infrastructure.  Only NMI/#MC are
    referenced externally (and NMI will cease to be soon, as part of adding FRED
    support).  Move the entrypoint declarations into the respective traps.c where
    they're used, rather than keeping them visible across ~all of Xen.
    
    Drop the long-stale comment at the top of init_idt_traps().  It's mostly
    discussing a 32bit Xen, and bogus otherwise as it's impossible to use trap
    gates correctly for these purposes.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

commit 26638cd9efaea4fea3322914efc2611981e001fe
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 17 23:06:37 2023 +0000

    x86/traps: Move do_general_protection() earlier
    
    ... in order to clean up the declarations without needing to forward declare
    it for handle_gdt_ldt_mapping_fault()
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

