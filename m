Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF07C9253
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 04:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617017.959464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrUNU-00028D-LH; Sat, 14 Oct 2023 02:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617017.959464; Sat, 14 Oct 2023 02:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrUNU-00025g-IC; Sat, 14 Oct 2023 02:27:44 +0000
Received: by outflank-mailman (input) for mailman id 617017;
 Sat, 14 Oct 2023 02:27:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qrUNT-00025W-DL; Sat, 14 Oct 2023 02:27:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qrUNT-0003r7-9r; Sat, 14 Oct 2023 02:27:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qrUNS-0003BO-RU; Sat, 14 Oct 2023 02:27:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qrUNS-0003Yd-Qz; Sat, 14 Oct 2023 02:27:42 +0000
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
	bh=HB83GOl7SIah3kRXiSVTYXZGglzx6ltl2pU6MAyFgTQ=; b=Z4tlmoz5U6cfmPuI2xgXsPSDgX
	Gr0FwlGXQABisB4kCHwZw5owF0jNGPLVIrKrOnjqB/ns0OY6w4DMefyKlcC1aKcvc5tHRkbvV00MA
	AvQyDSs3dRuQyUfTbN3gn5iubEDI3WNlczTRYR0eq+AM0NIONLxPHvqMnjnHIAhQdTQ0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183370: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=730406ab81094115d9fb5ca00ba8d53cec1279b3
X-Osstest-Versions-That:
    xen=9a5bbb2d34ef90ab7d146f11c9c2c0a23fb08035
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 14 Oct 2023 02:27:42 +0000

flight 183370 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183370/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  730406ab81094115d9fb5ca00ba8d53cec1279b3
baseline version:
 xen                  9a5bbb2d34ef90ab7d146f11c9c2c0a23fb08035

Last test of basis   183364  2023-10-13 09:02:04 Z    0 days
Testing same since   183370  2023-10-14 00:02:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nicola Vetrini <nicola.vetrini@bugseng.com>

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
   9a5bbb2d34..730406ab81  730406ab81094115d9fb5ca00ba8d53cec1279b3 -> smoke

