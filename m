Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917B927518
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 13:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753719.1161926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKcS-0005dl-Ix; Thu, 04 Jul 2024 11:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753719.1161926; Thu, 04 Jul 2024 11:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKcS-0005bg-FB; Thu, 04 Jul 2024 11:27:20 +0000
Received: by outflank-mailman (input) for mailman id 753719;
 Thu, 04 Jul 2024 11:27:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPKcR-0005bW-HM; Thu, 04 Jul 2024 11:27:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPKcR-0000iT-Ev; Thu, 04 Jul 2024 11:27:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPKcR-0002z6-4g; Thu, 04 Jul 2024 11:27:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPKcR-0004Tj-4A; Thu, 04 Jul 2024 11:27:19 +0000
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
	bh=DeMFwNrAPQF8JsqJd4sYi9HiKrGuNqOEEBAWC8cZCwo=; b=P/ZZw/dOUXRutdFIMGzlyl+SdF
	8wA5gvDbbINuNKfYCvMXceBr+4zfXffwXqGNFaaX2EHMc/Vh1ZXIb7u/XsUttJBM/yyaogzAml7ot
	lZOqKNOixqPrW8qmaUENf1//rChUPZMPnEPFSspxSO6IfKHbzLugcP4r5Dihq0Dnatks=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186651-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186651: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7e3701b6ce0347c8b906967e223fa846f23e71d4
X-Osstest-Versions-That:
    xen=63c66274d9934e0df7f4e3725c868ff2251b705f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jul 2024 11:27:19 +0000

flight 186651 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186651/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7e3701b6ce0347c8b906967e223fa846f23e71d4
baseline version:
 xen                  63c66274d9934e0df7f4e3725c868ff2251b705f

Last test of basis   186644  2024-07-03 17:04:06 Z    0 days
Testing same since   186651  2024-07-04 08:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
   63c66274d9..7e3701b6ce  7e3701b6ce0347c8b906967e223fa846f23e71d4 -> smoke

