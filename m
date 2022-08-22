Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A659C35F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391548.629430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9g5-0003P9-CW; Mon, 22 Aug 2022 15:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391548.629430; Mon, 22 Aug 2022 15:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9g5-0003MI-9m; Mon, 22 Aug 2022 15:49:25 +0000
Received: by outflank-mailman (input) for mailman id 391548;
 Mon, 22 Aug 2022 15:49:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oQ9g4-0003M8-OK; Mon, 22 Aug 2022 15:49:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oQ9g4-0005cz-LZ; Mon, 22 Aug 2022 15:49:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oQ9g4-0007O1-AS; Mon, 22 Aug 2022 15:49:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oQ9g4-0006aN-A0; Mon, 22 Aug 2022 15:49:24 +0000
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
	bh=xNz+p0QvNXClQKjgA1V2ZuQMQovmNIws5UdkookQPMI=; b=1zN929tADWhjDigMPMN+amD60y
	o8/iSfx+6cIShdLT29RIpz4StmsCSSleIJOnBDE0nvf6KFlBQZLfDTTJWTNpGiBiTFEvuoRZ/VTSI
	upal/qLyFHY4T4KDXU1Y8efI4Rx0ChW/O+INEL0YSB06hxoIXjXZ9T/24x20rGAMjEIU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172708-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 172708: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=696ee5ca9f4e2256e76056cf72a72001a9748f4c
X-Osstest-Versions-That:
    xen=58ce731faca28cb08f7c1b8c79b59fed47d0b2c2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Aug 2022 15:49:24 +0000

flight 172708 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172708/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 172705
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  696ee5ca9f4e2256e76056cf72a72001a9748f4c
baseline version:
 xen                  58ce731faca28cb08f7c1b8c79b59fed47d0b2c2

Last test of basis   172705  2022-08-22 09:01:49 Z    0 days
Testing same since   172708  2022-08-22 12:01:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
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
   58ce731fac..696ee5ca9f  696ee5ca9f4e2256e76056cf72a72001a9748f4c -> smoke

