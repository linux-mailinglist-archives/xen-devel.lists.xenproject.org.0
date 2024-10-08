Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2A99584B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813509.1226483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGiF-00043d-Fi; Tue, 08 Oct 2024 20:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813509.1226483; Tue, 08 Oct 2024 20:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGiF-00040e-CU; Tue, 08 Oct 2024 20:21:43 +0000
Received: by outflank-mailman (input) for mailman id 813509;
 Tue, 08 Oct 2024 20:21:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syGiE-00040U-8y; Tue, 08 Oct 2024 20:21:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syGiE-0001Vz-6v; Tue, 08 Oct 2024 20:21:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syGiD-000447-OZ; Tue, 08 Oct 2024 20:21:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syGiD-0004rg-OA; Tue, 08 Oct 2024 20:21:41 +0000
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
	bh=0Y/6fhPGgFZBoUbinzrU0S+WZbCE9mSAqmM3tv2UGmw=; b=WqNeae683z62mLy2vwkRNvt2qh
	4BvLjDG04u8bdPNgRYSdVknobeo7Tnb5QORRzWNwbus+XaRLYNDnZRMswgknYnegXKaaxBdpqe062
	bSSkSo9XehL/iaU61pDkiq+BcdPMb/NUasE1TSID4cALU/pyWeohhyXXVtr2v5NgtfSE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188015-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 188015: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd
X-Osstest-Versions-That:
    xen=16a81486c4cdafa8d881dec529a99e2441109872
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Oct 2024 20:21:41 +0000

flight 188015 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188015/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd
baseline version:
 xen                  16a81486c4cdafa8d881dec529a99e2441109872

Last test of basis   188011  2024-10-08 12:02:09 Z    0 days
Testing same since   188015  2024-10-08 16:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
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
   16a81486c4..c95cd5f9c5  c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd -> smoke

