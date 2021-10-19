Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030BE433763
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213251.371431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpOH-0004Kn-LY; Tue, 19 Oct 2021 13:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213251.371431; Tue, 19 Oct 2021 13:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpOH-0004In-HY; Tue, 19 Oct 2021 13:42:53 +0000
Received: by outflank-mailman (input) for mailman id 213251;
 Tue, 19 Oct 2021 13:42:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcpOF-0004IV-IQ; Tue, 19 Oct 2021 13:42:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcpOF-0002US-Cx; Tue, 19 Oct 2021 13:42:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcpOF-0007HC-4Y; Tue, 19 Oct 2021 13:42:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mcpOF-0007uC-42; Tue, 19 Oct 2021 13:42:51 +0000
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
	bh=+kxlXnsunxtZ9Rj7TETCO0ElB37z2uj1ovA+l+U/3qY=; b=UrglKglpsci2QS4eCtfzThK9rh
	8GFHPlRbF7zT0CDHJRKTtcCUqHaLE9poPY7PPlkrmLlAht8R2m4Fa8fKWzQ1nSpp65g1Z2XVlDhSL
	Bu7JM5nOwGSEFOH56d27yOyjrrUo+n4FuRhPen9D8IsWrTiBvakKJi9g9nVW7UxNc/Fk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165668-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165668: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:leak-check/basis(11):fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:leak-check/basis(11):fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:leak-check/basis(11):fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:leak-check/basis(11):fail:regression
X-Osstest-Versions-This:
    xen=b7635526acffbe4ad8ad16fd92812c57742e54c2
X-Osstest-Versions-That:
    xen=c11b8d25fbe9c0155e91409594ea6701008409ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Oct 2021 13:42:51 +0000

flight 165668 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165668/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 11 leak-check/basis(11) fail REGR. vs. 165635
 test-amd64-amd64-libvirt     11 leak-check/basis(11)     fail REGR. vs. 165635
 test-arm64-arm64-xl-xsm      11 leak-check/basis(11)     fail REGR. vs. 165635
 test-armhf-armhf-xl          11 leak-check/basis(11)     fail REGR. vs. 165635

version targeted for testing:
 xen                  b7635526acffbe4ad8ad16fd92812c57742e54c2
baseline version:
 xen                  c11b8d25fbe9c0155e91409594ea6701008409ed

Last test of basis   165635  2021-10-18 13:00:26 Z    1 days
Failing since        165638  2021-10-18 16:01:36 Z    0 days    5 attempts
Testing same since   165668  2021-10-19 10:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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
commit b7635526acffbe4ad8ad16fd92812c57742e54c2
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 19 10:08:30 2021 +0200

    x86/paging: restrict physical address width reported to guests
    
    Modern hardware may report more than 48 bits of physical address width.
    For paging-external guests our P2M implementation does not cope with
    larger values. Telling the guest of more available bits means misleading
    it into perhaps trying to actually put some page there (like was e.g.
    intermediately done in OVMF for the shared info page).
    
    While there also convert the PV check to a paging-external one (which in
    our current code base are synonyms of one another anyway).
    
    Fixes: 5dbd60e16a1f ("x86/shadow: Correct guest behaviour when creating PTEs above maxphysaddr")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 525eac931794434593c39a1d1cd739ad8b326e27
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 19 10:07:42 2021 +0200

    x86/PV: replace assertions in '0' debug key stack dumping
    
    While it was me to add them, I'm afraid I don't see justification for
    the assertions: A vCPU may very well have got preempted while in user
    mode. Limit compat guest user mode stack dumps to the containing page
    (like is done when using do_page_walk()), and suppress user mode stack
    dumping altogether for 64-bit domains.
    
    Fixes: cc0de53a903c ("x86: improve output resulting from sending '0' over serial")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 4843546fef5e024d5754f722fd01a8dfb482ac7d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 19 10:07:00 2021 +0200

    x86/PV: make '0' debug key dump Dom0's stacks again
    
    The conversion to __get_guest() failed to account for the fact that for
    remote vCPU-s dumping gets done through a pointer obtained from
    map_domain_page(): __get_guest() arranges for (apparent) accesses to
    hypervisor space to cause #GP(0).
    
    Fixes: 6a1d72d3739e ('x86: split __{get,put}_user() into "guest" and "unsafe" variants')
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 5e97b97bc254b0ee23f701a4d5a317853136d288
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 19 10:05:10 2021 +0200

    x86/altp2m: don't consider "active" when enabling failed
    
    We should not rely on guests to not use altp2m after reporting failure
    of HVMOP_altp2m_set_domain_state to them. Set "active" back to false in
    this case.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit d6e38eea2d806c53d976603717aebf6e5de30a1e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 19 10:04:13 2021 +0200

    x86/AMD: make HT range dynamic for Fam17 and up
    
    At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
    address range") documentation correctly stated that the range was
    completely fixed. For Fam17 and newer, it lives at the top of physical
    address space, though.
    
    To correctly determine the top of physical address space, we need to
    account for their physical address reduction, hence the calculation of
    paddr_bits also gets adjusted.
    
    While for paddr_bits < 40 the HT range is completely hidden, there's no
    need to suppress the range insertion in that case: It'll just have no
    real meaning.
    
    Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit a8cddbac5051020bb4a59a7f0ea27500c51063fb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 19 10:02:39 2021 +0200

    x86emul: de-duplicate scatters to the same linear address
    
    The SDM specifically allows for earlier writes to fully overlapping
    ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
    would crash it if varying data was written to the same address. Detect
    overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
    be quite a bit more difficult. To maintain proper faulting behavior,
    instead of dropping earlier write instances of fully overlapping slots
    altogether, write the data of the final of these slots multiple times.
    (We also can't pull ahead the [single] write of the data of the last of
    the slots, clearing all involved slots' op_mask bits together, as this
    would yield incorrect results if there were intervening partially
    overlapping ones.)
    
    Note that due to cache slot use being linear address based, there's no
    similar issue with multiple writes to the same physical address (mapped
    through different linear addresses).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 3ae80dea4601764818d1e5b84bd1e4479c0d4790
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Sep 10 07:55:17 2021 +0200

    stubdom: disable building pv-grub
    
    The stubdom based pv-grub is using a very outdated version of grub
    (0.97) and should not be used any longer. Mainline grub has support for
    PV guests for a long time now, so that should be used as a boot loader
    of a PV domain.
    
    So disable building pv-grub per default. In case someone really wants
    to continue using it he/she can still use a pv-grub binary from an older
    Xen version or manually enable building it via:
    
      configure --enable-pv-grub
    
    [ This was already disabled in osstest by 8dee6e333622
      "make-flight: Drop pvgrub (pvgrub1) tests" -iwj ]
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
    Acked-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 9cfeb83cbe23a873de512211d7ecd989348b9df0
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Oct 12 15:41:48 2021 +0200

    tools/xenstore: set open file descriptor limit for xenstored
    
    Add a configuration item for the maximum number of open file
    descriptors xenstored should be allowed to have.
    
    The default should be "unlimited" in order not to restrict xenstored
    in the number of domains it can support, but unfortunately the kernel
    is normally limiting the maximum value via /proc/sys/fs/nr_open [1],
    [2]. So check that file to exist and if it does, limit the maximum
    value to the one specified by /proc/sys/fs/nr_open.
    
    As an aid for the admin configuring the value add a comment specifying
    the common needs of xenstored for the different domain types.
    
    [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60fd760fb9ff7034360bab7137c917c0330628c2
    [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2d64fb6cae9aae480f6a46cfe79f8d7d48b59f
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit f282182af32939107d47943aba242d3189ec6f90
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Oct 12 15:41:47 2021 +0200

    tools/xenstore: set oom score for xenstore daemon on Linux
    
    Xenstored is absolutely mandatory for a Xen host and it can't be
    restarted, so being killed by OOM-killer in case of memory shortage is
    to be avoided.
    
    Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
    translates to 50% of dom0 memory size) in order to allow xenstored to
    use large amounts of memory without being killed.
    
    The percentage of dom0 memory above which the oom killer is allowed to
    kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
    xencommons.
    
    Make sure the pid file isn't a left-over from a previous run delete it
    before starting xenstored.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

