Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3151C4CC2
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 05:53:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVoeA-0006wJ-1c; Tue, 05 May 2020 03:53:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNY7=6T=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jVoe8-0006wB-6e
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 03:53:28 +0000
X-Inumbo-ID: f7972ed0-8e83-11ea-9d7a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7972ed0-8e83-11ea-9d7a-12813bfff9fa;
 Tue, 05 May 2020 03:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vzm5FhmC92WygCmP/BBW7FEiEwT2eVMsQEGqGu1d5OI=; b=tAPelbYKgiCvp4w+l2lsCgV8Y
 e3Ll1NKGBJBl+Pz6TuyRYgxBoWINKGkcLXez+V8LEuvx62qkLxoBIpueLyX3lT6JZEM9wzybEU5RE
 6WZI4igwfr51ne4eKI7xinL/Rq3dN6Y3EmJYk4ru4FMl6Oo9nknRGrI8elOOLtyCjk54c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jVoe3-0007md-6d; Tue, 05 May 2020 03:53:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jVoe2-0006on-St; Tue, 05 May 2020 03:53:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jVoe1-0002bn-HW; Tue, 05 May 2020 03:53:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149986-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 149986: trouble: blocked/broken/pass
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
 xen-unstable-smoke:build-amd64:<job status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-amd64:host-install(4):broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:host-install(4):broken:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=fe36a173d110fd792f5e337e208a5ed714df1536
X-Osstest-Versions-That: xen=0135be8bd8cd60090298f02310691b688d95c3a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 May 2020 03:53:21 +0000
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

flight 149986 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149986/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm                 <job status>                 broken
 test-armhf-armhf-xl             <job status>                 broken
 build-amd64                     <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 149888
 build-amd64                   4 host-install(4)        broken REGR. vs. 149888
 test-armhf-armhf-xl           4 host-install(4)        broken REGR. vs. 149888

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  fe36a173d110fd792f5e337e208a5ed714df1536
baseline version:
 xen                  0135be8bd8cd60090298f02310691b688d95c3a8

Last test of basis   149888  2020-04-30 09:00:53 Z    4 days
Testing same since   149986  2020-05-05 01:24:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              broken  
 build-amd64                                                  broken  
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          broken  
 test-arm64-arm64-xl-xsm                                      blocked 
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

broken-job build-arm64-xsm broken
broken-job test-armhf-armhf-xl broken
broken-job build-amd64 broken
broken-step build-arm64-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step test-armhf-armhf-xl host-install(4)

Not pushing.

------------------------------------------------------------
commit fe36a173d110fd792f5e337e208a5ed714df1536
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 30 10:47:14 2020 +0100

    x86/amd: Initial support for Fam19h processors
    
    Fam19h is very similar to Fam17h in these regards.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 0c9751b53c2ee135fd484a03fd47f3bb5fbe63b8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 4 11:54:35 2020 +0200

    x86/HyperV: correct hv_hcall_page for xen.efi build
    
    Along the lines of what the not reverted part of 3c4b2eef4941 ("x86:
    refine link time stub area related assertion") did, we need to transform
    the absolute HV_HCALL_PAGE into the image base relative hv_hcall_page
    (or else there'd be no need for two distinct symbols). Otherwise
    mkreloc, as used for generating the base relocations of xen.efi, will
    spit out warnings like "Difference at .text:0009b74f is 0xc0000000
    (expected 0x40000000)". As long as the offending relocations are PC
    relative ones, the generated binary is correct afaict, but if there ever
    was the absolute address stored, xen.efi would miss a fixup for it.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit b0f666c569b8af6a51ab8aeec3664d6acd1abee9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 4 11:53:42 2020 +0200

    x86/EFI: correct section offsets in mkreloc diagnostics
    
    These are more helpful if they point at the address where the relocated
    value starts, rather than at the specific byte of the difference.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 17b997aa1edb9eb8d9bd1958457ff50927f46832
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon May 4 11:53:01 2020 +0200

    x86/hap: be more selective with assisted TLB flush
    
    When doing an assisted flush on HAP the purpose of the
    on_selected_cpus is just to trigger a vmexit on remote CPUs that are
    in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
    also check that the vCPU is running. Due to the lazy context switching
    done by Xen dirty_cpu won't always be cleared when the guest vCPU is
    not running, and hence relying on is_running allows more fine grained
    control of whether the vCPU is actually running.
    
    I've measured the time of the non-local branch of flush_area_mask
    inside the shim running with 32vCPUs over 100000 executions and
    averaged the result on a large Westmere system (80 ways total). The
    figures where fetched during the boot of a SLES 11 PV guest. The
    results are as follow (less is better):
    
    Non assisted flush with x2APIC:      112406ns
    Assisted flush without this patch:   820450ns
    Assisted flush with this patch:        8330ns
    
    While there also pass NULL as the data parameter of on_selected_cpus,
    the dummy handler doesn't consume the data in any way.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 8d928648fd816f97ba3ebe98ab5d4b4a7def58ff
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 4 11:51:47 2020 +0200

    xenoprof: limit scope of types and #define-s
    
    Quite a few of the items are used by xenoprof.c only, so move them there
    to limit their visibility as well as the amount of re-building needed in
    case of changes. Also drop the inclusion of the public header there.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit e83719b53a9be1c69033b3ded8051d47e3dadab8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 4 11:51:18 2020 +0200

    xenoprof: drop unused struct xenoprof fields
    
    Both is_primary and domain_ready are only ever written to. Drop both
    fields and restrict structure visibility to just the one involved CU.
    While doing so (and just for starters) make "is_compat" properly bool.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Wei Liu <wl@xen.org>

commit 7f6a6e8c0a400d1a073b083fe0b7d25ef74b14e0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 4 11:48:13 2020 +0200

    xenoprof: adjust ordering of page sharing vs domain type setting
    
    Buffer pages should be shared with "ignored" or "active" guests only
    (besides, obviously, the primary profiling domain). Hence domain type
    should be set to "ignored" before unsharing from the primary domain
    (which implies even a previously "passive" domain may then access its
    buffers, albeit that's not very useful unless it gets promoted to
    "active" subsequently), i.e. such that no further writes of records to
    the buffer would occur, and (at least for consistency) also before
    sharing it (with the calling domain) from the XENOPROF_get_buffer path.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Wei Liu <wl@xen.org>
(qemu changes not included)

