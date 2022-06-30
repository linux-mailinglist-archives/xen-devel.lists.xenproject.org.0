Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A684561A33
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 14:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358465.587694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6t8V-00067N-KY; Thu, 30 Jun 2022 12:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358465.587694; Thu, 30 Jun 2022 12:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6t8V-00064j-Gc; Thu, 30 Jun 2022 12:19:07 +0000
Received: by outflank-mailman (input) for mailman id 358465;
 Thu, 30 Jun 2022 12:19:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6t8U-00064V-Io; Thu, 30 Jun 2022 12:19:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6t8U-0003ZY-CI; Thu, 30 Jun 2022 12:19:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6t8T-0005zI-Sq; Thu, 30 Jun 2022 12:19:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o6t8T-0008QK-SR; Thu, 30 Jun 2022 12:19:05 +0000
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
	bh=eHEaF+bYmSNj6PlBkALoD82Qv18kAiXJBFoIdg3XeUE=; b=23E3G4uopjxnUuY/viHCD35Ymr
	Wwa7kr3L4FMIwYQomggKANjdNcncAleAxWZWW1WNU3hND8EEnfxR0FzRcbtrCpC+uYHWQ2bbnasXJ
	wIp7ByzJwxCKK26H7Ui/rmjkpTfvqeOSsPCbu6Zv+FYPF2QG9y7G1mLGD+9Nhfpmnsf0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171412-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 171412: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-xl-vhd:guest-start.2:fail:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl:host-ping-check-xen:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=f96d4e0f60073963a5c64844271ecfee8dd87abc
X-Osstest-Versions-That:
    qemuu=2a8835cb45371a1f05c9c5899741d66685290f28
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Jun 2022 12:19:05 +0000

flight 171412 qemu-mainline real [real]
flight 171423 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/171412/
http://logs.test-lab.xenproject.org/osstest/logs/171423/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-vhd       22 guest-start.2  fail in 171423 REGR. vs. 171393

Tests which are failing intermittently (not blocking):
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install   fail pass in 171423-retest
 test-armhf-armhf-xl          10 host-ping-check-xen fail pass in 171423-retest
 test-arm64-arm64-xl-vhd 17 guest-start/debian.repeat fail pass in 171423-retest
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail pass in 171423-retest
 test-amd64-i386-xl-vhd 21 guest-start/debian.repeat fail pass in 171423-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 171423 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 171423 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171393
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171393
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171393
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171393
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171393
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171393
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171393
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171393
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass

version targeted for testing:
 qemuu                f96d4e0f60073963a5c64844271ecfee8dd87abc
baseline version:
 qemuu                2a8835cb45371a1f05c9c5899741d66685290f28

Last test of basis   171393  2022-06-29 02:25:02 Z    1 days
Testing same since   171412  2022-06-29 23:38:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Denis V. Lunev <den@openvz.org>
  Richard Henderson <richard.henderson@linaro.org>
  Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
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
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
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
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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
commit f96d4e0f60073963a5c64844271ecfee8dd87abc
Merge: 2a8835cb45 1b8f777673
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Jun 29 21:35:27 2022 +0530

    Merge tag 'pull-block-2022-06-14-v2' of https://gitlab.com/vsementsov/qemu into staging
    
    Block jobs & NBD patches
    
    v2: - add arguments to QEMUMachine constructor in test, to make it work
          on arm in gitlab pipeline
        - use bdrv_inc_in_flight() / bdrv_dec_in_flight() instead of direct
          manipulation with bs->in_flight
    
    - add new options for copy-before-write filter
    - new trace points for NBD
    - prefer unsigned type for some 'in_flight' fields
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQIzBAABCgAdFiEEi5wmzbL9FHyIDoahVh8kwfGfefsFAmK8BqkACgkQVh8kwfGf
    # efuiMw/+P9FFLfGFSjVP+LYeT0Ah6kN1ypCMQzIk3Qq/J6qgMZhtRqpQoZOfIFQL
    # U9fGmEtQZ7gvEMD/nJToL6uOYlnQfPxDcA6GrRwWWE3rcFiPK4J0q2LlnPLn4QaU
    # W/qag5l/QnZfLlj/iV6neWOEvqdnvY1L8IS+T8xV6N0iBYlwgMC/6FGshQwehzcV
    # T5F1qPGB0vjFDjf92LFPEsvsFFHjHIVPwOyJMvF64QtSk57utikq/la9PI/yA9AH
    # Ll4mNQuZKx6rSI5wE6b21jc8iOUvaoHdPSEDQZfNILSdgGdiKvFwE51y+baGnIAD
    # TpjxfG59q0jyGxMjQVxMRSFaxAC4+Mqi82diSPv4xbiUdsE4byJH0oENn4z7+wAv
    # EvjuU9yx4FfHHltoUNwfn2pv00o/ELdZIoBNmW36rPxSGZMvfVfRtuBL7XWNUFbW
    # Fr4BwsjC4KfIxb16QTBGhXVv6grxdlwoU9N23npdi0YpW1ftZzXGDa85+gINQ807
    # eK/gP/OtYPwIql0bgmLiuaRNzC9psmQOO6vQbdvd/e4BEVWkxiez37+e+zFMStmL
    # OAL8rS6jckUoxVZjCYFEWg97XOobLUIhQxt9Fwh2omMDGKTwv861ghUAivxSWs93
    # IRNxfwqNPxnpDDXjnK1ayZgU08IL98AUYVKcPN1y8JvEhB4Hr1k=
    # =ndKk
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Wed 29 Jun 2022 01:30:41 PM +0530
    # gpg:                using RSA key 8B9C26CDB2FD147C880E86A1561F24C1F19F79FB
    # gpg: Good signature from "Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>" [unknown]
    # gpg:                 aka "Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 8B9C 26CD B2FD 147C 880E  86A1 561F 24C1 F19F 79FB
    
    * tag 'pull-block-2022-06-14-v2' of https://gitlab.com/vsementsov/qemu:
      block: use 'unsigned' for in_flight field on driver state
      nbd: trace long NBD operations
      iotests: copy-before-write: add cases for cbw-timeout option
      block/copy-before-write: implement cbw-timeout option
      block/block-copy: block_copy(): add timeout_ns parameter
      util: add qemu-co-timeout
      iotests: add copy-before-write: on-cbw-error tests
      block/copy-before-write: add on-cbw-error open parameter
      block/copy-before-write: refactor option parsing
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 1b8f777673985af366de099ad4e41d334b36fb12
Author: Denis V. Lunev <den@openvz.org>
Date:   Mon May 30 12:39:57 2022 +0200

    block: use 'unsigned' for in_flight field on driver state
    
    This patch makes in_flight field 'unsigned' for BDRVNBDState and
    MirrorBlockJob. This matches the definition of this field on BDS
    and is generically correct - we should never get negative value here.
    
    Signed-off-by: Denis V. Lunev <den@openvz.org>
    CC: John Snow <jsnow@redhat.com>
    CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
    CC: Kevin Wolf <kwolf@redhat.com>
    CC: Hanna Reitz <hreitz@redhat.com>
    CC: Eric Blake <eblake@redhat.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit 8bb100c9e2dc1fe0e33283b0c43252dbaf4eb71b
Author: Denis V. Lunev <den@openvz.org>
Date:   Mon May 30 12:39:29 2022 +0200

    nbd: trace long NBD operations
    
    At the moment there are 2 sources of lengthy operations if configured:
    * open connection, which could retry inside and
    * reconnect of already opened connection
    These operations could be quite lengthy and cumbersome to catch thus
    it would be quite natural to add trace points for them.
    
    This patch is based on the original downstream work made by Vladimir.
    
    Signed-off-by: Denis V. Lunev <den@openvz.org>
    CC: Eric Blake <eblake@redhat.com>
    CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
    CC: Kevin Wolf <kwolf@redhat.com>
    CC: Hanna Reitz <hreitz@redhat.com>
    CC: Paolo Bonzini <pbonzini@redhat.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit 9d05a87b77a63ed5505c59f5e8e6c5ca4f2c04d3
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:26 2022 +0300

    iotests: copy-before-write: add cases for cbw-timeout option
    
    Add two simple test-cases: timeout failure with
    break-snapshot-on-cbw-error behavior and similar with
    break-guest-write-on-cbw-error behavior.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit 6db7fd1ca980f8dd2fd082f13613166e170afd05
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:25 2022 +0300

    block/copy-before-write: implement cbw-timeout option
    
    In some scenarios, when copy-before-write operations lasts too long
    time, it's better to cancel it.
    
    Most useful would be to use the new option together with
    on-cbw-error=break-snapshot: this way if cbw operation takes too long
    time we'll just cancel backup process but do not disturb the guest too
    much.
    
    Note the tricky point of realization: we keep additional point in
    bs->in_flight during block_copy operation even if it's timed-out.
    Background "cancelled" block_copy operations will finish at some point
    and will want to access state. We should care to not free the state in
    .bdrv_close() earlier.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
      [vsementsov: use bdrv_inc_in_flight()/bdrv_dec_in_flight() instead of
       direct manipulation on bs->in_flight]
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit 15df6e698719505570f8532772c2b08cb278a45a
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:24 2022 +0300

    block/block-copy: block_copy(): add timeout_ns parameter
    
    Add possibility to limit block_copy() call in time. To be used in the
    next commit.
    
    As timed-out block_copy() call will continue in background anyway (we
    can't immediately cancel IO operation), it's important also give user a
    possibility to pass a callback, to do some additional actions on
    block-copy call finish.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit e1878eb5f0d93a67deb46aaeea898cf4824a759a
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:23 2022 +0300

    util: add qemu-co-timeout
    
    Add new API, to make a time limited call of the coroutine.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit dd3e97dfbe199fa277869d127884071100a426e5
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:22 2022 +0300

    iotests: add copy-before-write: on-cbw-error tests
    
    Add tests for new option of copy-before-write filter: on-cbw-error.
    
    Note that we use QEMUMachine instead of VM class, because in further
    commit we'll want to use throttling which doesn't work with -accel
    qtest used by VM.
    
    We also touch pylintrc to not break iotest 297.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
      [vsementsov: add arguments to QEMUMachine constructor]
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit f1bb39a8a5b6d486faa1a51a7f28c577155642c9
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:21 2022 +0300

    block/copy-before-write: add on-cbw-error open parameter
    
    Currently, behavior on copy-before-write operation failure is simple:
    report error to the guest.
    
    Let's implement alternative behavior: break the whole copy-before-write
    process (and corresponding backup job or NBD client) but keep guest
    working. It's needed if we consider guest stability as more important.
    
    The realisation is simple: on copy-before-write failure we set
    s->snapshot_ret and continue guest operations. s->snapshot_ret being
    set will lead to all further snapshot API requests. Note that all
    in-flight snapshot-API requests may still success: we do wait for them
    on BREAK_SNAPSHOT-failure path in cbw_do_copy_before_write().
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

commit 79ef0cebb5694411e7452f0cf15c4bd170c7f2d6
Author: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Date:   Thu Apr 7 16:27:20 2022 +0300

    block/copy-before-write: refactor option parsing
    
    We are going to add one more option of enum type. Let's refactor option
    parsing so that we can simply work with BlockdevOptionsCbw object.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

