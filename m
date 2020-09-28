Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55527AD2F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMreu-00016p-FT; Mon, 28 Sep 2020 11:49:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rPw=DF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMres-00015l-Lp
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:49:30 +0000
X-Inumbo-ID: 08da6654-e8a5-43db-9738-f5b8d023cf42
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08da6654-e8a5-43db-9738-f5b8d023cf42;
 Mon, 28 Sep 2020 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=URDGfG47qhy0zDtY7Q1sBqbkKFoiXeFApYEEwBkBGow=; b=oG74R5bnA2XcHN3BPKpxsdDDBs
 Z4/yQF2sDShVBFiEqoH0/t3B4Im6hggChdlDGkNct1MRs+O5IGPbGZFrYo9nijeiN+C4f1hCfhq1Y
 srBBrHlx3mHCjfEKorI1BEEO+VQa4o4RJGMGwx9szcoJ+LPoVpnBoTXzbPiI72f5uVLs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrel-0001Se-AX; Mon, 28 Sep 2020 11:49:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrel-0003vd-3r; Mon, 28 Sep 2020 11:49:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrel-0002Rk-3J; Mon, 28 Sep 2020 11:49:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154998-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 154998: trouble:
 blocked/broken/preparing/queued/running
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-amd64-libvirt:<none executed>:queued:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:<none executed>:queued:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none
 executed>:queued:regression
 xen-unstable-smoke:test-armhf-armhf-xl:<none executed>:queued:regression
 xen-unstable-smoke:build-amd64:hosts-allocate:running:regression
 xen-unstable-smoke:build-armhf:host-install(4):running:regression
 xen-unstable-smoke:build-armhf:syslog-server:running:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=4bdbf746ac9152e70f264f87db4472707da805ce
X-Osstest-Versions-That: xen=5bcac985498ed83d89666959175ca9c9ed561ae1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Sep 2020 11:49:23 +0000
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

flight 154998 xen-unstable-smoke running [real]
http://logs.test-lab.xenproject.org/osstest/logs/154998/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm                 <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 154728
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-armhf-armhf-xl             <none executed>              queued
 build-amd64                   2 hosts-allocate               running
 build-armhf                   4 host-install(4)              running
 build-armhf                   3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  4bdbf746ac9152e70f264f87db4472707da805ce
baseline version:
 xen                  5bcac985498ed83d89666959175ca9c9ed561ae1

Last test of basis   154728  2020-09-24 21:01:24 Z    3 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              broken  
 build-amd64                                                  preparing
 build-armhf                                                  running 
 build-amd64-libvirt                                          queued  
 test-armhf-armhf-xl                                          queued  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-amd64-libvirt                                     queued  


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

broken-job build-amd64-libvirt queued
broken-job build-arm64-xsm broken
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job test-armhf-armhf-xl queued
broken-step build-arm64-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit 4bdbf746ac9152e70f264f87db4472707da805ce
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon Sep 28 10:43:10 2020 +0200

    x86/S3: fix shadow stack resume path
    
    Fix the resume path to load the shadow stack pointer from saved_ssp (not
    saved_rsp), to match what suspend path does.
    
    Fixes: 633ecc4a7cb2 ("x86/S3: Save and restore Shadow Stack configuration")
    Backport: 4.14
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 28fb8cf323dd93f59a9c851c93ba9b79de8b1c4e
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Sep 28 10:42:29 2020 +0200

    x86/iommu: remove code to fetch MSI message from remap table
    
    Remove the code to compose a MSI message based on the information from
    the MSI registers and the data in the interrupt remapping table.
    Since the removal of read_msi_msg and its user there's no longer a
    need for such code, as the last written (untranslated) MSI message is
    cached internally by Xen.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f9ffd20f946c0315937f85d2f124a9bc4be49473
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Sep 28 10:41:48 2020 +0200

    x86/hpet: remove hpet_msi_read
    
    It's dead code, even more now that read_msi_msg has been removed.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit fe41405f5ee650d3fe39105cf59193b1494cdcdc
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Sep 28 10:40:53 2020 +0200

    common/Kconfig: sort HAS_*
    
    Later additions look to have been put at the end, with MEM_ACCESS*
    somewhere in the middle. Re-sort this part of the file, in the hope that
    future additions will be made noticing the intentions here.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 643e2f3cbb3b607f3365b230f439845e9bf113b0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Sep 28 10:39:47 2020 +0200

    EFI: some easy constification
    
    Inspired by some of Trammell's suggestions, this harvests some low
    hanging fruit, without needing to be concerned about the definitions of
    the EFI interfaces themselves.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

