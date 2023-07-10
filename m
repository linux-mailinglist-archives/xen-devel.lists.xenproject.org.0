Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A374DE70
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 21:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561384.877802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIwnv-0007Z9-Qx; Mon, 10 Jul 2023 19:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561384.877802; Mon, 10 Jul 2023 19:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIwnv-0007XU-Ny; Mon, 10 Jul 2023 19:44:15 +0000
Received: by outflank-mailman (input) for mailman id 561384;
 Mon, 10 Jul 2023 19:44:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qIwnu-0007XK-If; Mon, 10 Jul 2023 19:44:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qIwnu-0008Rb-GS; Mon, 10 Jul 2023 19:44:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qIwnu-0000hc-5T; Mon, 10 Jul 2023 19:44:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qIwnu-0001RV-4y; Mon, 10 Jul 2023 19:44:14 +0000
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
	bh=RUqdpo0yLl+mn31TSZSWYkJHq9BMXoi/CACWOGGgLYs=; b=EDBvMdKsvUaV4lfNR1GFS3Ol6M
	lrWeoCL/Wwgzs0OB3Kj1ddrF1HVmUSmvVJdO8GgQk0KIk10GM3fshbG/wHBqEPqotdYgZGFwRKjsC
	0Owqi2fcmcsbUDpp2xsJxaLnl9So0/ZRbWEq2sCiVVVac2PvRP6jktEHhCnswbwMbq8E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181754-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181754: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b831326ee2f9ed94523b3d8b0fb2da2a82113e9e
X-Osstest-Versions-That:
    xen=fd62986f6b776876f3028a755c859d02e55dc262
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Jul 2023 19:44:14 +0000

flight 181754 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181754/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b831326ee2f9ed94523b3d8b0fb2da2a82113e9e
baseline version:
 xen                  fd62986f6b776876f3028a755c859d02e55dc262

Last test of basis   181750  2023-07-10 11:03:28 Z    0 days
Testing same since   181754  2023-07-10 17:02:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   fd62986f6b..b831326ee2  b831326ee2f9ed94523b3d8b0fb2da2a82113e9e -> smoke

