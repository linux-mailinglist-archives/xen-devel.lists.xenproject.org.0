Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33523C3223
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jul 2021 05:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153930.284435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m23Qa-0003aG-CQ; Sat, 10 Jul 2021 03:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153930.284435; Sat, 10 Jul 2021 03:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m23Qa-0003Xf-5y; Sat, 10 Jul 2021 03:13:16 +0000
Received: by outflank-mailman (input) for mailman id 153930;
 Sat, 10 Jul 2021 03:13:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m23QY-0003XV-Di; Sat, 10 Jul 2021 03:13:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m23QY-0000QP-2G; Sat, 10 Jul 2021 03:13:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m23QX-0007S9-OY; Sat, 10 Jul 2021 03:13:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m23QX-0000WX-O0; Sat, 10 Jul 2021 03:13:13 +0000
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
	bh=e6AjTT2s5QO3xzvaU5J37qL7GwFpswLPPClVBXpkUNg=; b=yXrRMzriA5JWw5aU8Pg/6eMiiT
	gCmIrtxmLgNdk2zxm7CdqzD0Ahhei/BDnBaZGwHzlBlT82F3Km/aHTll5QefK9yvHAAFL4SV9VslS
	1Z7p/Xnnm4GUpLWQaX+db8+5kWoIlJxMdvR24dYq7z/DOnOB4AAf/ku+F6gmoRx1jTHA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163478-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 163478: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:xen-boot/l1:fail:regression
    xen-unstable:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    xen-unstable:test-amd64-amd64-examine:memdisk-try-append:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
X-Osstest-Versions-That:
    xen=0f435e2b58543f5baae96e17a10ae20d3dbc28fa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Jul 2021 03:13:13 +0000

flight 163478 xen-unstable real [real]
flight 163502 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/163478/
http://logs.test-lab.xenproject.org/osstest/logs/163502/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 16 xen-boot/l1         fail REGR. vs. 163458

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt      8 xen-boot            fail pass in 163502-retest
 test-amd64-amd64-examine      4 memdisk-try-append  fail pass in 163502-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 163502 like 163458
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 163502 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 163458
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 163458
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 163458
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 163458
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 163458
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 163458
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 163458
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 163458
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 163458
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 xen                  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
baseline version:
 xen                  0f435e2b58543f5baae96e17a10ae20d3dbc28fa

Last test of basis   163458  2021-07-08 23:09:08 Z    1 days
Testing same since   163478  2021-07-09 15:23:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christopher Clark <christopher.clark@starlab.io>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Richard Kojedzinszky <richard@kojedz.in>
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-armhf-armhf-libvirt                                     fail    
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
commit 6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 8 12:52:14 2021 +0100

    cirrus-ci: Fix FreeBSD build following QEMU update
    
    QEMU requires ninja and bash to build now.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 89d57f291e37b4769ab26db919eba46548f2e13e
Author: Richard Kojedzinszky <richard@kojedz.in>
Date:   Fri Jul 9 10:06:45 2021 +0200

    tools/libxenstat: fix populating vbd.rd_sect
    
    Fixes: 91c3e3dc91d6 ("tools/xentop: Display '-' when stats are not available.")
    Signed-off-by: Richard Kojedzinszky <richard@kojedz.in>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit ab50c903e5d550bf6545a636c9a23144b54d0eb5
Author: Olaf Hering <olaf@aepfle.de>
Date:   Wed Jun 16 15:14:35 2021 +0200

    tools: ipxe: update for fixing build with GCC11
    
    Use a snapshot which includes commit
    f3f568e382a5f19824b3bfc6081cde39eee661e8 ("[crypto] Add
    memory output constraints for big-integer inline assembly"),
    which fixes build with gcc11.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 140931aa2894991d9d6f1b2ba6ca275e1bc56259
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jul 9 08:32:07 2021 +0200

    x86: mark hypercall argument regs clobbering for intended fall-through
    
    The CIDs below are all for the PV side of things, yet while at it take
    care of the HVM side as well.
    
    Coverity-ID: 1485896, 1485901, 1485906, 1485910, 1485911,
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 10cf9035d29c4b35fbecc02a73c285a4183dfa34
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jul 9 08:31:28 2021 +0200

    x86emul: pad blob-execution "okay" messages
    
    We already do so in the native execution case, and a few descriptions (I
    did notice this with SHA ones) are short enough for the output to look
    slightly odd.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>

commit 836314747b0fd1688fc9526f7c73fd9313ba82f3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jul 9 08:30:35 2021 +0200

    x86/AMD: drop MSR_K7_HWCR
    
    We don't support any K7 (32-bit only) hardware anymore, and the MSR is
    accessible as MSR_K8_HWCR as well. Using the K7 name was particularly
    odd for Hygon as well as in a Fam0F-specific piece of code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>

commit bfcdaae9c210bd7984d7691285aaf43deb1b0604
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jul 9 08:28:14 2021 +0200

    x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
    
    Sufficiently old Linux (3.12-ish) accesses these MSRs (with the
    exception of IORRs) in an unguarded manner. Furthermore these same MSRs,
    at least on Fam11 and older CPUs, are also consulted by modern Linux,
    and their (bogus) built-in zapping of #GP faults from MSR accesses leads
    to it effectively reading zero instead of the intended values, which are
    relevant for PCI BAR placement (which ought to all live in MMIO-type
    space, not in DRAM-type one).
    
    For SYSCFG, only certain bits get exposed. Since MtrrVarDramEn also
    covers the IORRs, expose them as well. Introduce (consistently named)
    constants for the bits we're interested in and use them in pre-existing
    code as well. While there also drop the unused and somewhat questionable
    K8_MTRR_RDMEM_WRMEM_MASK. To complete the set of memory type and DRAM vs
    MMIO controlling MSRs, also expose TSEG_{BASE,MASK} (the former also
    gets read by Linux, dealing with which was already the subject of
    6eef0a99262c ["x86/PV: conditionally avoid raising #GP for early guest
    MSR reads"]).
    
    As a welcome side effect, verbosity on/of debug builds gets (perhaps
    significantly) reduced.
    
    Note that at least as far as those MSR accesses by Linux are concerned,
    there's no similar issue for DomU-s, as the accesses sit behind PCI
    device matching logic. The checked for devices would never be exposed to
    DomU-s in the first place. Nevertheless I think that at least for HVM we
    should return sensible values, not 0 (as svm_msr_read_intercept() does
    right now). The intended values may, however, need to be determined by
    hvmloader, and then get made known to Xen.
    
    Fixes: 322ec7c89f66 ("x86/pv: disallow access to unknown MSRs")
    Reported-by: Olaf Hering <olaf@aepfle.de>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>

commit 0cbed4f0fd94a7fd40662fb0b4b82a58abeca111
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Fri Jul 9 08:26:42 2021 +0200

    docs/designs/launch: Hyperlaunch device tree
    
    Adds a design document for Hyperlaunch device tree structure.
    
    Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
    Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>

commit d4f3125f1bb4683a61a47d281ac5effa0740e79b
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Fri Jul 9 08:19:47 2021 +0200

    docs/designs/launch: Hyperlaunch design document
    
    Adds a design document for Hyperlaunch, formerly DomB mode of dom0less.
    
    Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
    Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Rich Persaud <rp@stacktrust.org>
(qemu changes not included)

