Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF864E4C4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463932.722237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5xu8-00083g-6b; Thu, 15 Dec 2022 23:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463932.722237; Thu, 15 Dec 2022 23:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5xu8-00080D-32; Thu, 15 Dec 2022 23:44:44 +0000
Received: by outflank-mailman (input) for mailman id 463932;
 Thu, 15 Dec 2022 23:44:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5xu6-000803-Mk; Thu, 15 Dec 2022 23:44:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5xu6-0001LH-KP; Thu, 15 Dec 2022 23:44:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5xu6-0000ta-AU; Thu, 15 Dec 2022 23:44:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5xu6-00066x-86; Thu, 15 Dec 2022 23:44:42 +0000
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
	bh=BdsooQbYcZ+kx8Gj0FhJsaiWaC9vW4V5UuKvfweoOAA=; b=18GdniqMZcfUrWHlHbHFt8t9LZ
	PRvMb+/DM4/DVhNNmte7u6vdVv9PiiYqpZfWVw01U6rFmCLQh4uROKOsEA2JJYhXGfl+FsfE3uVd0
	u59wz5BfjtThbdHd85q805h9j2kzLlSpGlzdMMjStTWVX8+F/vNsTHssCAIui7fAOFc8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175292-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175292: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c8aaebccc8e8fb5d90080e664202b0011ce4d0bd
X-Osstest-Versions-That:
    xen=630dc3798e1d0d1b95f7be8b176563eb40e866e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 23:44:42 +0000

flight 175292 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175292/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c8aaebccc8e8fb5d90080e664202b0011ce4d0bd
baseline version:
 xen                  630dc3798e1d0d1b95f7be8b176563eb40e866e5

Last test of basis   175173  2022-12-13 15:00:27 Z    2 days
Failing since        175199  2022-12-14 12:01:52 Z    1 days   16 attempts
Testing same since   175292  2022-12-15 20:00:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Viresh Kumar <viresh.kumar@linaro.org>

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
   630dc3798e..c8aaebccc8  c8aaebccc8e8fb5d90080e664202b0011ce4d0bd -> smoke

