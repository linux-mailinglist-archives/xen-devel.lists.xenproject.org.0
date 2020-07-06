Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBB215709
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 14:07:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsPtj-0004pt-Ei; Mon, 06 Jul 2020 12:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m1N9=AR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jsPti-0004pZ-5J
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 12:06:58 +0000
X-Inumbo-ID: 2d45d634-bf81-11ea-8c77-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d45d634-bf81-11ea-8c77-12813bfff9fa;
 Mon, 06 Jul 2020 12:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDzQCrEASPvAOpzXjlqgQ3wPV/D/6Ay7LxrNkx2Bu4w=; b=E8RhDSv+zYjrtsytiye/0ioPx
 6Nx7QDutbYdz8ZdpKMolvyCG6USt+A69sv7gw2ExZXc1pFrEo5y67httLDYWsN+UyQXXG9LOCnHTZ
 aDBr5TStB+wQyRkg1XhBb92BiEsufqZHblyx1jc8hfuYvga67MTOJ03gIYzK1Q076MQT4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jsPtb-0005Wy-Ge; Mon, 06 Jul 2020 12:06:51 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jsPtb-000216-5a; Mon, 06 Jul 2020 12:06:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jsPtb-0006jl-53; Mon, 06 Jul 2020 12:06:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151671-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 151671: regressions - FAIL
X-Osstest-Failures: xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=158912a532fe98f448c688d3571241c9033553bd
X-Osstest-Versions-That: xen=be63d9d47f571a60d70f8fb630c03871312d9655
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Jul 2020 12:06:51 +0000
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

flight 151671 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151671/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       7 xen-boot                 fail REGR. vs. 151535

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  158912a532fe98f448c688d3571241c9033553bd
baseline version:
 xen                  be63d9d47f571a60d70f8fb630c03871312d9655

Last test of basis   151535  2020-07-02 10:00:52 Z    4 days
Testing same since   151671  2020-07-06 09:02:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
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


Not pushing.

------------------------------------------------------------
commit 158912a532fe98f448c688d3571241c9033553bd
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Fri Jul 3 14:55:33 2020 +0100

    Config: Update QEMU
    
    Backport 2 commits to fix building QEMU without PCI passthrough
    support.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit d44cbbe0f3243afcc56e47dcfa97bbfe23e46fbb
Author: Wei Liu <wl@xen.org>
Date:   Fri Jul 3 20:10:01 2020 +0000

    kdd: fix build again
    
    Restore Tim's patch. The one that was committed was recreated by me
    because git didn't accept my saved copy. I made some mistakes while
    recreating that patch and here we are.
    
    Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
    Reported-by: Michael Young <m.a.young@durham.ac.uk>
    Signed-off-by: Wei Liu <wl@xen.org>
    Reviewed-by: Tim Deegan <tim@xen.org>
    Release-acked-by: Paul Durrant <paul@xen.org>
(qemu changes not included)

