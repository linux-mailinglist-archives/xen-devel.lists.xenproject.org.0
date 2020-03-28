Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DC1966D4
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 16:02:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jICuq-00088U-95; Sat, 28 Mar 2020 14:58:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fYQ=5N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jICuo-00088P-S1
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 14:58:26 +0000
X-Inumbo-ID: 905609b8-7104-11ea-8bad-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 905609b8-7104-11ea-8bad-12813bfff9fa;
 Sat, 28 Mar 2020 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7xrVKfVHeoLIs0aTpNQJMpIbzN3NStonodFGkKGpCGA=; b=SxiUOMjehuz1sp7/t+vE6jQD/
 0iJDIUx84XWDnjne37n7XqWoXFk0M1FiqtqLVk/K40UjHihfrga6ylKUu47TyeR0MwBY1k9+rp/BO
 5Bj2nUqYipOL8rW180BvjP+KCQg20syJeigY+bdddVTvOF07xpqVG7n8xbsEhsRvuo81U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jICui-0004CQ-4O; Sat, 28 Mar 2020 14:58:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jICuh-0003RR-QJ; Sat, 28 Mar 2020 14:58:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jICuh-0004UB-Pd; Sat, 28 Mar 2020 14:58:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149132-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=e19b4b3b55f84e0cfcc02fe5d66965969a81c965
X-Osstest-Versions-That: xen=a87676c4a32f94d79fcaf5b4e0eb59e880e0f032
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Mar 2020 14:58:19 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 149132: tolerable all pass -
 PUSHED
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149132 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149132/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e19b4b3b55f84e0cfcc02fe5d66965969a81c965
baseline version:
 xen                  a87676c4a32f94d79fcaf5b4e0eb59e880e0f032

Last test of basis   149110  2020-03-27 18:05:39 Z    0 days
Testing same since   149132  2020-03-28 12:00:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michael Young <m.a.young@durham.ac.uk>
  YOUNG, MICHAEL A <m.a.young@durham.ac.uk>

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
   a87676c4a3..e19b4b3b55  e19b4b3b55f84e0cfcc02fe5d66965969a81c965 -> smoke

