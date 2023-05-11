Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E636FF585
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 17:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533457.830154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7te-00020k-Vq; Thu, 11 May 2023 15:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533457.830154; Thu, 11 May 2023 15:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7te-0001yf-S5; Thu, 11 May 2023 15:07:58 +0000
Received: by outflank-mailman (input) for mailman id 533457;
 Thu, 11 May 2023 15:07:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1px7td-0001yS-7J; Thu, 11 May 2023 15:07:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1px7td-0006NT-4u; Thu, 11 May 2023 15:07:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1px7tc-00065g-LI; Thu, 11 May 2023 15:07:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1px7tc-0002QC-Kk; Thu, 11 May 2023 15:07:56 +0000
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
	bh=HS4v1aS4Yu0xOZ3t9yU28ZQUsNrwJmpMLMpZqZmS8Y0=; b=7NDbq+MOeFQX/q24huEAMWBowP
	wRP04lNxWuWIXX/i9f+tavG62v4rlY04TkVHYp+Ytth+/iJy98jNikBRvUaYgIyO0NViu2z4bH9pm
	V8457389GDceDC9phczAOVNCwnqQI0nHADXMRTXtZubJ174WjyVLngHnO+6Hp9ZbpphI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180619-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180619: regressions - trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-build-prep:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=bdb1184d4f6bf4e0121fda34a6c1cb51fe270e7d
X-Osstest-Versions-That:
    xen=31c65549746179e16cf3f82b694b4b1e0b7545ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 May 2023 15:07:56 +0000

flight 180619 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180619/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   5 host-build-prep          fail REGR. vs. 180607

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  bdb1184d4f6bf4e0121fda34a6c1cb51fe270e7d
baseline version:
 xen                  31c65549746179e16cf3f82b694b4b1e0b7545ca

Last test of basis   180607  2023-05-10 19:03:28 Z    0 days
Testing same since   180619  2023-05-11 12:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
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

broken-job build-armhf broken

Not pushing.

------------------------------------------------------------
commit bdb1184d4f6bf4e0121fda34a6c1cb51fe270e7d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu May 11 13:13:55 2023 +0200

    domctl: bump interface version
    
    The change to XEN_DOMCTL_getdomaininfo was a binary incompatible one,
    and the interface version wasn't bumped yet during the 4.18 release
    cycle.
    
    Fixes: 31c655497461 ("domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 5b49f5e09df905a3688107a06bc022a590606555
Author: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date:   Thu May 11 13:12:46 2023 +0200

    x86: Add AMD's CpuidUserDis bit definitions
    
    AMD reports support for CpuidUserDis in CPUID and provides the toggle in HWCR.
    This patch adds the positions of both of those bits to both xen and tools.
    
    No functional change.
    
    Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

