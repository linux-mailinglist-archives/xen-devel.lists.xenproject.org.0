Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC90444AA2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 23:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221158.382725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miOQ8-0002nU-Dw; Wed, 03 Nov 2021 22:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221158.382725; Wed, 03 Nov 2021 22:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miOQ8-0002kk-90; Wed, 03 Nov 2021 22:07:48 +0000
Received: by outflank-mailman (input) for mailman id 221158;
 Wed, 03 Nov 2021 22:07:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miOQ6-0002ka-7U; Wed, 03 Nov 2021 22:07:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miOQ5-0002Mc-Vk; Wed, 03 Nov 2021 22:07:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miOQ5-0006aE-Mk; Wed, 03 Nov 2021 22:07:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1miOQ5-0003wd-MH; Wed, 03 Nov 2021 22:07:45 +0000
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
	bh=yhGrXlnM81otp95+Okg9PHD1QhIEBMOMMIk4E3QvUyI=; b=t13allKsbSjhZJAvPx7VwV4bsP
	P6umjblNL/CxP2rf+X7wvlQlM8HU46OtJyFh2uK+84DTPRORiL1wiAafVA7Q0f7TLsVzBQYNS7Rdj
	4Etm1YK4PXLTekpnFpJsEwfkBQpI9fkA0ukA1xvtGw0n7neMSP99i858ffykppe3IHTg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166034-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 166034: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3231ddf9dc384a386df43fd1c0a0bcbba9d79569
X-Osstest-Versions-That:
    xen=b2851580b1f2ff121737a37cb25a370d7692ae3b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Nov 2021 22:07:45 +0000

flight 166034 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166034/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3231ddf9dc384a386df43fd1c0a0bcbba9d79569
baseline version:
 xen                  b2851580b1f2ff121737a37cb25a370d7692ae3b

Last test of basis   166030  2021-11-03 14:02:16 Z    0 days
Testing same since   166034  2021-11-03 19:01:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   b2851580b1..3231ddf9dc  3231ddf9dc384a386df43fd1c0a0bcbba9d79569 -> smoke

