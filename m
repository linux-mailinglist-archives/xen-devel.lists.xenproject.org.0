Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875356EA19F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 04:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524415.815326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppgU5-0007gO-Mf; Fri, 21 Apr 2023 02:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524415.815326; Fri, 21 Apr 2023 02:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppgU5-0007d8-Jl; Fri, 21 Apr 2023 02:26:49 +0000
Received: by outflank-mailman (input) for mailman id 524415;
 Fri, 21 Apr 2023 02:26:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppgU3-0007cy-Qe; Fri, 21 Apr 2023 02:26:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppgU3-0007RT-Im; Fri, 21 Apr 2023 02:26:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppgU2-0006Cr-Ts; Fri, 21 Apr 2023 02:26:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppgU2-00089M-TN; Fri, 21 Apr 2023 02:26:46 +0000
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
	bh=PuXktgMOi9IKEALP6OzV/O+QQZr5Nw6cdq7QQmjUThY=; b=apEcVJdk0UQbLQSGmN7OD5y3B0
	xxpH0Mg0KNM+et1h1gEcQiumb8lVU0JTry/lrlfhgSXZiHdTR8U1CovAqdmG6yyqkGKTkX5LKWrK1
	jc2EcVSDGhe1tyum/XduGFwGpTIgbaqPbkCGVXoc5NZdmy2AxU/ElefjW7WxBKla3fzc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180345-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180345: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=dff17457c482dcb38b7caafd095334f461ef6d35
X-Osstest-Versions-That:
    xen=8676092a0f16ca6ad188d3fb270784a2caecf542
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Apr 2023 02:26:46 +0000

flight 180345 xen-unstable-smoke real [real]
flight 180348 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180345/
http://logs.test-lab.xenproject.org/osstest/logs/180348/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 180302

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  dff17457c482dcb38b7caafd095334f461ef6d35
baseline version:
 xen                  8676092a0f16ca6ad188d3fb270784a2caecf542

Last test of basis   180302  2023-04-18 20:01:55 Z    2 days
Failing since        180314  2023-04-19 10:00:24 Z    1 days   13 attempts
Testing same since   180323  2023-04-19 21:01:54 Z    1 days    9 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Kanavin <alex@linutronix.de>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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


Not pushing.

(No revision log; it would be 317 lines long.)

