Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F520297ADB
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 07:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11446.30365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWBh1-0000KK-7P; Sat, 24 Oct 2020 05:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11446.30365; Sat, 24 Oct 2020 05:02:15 +0000
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
	id 1kWBh1-0000Ju-32; Sat, 24 Oct 2020 05:02:15 +0000
Received: by outflank-mailman (input) for mailman id 11446;
 Sat, 24 Oct 2020 05:02:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IA9X=D7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kWBgy-0000Jp-RR
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 05:02:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2104490-5934-4fb3-b701-10ddb4a6b3d2;
 Sat, 24 Oct 2020 05:02:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWBgw-0004ZQ-Go; Sat, 24 Oct 2020 05:02:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWBgw-0007G9-86; Sat, 24 Oct 2020 05:02:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kWBgw-0003yl-7Y; Sat, 24 Oct 2020 05:02:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IA9X=D7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kWBgy-0000Jp-RR
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 05:02:12 +0000
X-Inumbo-ID: d2104490-5934-4fb3-b701-10ddb4a6b3d2
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d2104490-5934-4fb3-b701-10ddb4a6b3d2;
	Sat, 24 Oct 2020 05:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=2v5+vcQbu56/FoWc89Ti0+ftqYsMjH3eNfUX+QsXp9Y=; b=qJpsYu1sHDn+pu9y0M8pTCMUWa
	21EuHrSwOKzvqohA6427mLPZbWbOVtSqb7LAGngtgb/lB3n26WAtDOlFLWJx4Xlbk4U3QdIZfB8qv
	0Dw2asBUEza9I5+1VllfZM0LDv/MjxCQqKEoZ+/savoQLZPYY0fNlow5cFKv4FkZsiKU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWBgw-0004ZQ-Go; Sat, 24 Oct 2020 05:02:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWBgw-0007G9-86; Sat, 24 Oct 2020 05:02:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWBgw-0003yl-7Y; Sat, 24 Oct 2020 05:02:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156159-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156159: regressions - trouble: blocked/fail
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=4ddd6499d999a7d08cabfda5b0262e473dd5beed
X-Osstest-Versions-That:
    xen=6ca70821b59849ad97c3fadc47e63c1a4af1a78c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Oct 2020 05:02:10 +0000

flight 156159 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156159/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 156117
 build-arm64-xsm               6 xen-build                fail REGR. vs. 156117
 build-armhf                   6 xen-build                fail REGR. vs. 156117

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  4ddd6499d999a7d08cabfda5b0262e473dd5beed
baseline version:
 xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c

Last test of basis   156117  2020-10-23 09:01:23 Z    0 days
Failing since        156120  2020-10-23 14:01:24 Z    0 days    6 attempts
Testing same since   156129  2020-10-23 18:01:24 Z    0 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christian Lindig <christian.lindig@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
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


Not pushing.

------------------------------------------------------------
commit 4ddd6499d999a7d08cabfda5b0262e473dd5beed
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Sun May 24 22:55:06 2020 -0400

    SUPPORT: Add linux device model stubdom to Toolstack
    
    Add qemu-xen linux device model stubdomain to the Toolstack section as a
    Tech Preview.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 06f0598b41f23c9e4cf7d8c5a05b282de92f3a35
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Oct 23 18:03:18 2020 +0200

    x86emul: fix PINSRW and adjust other {,V}PINSR*
    
    The use of simd_packed_int together with no further update to op_bytes
    has lead to wrong signaling of #GP(0) for PINSRW without a 16-byte
    aligned memory operand. Use simd_none instead and override it after
    general decoding with simd_other, like is done for the B/D/Q siblings.
    
    While benign, for consistency also use DstImplicit instead of DstReg
    in x86_decode_twobyte().
    
    PINSR{B,D,Q} also had a stray (redundant) get_fpu() invocation, which
    gets dropped.
    
    For further consistency also
    - use src.bytes instead of op_bytes in relevant memcpy() invocations,
    - avoid the pointless updating of op_bytes (all we care about later is
      that the value be less than 16).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 9af5e2b31b4e6f3892b4614ecd0a619af5d64d7e
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Oct 19 17:27:54 2020 +0200

    tools/libs/store: don't use symbolic links for external files
    
    Instead of using symbolic links to include files from xenstored use
    the vpath directive and an include path.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 588756db020e73e6f5e4407bbf78fbd53f15b731
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Oct 19 17:27:54 2020 +0200

    tools/libs/guest: don't use symbolic links for xenctrl headers
    
    Instead of using symbolic links for accessing the xenctrl private
    headers use an include path instead.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 4664034cdc720a52913bc26358240bb9d3798527
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Oct 19 17:27:54 2020 +0200

    tools/libs: move official headers to common directory
    
    Instead of each library having an own include directory move the
    official headers to tools/include instead. This will drop the need to
    link those headers to tools/include and there is no need any longer
    to have library-specific include paths when building Xen.
    
    While at it remove setting of the unused variable
    PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 154137dfdba334348887baf0be9693c407f7cef3
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Oct 7 08:50:03 2020 +0200

    stubdom: add xenstore pvh stubdom
    
    Add a PVH xenstore stubdom in order to support a Xenstore stubdom on
    a hypervisor built without PV-support.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
    Acked-by: Wei Liu <wl@xen.org>

commit f89955449c5a47ff688e91873bbce4c3670ed9fe
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Oct 23 15:53:10 2020 +0200

    tools/init-xenstore-domain: support xenstore pvh stubdom
    
    Instead of creating the xenstore-stubdom domain first and parsing the
    kernel later do it the other way round. This enables to probe for the
    domain type supported by the xenstore-stubdom and to support both, pv
    and pvh type stubdoms.
    
    Try to parse the stubdom image first for PV support, if this fails use
    HVM. Then create the domain with the appropriate type selected.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 56c1aca6a2bc013f45e7af2fa88605a693402770
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Oct 23 15:53:09 2020 +0200

    tools/init-xenstore-domain: add logging
    
    Add a possibility to do logging in init-xenstore-domain: use -v[...]
    for selecting the log-level as in xl, log to stderr.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 70cf8e9acada638f68c1c597d7580500d9f21c91
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Sep 9 13:59:44 2020 +0200

    maintainers: remove unreachable remus maintainer
    
    The mails for Yang Hongyang are bouncing, remove him from MAINTAINERS
    file.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 032a96e5ef38f96eccfebbf8a0dbd83dc7beb625
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Sep 9 13:59:43 2020 +0200

    maintainers: fix libxl paths
    
    Fix the paths of libxl in the MAINTAINERS file.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
(qemu changes not included)

