Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B324F9609
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301518.514578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nco0C-00075R-Fz; Fri, 08 Apr 2022 12:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301518.514578; Fri, 08 Apr 2022 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nco0C-00072Q-Cg; Fri, 08 Apr 2022 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 301518;
 Fri, 08 Apr 2022 12:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nco0B-00072G-3K; Fri, 08 Apr 2022 12:46:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nco0B-00029k-0A; Fri, 08 Apr 2022 12:46:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nco0A-0003cb-H7; Fri, 08 Apr 2022 12:46:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nco0A-00037K-Gh; Fri, 08 Apr 2022 12:46:10 +0000
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
	bh=IlCFUWkqchiDZllcvHP+idJ8UB45i7uMiVMfRa3K5Mk=; b=d1zD2lYKm2PPiDI8Ctxz2crG8c
	eIjSj4n8pIDco2eUBoJOsofBTZ9jQQixd6nS5q/Vmsbk/NLRkqZiN+qG1/tSu7CU0VrSktwcODvXL
	aPcl/SODiONi6Gd18401qm+R7p56JestoMXuSSU+B2pfMevqa+k+kgCKzxSuDiON4Ckw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169231-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169231: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9120b5737f517fe9d2a3936c38d3a2211630323b
X-Osstest-Versions-That:
    xen=d3f61beea4255e2d86ae82303384c57a3262435e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Apr 2022 12:46:10 +0000

flight 169231 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169231/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9120b5737f517fe9d2a3936c38d3a2211630323b
baseline version:
 xen                  d3f61beea4255e2d86ae82303384c57a3262435e

Last test of basis   169222  2022-04-07 17:00:54 Z    0 days
Testing same since   169231  2022-04-08 09:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bjoern Doebel <doebel@amazon.de>
  Roger Pau Monné <roger.pau@citrix.com>

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
   d3f61beea4..9120b5737f  9120b5737f517fe9d2a3936c38d3a2211630323b -> smoke

