Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA25802D4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 18:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374719.606877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG14i-00039T-LY; Mon, 25 Jul 2022 16:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374719.606877; Mon, 25 Jul 2022 16:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG14i-00037Y-Ih; Mon, 25 Jul 2022 16:36:56 +0000
Received: by outflank-mailman (input) for mailman id 374719;
 Mon, 25 Jul 2022 16:36:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG14g-00037O-Sj; Mon, 25 Jul 2022 16:36:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG14g-00045k-QN; Mon, 25 Jul 2022 16:36:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG14g-0003MU-AK; Mon, 25 Jul 2022 16:36:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oG14g-0002SA-9v; Mon, 25 Jul 2022 16:36:54 +0000
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
	bh=vYE52YPr88WyEMusMKjj0gUhmIvVWNz61edoYR8QgMw=; b=uIAPKmY+jl6cSnbQeZ7I6zcQmQ
	eApG/rnCwYv0zm4ha81qmlLoF11+VKQ5XOngA6RxnjBJZqXSG1Y8BKZS/8HP0wFUx7rBpB0eFBHrU
	8FudAVz1+0QG0NNKzvc7YE7t0+rqhjDnY7Y+Zl27PRdAzMvuPu9hVaDB0GEJA++1NlnA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171854-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171854: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f1c719d5cd8ab4d5d4c8df139b9df3c2c47221d1
X-Osstest-Versions-That:
    xen=fcd27b3c759995775afb66be6bb7ba1e85da0506
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Jul 2022 16:36:54 +0000

flight 171854 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171854/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f1c719d5cd8ab4d5d4c8df139b9df3c2c47221d1
baseline version:
 xen                  fcd27b3c759995775afb66be6bb7ba1e85da0506

Last test of basis   171747  2022-07-21 20:05:50 Z    3 days
Testing same since   171854  2022-07-25 14:03:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
   fcd27b3c75..f1c719d5cd  f1c719d5cd8ab4d5d4c8df139b9df3c2c47221d1 -> smoke

