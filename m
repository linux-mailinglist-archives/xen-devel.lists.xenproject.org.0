Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69379E171
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601037.936937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKsa-0000vJ-Jk; Wed, 13 Sep 2023 08:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601037.936937; Wed, 13 Sep 2023 08:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKsa-0000tQ-G0; Wed, 13 Sep 2023 08:05:44 +0000
Received: by outflank-mailman (input) for mailman id 601037;
 Wed, 13 Sep 2023 08:05:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgKsY-0000tG-Ts; Wed, 13 Sep 2023 08:05:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgKsY-0007fj-TA; Wed, 13 Sep 2023 08:05:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgKsY-0001LU-LZ; Wed, 13 Sep 2023 08:05:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qgKsY-0005CR-Ky; Wed, 13 Sep 2023 08:05:42 +0000
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
	bh=4qht9CNB1UKD8HohsOLls+aSxZ+FMQvWVmuC8gy4TRE=; b=SJgFXC0llO3ghZaHZcgenYEVHG
	z3Xij7UC7WDNciqw2qjZWGFsnhdZ6iCuhULc46oCVtmMKFve2L4/vr4kn85Bf7jpe5+IPTEtlu3nr
	tui8Nf9K3NT8BzpaxRKn1NovklsYwoKfnuza/nKEgTxllwPAtVvjZDPgzyrwjYuefAKc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182990-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182990: trouble: blocked/broken/pass
X-Osstest-Failures:
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=4a1afea6f7361fd65e9d4ba34eaac48ec8bb2867
X-Osstest-Versions-That:
    ovmf=b844b106e2a20c709ece1b2b89b2ae0e84a0e401
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Sep 2023 08:05:42 +0000

flight 182990 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182990/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 182988
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 182988
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 182988

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 4a1afea6f7361fd65e9d4ba34eaac48ec8bb2867
baseline version:
 ovmf                 b844b106e2a20c709ece1b2b89b2ae0e84a0e401

Last test of basis   182988  2023-09-13 02:42:26 Z    0 days
Testing same since   182990  2023-09-13 06:12:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               broken  
 build-amd64                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)

Not pushing.

------------------------------------------------------------
commit 4a1afea6f7361fd65e9d4ba34eaac48ec8bb2867
Author: Nickle Wang <nicklew@nvidia.com>
Date:   Fri Jul 21 21:39:10 2023 +0800

    RedfishPkg/RedfishPlatformConfigDxe: fix can not set one-of option issue.
    
    StatementValue->Buffer is converted from ASCII to Unicode by caller
    already so we don't have to convert it again.
    
    Signed-off-by: Nickle Wang <nicklew@nvidia.com>
    Cc: Abner Chang <abner.chang@amd.com>
    Cc: Igor Kulchytskyy <igork@ami.com>
    Cc: Nick Ramirez <nramirez@nvidia.com>
    Reviewed-by: Igor Kulchytskyy <igork@ami.com>

