Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBA756928
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564778.882495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLR7E-0003a8-9K; Mon, 17 Jul 2023 16:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564778.882495; Mon, 17 Jul 2023 16:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLR7E-0003Xt-64; Mon, 17 Jul 2023 16:30:28 +0000
Received: by outflank-mailman (input) for mailman id 564778;
 Mon, 17 Jul 2023 16:30:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLR7D-0003Xi-B6; Mon, 17 Jul 2023 16:30:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLR7D-0004uq-22; Mon, 17 Jul 2023 16:30:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLR7C-0004PG-MK; Mon, 17 Jul 2023 16:30:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qLR7C-0000wU-Lp; Mon, 17 Jul 2023 16:30:26 +0000
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
	bh=R2Hke1LtoLiYXJHUDmO5DeSRldRijNUVM3oYSE+oGvU=; b=InDJxo5iDIjvOWy4fgeSGMfDOB
	AvQ6MxCwcHRwFr3QjcubnqgYIHlBZbpxl/X8+CMybot3GSPch5pl7vfYzILWmpJBWr/bA0Fn2fXR9
	h0l6Iz9mUYSoFUOIqH7gGzcfXUTfa1KNy3HQH26q5oPkYLEgcyycOo8Fnwg8TfQcFs/Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181831-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 181831: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-4.16-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:heisenbug
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:hosts-allocate:starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=606331e6562f7b64ef0be1fd2596423c0ae209da
X-Osstest-Versions-That:
    xen=b0806d84d48d983d40a29534e663652887287a78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jul 2023 16:30:26 +0000

flight 181831 xen-4.16-testing real [real]
flight 181848 xen-4.16-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181831/
http://logs.test-lab.xenproject.org/osstest/logs/181848/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 180918

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-install  fail pass in 181848-retest

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop   fail in 181848 like 180918
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180918
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180918
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180918
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180918
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180918
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180918
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180918
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180918
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt      3 hosts-allocate               starved  n/a
 test-armhf-armhf-libvirt-qcow2  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-arndale   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-vhd       3 hosts-allocate               starved  n/a
 test-armhf-armhf-libvirt-raw  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl           3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-credit1   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-credit2   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-multivcpu  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-rtds      3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  606331e6562f7b64ef0be1fd2596423c0ae209da
baseline version:
 xen                  b0806d84d48d983d40a29534e663652887287a78

Last test of basis   180918  2023-05-23 13:08:46 Z   55 days
Testing same since   181831  2023-07-17 06:36:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Olaf Hering <olaf@aepfle.de>
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
 test-armhf-armhf-xl                                          starved 
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
 test-armhf-armhf-xl-arndale                                  starved 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
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
 test-amd64-amd64-libvirt-vhd                                 pass    
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
commit 606331e6562f7b64ef0be1fd2596423c0ae209da
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Jul 17 08:34:33 2023 +0200

    iommu/amd-vi: fix checking for Invalidate All support in amd_iommu_resume()
    
    The iommu local variable does not point to to a valid amd_iommu element
    after the call to for_each_amd_iommu().  Instead check whether any IOMMU
    on the system doesn't support Invalidate All in order to perform the
    per-domain and per-device flushes.
    
    Fixes: 9c46139de889 ('amd iommu: Support INVALIDATE_IOMMU_ALL command.')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 5ecbb779748a56495f2c892f0610d57dd623c7cd
    master date: 2023-06-13 14:41:32 +0200

commit d3065bf0a83e02032d0900566fa8605d8865073d
Author: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date:   Mon Jul 17 08:34:11 2023 +0200

    x86/microcode: Add missing unlock in microcode_update_helper()
    
    microcode_update_helper() may return early while holding
    cpu_add_remove_lock, hence preventing any writers from taking it again.
    
    Leave through the `put` label instead so it's properly released.
    
    Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
    Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: b35b22acb887f682efe8385b3df165220bc84c86
    master date: 2023-06-05 16:11:10 +0100

commit c15221e45c0ffafdbb9faafd1a07ffb054b2cde3
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Jul 17 08:32:34 2023 +0200

    vpci/header: cope with devices not having vpci allocated
    
    When traversing the list of pci devices assigned to a domain cope with
    some of them not having the vpci struct allocated. It should be
    possible for the hardware domain to have read-only devices assigned
    that are not handled by vPCI, such support will be added by further
    patches.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: ee045f3a4a6dddb09f5aa96a50cceaae97d3245f
    master date: 2023-05-26 09:18:37 +0200

commit c9c8b20ebcb5a75b40da34f541ff226cac70dd22
Author: Olaf Hering <olaf@aepfle.de>
Date:   Mon Jul 17 08:32:19 2023 +0200

    tools: convert bitfields to unsigned type
    
    clang complains about the signed type:
    
    implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
    
    Backport: Dropped the libxenvchan change, for the original commit saying
    
    "The potential ABI change in libxenvchan is covered by the Xen version
     based SONAME."
    
    which won't hold on stable trees.
    master commit: 99ab02f63ea813f2e467a39a7736bf460a3f3495
    master date: 2023-05-16 20:03:02 +0100
(qemu changes not included)

