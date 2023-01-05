Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D415165F46E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 20:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472119.732253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDVt7-00056B-D8; Thu, 05 Jan 2023 19:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472119.732253; Thu, 05 Jan 2023 19:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDVt7-00054O-9u; Thu, 05 Jan 2023 19:26:53 +0000
Received: by outflank-mailman (input) for mailman id 472119;
 Thu, 05 Jan 2023 19:26:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDVt5-00054E-CE; Thu, 05 Jan 2023 19:26:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDVt5-0003YM-50; Thu, 05 Jan 2023 19:26:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDVt4-0000Ph-Qd; Thu, 05 Jan 2023 19:26:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pDVt4-0005JW-QE; Thu, 05 Jan 2023 19:26:50 +0000
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
	bh=dPeraHKPSt5Xr24vT/88edpDy/j4fFVsR05C2rQ2J3Q=; b=Qr+6z3kV87dST/biDrGz5WkwDG
	a3GG9ufcMgtWntxvueVKy9rXSc28RRO/h7fssvWh1ca6auH1AFmPHdUYsElhwVMjf2WxKIOqJLTFj
	n5QAhL/OXFoh1dj/fgVbGxrnSSemgxOHmzQJutyrF+lpuSr58NPcteUQ3D/wvkSzhmtI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175589-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175589: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=671f50ffab3329c5497208da89620322b9721a77
X-Osstest-Versions-That:
    xen=c1df06afe578f698ebe91a1e3817463b9d165123
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Jan 2023 19:26:50 +0000

flight 175589 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175589/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  671f50ffab3329c5497208da89620322b9721a77
baseline version:
 xen                  c1df06afe578f698ebe91a1e3817463b9d165123

Last test of basis   175568  2023-01-04 14:00:26 Z    1 days
Testing same since   175589  2023-01-05 16:01:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>

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
   c1df06afe5..671f50ffab  671f50ffab3329c5497208da89620322b9721a77 -> smoke

