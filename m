Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802E77002C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 14:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577136.904032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRts2-0001V6-Hc; Fri, 04 Aug 2023 12:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577136.904032; Fri, 04 Aug 2023 12:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRts2-0001Ro-EH; Fri, 04 Aug 2023 12:25:30 +0000
Received: by outflank-mailman (input) for mailman id 577136;
 Fri, 04 Aug 2023 12:25:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRts0-0001Rd-G5; Fri, 04 Aug 2023 12:25:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRts0-0002lR-CA; Fri, 04 Aug 2023 12:25:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRtrz-0005xW-Th; Fri, 04 Aug 2023 12:25:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qRtrz-0007vQ-TF; Fri, 04 Aug 2023 12:25:27 +0000
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
	bh=T0bC3z+eKvtzEVewTjtM3Dsn01A5HbGHdByCHy/Uo70=; b=7HO7wqwANMpe9np+DGgSX5OK5V
	H/EBvaj/nkE/pxlIhkO/zRn7mK/+mlMU7KUP6z2zQ7c6SV7mY9ijjmjsOJKheSIXPoHi5ewSO04ku
	Gjktvuqp4AYejZ3iA5bI4xDLDRW+CVmniaDsg5NjPmiDkHHQlw6NV6CXwc8hshwEXGFs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182175-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 182175: regressions - FAIL
X-Osstest-Failures:
    libvirt:build-arm64-pvops:kernel-build:fail:regression
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=1ca3c339a119242b4a511fc9cf7b561a77d2301e
X-Osstest-Versions-That:
    libvirt=99349ba18e726465215a71f28d2146a0a2adb65d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Aug 2023 12:25:27 +0000

flight 182175 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182175/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 182131

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182131
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182131
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182131
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              1ca3c339a119242b4a511fc9cf7b561a77d2301e
baseline version:
 libvirt              99349ba18e726465215a71f28d2146a0a2adb65d

Last test of basis   182131  2023-08-02 19:15:02 Z    1 days
Testing same since   182175  2023-08-04 01:18:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laine Stump <laine@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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
commit 1ca3c339a119242b4a511fc9cf7b561a77d2301e
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 10:25:43 2023 +0200

    lib: Prefer sizeof(variable) instead of sizeof(type) in memset
    
    If one of previous commits taught us something, it's that:
    sizeof(variable) and sizeof(type) are not the same. Especially
    because for live enough code the type might change (e.g. as we
    use autoptr more). And since we don't get any warnings when an
    incorrect length is passed to memset() it is easy to mess up. But
    with sizeof(variable) instead, it's not as easy. Therefore,
    switch to using memset(variable, 0, sizeof(*variable)), or its
    alternatives, depending on level of pointers.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 4f159d426921bb81375fe5404ff88aab9437972a
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 11:48:30 2023 +0200

    lib: Finish using struct zero initializer manually
    
    There are some cases left after previous commit which were not
    picked up by coccinelle. Mostly, becuase the spatch was not
    generic enough. We are left with cases like: two variables
    declared on one line, a variable declared in #ifdef-s (there are
    notoriously difficult for coccinelle), arrays, macro definitions,
    etc.
    
    Finish what coccinelle started, by hand.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit b20a5e9a4d847b06030b07a5387da22df0005011
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Aug 2 10:09:52 2023 +0200

    lib: use struct zero initializer instead of memset
    
    This is a more concise approach and guarantees there is
    no time window where the struct is uninitialized.
    
    Generated using the following semantic patch:
    
      @@
      type T;
      identifier X;
      @@
      -  T X;
      +  T X = { 0 };
         ... when exists
      (
      -  memset(&X, 0, sizeof(X));
      |
      -  memset(&X, 0, sizeof(T));
      )
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 7ce0fbccf1df61e7dfd86d1cbb863f82c36c494c
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 09:45:14 2023 +0200

    virnetdaemon.c: Use struct zero initializer instead of memset
    
    Ideally, these would be fixed by coccinelle (see next commit),
    but because of various reasons they aren't. Fix them manually.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 3b95df9edaf5c1ab0aaa30727729f7fcc9122ddb
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 11:48:57 2023 +0200

    virnetclient: Update comment about memset()
    
    Instead of suggesting to zero structs out using memset() we
    should suggest initializing structs with zero initializer.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 3d7faaf71213d5dc004a0f0c9df2e729e7cf1d0e
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 10:43:13 2023 +0200

    virnetlink: Drop unused variable from virNetlinkCommand()
    
    The fds variable inside of virNetlinkCommand() is not used
    really. It's passed to memset() (hence compilers do not
    complain), but that's about it. Drop it.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit ea5352334af4ce9151e826db7a0dc3f02a211b6c
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 10:30:12 2023 +0200

    virfirewalld: Drop useless memset() in virFirewallDApplyRule()
    
    This is a residue of v6.8.0-rc1~100. The error variable inside of
    virFirewallDApplyRule() is already initialized to NULL. There's
    no need to memset() it to zero again.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 258fc73cf051419d19947059a98f1d6a2d1d4910
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 09:39:03 2023 +0200

    remote_driver: Drop explicit memset(&sargs) in remoteAuthSASL()
    
    Inside of remoteAuthSASL() the sargs variable is already
    initialized to zero during declaration. There's no need to
    memset() it again as it's unused in between it's declaration and
    said memset().
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 5aba19868732e86e610d84e11d8adcbd1046d5b9
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Aug 3 08:52:57 2023 +0200

    qemu: Don't reuse variable in processSerialChangedEvent()
    
    When a VSERPORT_CHANGE event is processed, we firstly do a little
    detour and try to detect whether the event is coming from guest
    agent. If so, we notify threads that are currently talking to the
    agent about this fact. Then we proceed with usual event
    processing (BeginJob(), update domain def, emit event, and so
    on).
    
    In both cases we use the same @dev variable to refer to domain
    device. While this works, it will make writing semantic patch
    unnecessary harder (see next commit(s)). Therefore, introduce a
    separate variable for the detour code.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 039b16e41ed1648646c4b35947428ba1b56d8e2a
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Aug 2 15:30:04 2023 +0200

    Decrease scope of some variables
    
    There are couple of variables that are declared at function
    beginning but then used solely within a block (either for() loop
    or if() statement). And just before their use they are zeroed
    explicitly using memset(). Decrease their scope, use struct zero
    initializer and drop explicit memset().
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 6b4ce69251373379d63b539050ab94c579fd1616
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Aug 2 15:42:31 2023 +0200

    virt-aa-helper: Use struct zero initializer instead of memset
    
    This is similar to the previous commit, except this is for a
    different type (vahControl) and also fixes the case where _ctl is
    passed not initialized to vah_error() (via ctl pointer so that's
    probably why compilers don't complain).
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit 33b794898364be55f19eaf9a834cd095b75e1b71
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Aug 2 14:57:44 2023 +0200

    tools: Fix vshControl declaration and initialization
    
    Both virsh and virt-admin have vshControl typed variables and
    also pointers to these variables. In both cases these are
    declared on a single line. Do the following:
    
      1) break declaration into two lines,
      2) use struct zero initializer for vshControl and
         virshControl/vshAdmControl structs,
      3) drop explicit memset(.., 0, ...) ;
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Claudio Fontana <cfontana@suse.de>

commit a8262cb331db0f1a706edbadffc2cd5b01e44be6
Author: Laine Stump <laine@redhat.com>
Date:   Thu Jul 13 11:51:28 2023 -0400

    qemu: don't add --mac-addr option to passt commandline
    
    When I implemented passt support in libvirt, I saw the --mac-addr
    option on the passt commandline, immediately assumed that this was
    used for setting the guest interface's mac address somewhere within
    passt, and read no further. As a result, "--mac-addr" is always added
    to the passt commandline, specifying the setting from <mac
    addr='blah'/> in the guest's interface config.
    
    But as pointed out in this bugzilla comment:
    
    https://bugzilla.redhat.com/2184967#c8
    
    That is *not at all* what passt's --mac-addr option does. Instead, it
    is used to force the *remote* mac address for incoming traffic to a
    specific value. So setting --mac-addr results in all traffic on the
    interface having the same (the guest's) mac address for both source
    and destination in all traffic. Surprisingly, this still works, so
    nobody noticed it during testing.
    
    The proper thing is to not specify any mac address to passt - the
    remote MAC addresses can and should remain untouched, and the local
    MAC address will end up being known to passt just by the guest sending
    out packets with that MAC address.
    
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

