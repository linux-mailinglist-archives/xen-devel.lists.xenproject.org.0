Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF4D232B02
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 06:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k10Er-0003l4-Rm; Thu, 30 Jul 2020 04:32:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uMI=BJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k10Eq-0003ke-T0
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 04:32:16 +0000
X-Inumbo-ID: a2513fdc-d21d-11ea-aa9f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2513fdc-d21d-11ea-aa9f-12813bfff9fa;
 Thu, 30 Jul 2020 04:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t6KGXJpP5EnxK53Cu8vWRZnx8sauOTKFm7wwf+jqqLQ=; b=HGFsW8mGTO8CD8p9WOTAFN1fV
 RgGGvj94O3o66r3b5oyaLNBA//oZr6SoXOglj9P7sSLG8a2Du0oIdSznSWLp7nYLiKQtbi0gjoji3
 xuc1GHw3+cDlnsTfxixtUOZn1bAdj7C44kdkKFMxemIJotE8VQF7MuTTc6wwkMAm4OxwA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k10Ej-0005Ls-Ut; Thu, 30 Jul 2020 04:32:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k10Ej-00017K-J6; Thu, 30 Jul 2020 04:32:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k10Ej-0001s6-IT; Thu, 30 Jul 2020 04:32:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152291-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 152291: regressions - FAIL
X-Osstest-Failures: xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=64219fa179c3e48adad12bfce3f6b3f1596cccbf
X-Osstest-Versions-That: xen=b071ec25e85c4aacf3da59e5258cda0b1c4df45d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Jul 2020 04:32:09 +0000
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

flight 152291 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152291/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       7 xen-boot                 fail REGR. vs. 152269

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  64219fa179c3e48adad12bfce3f6b3f1596cccbf
baseline version:
 xen                  b071ec25e85c4aacf3da59e5258cda0b1c4df45d

Last test of basis   152269  2020-07-28 19:05:32 Z    1 days
Testing same since   152288  2020-07-29 19:01:00 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Fam Zheng <famzheng@amazon.com>

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
commit 64219fa179c3e48adad12bfce3f6b3f1596cccbf
Author: Fam Zheng <famzheng@amazon.com>
Date:   Wed Jul 29 18:51:45 2020 +0100

    x86/cpuid: Fix APIC bit clearing
    
    The bug is obvious here, other places in this function used
    "cpufeat_mask" correctly.
    
    Fixed: b648feff8ea2 ("xen/x86: Improvements to in-hypervisor cpuid sanity checks")
    Signed-off-by: Fam Zheng <famzheng@amazon.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

