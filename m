Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C088529F25D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14357.35496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBFS-0008Nr-Cg; Thu, 29 Oct 2020 16:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14357.35496; Thu, 29 Oct 2020 16:58:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBFS-0008NV-9R; Thu, 29 Oct 2020 16:58:02 +0000
Received: by outflank-mailman (input) for mailman id 14357;
 Thu, 29 Oct 2020 16:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9Pg=EE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kYBFR-0008NP-GI
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:58:01 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e284285-160f-409e-85d1-222b36185b23;
 Thu, 29 Oct 2020 16:58:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYBFP-0001a8-TY; Thu, 29 Oct 2020 16:57:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYBFP-0003Wg-Lz; Thu, 29 Oct 2020 16:57:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kYBFP-0006QW-LV; Thu, 29 Oct 2020 16:57:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m9Pg=EE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kYBFR-0008NP-GI
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:58:01 +0000
X-Inumbo-ID: 4e284285-160f-409e-85d1-222b36185b23
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e284285-160f-409e-85d1-222b36185b23;
	Thu, 29 Oct 2020 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=p5QXr4YKX+XUr7uXySSJNGvolq1COPSDV0IK0QEamNI=; b=ioKXyNV+kRbxRTqTCyl99HsTOo
	NqRaMuvCYkBk1wZcBsX5A0HZpuqSeapeq9CndBLs1NvxrgMO+Ey79C2YSm6wvjqZoA0gn0Pnb8hbL
	ny4rWocgUt0eFnaV4e0DRsWIGo/ccGvO+IcGtGIXq4j8MAqDxUAcyfPZjchvgABkwTdI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYBFP-0001a8-TY; Thu, 29 Oct 2020 16:57:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYBFP-0003Wg-Lz; Thu, 29 Oct 2020 16:57:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYBFP-0006QW-LV; Thu, 29 Oct 2020 16:57:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156297-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156297: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1fd1d4bafdf6f9f8fe5ca9b947f016a7aae92a74
X-Osstest-Versions-That:
    xen=16a20963b3209788f2c0d3a3eebb7d92f03f5883
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Oct 2020 16:57:59 +0000

flight 156297 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156297/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1fd1d4bafdf6f9f8fe5ca9b947f016a7aae92a74
baseline version:
 xen                  16a20963b3209788f2c0d3a3eebb7d92f03f5883

Last test of basis   156260  2020-10-27 18:01:29 Z    1 days
Testing same since   156297  2020-10-29 14:01:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   16a20963b3..1fd1d4bafd  1fd1d4bafdf6f9f8fe5ca9b947f016a7aae92a74 -> smoke

