Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1229675E8
	for <lists+xen-devel@lfdr.de>; Sun,  1 Sep 2024 12:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787364.1196879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skhwZ-0007D5-4k; Sun, 01 Sep 2024 10:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787364.1196879; Sun, 01 Sep 2024 10:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skhwZ-0007Ae-22; Sun, 01 Sep 2024 10:36:27 +0000
Received: by outflank-mailman (input) for mailman id 787364;
 Sun, 01 Sep 2024 10:36:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skhwY-0007AU-2m; Sun, 01 Sep 2024 10:36:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skhwX-00055q-V0; Sun, 01 Sep 2024 10:36:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skhwX-0008TF-EJ; Sun, 01 Sep 2024 10:36:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skhwX-0001VC-DN; Sun, 01 Sep 2024 10:36:25 +0000
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
	bh=VsYCyAd1tbhe7+iORexZ6An8dI3Vq4VQzuAYUU+oUhg=; b=GGIL3f8QS8VwGIMTjGtvJMiGmp
	iMpmSUhOrwADOqooRb8hfWCcFO34b1IIy0ILWejlQ3zhyXUdh57nepYeYa7Go/8qZqbKlah5TAEvC
	tYuHHv+Y3J/qQsnZaXkUtBcqqPC/QtHxB2brLMxmGNjUU7jcsYolZEhgMO8tReKnNpbE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187443-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187443: trouble: blocked/broken
X-Osstest-Failures:
    ovmf:build-amd64:<job status>:broken:regression
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-amd64-xsm:<job status>:broken:regression
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-amd64:host-install(4):broken:regression
    ovmf:build-amd64-pvops:host-install(4):broken:regression
    ovmf:build-amd64-xsm:host-install(4):broken:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=4ef87f455b57e4529db1420fbfba22c9c16f1444
X-Osstest-Versions-That:
    ovmf=96b90e150c2f107c64a827e82451b642a42df686
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 01 Sep 2024 10:36:25 +0000

flight 187443 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187443/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 187436
 build-i386                    4 host-install(4)        broken REGR. vs. 187436
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 187436
 build-amd64                   4 host-install(4)        broken REGR. vs. 187436
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 187436
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 187436

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a

version targeted for testing:
 ovmf                 4ef87f455b57e4529db1420fbfba22c9c16f1444
baseline version:
 ovmf                 96b90e150c2f107c64a827e82451b642a42df686

Last test of basis   187436  2024-08-31 10:45:13 Z    0 days
Failing since        187440  2024-08-31 17:11:30 Z    0 days    2 attempts
Testing same since   187443  2024-08-31 22:41:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Saloni Kasbekar <saloni.kasbekar@intel.com>
  zodf0055980 <zodf0055980@gmail.com>

jobs:
 build-amd64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 


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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit 4ef87f455b57e4529db1420fbfba22c9c16f1444
Author: Saloni Kasbekar <saloni.kasbekar@intel.com>
Date:   Thu Aug 29 20:59:22 2024 -0700

    MdePkg: Add Reset Reason definitions
    
    Add Reset Reason definitions defined in ACPI 6.5
    
    Signed-off-by: Saloni Kasbekar <saloni.kasbekar@intel.com>

commit f7abf6af2db7a823aa139fbbf8a82d209aca4998
Author: zodf0055980 <zodf0055980@gmail.com>
Date:   Wed Aug 21 15:18:08 2024 +0800

    SecurityPkg: Fix exponent unmarshaled as 16 bits
    
    According issue #5536, exponent is 32 bits but is unmarshaled as 16 bits.
    
    Signed-off-by: zodf0055980 <zodf0055980@gmail.com>

