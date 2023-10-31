Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DA7DD6F4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 21:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626003.975868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxv86-0000Se-Ip; Tue, 31 Oct 2023 20:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626003.975868; Tue, 31 Oct 2023 20:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxv86-0000PH-FH; Tue, 31 Oct 2023 20:14:26 +0000
Received: by outflank-mailman (input) for mailman id 626003;
 Tue, 31 Oct 2023 20:14:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxv84-0000KS-4H; Tue, 31 Oct 2023 20:14:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxv83-0005wc-Vo; Tue, 31 Oct 2023 20:14:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxv83-0001fy-MO; Tue, 31 Oct 2023 20:14:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qxv83-0006JG-Lz; Tue, 31 Oct 2023 20:14:23 +0000
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
	bh=d8ZacTNYmJPTAYB5uIC0WLZbYLWbr4WDSO7whV7ihs8=; b=xOV+iS4VOIlMWlszNwQECQNrRB
	pamC90Jsoo0pKXeQ24DMDuoXvfiUNXWhkFbG1/+DZV3MI6aUybJJe5ef+KtGWdNh3GjNFl+FJmeKX
	+duamY5qcK6JOUofe6VvU/4SMjpyl4N6DWr6Uam0Q4KEoNXCjt35uPk5vcx0EcHvK1Lg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183642-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183642: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7befef87cc9b1bb8ca15d866ce1ecd9165ccb58c
X-Osstest-Versions-That:
    xen=9659b2a6d73b14620e187f9c626a09323853c459
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Oct 2023 20:14:23 +0000

flight 183642 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183642/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7befef87cc9b1bb8ca15d866ce1ecd9165ccb58c
baseline version:
 xen                  9659b2a6d73b14620e187f9c626a09323853c459

Last test of basis   183618  2023-10-30 10:00:39 Z    1 days
Testing same since   183642  2023-10-31 17:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Federico Serafini <federico.serafini@bugseng.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   9659b2a6d7..7befef87cc  7befef87cc9b1bb8ca15d866ce1ecd9165ccb58c -> smoke

