Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F4967393
	for <lists+xen-devel@lfdr.de>; Sun,  1 Sep 2024 00:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787294.1196840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skWdf-0001Gs-Cq; Sat, 31 Aug 2024 22:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787294.1196840; Sat, 31 Aug 2024 22:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skWdf-0001EH-9X; Sat, 31 Aug 2024 22:32:11 +0000
Received: by outflank-mailman (input) for mailman id 787294;
 Sat, 31 Aug 2024 22:32:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skWde-0001E7-7B; Sat, 31 Aug 2024 22:32:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skWde-000405-1R; Sat, 31 Aug 2024 22:32:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skWdd-00017V-JF; Sat, 31 Aug 2024 22:32:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skWdd-00086F-Iq; Sat, 31 Aug 2024 22:32:09 +0000
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
	bh=xE0T6nwZCcAyKbd4jK8aGjitJRxom+9f0/YTjJG+kMk=; b=S/7SIAt/CBvkcXjtaVGVKKHgfT
	iolH5t6OcjidZjLtluop3ddRLv3/iuc/B3+oeHpTVaaIeQvC7nlUZVnh6b7WxY/XiOpiA59rsCQUK
	o3n9pKau9JgWVIvBE4VeYzsdBmhKp+Y34gZpRts8HlN4FKp3DQbLy5DTdrlyhA4dla7U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187440-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187440: trouble: blocked/broken
X-Osstest-Failures:
    ovmf:build-amd64:<job status>:broken:regression
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-amd64-xsm:<job status>:broken:regression
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-amd64:host-install(4):broken:regression
    ovmf:build-amd64-pvops:host-install(4):broken:regression
    ovmf:build-amd64-xsm:host-install(4):broken:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=f7abf6af2db7a823aa139fbbf8a82d209aca4998
X-Osstest-Versions-That:
    ovmf=96b90e150c2f107c64a827e82451b642a42df686
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 22:32:09 +0000

flight 187440 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187440/

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
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 187436
 build-i386                    4 host-install(4)        broken REGR. vs. 187436
 build-amd64                   4 host-install(4)        broken REGR. vs. 187436
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 187436
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 187436

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a

version targeted for testing:
 ovmf                 f7abf6af2db7a823aa139fbbf8a82d209aca4998
baseline version:
 ovmf                 96b90e150c2f107c64a827e82451b642a42df686

Last test of basis   187436  2024-08-31 10:45:13 Z    0 days
Testing same since   187440  2024-08-31 17:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
broken-step build-i386-pvops host-install(4)
broken-step build-i386 host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit f7abf6af2db7a823aa139fbbf8a82d209aca4998
Author: zodf0055980 <zodf0055980@gmail.com>
Date:   Wed Aug 21 15:18:08 2024 +0800

    SecurityPkg: Fix exponent unmarshaled as 16 bits
    
    According issue #5536, exponent is 32 bits but is unmarshaled as 16 bits.
    
    Signed-off-by: zodf0055980 <zodf0055980@gmail.com>

