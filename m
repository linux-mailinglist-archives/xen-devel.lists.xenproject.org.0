Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B30719B34
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 13:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542429.846280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4grW-0004D3-HX; Thu, 01 Jun 2023 11:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542429.846280; Thu, 01 Jun 2023 11:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4grW-0004A3-E3; Thu, 01 Jun 2023 11:53:02 +0000
Received: by outflank-mailman (input) for mailman id 542429;
 Thu, 01 Jun 2023 11:53:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4grU-00049t-6N; Thu, 01 Jun 2023 11:53:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4grT-00086d-Ox; Thu, 01 Jun 2023 11:52:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4grT-0000EU-FJ; Thu, 01 Jun 2023 11:52:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4grT-0004QI-Ep; Thu, 01 Jun 2023 11:52:59 +0000
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
	bh=sTy9tpUpOxMSGKmbr+j1hxMJgyZApMMG9k/M+/bIjBc=; b=RwAit6LafYIxORoUMFuZoPDcKT
	2F60cz9aUwEqD36VhnI0xJ4o3Ed9DGjK47y32IV5sv4V1qdBmjpPJuksKuieiLphadrBlvX2HRkDX
	CChrL61xzpvh667cBFki7D485Dw+Rp+yR8mel9SPgRm9rpuX5/y6n3t1RjkaVqt9qEi0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181061-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 181061: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-pair:guest-migrate/dst_host/src_host/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=dc98fa74446e5abe417e5ba9a6a632b50444cfa1
X-Osstest-Versions-That:
    xen=94200e1bae07e725cc07238c11569c5cab7befb7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jun 2023 11:52:59 +0000

flight 181061 xen-unstable real [real]
flight 181071 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181061/
http://logs.test-lab.xenproject.org/osstest/logs/181071/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install  fail REGR. vs. 181027

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail pass in 181071-retest
 test-amd64-amd64-pair 28 guest-migrate/dst_host/src_host/debian.repeat fail pass in 181071-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181027
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181027
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181027
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181027
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181027
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181027
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181027
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181027
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 181027
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181027
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181027
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  dc98fa74446e5abe417e5ba9a6a632b50444cfa1
baseline version:
 xen                  94200e1bae07e725cc07238c11569c5cab7befb7

Last test of basis   181027  2023-05-31 08:39:08 Z    1 days
Testing same since   181061  2023-05-31 23:38:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bobby Eshleman <bobbyeshleman@gmail.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
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
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-amd64-amd64-pair                                        fail    
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
commit dc98fa74446e5abe417e5ba9a6a632b50444cfa1
Author: Olaf Hering <olaf@aepfle.de>
Date:   Wed May 31 17:06:58 2023 +0100

    xentrace: close output file in the function which opened it
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit f53c498276588c2aced36d5baa61e4a24e8d1bf8
Author: Olaf Hering <olaf@aepfle.de>
Date:   Wed May 31 17:06:56 2023 +0100

    xentrace: remove return value from monitor_tbufs
    
    The program is structured so that fatal errors cause exit() to be
    called directly, rather than being passed up the stack; returning a
    value here may mislead people into believing otherwise.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit 0e0d3c00bc098e41b82a4073e3d3f5432fb9b0c6
Author: George Dunlap <george.dunlap@cloud.com>
Date:   Wed May 31 17:06:55 2023 +0100

    xentrace: allow xentrace to write to stdout
    
    The output file is optional. In case it is missing, xentrace is supposed
    to write to stdout - unless it is a tty, which is checked prior using it.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: George Dunlap <george.dunlap@cloud.com>

commit 04f25e9048c375898430a58e1c570806896252cb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 31 16:04:30 2023 +0200

    vPCI: fix test harness build
    
    The earlier commit introduced two uses of is_hardware_domain().
    
    Fixes: 465217b0f872 ("vPCI: account for hidden devices")
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 7a2f0ba0d08562fc09c6dd865c6cb3468185be1f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 31 16:04:12 2023 +0200

    vPCI: add test harness entry to ./MAINTAINERS
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 465217b0f872602b4084a1b0fa2ef75377cb3589
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 31 12:01:11 2023 +0200

    vPCI: account for hidden devices
    
    Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
    console) are associated with DomXEN, not Dom0. This means that while
    looking for overlapping BARs such devices cannot be found on Dom0's list
    of devices; DomXEN's list also needs to be scanned.
    
    Suppress vPCI init altogether for r/o devices (which constitute a subset
    of hidden ones).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>

commit 445fdc641e304ff41a544f8f5926a13b604c08ad
Author: Juergen Gross <jgross@suse.com>
Date:   Wed May 31 12:00:40 2023 +0200

    xen/include/public: fix 9pfs xenstore path description
    
    In xen/include/public/io/9pfs.h the name of the Xenstore backend node
    "security-model" should be "security_model", as this is how the Xen
    tools are creating it and qemu is reading it.
    
    Fixes: ad58142e73a9 ("xen/public: move xenstore related doc into 9pfs.h")
    Fixes: cf1d2d22fdfd ("docs/misc: Xen transport for 9pfs")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 0f80a46ffa6bfd5d111fc2e64ee5983513627e4d
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 12:00:13 2023 +0200

    xen/riscv: remove dummy_bss variable
    
    After introduction of initial pagetables there is no any sense
    in dummy_bss variable as bss section will not be empty anymore.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit 0d74fc2b2f85586ceb5672aedc79c666e529381d
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 12:00:05 2023 +0200

    xen/riscv: setup initial pagetables
    
    The patch does two thing:
    1. Setup initial pagetables.
    2. Enable MMU which end up with code in
       cont_after_mmu_is_enabled()
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit ec337ce2e972b70619f5a076b20910a2ff4fea7a
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 11:59:53 2023 +0200

    xen/riscv: align __bss_start
    
    bss clear cycle requires proper alignment of __bss_start.
    
    ALIGN(PAGE_SIZE) before "*(.bss.page_aligned)" in xen.lds.S
    was removed as any contribution to "*(.bss.page_aligned)" have to
    specify proper aligntment themselves.
    
    Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit e66003e7be1996c9dd8daca54ba34ad5bb58d668
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 11:55:58 2023 +0200

    xen/riscv: introduce setup_initial_pages
    
    The idea was taken from xvisor but the following changes
    were done:
    * Use only a minimal part of the code enough to enable MMU
    * rename {_}setup_initial_pagetables functions
    * add an argument for setup_initial_mapping to have
      an opportunity to make set PTE flags.
    * update setup_initial_pagetables function to map sections
      with correct PTE flags.
    * Rewrite enable_mmu() to C.
    * map linker addresses range to load addresses range without
      1:1 mapping. It will be 1:1 only in case when
      load_start_addr is equal to linker_start_addr.
    * add safety checks such as:
      * Xen size is less than page size
      * linker addresses range doesn't overlap load addresses
        range
    * Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
    * change PTE_LEAF_DEFAULT to RW instead of RWX.
    * Remove phys_offset as it is not used now
    * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0);
      in  setup_inital_mapping() as they should be already aligned.
      Make a check that {map_pa}_start are aligned.
    * Remove clear_pagetables() as initial pagetables will be
      zeroed during bss initialization
    * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
      as there is no such section in xen.lds.S
    * Update the argument of pte_is_valid() to "const pte_t *p"
    * Add check that Xen's load address is aligned at 4k boundary
    * Refactor setup_initial_pagetables() so it is mapping linker
      address range to load address range. After setup needed
      permissions for specific section ( such as .text, .rodata, etc )
      otherwise RW permission will be set by default.
    * Add function to check that requested SATP_MODE is supported
    
    Origin: git@github.com:xvisor/xvisor.git 9be2fdd7
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit efadb18dd58abaa0c6102e04f1c25ac94c273853
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 11:55:46 2023 +0200

    xen/riscv: add VM space layout
    
    Also it was added explanation about ignoring of top VA bits
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>
(qemu changes not included)

