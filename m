Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9E7F2124
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 00:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637371.993115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5DHR-0003nG-UQ; Mon, 20 Nov 2023 23:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637371.993115; Mon, 20 Nov 2023 23:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5DHR-0003lb-RQ; Mon, 20 Nov 2023 23:02:13 +0000
Received: by outflank-mailman (input) for mailman id 637371;
 Mon, 20 Nov 2023 23:02:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5DHR-0003lR-8X; Mon, 20 Nov 2023 23:02:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5DHR-0001bQ-6c; Mon, 20 Nov 2023 23:02:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5DHQ-0005TV-Qz; Mon, 20 Nov 2023 23:02:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r5DHQ-0001Yx-Qa; Mon, 20 Nov 2023 23:02:12 +0000
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
	bh=bWvICCcaEBbba4j/mFSuCHaIiOMfalwlyzvTWuDN2r0=; b=j85y8nDdGbZIAuY+zwqiKRVoGx
	Ygt1W70hkxD1IfhMYet/JSYvwGSNaGHVs0FO1sH6qeQ7J0N23z4/ANxuKwZHcORZ9l23wNOqK9k30
	q1kaxDzJqSVwlryOLZGduY/HtTSWXBJOJ5Ifj4AleAo+l23gEUIYCej/9Gk/bcWe0RIw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183802-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183802: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=fa2da5bce90b3777aa7a323e1cf201c97b56d278
X-Osstest-Versions-That:
    xen=cfb777791d39e025cf625ba1fa080597d4defef6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Nov 2023 23:02:12 +0000

flight 183802 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183802/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  fa2da5bce90b3777aa7a323e1cf201c97b56d278
baseline version:
 xen                  cfb777791d39e025cf625ba1fa080597d4defef6

Last test of basis   183798  2023-11-20 10:00:29 Z    0 days
Testing same since   183802  2023-11-20 20:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Henry Wang <Henry.Wang@arm.com>
  Julien Grall <jgrall@amazon.com>
  Penny Zheng <penny.zheng@arm.com>
  Wei Chen <wei.chen@arm.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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
   cfb777791d..fa2da5bce9  fa2da5bce90b3777aa7a323e1cf201c97b56d278 -> smoke

