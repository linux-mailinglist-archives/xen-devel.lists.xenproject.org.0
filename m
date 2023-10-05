Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844167BAE2B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 23:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613140.953467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoWD0-0001P1-6y; Thu, 05 Oct 2023 21:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613140.953467; Thu, 05 Oct 2023 21:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoWD0-0001MQ-3H; Thu, 05 Oct 2023 21:48:38 +0000
Received: by outflank-mailman (input) for mailman id 613140;
 Thu, 05 Oct 2023 21:48:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qoWCy-0001MG-Kc; Thu, 05 Oct 2023 21:48:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qoWCx-0001N7-Jt; Thu, 05 Oct 2023 21:48:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qoWCx-0007Tl-8X; Thu, 05 Oct 2023 21:48:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qoWCx-0005pj-6M; Thu, 05 Oct 2023 21:48:35 +0000
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
	bh=wlsvVQlEMvQEqOO6o6pQhJ0f1iW45h/dW51Lda2+5f8=; b=rDu5pgY2JzH+PzmwV7j643ZE6B
	r4Y3hWYUZPXPlO74Ps6eFSIis4RlrSS70GfFaDRwrcRk39uMdNWDYsM4cScRJjN2lNoU4frtqOjw/
	KuguqIazdqxMVWqcnuwt/7nF0gLGPQfVpApmrLIHje+hnugwfHzYl4aFOV4UhrpWoQPo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183272-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183272: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=295514ff7550626de4fb5e43b51deb25d9331cd5
X-Osstest-Versions-That:
    xen=02c98966360b76052779b0186784437af88f301e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Oct 2023 21:48:35 +0000

flight 183272 xen-unstable-smoke real [real]
flight 183274 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183272/
http://logs.test-lab.xenproject.org/osstest/logs/183274/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 183270

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  295514ff7550626de4fb5e43b51deb25d9331cd5
baseline version:
 xen                  02c98966360b76052779b0186784437af88f301e

Last test of basis   183270  2023-10-05 13:03:52 Z    0 days
Testing same since   183272  2023-10-05 16:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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


Not pushing.

------------------------------------------------------------
commit 295514ff7550626de4fb5e43b51deb25d9331cd5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:27 2023 +0200

    common: convert vCPU info area registration
    
    Switch to using map_guest_area(). Noteworthy differences from
    map_vcpu_info():
    - remote vCPU-s are paused rather than checked for being down (which in
      principle can change right after the check),
    - the domain lock is taken for a much smaller region,
    - the error code for an attempt to re-register the area is now -EBUSY,
    - we could in principle permit de-registration when no area was
      previously registered (which would permit "probing", if necessary for
      anything).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 60e544a8c58fdc720de05f6a721178f9516436d1
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:26 2023 +0200

    x86: introduce GADDR based secondary time area registration alternative
    
    The registration by virtual/linear address has downsides: The access is
    expensive for HVM/PVH domains. Furthermore for 64-bit PV domains the area
    is inaccessible (and hence cannot be updated by Xen) when in guest-user
    mode.
    
    Introduce a new vCPU operation allowing to register the secondary time
    area by guest-physical address.
    
    An at least theoretical downside to using physically registered areas is
    that PV then won't see dirty (and perhaps also accessed) bits set in its
    respective page table entries.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit d5df44275e7af690ef18b56cc58762ce33a37149
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:25 2023 +0200

    domain: introduce GADDR based runstate area registration alternative
    
    The registration by virtual/linear address has downsides: At least on
    x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
    PV domains the area is inaccessible (and hence cannot be updated by Xen)
    when in guest-user mode.
    
    Introduce a new vCPU operation allowing to register the runstate area by
    guest-physical address.
    
    An at least theoretical downside to using physically registered areas is
    that PV then won't see dirty (and perhaps also accessed) bits set in its
    respective page table entries.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit eadc288cbb0ddc432ff8c9c639fb25b7538325de
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:24 2023 +0200

    domain: map/unmap GADDR based shared guest areas
    
    The registration by virtual/linear address has downsides: At least on
    x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
    PV domains the areas are inaccessible (and hence cannot be updated by
    Xen) when in guest-user mode, and for HVM guests they may be
    inaccessible when Meltdown mitigations are in place. (There are yet
    more issues.)
    
    In preparation of the introduction of new vCPU operations allowing to
    register the respective areas (one of the two is x86-specific) by
    guest-physical address, flesh out the map/unmap functions.
    
    Noteworthy differences from map_vcpu_info():
    - areas can be registered more than once (and de-registered),
    - remote vCPU-s are paused rather than checked for being down (which in
      principle can change right after the check),
    - the domain lock is taken for a much smaller region.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit c4dde71e3e6961f817e2a574ce4918041cb30fb9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Oct 4 15:53:31 2023 +0200

    x86/mem-sharing: copy GADDR based shared guest areas
    
    In preparation of the introduction of new vCPU operations allowing to
    register the respective areas (one of the two is x86-specific) by
    guest-physical address, add the necessary fork handling (with the
    backing function yet to be filled in).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit c2e285ea0e6dea9cc6f4578e49d76075a153baa0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:22 2023 +0200

    x86: update GADDR based secondary time area
    
    Before adding a new vCPU operation to register the secondary time area
    by guest-physical address, add code to actually keep such areas up-to-
    date.
    
    Note that pages aren't marked dirty when written to (matching the
    handling of space mapped by map_vcpu_info()), on the basis that the
    registrations are lost anyway across migration (or would need re-
    populating at the target for transparent migration). Plus the contents
    of the areas in question have to be deemed volatile in the first place
    (so saving a "most recent" value is pretty meaningless even for e.g.
    snapshotting).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit e1ddb822ca2e3c332d42d508e2a5fbd7be018815
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:21 2023 +0200

    domain: update GADDR based runstate guest area
    
    Before adding a new vCPU operation to register the runstate area by
    guest-physical address, add code to actually keep such areas up-to-date.
    
    Note that updating of the area will be done exclusively following the
    model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
    based registered areas.
    
    Note further that pages aren't marked dirty when written to (matching
    the handling of space mapped by map_vcpu_info()), on the basis that the
    registrations are lost anyway across migration (or would need re-
    populating at the target for transparent migration). Plus the contents
    of the areas in question have to be deemed volatile in the first place
    (so saving a "most recent" value is pretty meaningless even for e.g.
    snapshotting).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit c4630e316240508f3fb619678adc4cfb47bf13d2
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:20 2023 +0200

    domain: GADDR based shared guest area registration alternative - teardown
    
    In preparation of the introduction of new vCPU operations allowing to
    register the respective areas (one of the two is x86-specific) by
    guest-physical address, add the necessary domain cleanup hooks.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 826da6e30cf37a22b3f32dba33477856125df91b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Oct 2 17:11:19 2023 +0200

    x86/shim: zap runstate and time area handles during shutdown
    
    While likely the guest would just re-register the same areas after
    a possible resume, let's not take this for granted and avoid the risk of
    otherwise corrupting guest memory.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 9a499a84a2724757ad59b684e7858dfb60521290
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Mon Oct 2 17:11:18 2023 +0200

    mem_sharing/fork: do not attempt to populate vcpu_info page
    
    Instead let map_vcpu_info() and it's call to get_page_from_gfn()
    populate the page in the child as needed.  Also remove the bogus
    copy_domain_page(): should be placed before the call to map_vcpu_info(),
    as the later can update the contents of the vcpu_info page.
    
    Note that this eliminates a bug in copy_vcpu_settings(): The function did
    allocate a new page regardless of the GFN already having a mapping, thus in
    particular breaking the case of two vCPU-s having their info areas on the same
    page.
    
    Fixes: 41548c5472a3 ('mem_sharing: VM forking')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>
(qemu changes not included)

