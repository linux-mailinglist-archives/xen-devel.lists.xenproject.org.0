Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC96CB45E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 04:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515532.798511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgzS7-0006Xq-6z; Tue, 28 Mar 2023 02:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515532.798511; Tue, 28 Mar 2023 02:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgzS7-0006VQ-34; Tue, 28 Mar 2023 02:52:51 +0000
Received: by outflank-mailman (input) for mailman id 515532;
 Tue, 28 Mar 2023 02:52:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgzS5-0006VG-RK; Tue, 28 Mar 2023 02:52:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgzS5-0006S4-Ov; Tue, 28 Mar 2023 02:52:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgzS5-0002Dy-77; Tue, 28 Mar 2023 02:52:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgzS5-00067S-6L; Tue, 28 Mar 2023 02:52:49 +0000
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
	bh=Q12DBZvsMIq/HW9Enh/gVg/D4WTYMTy36LIcMKfAG20=; b=y2FKnkMg0/prxgktuxDQgH6Igg
	CREzIEBDJNLjpsTTZe/sWTmYbA6BXMmpm75blwHn4uLQDNw71cxvSkwkpRO0bE9A4Lpub1gOAmP7B
	AtIb/FWg+9k/eXZQvfa/SAwyjBY+6HuLmKDCGXntdaYEB5E7v9R/IQDyUN/TWfCGGI6Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180034-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180034: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=0ab316e7e15f895c983e853512cfe0bb71ee3053
X-Osstest-Versions-That:
    xen=b1f11273d5a774cc88a3685c96c2e7cf6385e3b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Mar 2023 02:52:49 +0000

flight 180034 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180034/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  0ab316e7e15f895c983e853512cfe0bb71ee3053
baseline version:
 xen                  b1f11273d5a774cc88a3685c96c2e7cf6385e3b6

Last test of basis   179947  2023-03-24 23:00:25 Z    3 days
Testing same since   180034  2023-03-28 01:01:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
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
   b1f11273d5..0ab316e7e1  0ab316e7e15f895c983e853512cfe0bb71ee3053 -> smoke

