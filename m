Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C910E1B8443
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 09:51:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSFZB-0007i8-3y; Sat, 25 Apr 2020 07:49:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVj9=6J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jSFZ9-0007i3-Jb
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 07:49:35 +0000
X-Inumbo-ID: 4d3898b4-86c9-11ea-9592-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d3898b4-86c9-11ea-9592-12813bfff9fa;
 Sat, 25 Apr 2020 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T/13owPnx4X50usBXWLc7EDghao2uWY1ksqUjF3Omv0=; b=Y4UcoWjE1haydq8bO45zcu/Ht
 f2ZDJCj/L77qXKDNFvjIip2FjXKTLVdCd/mZSy5t0xnQha4WmUdr3sTJe3J/bI2JhcLxHE5bKPKOF
 SVcWJqCSutkZiQjYlB6lhTB+fjJ4fO7AVd24cZSl6t0ZAG4OD/DKSE5RWfWbkMqEyb2yQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSFZ6-0006Kp-PX; Sat, 25 Apr 2020 07:49:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSFZ6-0001qC-He; Sat, 25 Apr 2020 07:49:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jSFZ6-0000PT-H1; Sat, 25 Apr 2020 07:49:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149805-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 149805: regressions - FAIL
X-Osstest-Failures: xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=f093b08c47b39da6019421a2b61d40745b3e573b
X-Osstest-Versions-That: xen=96b5c267e52657e99bd1bbf81dd51925447115e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Apr 2020 07:49:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

flight 149805 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149805/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 149784

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f093b08c47b39da6019421a2b61d40745b3e573b
baseline version:
 xen                  96b5c267e52657e99bd1bbf81dd51925447115e2

Last test of basis   149784  2020-04-24 14:00:40 Z    0 days
Failing since        149785  2020-04-24 17:01:40 Z    0 days    5 attempts
Testing same since   149788  2020-04-24 20:00:41 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <ian.jackson@eu.citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
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


Not pushing.

------------------------------------------------------------
commit f093b08c47b39da6019421a2b61d40745b3e573b
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Tue Apr 21 11:29:46 2020 -0700

    Introduce a description of the Backport and Fixes tags
    
    Create a new document under docs/process to describe our special tags.
    Add a description of the Fixes tag and the new Backport tag. Also
    clarify that lines with tags should not be split.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Acked-by: Wei Liu <wl@xen.org>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    CC: jbeulich@suse.com
    CC: george.dunlap@citrix.com
    CC: julien@xen.org
    CC: lars.kurth@citrix.com
    CC: andrew.cooper3@citrix.com
    CC: konrad.wilk@oracle.com

commit 3acfd35b61688ad9a5b843ee923221eb36e0b613
Author: Ian Jackson <ian.jackson@eu.citrix.com>
Date:   Fri Apr 24 15:49:23 2020 +0100

    Update QEMU_TRADITIONAL_REVISION
    
    Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
(qemu changes not included)

