Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C614FA18B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 04:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301870.515259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd0Uv-00039G-17; Sat, 09 Apr 2022 02:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301870.515259; Sat, 09 Apr 2022 02:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd0Uu-00036e-Tm; Sat, 09 Apr 2022 02:06:44 +0000
Received: by outflank-mailman (input) for mailman id 301870;
 Sat, 09 Apr 2022 02:06:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nd0Ut-00036U-GQ; Sat, 09 Apr 2022 02:06:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nd0Ut-0001K2-Cu; Sat, 09 Apr 2022 02:06:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nd0Us-0003RP-UR; Sat, 09 Apr 2022 02:06:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nd0Us-0007Ca-Qh; Sat, 09 Apr 2022 02:06:42 +0000
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
	bh=OID8S6KntrD2IDDZ7XiAnLA7J4qL/vGnq5QKfr/rM10=; b=RJcg5TK/XlTk2bS6edKFc7I2DI
	ML7kaGZWuER9sLqzSvpo33fysVWErvMTjj6oMDobaI6etcnRO+I+lFqx4ZaIjk7LpAqgYS5ucVuNd
	+xIJHh5d4RtDOhbt8l5pFWZSdpWAZxQFzDEeuu5Ly/JcMJn0wM6Y+uaRpAlzesx0VeCc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169238-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 169238: regressions - FAIL
X-Osstest-Failures:
    xen-4.16-testing:build-arm64:xen-build:fail:regression
    xen-4.16-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.16-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b953760d0b564478e232e7e64823d2a1506e92b5
X-Osstest-Versions-That:
    xen=2c026fe1f159494b3ec05f19ddfb3d39ff901296
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Apr 2022 02:06:42 +0000

flight 169238 xen-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169238/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 169194
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 169194

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169194
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 169194
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 169194
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 169194
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 169194
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 169194
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 169194
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 169194
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 169194
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 169194
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 169194
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 169194
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  b953760d0b564478e232e7e64823d2a1506e92b5
baseline version:
 xen                  2c026fe1f159494b3ec05f19ddfb3d39ff901296

Last test of basis   169194  2022-04-06 08:39:21 Z    2 days
Testing same since   169238  2022-04-08 13:07:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bjoern Doebel <doebel@amazon.de>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
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
 test-arm64-arm64-xl                                          blocked 
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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
commit b953760d0b564478e232e7e64823d2a1506e92b5
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Fri Apr 8 14:59:27 2022 +0200

    livepatch: avoid relocations referencing ignored section symbols
    
    Track whether symbols belong to ignored sections in order to avoid
    applying relocations referencing those symbols. The address of such
    symbols won't be resolved and thus the relocation will likely fail or
    write garbage to the destination.
    
    Return an error in that case, as leaving unresolved relocations would
    lead to malfunctioning payload code.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Tested-by: Bjoern Doebel <doebel@amazon.de>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    master commit: 9120b5737f517fe9d2a3936c38d3a2211630323b
    master date: 2022-04-08 10:27:11 +0200

commit 46d80ba371b20a5201b7168a4fee924ba3f80303
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Fri Apr 8 14:58:57 2022 +0200

    livepatch: do not ignore sections with 0 size
    
    A side effect of ignoring such sections is that symbols belonging to
    them won't be resolved, and that could make relocations belonging to
    other sections that reference those symbols fail.
    
    For example it's likely to have an empty .altinstr_replacement with
    symbols pointing to it, and marking the section as ignored will
    prevent the symbols from being resolved, which in turn will cause any
    relocations against them to fail.
    
    In order to solve this do not ignore sections with 0 size, only ignore
    sections that don't have the SHF_ALLOC flag set.
    
    Special case such empty sections in move_payload so they are not taken
    into account in order to decide whether a livepatch can be safely
    re-applied after a revert.
    
    Fixes: 98b728a7b2 ('livepatch: Disallow applying after an revert')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Tested-by: Bjoern Doebel <doebel@amazon.de>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    master commit: 0dc1f929e8fed681dec09ca3ea8de38202d5bf30
    master date: 2022-04-08 10:24:10 +0200

commit 44aae670cc28e0533cd893da408878c80a579876
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Apr 8 14:58:25 2022 +0200

    vPCI: fix MSI-X PBA read/write gprintk()s
    
    %pp wants the address of an SBDF, not that of a PCI device.
    
    Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: d3f61beea4255e2d86ae82303384c57a3262435e
    master date: 2022-04-07 18:01:24 +0200

commit 5a4935bff50d51cf26a4ae2a1c08663e853e47dc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Apr 8 14:57:54 2022 +0200

    x86/cpuid: Clobber CPUID leaves 0x800000{1d..20} in policies
    
    c/s 1a914256dca5 increased the AMD max leaf from 0x8000001c to 0x80000021, but
    did not adjust anything in the calculate_*_policy() chain.  As a result, on
    hardware supporting these leaves, we read the real hardware values into the
    raw policy, then copy into host, and all the way into the PV/HVM default
    policies.
    
    All 4 of these leaves have enable bits (first two by TopoExt, next by SEV,
    next by PQOS), so any software following the rules is fine and will leave them
    alone.  However, leaf 0x8000001d takes a subleaf input and at least two
    userspace utilities have been observed to loop indefinitely under Xen (clearly
    waiting for eax to report "no more cache levels").
    
    Such userspace is buggy, but Xen's behaviour isn't great either.
    
    In the short term, clobber all information in these leaves.  This is a giant
    bodge, but there are complexities with implementing all of these leaves
    properly.
    
    Fixes: 1a914256dca5 ("x86/cpuid: support LFENCE always serialising CPUID bit")
    Link: https://github.com/QubesOS/qubes-issues/issues/7392
    Reported-by: fosslinux <fosslinux@aussies.space>
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: d4012d50082c2eae2f3cbe7770be13b9227fbc3f
    master date: 2022-04-07 11:36:45 +0100

commit eedc5acfb32ec35c38e9b5fcaa3d28d8b0971855
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Apr 8 14:57:25 2022 +0200

    VT-d: avoid infinite recursion on domain_context_mapping_one() error path
    
    Despite the comment there infinite recursion was still possible, by
    flip-flopping between two domains. This is because prev_dom is derived
    from the DID found in the context entry, which was already updated by
    the time error recovery is invoked. Simply introduce yet another mode
    flag to prevent rolling back an in-progress roll-back of a prior
    mapping attempt.
    
    Also drop the existing recursion prevention for having been dead anyway:
    Earlier in the function we already bail when prev_dom == domain.
    
    Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 99d829dba1390b98a3ca07b365713e62182ee7ca
    master date: 2022-04-07 12:31:16 +0200

commit 0497023ae57649a23cde211dd022522724f993b6
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Apr 8 14:56:54 2022 +0200

    VT-d: avoid NULL deref on domain_context_mapping_one() error paths
    
    First there's a printk() which actually wrongly uses pdev in the first
    place: We want to log the coordinates of the (perhaps fake) device
    acted upon, which may not be pdev.
    
    Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
    device quarantine page tables (part I)") to add a domid_t parameter to
    domain_context_unmap_one(): It's only used to pass back here via
    me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.
    
    Finally there's the invocation of domain_context_mapping_one(), which
    needs to be passed the correct domain ID. Avoid taking that path when
    pdev is NULL and the quarantine state is what would need restoring to.
    This means we can't security-support non-PCI-Express devices with RMRRs
    (if such exist in practice) any longer; note that as of trhe 1st of the
    two commits referenced below assigning them to DomU-s is unsupported
    anyway.
    
    Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
    Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quarantining")
    Coverity ID: 1503784
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 608394b906e71587f02e6662597bc985bad33a5a
    master date: 2022-04-07 12:30:19 +0200

commit ab6f4a11629bd06b860c036f8ec604f7cd9fba68
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Apr 8 14:55:55 2022 +0200

    VT-d: don't needlessly look up DID
    
    If get_iommu_domid() in domain_context_unmap_one() fails, we better
    wouldn't clear the context entry in the first place, as we're then unable
    to issue the corresponding flush. However, we have no need to look up the
    DID in the first place: What needs flushing is very specifically the DID
    that was in the context entry before our clearing of it.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 445ab9852d69d8957467f0036098ebec75fec092
    master date: 2022-04-07 12:29:03 +0200
(qemu changes not included)

