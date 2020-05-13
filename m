Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBEB1D1CA5
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 19:54:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYvZd-0004Iq-N9; Wed, 13 May 2020 17:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Rkd=63=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYvZc-0004Il-KL
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 17:53:40 +0000
X-Inumbo-ID: aa565c34-9542-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa565c34-9542-11ea-b9cf-bc764e2007e4;
 Wed, 13 May 2020 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jEXiLkiIB/bAqJMREV2PQvYroas6M2gpTCuG/Im1jgY=; b=tDmxk1z8H9F+GAjvmyVsINYxk
 c17DelR8KeAyRdBmwbuhqfY5iRzMDpBhatpsVUTWkshpMc+ddwt4O7f4A2chLa166B5hEx3kfFfUN
 1pL9Ueg8p/+3GozrSKroEIIFK44/VpCvR6nXL8wT7JCNYD239syiM4uHikLqlPVlIbFRs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYvZW-00052C-5Q; Wed, 13 May 2020 17:53:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYvZV-0005zE-R0; Wed, 13 May 2020 17:53:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYvZV-0005TT-QN; Wed, 13 May 2020 17:53:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150163-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150163: regressions - FAIL
X-Osstest-Failures: xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=61be48dc029294275348443f78a5e600ef28274f
X-Osstest-Versions-That: xen=9d83ad86834300927b636fa02b29d84854399ed8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 May 2020 17:53:33 +0000
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

flight 150163 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150163/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 150162

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  61be48dc029294275348443f78a5e600ef28274f
baseline version:
 xen                  9d83ad86834300927b636fa02b29d84854399ed8

Last test of basis   150162  2020-05-13 13:00:23 Z    0 days
Testing same since   150163  2020-05-13 16:01:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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


Not pushing.

------------------------------------------------------------
commit 61be48dc029294275348443f78a5e600ef28274f
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Wed May 13 10:18:19 2020 -0400

    golang/xenlight: add necessary module/package documentation
    
    Add a README and package comment giving a brief overview of the package.
    These also help pkg.go.dev generate better documentation.
    
    Also, add a copy of the LGPL (the same license used by libxl) to
    tools/golang/xenlight. This is required for the package to be shown
    on pkg.go.dev and added to the default module proxy, proxy.golang.org.
    
    Finally, add an entry for the xenlight package to SUPPORT.md.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
(qemu changes not included)

