Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE929A51B2
	for <lists+xen-devel@lfdr.de>; Sun, 20 Oct 2024 00:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822689.1236639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2ILS-0008Kt-5r; Sat, 19 Oct 2024 22:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822689.1236639; Sat, 19 Oct 2024 22:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2ILS-0008I9-2h; Sat, 19 Oct 2024 22:54:50 +0000
Received: by outflank-mailman (input) for mailman id 822689;
 Sat, 19 Oct 2024 22:54:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2ILQ-0008HD-Lp; Sat, 19 Oct 2024 22:54:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2ILQ-00005N-IC; Sat, 19 Oct 2024 22:54:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2ILQ-0003ys-2J; Sat, 19 Oct 2024 22:54:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t2ILQ-0006WF-1i; Sat, 19 Oct 2024 22:54:48 +0000
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
	bh=uVT50tdiVQ68qyQhU933AOyxA35Lu3TuWKXWxdQMQcE=; b=EJmCkipHJOd68ALYAcsPzRnbzr
	df2x8KHy+NhGTymG5gAefzwKXFZEGWDrkMoS3Vm2lVSFEr+X9+JXEr/xIv+hHxMvxuxula4hj9+KS
	2tViWUfu/p74m2NyB4PdL8m3ks8JwkEluozesXzb82kYBzUVkJ5d+b2XMpCGsxCsKoWA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188305-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 188305: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:build-armhf:xen-build:fail:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    xen-unstable:test-amd64-amd64-libvirt-pair:guest-migrate/dst_host/src_host/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-vhd:leak-check/check:fail:heisenbug
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e9f227685e7204cb2293576ee5b745b828cb3cd7
X-Osstest-Versions-That:
    xen=47990ecef286606794d607d4ca8703d71c98d659
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Oct 2024 22:54:48 +0000

flight 188305 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188305/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 188128
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 188153

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-pair 28 guest-migrate/dst_host/src_host/debian.repeat fail in 188282 pass in 188305
 test-amd64-amd64-libvirt-vhd 22 leak-check/check           fail pass in 188282

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 188282 blocked in 188153
 test-armhf-armhf-xl         15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-qcow2   14 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-qcow2 15 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-xl-raw     14 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-raw 15 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 188282 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 188282 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 188282 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 188153
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e9f227685e7204cb2293576ee5b745b828cb3cd7
baseline version:
 xen                  47990ecef286606794d607d4ca8703d71c98d659

Last test of basis   188153  2024-10-17 07:28:21 Z    2 days
Failing since        188193  2024-10-17 18:11:18 Z    2 days    4 attempts
Testing same since   188282  2024-10-19 03:21:26 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Cherechesu <andrei.cherechesu@nxp.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@cloud.com>
  Christopher Clark <christopher.w.clark@gmail.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Javi Merino <javi.merino@cloud.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@amd.com>
  Peter van der Perk <peter.vander.perk@nxp.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
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
 test-armhf-armhf-xl                                          blocked 
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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
commit e9f227685e7204cb2293576ee5b745b828cb3cd7
Author: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Date:   Mon Sep 30 14:47:08 2024 +0300

    xen/arm: Add NXP LINFlexD UART early printk support
    
    This adds support for early printk debug via the NXP LINFlexD
    UART controller.
    
    Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
    Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 6ba3b1f8285fbca53c8f6eeb587a1364cbe17939
Author: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Date:   Mon Sep 30 14:47:07 2024 +0300

    xen/arm: Add NXP LINFlexD UART Driver
    
    The LINFlexD UART is an UART controller available on NXP S32
    processors family targeting automotive (for example: S32G2, S32G3,
    S32R).
    
    S32G3 Reference Manual:
    https://www.nxp.com/webapp/Download?colCode=RMS32G3.
    
    Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
    Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 0710b38921ec6740d75148b6b400b6aa44314d2d
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Fri Oct 18 14:57:25 2024 +0100

    Update deprecated SPDX license identifiers
    
    As specified in LICENSES/GPL-2.0:
    - GPL-2.0 -> GPL-2.0-only;
    - GPL-2.0+ -> GPL-2.0-or-later.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> [RISC-V]

commit 4c21b6affb4c5a3afe22cbc144362091de063366
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Aug 30 18:49:53 2024 +0100

    x86/boot: Further simplify CR4 handling in dom0_construct_pv()
    
    The logic would be more robust disabling SMAP based on its precense in CR4,
    rather than SMAP's accociation with a synthetic feature.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 6e085825cb073255cc9d5db32b496284b89290d3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Oct 17 17:20:21 2024 +0100

    CI: Refresh and upgrade the Fedora container
    
    Fedora 29 is long out of date.  Move forward 5 years to Fedora 40.
    
    Include all the usual improvements.  Rework the container to be non-root, use
    heredocs for legibility, and switch to the new naming scheme.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Javi Merino <javi.merino@cloud.com>
    Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit d84f6870fe18565c93937224fc0e1a2b69aa529a
Author: Javi Merino <javi.merino@cloud.com>
Date:   Thu Oct 17 17:20:20 2024 +0100

    ocaml/libs: Fill build failure due to unused variable in ocaml macro
    
    On Fedora 40, the build fails with:
    
        In file included from domain_getinfo_stubs_v1.c:10:
        domain_getinfo_stubs_v1.c: In function 'xsd_glue_failwith':
        /usr/lib64/ocaml/caml/memory.h:275:29: error: unused variable 'caml__frame' [-Werror=unused-variable]
          275 |   struct caml__roots_block *caml__frame = *caml_local_roots_ptr
              |                             ^~~~~~~~~~~
        domain_getinfo_stubs_v1.c:48:9: note: in expansion of macro 'CAMLparam0'
          48 |         CAMLparam0();
             |         ^~~~~~~~~~
        cc1: all warnings being treated as errors
    
    The CAMLparam0 macro is defined in /usr/lib64/ocaml/caml/memory.h:255 as:
    
        #define CAMLparam0()                                                    \$
          struct caml__roots_block** caml_local_roots_ptr =                     \$
            (DO_CHECK_CAML_STATE ? Caml_check_caml_state() : (void)0,           \$
             &CAML_LOCAL_ROOTS);                                                \$
          struct caml__roots_block *caml__frame = *caml_local_roots_ptr
    
    We can't modify the macro.  But, it turns out there's a CAMLnoreturn macro
    with the sole purpose of masking this warning.
    
    Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
    Signed-off-by: Javi Merino <javi.merino@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit 0bcf66d05a3d425e22b995020ca31bdbcaf48823
Author: Javi Merino <javi.merino@cloud.com>
Date:   Thu Oct 17 17:20:19 2024 +0100

    automation: Fix URL to the gitlab container registry documentation
    
    The gitlab documentation is now at
    https://docs.gitlab.com/ee/administration/packages/container_registry.html
    
    Signed-off-by: Javi Merino <javi.merino@cloud.com>
    Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 572010c552b210f07e633473bd0c1129af4d0b50
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Oct 17 13:02:56 2024 -0400

    x86/boot: split bootstrap_map_addr() out of bootstrap_map()
    
    Using an interface based on addresses directly, not modules.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

commit a285d2ac2e524c808091062c67142cf5924b56f6
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Thu Oct 17 13:02:44 2024 -0400

    x86/boot: move mmap info to boot info
    
    Transition the memory map info to be held in struct boot_info.
    
    No functional change intended.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 29aaded97dacd3120842aeeafa91a4a8e6d45180
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Thu Oct 17 13:02:43 2024 -0400

    x86/boot: move cmdline to boot info
    
    Transition Xen's command line to being held in struct boot_info.
    
    No functional change intended.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b438c5fbf4c02145f6ecc8642290d46bf1957388
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Thu Oct 17 13:02:42 2024 -0400

    x86/boot: move boot loader name to boot info
    
    Transition the incoming boot loader name to be held in struct boot_info.
    
    No functional change intended.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 038826b61e852469b1a54690dba6d142aceb1f20
Author: Christopher Clark <christopher.w.clark@gmail.com>
Date:   Thu Oct 17 13:02:41 2024 -0400

    x86/boot: move x86 boot module counting into a new boot_info struct
    
    An initial step towards a non-multiboot internal representation of boot
    modules for common code, starting with x86 setup and converting the fields
    that are accessed for the startup calculations.
    
    Introduce a new header, <asm/bootinfo.h>, and populate it with a new boot_info
    structure initially containing a count of the number of boot modules.
    
    No functional change intended.
    
    Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 081683ea578da56dd20b9dc22a64d03c893b47ba
Author: Stewart Hildebrand <stewart.hildebrand@amd.com>
Date:   Fri Oct 11 17:19:56 2024 -0400

    xen/arm: dom0less: cope with missing /gic phandle
    
    If a partial DT has a /gic node, but no references to it, dtc may omit
    the phandle property. With the phandle property missing,
    fdt_get_phandle() returns 0, leading Xen to generate a malformed domU
    dtb due to invalid interrupt-parent phandle references. 0 is an invalid
    phandle value. Add a zero check, and fall back to GUEST_PHANDLE_GIC.
    
    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 1e81d2df4f48f37d2086bc75199c75ca93cace92
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Thu Oct 10 12:57:46 2024 +0200

    device-tree: Move dt-overlay.c to common/device-tree/
    
    The code is DT specific and as such should be placed under common
    directory for DT related files. Update MAINTAINERS file accordingly
    and drop the line with a path from a top-level comment in dt-overlay.c.
    It serves no purpose and requires being updated on every code movement.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 17 14:14:51 2024 +0200

    x86emul/test: drop Xeon Phi S/G prefetch special case
    
    Another leftover from the dropping of Xeon Phi support.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 09d22fe15cb11254d06413d15fd578093d7fe062
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 17 14:14:31 2024 +0200

    x86emul/test: correct loop body indentation in evex-disp8.c:test_one()
    
    For some reason I entirely consistently screwed these up.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

commit 330d4e62508defa708b55f1b612f42b6a2e2842b
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Oct 17 14:13:50 2024 +0200

    docs: update documentation of reboot param
    
    Reflect changed default mode, and fix formatting of `efi` value.
    
    Fixes: d81dd3130351 ("x86/shutdown: change default reboot method preference")
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

