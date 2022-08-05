Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987EC58B276
	for <lists+xen-devel@lfdr.de>; Sat,  6 Aug 2022 00:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381600.616317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK5ni-0001Cb-13; Fri, 05 Aug 2022 22:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381600.616317; Fri, 05 Aug 2022 22:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK5nh-00019K-UQ; Fri, 05 Aug 2022 22:28:13 +0000
Received: by outflank-mailman (input) for mailman id 381600;
 Fri, 05 Aug 2022 22:28:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK5ng-00019A-KT; Fri, 05 Aug 2022 22:28:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK5ng-0003kd-G4; Fri, 05 Aug 2022 22:28:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK5ng-0008AV-5k; Fri, 05 Aug 2022 22:28:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oK5ng-0004Mz-5K; Fri, 05 Aug 2022 22:28:12 +0000
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
	bh=nT7ZRlSYzSPMeJk7C5uQQlnawEq1pCi5NIecXeaiRf4=; b=fuP1o8KJvsQrwqpYxIKu5rAke6
	9p+53qZPNJL/yFyZ9jyjt42ae3cnbJ5FBpoXy8wlceEzasNp1I+IlckqNXbQEWmlRbbGkjadvPGMv
	rD9I5Qll47gHAuO3Gf95u3ne/P1Z8yt0Aq44IZ4AfmQxtT2FEJSTkOPbSlLURCPHCY4o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172199-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 172199: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6d6aee437e37fced0c49be97e08c30da873690fc
X-Osstest-Versions-That:
    xen=da74c951e4e58080583daaad373b0d38a3f8bc83
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Aug 2022 22:28:12 +0000

flight 172199 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172199/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 172174
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6d6aee437e37fced0c49be97e08c30da873690fc
baseline version:
 xen                  da74c951e4e58080583daaad373b0d38a3f8bc83

Last test of basis   172174  2022-08-05 12:05:02 Z    0 days
Testing same since   172199  2022-08-05 18:03:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayankuma@amd.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     blocked 


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
   da74c951e4..6d6aee437e  6d6aee437e37fced0c49be97e08c30da873690fc -> smoke

