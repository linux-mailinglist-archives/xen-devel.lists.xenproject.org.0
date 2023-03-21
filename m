Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6F06C2856
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 03:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512172.791936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peS6D-0003uu-4k; Tue, 21 Mar 2023 02:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512172.791936; Tue, 21 Mar 2023 02:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peS6C-0003tD-Uj; Tue, 21 Mar 2023 02:51:44 +0000
Received: by outflank-mailman (input) for mailman id 512172;
 Tue, 21 Mar 2023 02:51:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peS6C-0003t1-2u; Tue, 21 Mar 2023 02:51:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peS6C-0005m5-1J; Tue, 21 Mar 2023 02:51:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peS6B-00067v-KA; Tue, 21 Mar 2023 02:51:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1peS6B-0007w9-Jb; Tue, 21 Mar 2023 02:51:43 +0000
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
	bh=Ur2zp8M84pDUBMhupBRPg6ZVU7DJBJrTu89tWHlth30=; b=WJi7xQmtOyHyJme7wpEdLVQMkX
	NYHmLwRmXYKe3vPJcLENm8QJNs0TxhhuddGo4e543k1WEuZ05L1Rh1YdDdA1X3VRNsz3HyYJ81PwI
	qB3es7FNUg+pw8CB1GluevgyIdVKU5StIF5ySSkRj+pKHMa90FTWlGowlInFkneJzk+Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179826-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 179826: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=0bbf102d8794fb961cb103ada00999768547916e
X-Osstest-Versions-That:
    xen=c2581c58bec96afa450ebaca3fa2a33bcb0a9974
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Mar 2023 02:51:43 +0000

flight 179826 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179826/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  0bbf102d8794fb961cb103ada00999768547916e
baseline version:
 xen                  c2581c58bec96afa450ebaca3fa2a33bcb0a9974

Last test of basis   179814  2023-03-20 17:00:25 Z    0 days
Testing same since   179826  2023-03-21 01:05:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiamei Xie <jiamei.xie@arm.com>

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
   c2581c58be..0bbf102d87  0bbf102d8794fb961cb103ada00999768547916e -> smoke

