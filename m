Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16967DCB8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 04:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485273.752374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLFkB-0002m8-R8; Fri, 27 Jan 2023 03:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485273.752374; Fri, 27 Jan 2023 03:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLFkB-0002kL-OH; Fri, 27 Jan 2023 03:49:39 +0000
Received: by outflank-mailman (input) for mailman id 485273;
 Fri, 27 Jan 2023 03:49:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLFkA-0002k9-Ad; Fri, 27 Jan 2023 03:49:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLFkA-0006zs-4P; Fri, 27 Jan 2023 03:49:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLFk9-0007r2-NF; Fri, 27 Jan 2023 03:49:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLFk9-00021w-Mp; Fri, 27 Jan 2023 03:49:37 +0000
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
	bh=nogSXhR7mPKXML4M+IZXrxXqnvV9OIgL8XeUCA9K+Y8=; b=I8b8N5wPxiyVxM5v4RhFcYPiM8
	+pnHqDKH/K4bSGjCIAZDzGxr2lixhrznXTU6hDLDDXo5gc8FuLfV+yO07TH998axWB5r3Aj7nG/Kf
	+j/GixgBwMRowmZTWlp1X5xO307da+cwU/Mo/r0YPPXJbUxFnO83fREpBgtL9455TjdM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176223-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 176223: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    linux-linus:build-arm64-pvops:<job status>:broken:regression
    linux-linus:build-arm64-xsm:<job status>:broken:regression
    linux-linus:build-arm64-pvops:host-install(4):broken:regression
    linux-linus:build-arm64-xsm:host-install(4):broken:regression
    linux-linus:test-arm64-arm64-xl-credit2:<job status>:broken:regression
    linux-linus:test-arm64-arm64-xl-xsm:<job status>:broken:regression
    linux-linus:test-arm64-arm64-xl-vhd:<job status>:broken:regression
    linux-linus:test-arm64-arm64-xl-seattle:<job status>:broken:regression
    linux-linus:test-arm64-arm64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:host-install(5):broken:heisenbug
    linux-linus:test-arm64-arm64-xl-seattle:host-install(5):broken:heisenbug
    linux-linus:test-arm64-arm64-xl-xsm:host-install(5):broken:heisenbug
    linux-linus:test-arm64-arm64-xl-credit2:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-libvirt:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-examine:host-install:broken:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-cubietruck:capture-logs(22):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-vhd:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-xl-multivcpu:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-libvirt-raw:host-install(5):broken:heisenbug
    linux-linus:test-armhf-armhf-examine:capture-logs:broken:heisenbug
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-libvirt:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-xl:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:capture-logs(9):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:capture-logs(6):broken:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:capture-logs(6):broken:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=7c46948a6e9cf47ed03b0d489fde894ad46f1437
X-Osstest-Versions-That:
    linux=9d84bb40bcb30a7fa16f33baa967aeb9953dda78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Jan 2023 03:49:37 +0000

flight 176223 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176223/

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
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 173462
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 173462
 test-arm64-arm64-xl-credit2     <job status>                 broken  in 176143
 test-arm64-arm64-xl-xsm         <job status>                 broken  in 176143
 test-arm64-arm64-xl-vhd         <job status>                 broken  in 176143
 test-arm64-arm64-xl-seattle     <job status>                 broken  in 176143
 test-arm64-arm64-xl-vhd       8 xen-boot       fail in 176135 REGR. vs. 173462
 test-arm64-arm64-xl-seattle   8 xen-boot       fail in 176135 REGR. vs. 173462
 test-arm64-arm64-xl-xsm       8 xen-boot       fail in 176135 REGR. vs. 173462
 test-arm64-arm64-xl-credit2   8 xen-boot       fail in 176135 REGR. vs. 173462
 test-arm64-arm64-examine      8 reboot         fail in 176143 REGR. vs. 173462
 test-arm64-arm64-xl           8 xen-boot       fail in 176143 REGR. vs. 173462
 test-arm64-arm64-libvirt-xsm  8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-xl-arndale   8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-xl-multivcpu  8 xen-boot      fail in 176143 REGR. vs. 173462
 test-armhf-armhf-xl           8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-xl-vhd       8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-xl-credit1   8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-libvirt-raw  8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-libvirt      8 xen-boot       fail in 176143 REGR. vs. 173462
 test-arm64-arm64-xl-credit1   8 xen-boot       fail in 176143 REGR. vs. 173462
 test-arm64-arm64-libvirt-raw  8 xen-boot       fail in 176143 REGR. vs. 173462
 test-armhf-armhf-examine      8 reboot         fail in 176143 REGR. vs. 173462
 test-armhf-armhf-libvirt-qcow2  8 xen-boot     fail in 176143 REGR. vs. 173462
 test-armhf-armhf-xl-credit2   8 xen-boot       fail in 176143 REGR. vs. 173462

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-vhd      5 host-install(5) broken in 176143 pass in 176135
 test-arm64-arm64-xl-seattle  5 host-install(5) broken in 176143 pass in 176135
 test-arm64-arm64-xl-xsm      5 host-install(5) broken in 176143 pass in 176135
 test-arm64-arm64-xl-credit2  5 host-install(5) broken in 176143 pass in 176135
 test-armhf-armhf-xl-arndale   5 host-install(5)          broken pass in 176143
 test-armhf-armhf-xl-credit1   5 host-install(5)          broken pass in 176143
 test-armhf-armhf-libvirt      5 host-install(5)          broken pass in 176143
 test-armhf-armhf-xl           5 host-install(5)          broken pass in 176143
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)        broken pass in 176143
 test-armhf-armhf-examine      5 host-install             broken pass in 176143
 test-armhf-armhf-xl-credit2   5 host-install(5)          broken pass in 176143
 test-armhf-armhf-xl-cubietruck 22 capture-logs(22)       broken pass in 176143
 test-armhf-armhf-xl-vhd       5 host-install(5)          broken pass in 176143
 test-armhf-armhf-xl-multivcpu  5 host-install(5)         broken pass in 176143
 test-armhf-armhf-libvirt-raw  5 host-install(5)          broken pass in 176143
 test-armhf-armhf-examine      6 capture-logs             broken pass in 176143
 test-amd64-amd64-xl-xsm       8 xen-boot         fail in 176135 pass in 176223

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 173462

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  6 capture-logs(6)     broken blocked in 173462
 test-armhf-armhf-xl-credit1   6 capture-logs(6)       broken blocked in 173462
 test-armhf-armhf-libvirt      6 capture-logs(6)       broken blocked in 173462
 test-armhf-armhf-xl-arndale   6 capture-logs(6)       broken blocked in 173462
 test-armhf-armhf-xl-credit2   6 capture-logs(6)       broken blocked in 173462
 test-armhf-armhf-xl           6 capture-logs(6)       broken blocked in 173462
 test-armhf-armhf-xl-rtds      9 capture-logs(9)       broken blocked in 173462
 test-armhf-armhf-xl-vhd       6 capture-logs(6)       broken blocked in 173462
 test-armhf-armhf-xl-multivcpu  6 capture-logs(6)      broken blocked in 173462
 test-armhf-armhf-libvirt-raw  6 capture-logs(6)       broken blocked in 173462
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 176143 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 176143 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173462
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                7c46948a6e9cf47ed03b0d489fde894ad46f1437
baseline version:
 linux                9d84bb40bcb30a7fa16f33baa967aeb9953dda78

Last test of basis   173462  2022-10-07 18:41:45 Z  111 days
Failing since        173470  2022-10-08 06:21:34 Z  110 days  229 attempts
Testing same since   176135  2023-01-26 00:10:53 Z    1 days    3 attempts

------------------------------------------------------------
3442 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
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
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     broken  
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-step test-armhf-armhf-libvirt-qcow2 capture-logs(6)
broken-step test-armhf-armhf-xl-credit1 capture-logs(6)
broken-step test-armhf-armhf-libvirt capture-logs(6)
broken-step test-armhf-armhf-xl-arndale capture-logs(6)
broken-step test-armhf-armhf-xl-credit2 capture-logs(6)
broken-step build-arm64-pvops host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-xl capture-logs(6)
broken-step test-armhf-armhf-xl-rtds capture-logs(9)
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)
broken-step test-armhf-armhf-examine host-install
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-xl-cubietruck capture-logs(22)
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-examine capture-logs
broken-step test-armhf-armhf-xl-vhd capture-logs(6)
broken-step test-armhf-armhf-xl-multivcpu capture-logs(6)
broken-step test-armhf-armhf-libvirt-raw capture-logs(6)
broken-job test-arm64-arm64-xl-credit2 broken
broken-job test-arm64-arm64-xl-xsm broken
broken-job test-arm64-arm64-xl-vhd broken
broken-job test-arm64-arm64-xl-seattle broken

Not pushing.

(No revision log; it would be 529026 lines long.)

