Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB52ADB3C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 17:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23520.50316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcW9J-0001fu-Ps; Tue, 10 Nov 2020 16:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23520.50316; Tue, 10 Nov 2020 16:05:37 +0000
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
	id 1kcW9J-0001fV-MN; Tue, 10 Nov 2020 16:05:37 +0000
Received: by outflank-mailman (input) for mailman id 23520;
 Tue, 10 Nov 2020 16:05:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcW9H-0001fQ-J5
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 16:05:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d27df046-f4f7-459f-be6b-4fb446d587c7;
 Tue, 10 Nov 2020 16:05:34 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcW9F-0004Me-Ok; Tue, 10 Nov 2020 16:05:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcW9F-0000m0-HF; Tue, 10 Nov 2020 16:05:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcW9F-00021K-Gh; Tue, 10 Nov 2020 16:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcW9H-0001fQ-J5
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 16:05:35 +0000
X-Inumbo-ID: d27df046-f4f7-459f-be6b-4fb446d587c7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d27df046-f4f7-459f-be6b-4fb446d587c7;
	Tue, 10 Nov 2020 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=FyI95Iwy1Mpq3hdwv02l/wa63dzxB31bWCFREHzxQF0=; b=ZZLGmM1AAoGg9WmPuhB2IJWnbZ
	VOp32tMiN0uWN2UNMphEz7R9Q4oSQ/tniuUmirhPb1NxeMMzkfvBBw4HT1542Dirc/m1h8nlxCusB
	ukJqDls+3n099GfT0sV/HaD6ppPPNWH7M0wzJC3Hbw46MyS7TQGk/caDaODipt1l/fl8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcW9F-0004Me-Ok; Tue, 10 Nov 2020 16:05:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcW9F-0000m0-HF; Tue, 10 Nov 2020 16:05:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcW9F-00021K-Gh; Tue, 10 Nov 2020 16:05:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156622-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156622: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3059178798a23ba870ff86ff54d442a07e6651fc
X-Osstest-Versions-That:
    xen=0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Nov 2020 16:05:33 +0000

flight 156622 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156622/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3059178798a23ba870ff86ff54d442a07e6651fc
baseline version:
 xen                  0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258

Last test of basis   156532  2020-11-06 17:01:35 Z    3 days
Testing same since   156622  2020-11-10 13:01:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
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
   0a5e0ce0fb..3059178798  3059178798a23ba870ff86ff54d442a07e6651fc -> smoke

