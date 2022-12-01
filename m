Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4463F89C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 20:54:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451151.708772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0pcE-0008Si-6Z; Thu, 01 Dec 2022 19:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451151.708772; Thu, 01 Dec 2022 19:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0pcE-0008QU-3X; Thu, 01 Dec 2022 19:53:02 +0000
Received: by outflank-mailman (input) for mailman id 451151;
 Thu, 01 Dec 2022 19:53:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0pcC-0008QJ-2E; Thu, 01 Dec 2022 19:53:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0pcC-000297-0K; Thu, 01 Dec 2022 19:53:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0pcB-0007Ky-Gn; Thu, 01 Dec 2022 19:52:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p0pcB-00012K-GM; Thu, 01 Dec 2022 19:52:59 +0000
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
	bh=DstJOV7rkthPL5zlfOhe88NYuaOYVxlfcqBbOdXUhN0=; b=uPB+XsAam5SSVdDZliS/5grw1s
	kKCeX7wjDqlt5PoRVRbRGSCVOat+qqygiBcqKtdtbqyikLz6u6eUm+to/LlHS+CqEoIijTLR4F7XM
	7jjEDjC/BI12FFZf3YGXmm/O77/sPFWoMniFuIG9WAMx/Mqkbm1iXursjLUXHdFdGQhA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175010-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175010: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=25b55688e1f20ebb1bb15d0e82079e91cd787e5b
X-Osstest-Versions-That:
    xen=ddcc208ccdd44c688b3265be26237875c16b6258
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Dec 2022 19:52:59 +0000

flight 175010 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175010/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  25b55688e1f20ebb1bb15d0e82079e91cd787e5b
baseline version:
 xen                  ddcc208ccdd44c688b3265be26237875c16b6258

Last test of basis   175006  2022-12-01 11:02:36 Z    0 days
Testing same since   175010  2022-12-01 16:00:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Julien Grall <jgrall@amazon.com>

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
   ddcc208ccd..25b55688e1  25b55688e1f20ebb1bb15d0e82079e91cd787e5b -> smoke

