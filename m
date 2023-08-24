Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B0787BD7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 01:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590392.922670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZJW5-0003ex-N1; Thu, 24 Aug 2023 23:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590392.922670; Thu, 24 Aug 2023 23:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZJW5-0003dI-K3; Thu, 24 Aug 2023 23:13:29 +0000
Received: by outflank-mailman (input) for mailman id 590392;
 Thu, 24 Aug 2023 23:13:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZJW4-0003d7-CB; Thu, 24 Aug 2023 23:13:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZJW4-0005Jf-07; Thu, 24 Aug 2023 23:13:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZJW3-0007L9-Ej; Thu, 24 Aug 2023 23:13:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qZJW3-0007DF-EP; Thu, 24 Aug 2023 23:13:27 +0000
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
	bh=xuymBl0RKBhLk8iEx6d/k2TqUOBGzySOo4Ql8afaojA=; b=CdDEu1S8RDBOX5g3/XojsQdB75
	s6I3FgYVckCtqYjL22CDARVStJhQNPiiBkNVUHTiYQlqoGuXTV+0uyy6QH3DsLArBb/aa4rDM185X
	3XDHisBP4B/a+OypdL85OkxKa43Fo9XnOLtsqiq3K5KWRr0ig2LGs20CoCmp+nGOl25o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182506-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182506: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-arm64:xen-build:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start.2:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-pair:guest-migrate/dst_host/src_host/debian.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=93f5de5f648d2b1ce3540a4ac71756d4a852dc23
X-Osstest-Versions-That:
    linux=53663f4103ff6738e4697004d6f84864d052333d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Aug 2023 23:13:27 +0000

flight 182506 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182506/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build      fail in 182499 REGR. vs. 182424

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot fail in 182499 pass in 182506
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 8 xen-boot fail in 182499 pass in 182506
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 15 guest-start.2 fail in 182499 pass in 182506
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 20 guest-start/debianhvm.repeat fail in 182499 pass in 182506
 test-amd64-amd64-pair 28 guest-migrate/dst_host/src_host/debian.repeat fail pass in 182499
 test-armhf-armhf-xl          18 guest-start/debian.repeat  fail pass in 182499
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 18 guest-localmigrate/x10 fail pass in 182499

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 182499 n/a
 build-arm64-libvirt           1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 182499 n/a
 test-arm64-arm64-examine      1 build-check(1)           blocked in 182499 n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182424
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182424
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182424
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182424
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182424
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182424
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                93f5de5f648d2b1ce3540a4ac71756d4a852dc23
baseline version:
 linux                53663f4103ff6738e4697004d6f84864d052333d

Last test of basis   182424  2023-08-22 18:10:18 Z    2 days
Failing since        182452  2023-08-23 10:10:33 Z    1 days    3 attempts
Testing same since   182499  2023-08-24 05:04:50 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  André Apitzsch <git@apitzsch.eu>
  Hans de Goede <hdegoede@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Peng Fan <peng.fan@nxp.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rik van Riel <riel@surriel.com>
  Rob Herring <robh@kernel.org>
  Shih-Yi Chen <shihyic@nvidia.com>
  Swapnil Devesh <me@sidevesh.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
commit 93f5de5f648d2b1ce3540a4ac71756d4a852dc23
Merge: a5e505a99ca7 453b014e2c29
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Aug 23 14:28:19 2023 -0700

    Merge tag 'acpi-6.5-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
    
    Pull ACPI fix from Rafael Wysocki:
     "Make an existing ACPI IRQ override quirk for PCSpecialist Elimina Pro
      16 M work as intended (Hans de Goede)"
    
    * tag 'acpi-6.5-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm:
      ACPI: resource: Fix IRQ override quirk for PCSpecialist Elimina Pro 16 M

commit a5e505a99ca748583dbe558b691be1b26f05d678
Merge: 89bf6209cad6 0848cab765c6
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Aug 23 08:32:52 2023 -0700

    Merge tag 'platform-drivers-x86-v6.5-5' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
    
    Pull x86 platform driver fixes from Hans de Goede:
     "Final set of three small fixes for 6.5"
    
    * tag 'platform-drivers-x86-v6.5-5' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86:
      platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
      platform/x86: ideapad-laptop: Add support for new hotkeys found on ThinkBook 14s Yoga ITL
      platform/x86: lenovo-ymc: Add Lenovo Yoga 7 14ACN6 to ec_trigger_quirk_dmi_table

commit 0848cab765c634597636810bf76d0934003cce28
Author: Shih-Yi Chen <shihyic@nvidia.com>
Date:   Mon Aug 21 11:06:27 2023 -0400

    platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
    
    rshim console does not show all entries of dmesg.
    
    Fixed by setting MLXBF_TM_TX_LWM_IRQ for every CONSOLE notification.
    
    Signed-off-by: Shih-Yi Chen <shihyic@nvidia.com>
    Reviewed-by: Liming Sung <limings@nvidia.com>
    Reviewed-by: David Thompson <davthompson@nvidia.com>
    Link: https://lore.kernel.org/r/20230821150627.26075-1-shihyic@nvidia.com
    Reviewed-by: Hans de Goede <hdegoede@redhat.com>
    Signed-off-by: Hans de Goede <hdegoede@redhat.com>

commit 89bf6209cad66214d3774dac86b6bbf2aec6a30d
Merge: 53663f4103ff 7882541ca06d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Aug 22 11:16:23 2023 -0700

    Merge tag 'devicetree-fixes-for-6.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
    
    Pull devicetree fixes from Rob Herring:
    
     - Fix DT node refcount when creating platform devices
    
     - Fix deadlock in changeset code due to printing with devtree_lock held
    
     - Fix unittest EXPECT strings for parse_phandle_with_args_map() test
    
     - Fix IMA kexec memblock freeing
    
    * tag 'devicetree-fixes-for-6.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux:
      of/platform: increase refcount of fwnode
      of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
      of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
      mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer

commit 7882541ca06d51a6c12d687827176c16d5e05f65
Author: Peng Fan <peng.fan@nxp.com>
Date:   Mon Aug 21 10:39:28 2023 +0800

    of/platform: increase refcount of fwnode
    
    commit 0f8e5651095b
    ("of/platform: Propagate firmware node by calling device_set_node()")
    use of_fwnode_handle to replace of_node_get, which introduces a side
    effect that the refcount is not increased. Then the out of tree
    jailhouse hypervisor enable/disable test will trigger kernel dump in
    of_overlay_remove, with the following sequence
    "
       of_changeset_revert(&overlay_changeset);
       of_changeset_destroy(&overlay_changeset);
       of_overlay_remove(&overlay_id);
    "
    
    So increase the refcount to avoid issues.
    
    This patch also release the refcount when releasing amba device to avoid
    refcount leakage.
    
    Fixes: 0f8e5651095b ("of/platform: Propagate firmware node by calling device_set_node()")
    Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Signed-off-by: Peng Fan <peng.fan@nxp.com>
    Link: https://lore.kernel.org/r/20230821023928.3324283-2-peng.fan@oss.nxp.com
    Signed-off-by: Rob Herring <robh@kernel.org>

commit 914d9d831e6126a6e7a92e27fcfaa250671be42c
Author: Rob Herring <robh@kernel.org>
Date:   Fri Aug 18 15:40:57 2023 -0500

    of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
    
    While originally it was fine to format strings using "%pOF" while
    holding devtree_lock, this now causes a deadlock.  Lockdep reports:
    
        of_get_parent from of_fwnode_get_parent+0x18/0x24
        ^^^^^^^^^^^^^
        of_fwnode_get_parent from fwnode_count_parents+0xc/0x28
        fwnode_count_parents from fwnode_full_name_string+0x18/0xac
        fwnode_full_name_string from device_node_string+0x1a0/0x404
        device_node_string from pointer+0x3c0/0x534
        pointer from vsnprintf+0x248/0x36c
        vsnprintf from vprintk_store+0x130/0x3b4
    
    Fix this by moving the printing in __of_changeset_entry_apply() outside
    the lock. As the only difference in the multiple prints is the action
    name, use the existing "action_names" to refactor the prints into a
    single print.
    
    Fixes: a92eb7621b9fb2c2 ("lib/vsprintf: Make use of fwnode API to obtain node names and separators")
    Cc: stable@vger.kernel.org
    Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Link: https://lore.kernel.org/r/20230801-dt-changeset-fixes-v3-2-5f0410e007dd@kernel.org
    Signed-off-by: Rob Herring <robh@kernel.org>

commit 0aeae3788e28f64ccb95405d4dc8cd80637ffaea
Author: Rob Herring <robh@kernel.org>
Date:   Fri Aug 18 15:40:56 2023 -0500

    of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
    
    Commit 12e17243d8a1 ("of: base: improve error msg in
    of_phandle_iterator_next()") added printing of the phandle value on
    error, but failed to update the unittest.
    
    Fixes: 12e17243d8a1 ("of: base: improve error msg in of_phandle_iterator_next()")
    Cc: stable@vger.kernel.org
    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Link: https://lore.kernel.org/r/20230801-dt-changeset-fixes-v3-1-5f0410e007dd@kernel.org
    Signed-off-by: Rob Herring <robh@kernel.org>

commit a260f7d726fde52c0278bd3fa085a758639bcee2
Author: André Apitzsch <git@apitzsch.eu>
Date:   Sat Aug 19 09:12:15 2023 +0200

    platform/x86: ideapad-laptop: Add support for new hotkeys found on ThinkBook 14s Yoga ITL
    
    The Lenovo Thinkbook 14s Yoga ITL has 4 new symbols/shortcuts on their
    F9-F11 and PrtSc keys:
    
    F9:    Has a symbol of a head with a headset, the manual says "Service key"
    F10:   Has a symbol of a telephone horn which has been picked up from the
           receiver, the manual says: "Answer incoming calls"
    F11:   Has a symbol of a telephone horn which is resting on the receiver,
           the manual says: "Reject incoming calls"
    PrtSc: Has a symbol of a siccor and a dashed ellipse, the manual says:
           "Open the Windows 'Snipping' Tool app"
    
    This commit adds support for these 4 new hkey events.
    
    Signed-off-by: André Apitzsch <git@apitzsch.eu>
    Link: https://lore.kernel.org/r/20230819-lenovo_keys-v1-1-9d34eac88e0a@apitzsch.eu
    Reviewed-by: Hans de Goede <hdegoede@redhat.com>
    Signed-off-by: Hans de Goede <hdegoede@redhat.com>

commit db35610a181c18f7a521a2e157f7acdef7ce425f
Author: Swapnil Devesh <me@sidevesh.com>
Date:   Fri Aug 18 18:09:47 2023 +0530

    platform/x86: lenovo-ymc: Add Lenovo Yoga 7 14ACN6 to ec_trigger_quirk_dmi_table
    
    This adds my laptop Lenovo Yoga 7 14ACN6, with Product Name: 82N7
    (from `dmidecode -t1 | grep "Product Name"`) to
    the ec_trigger_quirk_dmi_table, have tested that this is required
    for the YMC driver to work correctly on this model.
    
    Signed-off-by: Swapnil Devesh <me@sidevesh.com>
    Reviewed-by: Gergő Köteles <soyer@irl.hu>
    Link: https://lore.kernel.org/r/18a08a8b173.895ef3b250414.1213194126082324071@sidevesh.com
    Reviewed-by: Hans de Goede <hdegoede@redhat.com>
    Signed-off-by: Hans de Goede <hdegoede@redhat.com>

commit 453b014e2c294abf762d3bce12e91ce4b34055e6
Author: Hans de Goede <hdegoede@redhat.com>
Date:   Mon Aug 21 11:09:27 2023 +0200

    ACPI: resource: Fix IRQ override quirk for PCSpecialist Elimina Pro 16 M
    
    It turns out that some PCSpecialist Elimina Pro 16 M models
    have "GM6BGEQ" as DMI product-name instead of "Elimina Pro 16 M",
    causing the existing DMI quirk to not work on these models.
    
    The DMI board-name is always "GM6BGEQ", so match on that instead.
    
    Fixes: 56fec0051a69 ("ACPI: resource: Add IRQ override quirk for PCSpecialist Elimina Pro 16 M")
    Link: https://bugzilla.kernel.org/show_bug.cgi?id=217394#c36
    Cc: All applicable <stable@vger.kernel.org>
    Signed-off-by: Hans de Goede <hdegoede@redhat.com>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

commit f0362a253606e2031f8d61c74195d4d6556e12a4
Author: Rik van Riel <riel@surriel.com>
Date:   Thu Aug 17 13:57:59 2023 -0400

    mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer
    
    The code calling ima_free_kexec_buffer runs long after the memblock
    allocator has already been torn down, potentially resulting in a use
    after free in memblock_isolate_range.
    
    With KASAN or KFENCE, this use after free will result in a BUG
    from the idle task, and a subsequent kernel panic.
    
    Switch ima_free_kexec_buffer over to memblock_free_late to avoid
    that issue.
    
    Fixes: fee3ff99bc67 ("powerpc: Move arch independent ima kexec functions to drivers/of/kexec.c")
    Cc: stable@kernel.org
    Signed-off-by: Rik van Riel <riel@surriel.com>
    Suggested-by: Mike Rappoport <rppt@kernel.org>
    Link: https://lore.kernel.org/r/20230817135759.0888e5ef@imladris.surriel.com
    Signed-off-by: Rob Herring <robh@kernel.org>

