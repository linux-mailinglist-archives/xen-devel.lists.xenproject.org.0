Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E16E1EB1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 10:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521051.809323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnF4Y-00015w-80; Fri, 14 Apr 2023 08:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521051.809323; Fri, 14 Apr 2023 08:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnF4Y-00012e-57; Fri, 14 Apr 2023 08:46:22 +0000
Received: by outflank-mailman (input) for mailman id 521051;
 Fri, 14 Apr 2023 08:46:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnF4W-00012U-KP; Fri, 14 Apr 2023 08:46:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnF4W-0005Gr-GT; Fri, 14 Apr 2023 08:46:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnF4W-0007N6-40; Fri, 14 Apr 2023 08:46:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pnF4W-0003oy-3V; Fri, 14 Apr 2023 08:46:20 +0000
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
	bh=qMh9RedIxsTzSzUySz+FBrgZoII1lSf1la7H9WjfH3E=; b=O5wK8N9rBqzBClW/BVCJm4X8th
	DNDWdDJglm4RkV/EGv5S2rZMNYqOqcGaBa7QCmHyBZTd3YSluM72daGiozRuRbeMOQmWIl7CsbCUw
	mzPROmKpo+U803s21fO5tVgb+vsAQ2+i4/rMyTMnFvxptmiNKo0n3NXBjzUfrZDeAO4g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180251-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 180251: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    qemu-mainline:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    qemuu=7dbd6f8a27e30fe14adb3d5869097cddf24038d6
X-Osstest-Versions-That:
    qemuu=9d177b7f87d96d1ed8fd16e222a37bd1ac8a0cd8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Apr 2023 08:46:20 +0000

flight 180251 qemu-mainline real [real]
flight 180257 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180251/
http://logs.test-lab.xenproject.org/osstest/logs/180257/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 180231

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180231
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180231
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180231
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180231
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180231
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 qemuu                7dbd6f8a27e30fe14adb3d5869097cddf24038d6
baseline version:
 qemuu                9d177b7f87d96d1ed8fd16e222a37bd1ac8a0cd8

Last test of basis   180231  2023-04-13 09:18:05 Z    0 days
Testing same since   180251  2023-04-13 20:08:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Juan Quintela <quintela@redhat.com>
  Lukas Straub <lukasstraub2@web.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
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
commit 7dbd6f8a27e30fe14adb3d5869097cddf24038d6
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Apr 13 16:40:22 2023 +0100

    Update version for v8.0.0-rc4 release
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit c38b2ca7387b7857a614d1a6b8be5371949156d4
Merge: 69d4e746b3 28ef5339c3
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Apr 13 10:09:42 2023 +0100

    Merge tag 'migration-20230412-pull-request' of https://gitlab.com/juan.quintela/qemu into staging
    
    Migration Pull request for 8.0
    
    Last patches found:
    - peter xu preempt channel fixes.
      needed for backward compatibility with old machine types.
    - lukas fix to get compress working again.
    
    - fix ram on s390x.  Get back to the old code, even when it shouldn't
      be needed, but as it fails on s390x, just revert.
    
    Later, Juan.
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQIzBAABCAAdFiEEGJn/jt6/WMzuA0uC9IfvGFhy1yMFAmQ3HgQACgkQ9IfvGFhy
    # 1yPXGQ/+Pf6HepNUlIr7naYOcpRriXPQF+q1zqo74F9fy2vrGcwJOI6qmRTjsX4E
    # 9KgXipOz7+b5wSemF7PDKcnBiwyt6UHCH+XXe0h4TpyuORbtABKRgtOhA1/sa84D
    # HnKp0TwImpAO26tzPa7u49aau/EEVBKAzFVcyn4w56S9qiDWicOpd5kG0CJBIsMJ
    # Mnvy5fXaqQRewnKiwFoJGWfyhzEToDO6Z/SkT5xYON94P+eiM2xMwXOC5WcGfmY7
    # wFGDB+SuyEP8TTn7mV0mmnlFjYe4G07hVARHSDFX3ho4b6q5F+WzfW095G6QKiu9
    # n3Pzr7IBGX3sgetPtYwOwGsE9JrfHMFzBRxQZZwq5GSmjk7+agkbXmV7RyV82EYs
    # KYOhuNF91ca0qvCrGA/eGbbJqVrd7SR5FhS4SQ7oKd5n2au/ZHoKwAgm5lBdcvES
    # 2TB0MBN1s0JPh6KMV8tPB2miZyqPRa++oA8qIX7Asoe1X4xVT1FwiDaFL8TO8i2A
    # 7uBis3KLZqOHC6dAiXlCDtaADAWgQxjcdoS1l8jTF6MgBSe+zQhXG+pcIDuSiV9N
    # WfDiUPY97iqPTvpzdz3Is+LbBax2uY5ZR05KSdmCBpIgfvSWMqXtwRydclt6G5h7
    # ZiOcTwrgMpXdbhdsFZTqVWAJG2sTkj4TA+IezVpXzPeQNLZ+T8k=
    # =kW3P
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Wed 12 Apr 2023 22:09:24 BST
    # gpg:                using RSA key 1899FF8EDEBF58CCEE034B82F487EF185872D723
    # gpg: Good signature from "Juan Quintela <quintela@redhat.com>" [full]
    # gpg:                 aka "Juan Quintela <quintela@trasno.org>" [full]
    # Primary key fingerprint: 1899 FF8E DEBF 58CC EE03  4B82 F487 EF18 5872 D723
    
    * tag 'migration-20230412-pull-request' of https://gitlab.com/juan.quintela/qemu:
      migration: fix ram_state_pending_exact()
      migration/ram.c: Fix migration with compress enabled
      migration: Recover behavior of preempt channel creation for pre-7.2
      migration: Fix potential race on postcopy_qemufile_src
      io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 69d4e746b3a899b90d2cbf422a3ce764cf51cfbe
Author: David Woodhouse <dwmw@amazon.co.uk>
Date:   Wed Apr 12 19:51:01 2023 +0100

    hw/xen: Fix double-free in xen_console store_con_info()
    
    Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
    then for some reason immediately call free(path) too.
    
    We should just use g_autoptr() for it anyway, which simplifies the code
    a bit.
    
    Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
    Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 28ef5339c37f1f78c2fa4df2295bc0cd73a0abfd
Author: Juan Quintela <quintela@redhat.com>
Date:   Wed Apr 12 22:30:20 2023 +0200

    migration: fix ram_state_pending_exact()
    
    I removed that bit on commit:
    
    commit c8df4a7aeffcb46020f610526eea621fa5b0cd47
    Author: Juan Quintela <quintela@redhat.com>
    Date:   Mon Oct 3 02:00:03 2022 +0200
    
        migration: Split save_live_pending() into state_pending_*
    
    Fixes: c8df4a7aeffcb46020f610526eea621fa5b0cd47
    Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
    Signed-off-by: Juan Quintela <quintela@redhat.com>

commit 37502df32c4b02403fe92452c4ed1d96da3df01c
Author: Lukas Straub <lukasstraub2@web.de>
Date:   Sun Apr 2 17:06:32 2023 +0000

    migration/ram.c: Fix migration with compress enabled
    
    Since ec6f3ab9, migration with compress enabled was broken, because
    the compress threads use a dummy QEMUFile which just acts as a
    buffer and that commit accidentally changed it to use the outgoing
    migration channel instead.
    
    Fix this by using the dummy file again in the compress threads.
    
    Signed-off-by: Lukas Straub <lukasstraub2@web.de>
    Reviewed-by: Juan Quintela <quintela@redhat.com>
    Signed-off-by: Juan Quintela <quintela@redhat.com>

commit 06064a671573580326b1f23a2afa2702c48d8e05
Author: Peter Xu <peterx@redhat.com>
Date:   Sun Mar 26 13:25:40 2023 -0400

    migration: Recover behavior of preempt channel creation for pre-7.2
    
    In 8.0 devel window we reworked preempt channel creation, so that there'll
    be no race condition when the migration channel and preempt channel got
    established in the wrong order in commit 5655aab079.
    
    However no one noticed that the change will also be not compatible with
    older qemus, majorly 7.1/7.2 versions where preempt mode started to be
    supported.
    
    Leverage the same pre-7.2 flag introduced in the previous patch to recover
    the behavior hopefully before 8.0 releases, so we don't break migration
    when we migrate from 8.0 to older qemu binaries.
    
    Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
    Signed-off-by: Peter Xu <peterx@redhat.com>
    Reviewed-by: Juan Quintela <quintela@redhat.com>
    Signed-off-by: Juan Quintela <quintela@redhat.com>

commit 6621883f9398bc3f255968f0b4919e883bafb06c
Author: Peter Xu <peterx@redhat.com>
Date:   Sun Mar 26 13:25:39 2023 -0400

    migration: Fix potential race on postcopy_qemufile_src
    
    postcopy_qemufile_src object should be owned by one thread, either the main
    thread (e.g. when at the beginning, or at the end of migration), or by the
    return path thread (when during a preempt enabled postcopy migration).  If
    that's not the case the access to the object might be racy.
    
    postcopy_preempt_shutdown_file() can be potentially racy, because it's
    called at the end phase of migration on the main thread, however during
    which the return path thread hasn't yet been recycled; the recycle happens
    in await_return_path_close_on_source() which is after this point.
    
    It means, logically it's posslbe the main thread and the return path thread
    are both operating on the same qemufile.  While I don't think qemufile is
    thread safe at all.
    
    postcopy_preempt_shutdown_file() used to be needed because that's where we
    send EOS to dest so that dest can safely shutdown the preempt thread.
    
    To avoid the possible race, remove this only place that a race can happen.
    Instead we figure out another way to safely close the preempt thread on
    dest.
    
    The core idea during postcopy on deciding "when to stop" is that dest will
    send a postcopy SHUT message to src, telling src that all data is there.
    Hence to shut the dest preempt thread maybe better to do it directly on
    dest node.
    
    This patch proposed such a way that we change postcopy_prio_thread_created
    into PreemptThreadStatus, so that we kick the preempt thread on dest qemu
    by a sequence of:
    
      mis->preempt_thread_status = PREEMPT_THREAD_QUIT;
      qemu_file_shutdown(mis->postcopy_qemufile_dst);
    
    While here shutdown() is probably so far the easiest way to kick preempt
    thread from a blocked qemu_get_be64().  Then it reads preempt_thread_status
    to make sure it's not a network failure but a willingness to quit the
    thread.
    
    We could have avoided that extra status but just rely on migration status.
    The problem is postcopy_ram_incoming_cleanup() is just called early enough
    so we're still during POSTCOPY_ACTIVE no matter what.. So just make it
    simple to have the status introduced.
    
    One flag x-preempt-pre-7-2 is added to keep old pre-7.2 behaviors of
    postcopy preempt.
    
    Fixes: 9358982744 ("migration: Send requested page directly in rp-return thread")
    Signed-off-by: Peter Xu <peterx@redhat.com>
    Reviewed-by: Juan Quintela <quintela@redhat.com>
    Signed-off-by: Juan Quintela <quintela@redhat.com>

commit 86d063fa83901bc8150343ff8b03979fbea392c9
Author: Peter Xu <peterx@redhat.com>
Date:   Sun Mar 26 13:25:38 2023 -0400

    io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side
    
    TLS iochannel will inherit io_shutdown() from the master ioc, however we
    missed to do that on the server side.
    
    This will e.g. allow qemu_file_shutdown() to work on dest QEMU too for
    migration.
    
    Acked-by: Daniel P. Berrangé <berrange@redhat.com>
    Signed-off-by: Peter Xu <peterx@redhat.com>
    Reviewed-by: Juan Quintela <quintela@redhat.com>
    Signed-off-by: Juan Quintela <quintela@redhat.com>

