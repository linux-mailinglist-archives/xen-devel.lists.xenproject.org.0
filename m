Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7833022F5A4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 18:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06FN-00055P-Ae; Mon, 27 Jul 2020 16:45:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AKR=BG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k06FL-00054e-Qp
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 16:45:03 +0000
X-Inumbo-ID: 7f87c83c-d028-11ea-a7a9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f87c83c-d028-11ea-a7a9-12813bfff9fa;
 Mon, 27 Jul 2020 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZNBlxwVkXZXBH+3CIWjTWMWNCjesxg0BvSNCjSNHnyE=; b=3LeWfDwJEq7Bh3FRqpA7kYBeg
 jyB41hDL19I50WeQNi6E/iP8pVbWPFDh8xID/gjqDQiFzZOV8zXxNbe4yZGo+qmsM1gs2Gyehu+RE
 VTM9j0R70SZ+ec2O1TFz6Zd95P9cEGPYcoyqgFxR+YkQWrU3s5ibBayQYFAsHg5h/qp+E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k06FC-0004u4-81; Mon, 27 Jul 2020 16:44:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k06FB-0000Ib-U2; Mon, 27 Jul 2020 16:44:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k06FB-0005bk-TO; Mon, 27 Jul 2020 16:44:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152235-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 152235: tolerable all pass - PUSHED
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=c27a184225eab54d20435c8cab5ad0ef384dc2c0
X-Osstest-Versions-That: xen=0562cbc14cf02b8188b9f1f37f39a4886776ce7c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 Jul 2020 16:44:53 +0000
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

flight 152235 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152235/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c27a184225eab54d20435c8cab5ad0ef384dc2c0
baseline version:
 xen                  0562cbc14cf02b8188b9f1f37f39a4886776ce7c

Last test of basis   152180  2020-07-24 15:02:33 Z    3 days
Testing same since   152235  2020-07-27 14:10:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

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
   0562cbc14c..c27a184225  c27a184225eab54d20435c8cab5ad0ef384dc2c0 -> smoke

