Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE556BA571
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 04:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509873.786532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcHOw-0006AN-2n; Wed, 15 Mar 2023 03:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509873.786532; Wed, 15 Mar 2023 03:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcHOv-000680-WA; Wed, 15 Mar 2023 03:02:05 +0000
Received: by outflank-mailman (input) for mailman id 509873;
 Wed, 15 Mar 2023 03:02:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcHOv-00067q-3D; Wed, 15 Mar 2023 03:02:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcHOv-0007KG-1u; Wed, 15 Mar 2023 03:02:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcHOu-0005xT-M6; Wed, 15 Mar 2023 03:02:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pcHOu-0004Nt-Lj; Wed, 15 Mar 2023 03:02:04 +0000
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
	bh=cJKH11dTbOXabk4RCjDhP3ONas4Lk60Id1G3aLyEp+Q=; b=gHiNNccWh8N8+yOvKJKDTOgXlJ
	AMnn3ClYSjffe+uiOHar6LWqS+Uidgw4DC462DOaZhgT2fitNG+XwXYGyUP2wlD/QTacJPPgWRIC5
	iDz2E3SFu0UdUj1OhH3+k6MPw1pij8z2z15W11/g4DgS+1oFF9WAxwaZaM1QL4rc6fBw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179636-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 179636: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=391f1e135fc121ce8cd5d864eb856988e1562e58
X-Osstest-Versions-That:
    xen=de819c96c863467b6e625cd7197d17682f6c6122
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Mar 2023 03:02:04 +0000

flight 179636 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179636/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  391f1e135fc121ce8cd5d864eb856988e1562e58
baseline version:
 xen                  de819c96c863467b6e625cd7197d17682f6c6122

Last test of basis   179624  2023-03-14 10:12:13 Z    0 days
Testing same since   179636  2023-03-15 01:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Cherechesu <andrei.cherechesu@nxp.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   de819c96c8..391f1e135f  391f1e135fc121ce8cd5d864eb856988e1562e58 -> smoke

