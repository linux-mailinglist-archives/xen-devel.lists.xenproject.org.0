Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC4358FCCE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384575.619978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM7ed-0001yE-Tj; Thu, 11 Aug 2022 12:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384575.619978; Thu, 11 Aug 2022 12:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM7ed-0001wS-Qy; Thu, 11 Aug 2022 12:51:15 +0000
Received: by outflank-mailman (input) for mailman id 384575;
 Thu, 11 Aug 2022 12:51:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oM7ec-0001wG-CZ; Thu, 11 Aug 2022 12:51:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oM7ec-0001Au-AF; Thu, 11 Aug 2022 12:51:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oM7eb-0000Mr-Uk; Thu, 11 Aug 2022 12:51:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oM7eb-0003Yz-UK; Thu, 11 Aug 2022 12:51:13 +0000
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
	bh=JyrSAd9SDGzP6/TrUUwn6AiorTnPfZxrfCBKSeaY3Ts=; b=agHQLfPTGDl5Fffiis244ZKyWq
	wPHOGp4aQ53z/WInf9NuW9MhPvfJpCLebRYz0FaaGB2DA93d0xpVn6njzF3eNMvgIkZ/KLpA4eEAU
	g+ywYyr3XGe2sFrD8I3TKhdmag1WUWicaPhK4F1rqYKhbedZIcViGhcep4IQJHTXBDyk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172382-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 172382: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4a2217c97024ccaf92adb6a08f4d340a803af352
X-Osstest-Versions-That:
    xen=d7c3c845c44e097d6c980001e108da0bb84ed16f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Aug 2022 12:51:13 +0000

flight 172382 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172382/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 172368
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  4a2217c97024ccaf92adb6a08f4d340a803af352
baseline version:
 xen                  d7c3c845c44e097d6c980001e108da0bb84ed16f

Last test of basis   172368  2022-08-10 21:00:28 Z    0 days
Testing same since   172382  2022-08-11 10:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
   d7c3c845c4..4a2217c970  4a2217c97024ccaf92adb6a08f4d340a803af352 -> smoke

