Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B5513873
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 17:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316652.535631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk69f-0004zD-Iq; Thu, 28 Apr 2022 15:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316652.535631; Thu, 28 Apr 2022 15:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk69f-0004xS-FR; Thu, 28 Apr 2022 15:34:07 +0000
Received: by outflank-mailman (input) for mailman id 316652;
 Thu, 28 Apr 2022 15:34:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nk69e-0004xI-Cm; Thu, 28 Apr 2022 15:34:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nk69e-0000qQ-BS; Thu, 28 Apr 2022 15:34:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nk69e-0006nF-0Q; Thu, 28 Apr 2022 15:34:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nk69e-0004Ul-00; Thu, 28 Apr 2022 15:34:06 +0000
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
	bh=xFuxd+txDThp6hr31UoPgEM/14hkbCirZpvaipyi8l4=; b=zmviVfWTlL/HiUYi0w5ZRKbgB3
	DurBSU1uJH9HM2uAXVx+fRsfTpVzGUqal27j4KZ6/TSvYaBjPmdi7ETIWbmewbtrDz9OGA3wmUN7M
	NQAK0p/UzJ5+P3M1IqT2G1z2wS2z81Z936R+fS2b4O5uXQNf2hW6hxFxb2LyngGU9GSQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169807-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169807: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2c992810854a15b41be920519ce83a4a328d5168
X-Osstest-Versions-That:
    xen=da28439ba55b8a571032b3358af567cff749f612
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 Apr 2022 15:34:06 +0000

flight 169807 xen-unstable-smoke real [real]
flight 169817 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169807/
http://logs.test-lab.xenproject.org/osstest/logs/169817/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 169800

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2c992810854a15b41be920519ce83a4a328d5168
baseline version:
 xen                  da28439ba55b8a571032b3358af567cff749f612

Last test of basis   169800  2022-04-27 23:01:43 Z    0 days
Testing same since   169807  2022-04-28 09:01:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
commit 2c992810854a15b41be920519ce83a4a328d5168
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 28 10:00:49 2022 +0200

    x86+libxl: correct p2m (shadow) memory pool size calculation
    
    The reference "to shadow the resident processes" is applicable to
    domains (potentially) running in shadow mode only. Adjust the
    calculations accordingly. This, however, requires further parameters.
    Since the original function is deprecated anyway, and since it can't be
    changed (for being part of a stable ABI), introduce a new (internal
    only) function, with the deprecated one simply becoming a wrapper.
    
    In dom0_paging_pages() also take the opportunity and stop open-coding
    DIV_ROUND_UP().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 9c432b876bf518866d431bda73f2be1250f688eb
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Thu Apr 28 10:00:18 2022 +0200

    x86/mwait-idle: add SPR support
    
    Add Sapphire Rapids Xeon support.
    
    Up until very recently, the C1 and C1E C-states were independent, but this
    has changed in some new chips, including Sapphire Rapids Xeon (SPR). In these
    chips the C1 and C1E states cannot be enabled at the same time. The "C1E
    promotion" bit in 'MSR_IA32_POWER_CTL' also has its semantics changed a bit.
    
    Here are the C1, C1E, and "C1E promotion" bit rules on Xeons before SPR.
    
    1. If C1E promotion bit is disabled.
       a. C1  requests end up with C1  C-state.
       b. C1E requests end up with C1E C-state.
    2. If C1E promotion bit is enabled.
       a. C1  requests end up with C1E C-state.
       b. C1E requests end up with C1E C-state.
    
    Here are the C1, C1E, and "C1E promotion" bit rules on Sapphire Rapids Xeon.
    1. If C1E promotion bit is disabled.
       a. C1  requests end up with C1 C-state.
       b. C1E requests end up with C1 C-state.
    2. If C1E promotion bit is enabled.
       a. C1  requests end up with C1E C-state.
       b. C1E requests end up with C1E C-state.
    
    Before SPR Xeon, the 'intel_idle' driver was disabling C1E promotion and was
    exposing C1 and C1E as independent C-states. But on SPR, C1 and C1E cannot be
    enabled at the same time.
    
    This patch adds both C1 and C1E states. However, C1E is marked as with the
    "CPUIDLE_FLAG_UNUSABLE" flag, which means that in won't be registered by
    default. The C1E promotion bit will be cleared, which means that by default
    only C1 and C6 will be registered on SPR.
    
    The next patch will add an option for enabling C1E and disabling C1 on SPR.
    
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9edf3c0ffef0
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 3f6aef8a7a371ce35e83c4a85022ff0e6295d91a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 28 09:59:14 2022 +0200

    x86/mwait-idle: switch to asm/intel-family.h naming
    
    This brings us (back) closer to the original Linux source.
    
    While touching mwait_idle_state_table_update() also drop a stray leading
    blank.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 6cf1398ba9e3f8ea64d58930288a6dffbdb7c207
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Apr 28 09:58:42 2022 +0200

    xen/public: add new macro to ring.h
    
    For the initialization of a ring page by the frontend two macros are
    available in ring.h: SHARED_RING_INIT() and FRONT_RING_INIT().
    
    All known users use always both of them in direct sequence.
    
    Add another macro XEN_FRONT_RING_INIT() combining the two macros.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

