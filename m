Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107386B1A22
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 04:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508157.782514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pa7Gq-0002cB-OU; Thu, 09 Mar 2023 03:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508157.782514; Thu, 09 Mar 2023 03:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pa7Gq-0002ZG-JF; Thu, 09 Mar 2023 03:48:48 +0000
Received: by outflank-mailman (input) for mailman id 508157;
 Thu, 09 Mar 2023 03:48:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pa7Go-0002Z3-7V; Thu, 09 Mar 2023 03:48:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pa7Go-0004K5-3h; Thu, 09 Mar 2023 03:48:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pa7Gn-0004fm-Lq; Thu, 09 Mar 2023 03:48:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pa7Gn-0002Gi-LC; Thu, 09 Mar 2023 03:48:45 +0000
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
	bh=DGaIba7OQKLaluaT0BzsZrC7UUymkCxqtMQmeUByMAY=; b=3vOSmn4qK0SxwepDsD2xJzTR9R
	42sdL4iwDWcwbJHSxaHffAihp64p93atq1GtFg97M8iCXmmvCUzbKLRUYCxtRrgVrLP//I9lNxdDG
	EVha3cN9T47/RFto6l1sesx+3bXpKhR6XmKrKO8DYNaS494VzIIwLRmfMHY6kEa9g14Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179509-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 179509: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-unstable:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=746774cd1786b13dc67020efb6496477535dcb26
X-Osstest-Versions-That:
    xen=31270f11a96ebb875cd70661e2df9e5c6edd7564
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Mar 2023 03:48:45 +0000

flight 179509 xen-unstable real [real]
flight 179512 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/179509/
http://logs.test-lab.xenproject.org/osstest/logs/179512/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 179503

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 179503
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 179503
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 179503
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 179503
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 179503
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 179503
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 179503
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 179503
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 179503
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  746774cd1786b13dc67020efb6496477535dcb26
baseline version:
 xen                  31270f11a96ebb875cd70661e2df9e5c6edd7564

Last test of basis   179503  2023-03-08 01:55:30 Z    1 days
Testing same since   179509  2023-03-08 14:07:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Michal Orzel <michal.orzel@amd.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      pass    
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
 test-amd64-amd64-xl-qcow2                                    fail    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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
commit 746774cd1786b13dc67020efb6496477535dcb26
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Mon Mar 6 15:33:10 2023 -0800

    automation: introduce a dom0less test run on Xilinx hardware
    
    The test prepares dom0 and domU binaries and boot artifacts, similarly
    to the existing QEMU test. (TBD: share preparation steps with the
    regular QEMU tests.)
    
    However, instead of running the test inside QEMU as usual, it copies
    the binaries to the tftp server root, triggers a Xilinx ZCU102 board
    reboot, and connects to the real serial of the board.
    
    Only run the job on protected branches with XILINX_JOBS set to true (the
    "master" and "staging" on gitlab.com/xen-project/xen qualify).
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>

commit 3c55057bab0e992a6fc25cd498d6aca72034a8b5
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Mon Mar 6 15:33:09 2023 -0800

    automation: add Ubuntu container for Xilinx hardware tests
    
    This container is only run on the controller PC (x86) to trigger the
    test on a connected Xilinx ZCU102 physical board.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>

commit dd0f000aafd91ff674a11d6d5623d345fa8f91a6
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Mar 1 10:06:44 2023 +0100

    automation: Add missing and drop obsoleted aliases from containerize
    
    Add missing aliases for:
     - debian:unstable-cppcheck
     - debian:unstable-arm64v8-arm32-gcc
     - ubuntu:bionic
    
    Remove aliases for no longer used containers:
     - centos:7.2
     - debian:unstable-arm32-gcc
    
    Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 002641a8b76dd560f425dca636ae17149cc6b379
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Tue Feb 28 08:08:10 2023 +0000

    xen/arm: check max_init_domid validity
    
    Before trying to create a dom0less guest, check that max_init_domid
    increment will generate a valid domain ID, lower than
    DOMID_FIRST_RESERVED.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

