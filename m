Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF462635FA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 20:27:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG4nY-0007dM-8i; Wed, 09 Sep 2020 18:26:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLKP=CS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kG4nW-0007dF-QK
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 18:26:22 +0000
X-Inumbo-ID: 688e47e4-6c9b-4b7b-9395-bf28591096f4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 688e47e4-6c9b-4b7b-9395-bf28591096f4;
 Wed, 09 Sep 2020 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=ItrR+knUhwXYBuEQCNkZTiCleT7CB9K6eDbenKP7lcU=; b=gWSIl+eKk1RLpJIfaFrxhV0r3B
 gdK+f12Blo9YT52pIbMFXkFRogkTEK+iKGDdLGKMXvMDhaD6BYKgTUw7Ysoul0hhiWU9lDXf8Y6fH
 ip6n+0oNLMn9Z7Kh2CCUYuhZ2aL5Mk7tX3FJb3ovMuSL1zMwF4GjdtFBcQhpUnmbYL80=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kG4nU-0007Zk-Ca; Wed, 09 Sep 2020 18:26:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kG4nU-0005eA-4f; Wed, 09 Sep 2020 18:26:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kG4nU-0005Wq-4D; Wed, 09 Sep 2020 18:26:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154026-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 154026: tolerable all pass - PUSHED
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=6d2f1ebccdef655d64fbc3abc83db76c3de08cb1
X-Osstest-Versions-That: xen=3cccdae45242dab27198b8e150be0c85acd5d3c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Sep 2020 18:26:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154026 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154026/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6d2f1ebccdef655d64fbc3abc83db76c3de08cb1
baseline version:
 xen                  3cccdae45242dab27198b8e150be0c85acd5d3c9

Last test of basis   154020  2020-09-09 12:00:24 Z    0 days
Testing same since   154026  2020-09-09 15:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Diego Sueiro <diego.sueiro@arm.com>
  Wei Liu <wl@xen.org>

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
   3cccdae452..6d2f1ebccd  6d2f1ebccdef655d64fbc3abc83db76c3de08cb1 -> smoke

