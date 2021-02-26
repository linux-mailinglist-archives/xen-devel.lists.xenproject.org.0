Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C32326596
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90445.171209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFg43-0000ZZ-99; Fri, 26 Feb 2021 16:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90445.171209; Fri, 26 Feb 2021 16:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFg43-0000Yx-3Q; Fri, 26 Feb 2021 16:34:03 +0000
Received: by outflank-mailman (input) for mailman id 90445;
 Fri, 26 Feb 2021 16:34:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFg41-0000Yp-JC; Fri, 26 Feb 2021 16:34:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFg41-0007fy-9T; Fri, 26 Feb 2021 16:34:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFg41-0002MT-1r; Fri, 26 Feb 2021 16:34:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFg41-0007pI-1K; Fri, 26 Feb 2021 16:34:01 +0000
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
	bh=DZ3blG6LYlK0WHXW1LUbvStEfg3vRMB+2lU3///060Q=; b=59uRkxb0FJfYQ+N4VU378fuZ+8
	5A3foZ5qDzcN2zY33gNgeYXlF8ZV3TxEkqojNnmx6DhzMdkUtKPzHPAPYlhe1UljuQh7Fk/ix9xLj
	Ea8q1m5ISo1XdX1w8KVMoVKiv77MMBw1486RN6px7vUAQPywdhi1WIT1+jXAdUSR1Q4I=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159709-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159709: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c4441ab1f1d506a942002ccc55fdde2fe30ef626
X-Osstest-Versions-That:
    xen=109e8177fd4a225e7025c4c17d2c9537b550b4ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Feb 2021 16:34:01 +0000

flight 159709 xen-unstable-smoke real [real]
flight 159713 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/159709/
http://logs.test-lab.xenproject.org/osstest/logs/159713/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 159704

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c4441ab1f1d506a942002ccc55fdde2fe30ef626
baseline version:
 xen                  109e8177fd4a225e7025c4c17d2c9537b550b4ed

Last test of basis   159704  2021-02-26 10:01:26 Z    0 days
Testing same since   159709  2021-02-26 13:00:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
commit c4441ab1f1d506a942002ccc55fdde2fe30ef626
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 25 15:46:10 2021 +0000

    dmop: Add XEN_DMOP_nr_vcpus
    
    Curiously absent from the stable API/ABIs is an ability to query the number of
    vcpus which a domain has.  Emulators need to know this information in
    particular to know how many stuct ioreq's live in the ioreq server mappings.
    
    In practice, this forces all userspace to link against libxenctrl to use
    xc_domain_getinfo(), which rather defeats the purpose of the stable libraries.
    
    Introduce a DMOP to retrieve this information and surface it in
    libxendevicemodel to help emulators shed their use of unstable interfaces.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    ---
    CC: Jan Beulich <JBeulich@suse.com>
    CC: Roger Pau Monné <roger.pau@citrix.com>
    CC: Wei Liu <wl@xen.org>
    CC: Paul Durrant <paul@xen.org>
    CC: Stefano Stabellini <sstabellini@kernel.org>
    CC: Julien Grall <julien@xen.org>
    CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
    CC: Ian Jackson <iwj@xenproject.org>
    
    For 4.15.  This was a surprise discovery in the massive ABI untangling effort
    I'm currently doing for XenServer's new build system.
    
    This is one new read-only op to obtain information which isn't otherwise
    available under a stable API/ABI.  As such, its risk for 4.15 is very low,
    with a very real quality-of-life improvement for downstreams.
    
    I realise this is technically a new feature and we're long past feature
    freeze, but I'm hoping that "really lets some emulators move off the unstable
    libraries" is sufficiently convincing argument.
    
    It's not sufficient to let Qemu move off unstable libraries yet - at a
    minimum, the add_to_phymap hypercalls need stabilising to support PCI
    Passthrough and BAR remapping.
    
    I'd prefer not to duplicate the op handling between ARM and x86, and if this
    weren't a release window, I'd submit a prereq patch to dedup the common dmop
    handling.  That can wait to 4.16 at this point.  Also, this op ought to work
    against x86 PV guests, but fixing that up will also need this rearrangement
    into common code, so needs to wait.

commit 615367b5275a5b0123f1f1ee86c985fab234a5a4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 25 16:54:17 2021 +0000

    x86/dmop: Properly fail for PV guests
    
    The current code has an early exit for PV guests, but it returns 0 having done
    nothing.
    
    Fixes: 524a98c2ac5 ("public / x86: introduce __HYPERCALL_dm_op...")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

