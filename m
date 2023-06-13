Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774572D6A7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 02:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547705.855279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8sKQ-00044V-K1; Tue, 13 Jun 2023 00:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547705.855279; Tue, 13 Jun 2023 00:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8sKQ-000419-Fm; Tue, 13 Jun 2023 00:56:10 +0000
Received: by outflank-mailman (input) for mailman id 547705;
 Tue, 13 Jun 2023 00:56:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q8sKP-00040z-70; Tue, 13 Jun 2023 00:56:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q8sKP-0000LA-3d; Tue, 13 Jun 2023 00:56:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q8sKO-0003R7-JP; Tue, 13 Jun 2023 00:56:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q8sKO-0005c1-Iv; Tue, 13 Jun 2023 00:56:08 +0000
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
	bh=HTouw4tZQ61HlMAseJuck9VY1odl70327wi0pG/aXXQ=; b=qMmj1rzXWzgAMLSCMh+0F0dWFy
	fqxdx3MLXOMYSOONaIlh2+wMXuUNDMoXhlA8WrvLPQWvB+OmmZv2bI6t6Gs03WmvfhyOWVLqnBs3D
	cF3sVDPFgECZuxutzGOD4Nv9QGf2D2KP1pYzRnDVjKTz3E7kFiv5YtIlm5YO/aCThF8I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181392-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 181392: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-multivcpu:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-vhd:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-examine:host-install:broken:heisenbug
    linux-linus:test-armhf-armhf-xl:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-libvirt:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:heisenbug
    linux-linus:test-amd64-amd64-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=858fd168a95c5b9669aac8db6c14a9aeab446375
X-Osstest-Versions-That:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Jun 2023 00:56:08 +0000

flight 181392 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181392/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt-qcow2    <job status>                 broken
 test-armhf-armhf-libvirt-raw    <job status>                 broken
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 test-armhf-armhf-xl-credit1   8 xen-boot       fail in 181383 REGR. vs. 180278
 build-arm64-pvops             6 kernel-build   fail in 181383 REGR. vs. 180278

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-raw  5 host-install(5)          broken pass in 181383
 test-armhf-armhf-xl-multivcpu  5 host-install(5)         broken pass in 181383
 test-armhf-armhf-xl-vhd       5 host-install(5)          broken pass in 181383
 test-armhf-armhf-xl-credit1   5 host-install(5)          broken pass in 181383
 test-armhf-armhf-examine      5 host-install             broken pass in 181387
 test-armhf-armhf-xl           5 host-install(5)          broken pass in 181387
 test-armhf-armhf-xl-rtds      5 host-install(5)          broken pass in 181387
 test-armhf-armhf-xl-arndale   5 host-install(5)          broken pass in 181387
 test-armhf-armhf-xl-credit2   5 host-install(5)          broken pass in 181387
 test-armhf-armhf-libvirt      5 host-install(5)          broken pass in 181387
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)        broken pass in 181387
 test-amd64-amd64-xl-vhd 21 guest-start/debian.repeat fail in 181383 pass in 181392

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 181383 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 181383 n/a
 test-armhf-armhf-xl-multivcpu  8 xen-boot           fail in 181383 like 180278
 test-armhf-armhf-xl-vhd       8 xen-boot            fail in 181383 like 180278
 test-armhf-armhf-libvirt-raw  8 xen-boot            fail in 181383 like 180278
 test-armhf-armhf-xl-credit2   8 xen-boot            fail in 181387 like 180278
 test-armhf-armhf-examine      8 reboot              fail in 181387 like 180278
 test-armhf-armhf-libvirt      8 xen-boot            fail in 181387 like 180278
 test-armhf-armhf-xl-arndale   8 xen-boot            fail in 181387 like 180278
 test-armhf-armhf-libvirt-qcow2  8 xen-boot          fail in 181387 like 180278
 test-armhf-armhf-xl           8 xen-boot            fail in 181387 like 180278
 test-armhf-armhf-xl-rtds      8 xen-boot            fail in 181387 like 180278
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180278
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                858fd168a95c5b9669aac8db6c14a9aeab446375
baseline version:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d

Last test of basis   180278  2023-04-16 19:41:46 Z   57 days
Failing since        180281  2023-04-17 06:24:36 Z   56 days  107 attempts
Testing same since   181383  2023-06-11 22:12:05 Z    1 days    3 attempts

------------------------------------------------------------
2681 people touched revisions under test,
not listing them all

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
 test-armhf-armhf-xl                                          broken  
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
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               broken  
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      broken  


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

broken-job test-armhf-armhf-libvirt broken
broken-job test-armhf-armhf-libvirt-qcow2 broken
broken-job test-armhf-armhf-libvirt-raw broken
broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl-vhd broken
broken-step test-armhf-armhf-examine host-install
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-armhf-armhf-libvirt-raw broken
broken-job test-armhf-armhf-xl-multivcpu broken

Not pushing.

(No revision log; it would be 340189 lines long.)

