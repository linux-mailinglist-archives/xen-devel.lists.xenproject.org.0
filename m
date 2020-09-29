Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91227D5AC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 20:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352.1052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNKE2-0001eI-Ts; Tue, 29 Sep 2020 18:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352.1052; Tue, 29 Sep 2020 18:19:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNKE2-0001dt-Qp; Tue, 29 Sep 2020 18:19:42 +0000
Received: by outflank-mailman (input) for mailman id 352;
 Tue, 29 Sep 2020 18:19:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KBKl=DG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNKE1-0001dn-KC
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:19:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 200a2158-52f0-43f5-b977-2c829c9153ef;
 Tue, 29 Sep 2020 18:19:40 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNKE0-0001ED-6M; Tue, 29 Sep 2020 18:19:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNKDz-0007MA-VR; Tue, 29 Sep 2020 18:19:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNKDz-0003JX-Ux; Tue, 29 Sep 2020 18:19:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KBKl=DG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNKE1-0001dn-KC
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:19:41 +0000
X-Inumbo-ID: 200a2158-52f0-43f5-b977-2c829c9153ef
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 200a2158-52f0-43f5-b977-2c829c9153ef;
	Tue, 29 Sep 2020 18:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=j6qozxXrGJ0UHpqNmYcJKuGwMzO/Bmb96hkr7pQyDHU=; b=RLW/myj3FgTy0x2YTM9dyXetx1
	WQVzQm/o9xVxOzEmPrZOxfss5u62cq/zoLLWTf8qCfJBxflxCP9m0Hd/6fs2vS+Bk08eu/EBEksvS
	bo98Zc+9CrU7isV/XESWPWeH5m6/kMNEJ56dJDEOWvrDJgIRwmlvE5Au2mPEGCz4wris=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNKE0-0001ED-6M; Tue, 29 Sep 2020 18:19:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNKDz-0007MA-VR; Tue, 29 Sep 2020 18:19:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNKDz-0003JX-Ux; Tue, 29 Sep 2020 18:19:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155089-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155089: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5dba8c2f23049aa68b777a9e7e9f76c12dd00012
X-Osstest-Versions-That:
    xen=358d57d411ee759a5a9dbf367179a9ac37faf0b3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Sep 2020 18:19:39 +0000

flight 155089 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155089/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5dba8c2f23049aa68b777a9e7e9f76c12dd00012
baseline version:
 xen                  358d57d411ee759a5a9dbf367179a9ac37faf0b3

Last test of basis   155080  2020-09-29 09:00:26 Z    0 days
Testing same since   155089  2020-09-29 13:00:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
   358d57d411..5dba8c2f23  5dba8c2f23049aa68b777a9e7e9f76c12dd00012 -> smoke

