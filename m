Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BA81A072
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657855.1026995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFx5b-0002Zh-Q1; Wed, 20 Dec 2023 13:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657855.1026995; Wed, 20 Dec 2023 13:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFx5b-0002XY-MC; Wed, 20 Dec 2023 13:58:23 +0000
Received: by outflank-mailman (input) for mailman id 657855;
 Wed, 20 Dec 2023 13:58:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFx5Z-0002XO-Et; Wed, 20 Dec 2023 13:58:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFx5Z-0006D3-5v; Wed, 20 Dec 2023 13:58:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFx5Y-0005No-Pc; Wed, 20 Dec 2023 13:58:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFx5Y-0000vj-Nr; Wed, 20 Dec 2023 13:58:20 +0000
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
	bh=oC6aZd5ISDSQrRTZF3eGpqhF4mVJVTh9Z7QNLyZXN8k=; b=e17pLVCp6GVsULZhInkFf5Iniv
	D+j0uClFa1f1NR47kx4xjtyZ0NZu9fVw8MRMgLEqI4ANQjLAWgBJ8iaQf7weX54Pn8mn999/ihray
	HZEBOTSRPZx/9t+N5Hr7YPi8lqVxUOEieBDyU38u5UIegYLpIx2ONl2OgZa1O887rGHY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184190-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184190: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=913a1774168f82565bbdc7d41a46013a40ba302d
X-Osstest-Versions-That:
    xen=725acf8e4d406bf0a24441ac1738eb6f4f6ef0c3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Dec 2023 13:58:20 +0000

flight 184190 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184190/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  913a1774168f82565bbdc7d41a46013a40ba302d
baseline version:
 xen                  725acf8e4d406bf0a24441ac1738eb6f4f6ef0c3

Last test of basis   184184  2023-12-20 02:00:26 Z    0 days
Testing same since   184190  2023-12-20 11:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
  Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
  Simone Ballarin  <simone.ballarin@bugseng.com>

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
   725acf8e4d..913a177416  913a1774168f82565bbdc7d41a46013a40ba302d -> smoke

