Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE267F4A3
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 05:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486070.753555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLcok-0000B1-Hv; Sat, 28 Jan 2023 04:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486070.753555; Sat, 28 Jan 2023 04:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLcok-00008Q-D1; Sat, 28 Jan 2023 04:27:54 +0000
Received: by outflank-mailman (input) for mailman id 486070;
 Sat, 28 Jan 2023 04:27:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLcoi-00008F-H7; Sat, 28 Jan 2023 04:27:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLcoi-0002lo-Cx; Sat, 28 Jan 2023 04:27:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLcoi-00042e-2T; Sat, 28 Jan 2023 04:27:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLcoi-0003Xq-0m; Sat, 28 Jan 2023 04:27:52 +0000
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
	bh=fqTQ2XORURePxxwvocROiHV5LmJkISZ1XyYwr9eflnI=; b=qlr0fwVnYY/pNTy2KaNVUxseAs
	uLbCrKzchS8CuDxNJPOuUcoMvdgoW+TOoeLlmgF3cFXrmR2uq6HTryQkBnR0JI0TtZRk68Drc1JFy
	vVbTDfOQHPHMT+Agcy2jzNW0E664oq3SfjVIB5ZoTIyNfPY6vutvqG4bbd7aP9hJvUeY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176252-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 176252: trouble: broken/fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-armhf-armhf-libvirt:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-arndale:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-libvirt-raw:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl-cubietruck:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl-credit1:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl-credit2:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-examine:host-install:broken:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-examine:capture-logs:broken:regression
    xen-unstable:test-armhf-armhf-libvirt:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl-vhd:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl-rtds:host-install(5):broken:allowable
    xen-unstable:test-armhf-armhf-libvirt-raw:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:capture-logs(6):broken:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=10b80ee5588e8928b266dea02a5e99d098bd227a
X-Osstest-Versions-That:
    xen=f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Jan 2023 04:27:52 +0000

flight 176252 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176252/

Failures and problems with tests :-(

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
 test-armhf-armhf-xl-arndale   5 host-install(5)        broken REGR. vs. 175994
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 175994
 test-armhf-armhf-libvirt-raw  5 host-install(5)        broken REGR. vs. 175994
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 175994
 test-armhf-armhf-xl-cubietruck  5 host-install(5)      broken REGR. vs. 175994
 test-armhf-armhf-xl-credit1   5 host-install(5)        broken REGR. vs. 175994
 test-armhf-armhf-xl-credit2   5 host-install(5)        broken REGR. vs. 175994
 test-armhf-armhf-examine      5 host-install           broken REGR. vs. 175994
 test-armhf-armhf-xl-multivcpu  5 host-install(5)       broken REGR. vs. 175994
 test-armhf-armhf-examine      6 capture-logs           broken REGR. vs. 175994
 test-armhf-armhf-libvirt      5 host-install(5)        broken REGR. vs. 175994
 test-armhf-armhf-xl-vhd       5 host-install(5)        broken REGR. vs. 175994

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      5 host-install(5)        broken REGR. vs. 175994

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw  6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-xl-credit2   6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-libvirt-qcow2  6 capture-logs(6)     broken blocked in 175994
 test-armhf-armhf-xl           6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-xl-multivcpu  6 capture-logs(6)      broken blocked in 175994
 test-armhf-armhf-xl-cubietruck  6 capture-logs(6)     broken blocked in 175994
 test-armhf-armhf-xl-rtds      6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-xl-arndale   6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-xl-vhd       6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-xl-credit1   6 capture-logs(6)       broken blocked in 175994
 test-armhf-armhf-libvirt      6 capture-logs(6)       broken blocked in 175994
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175987
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175987
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175994
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175994
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175994
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175994
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175994
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175994
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175994
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle   3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  10b80ee5588e8928b266dea02a5e99d098bd227a
baseline version:
 xen                  f588e7b7cb70800533aaa8a2a9d7a4b32d10b363

Last test of basis   175994  2023-01-20 08:38:32 Z    7 days
Failing since        176003  2023-01-20 17:40:27 Z    7 days   16 attempts
Testing same since   176222  2023-01-26 22:13:29 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Bobby Eshleman <bobby.eshleman@gmail.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
 test-armhf-armhf-xl                                          broken  
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
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               broken  
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     broken  
 test-arm64-arm64-xl-seattle                                  starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      broken  
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
broken-step test-armhf-armhf-libvirt-raw capture-logs(6)
broken-step test-armhf-armhf-xl-credit2 capture-logs(6)
broken-step test-armhf-armhf-libvirt-qcow2 capture-logs(6)
broken-step test-armhf-armhf-xl capture-logs(6)
broken-step test-armhf-armhf-xl-multivcpu capture-logs(6)
broken-step test-armhf-armhf-xl-cubietruck capture-logs(6)
broken-step test-armhf-armhf-xl-rtds capture-logs(6)
broken-step test-armhf-armhf-xl-arndale capture-logs(6)
broken-step test-armhf-armhf-xl-vhd capture-logs(6)
broken-step test-armhf-armhf-xl-credit1 capture-logs(6)
broken-step test-armhf-armhf-libvirt capture-logs(6)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)
broken-step test-armhf-armhf-xl-cubietruck host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-examine host-install
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-examine capture-logs
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)

Not pushing.

(No revision log; it would be 1225 lines long.)

