Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC96A13FB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 00:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500725.772208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVLLP-0007w5-Dv; Thu, 23 Feb 2023 23:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500725.772208; Thu, 23 Feb 2023 23:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVLLP-0007tj-Ak; Thu, 23 Feb 2023 23:49:47 +0000
Received: by outflank-mailman (input) for mailman id 500725;
 Thu, 23 Feb 2023 23:49:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVLLO-0007tZ-EY; Thu, 23 Feb 2023 23:49:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVLLO-0003fH-9o; Thu, 23 Feb 2023 23:49:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVLLN-00049W-UV; Thu, 23 Feb 2023 23:49:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pVLLN-0003iS-Ty; Thu, 23 Feb 2023 23:49:45 +0000
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
	bh=nGO/FPH/wqBCnZCiQfGN0+p6z6Njvv4LM9zmIsFSMwU=; b=DrmWLZJOC9EslfaHNSnF3RCtHQ
	dyu4frZ9itQJqghVvZ6wHvjNzJQeIUUKp0n62zUJT2myXoCOO/T1/X/wBVXPqXAlPFd5xuX0HCCN+
	Q5RppOSeFLad4FOvWLv4OYaaF9CDjhCqHJwYb1lD8bY62zFQviuOjurIxV98Q7coVfqs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178202-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 178202: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    libvirt:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    libvirt:test-arm64-arm64-libvirt:xen-install:fail:heisenbug
    libvirt:test-arm64-arm64-libvirt-qcow2:guest-start/debian.repeat:fail:heisenbug
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:build-armhf-libvirt:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    libvirt:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    libvirt=6af048339fe6b22fb25cf62f7ec4d1bddb7ad1d6
X-Osstest-Versions-That:
    libvirt=110d209263022c6029e398116154562518e4a474
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Feb 2023 23:49:45 +0000

flight 178202 libvirt real [real]
flight 178283 libvirt real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/178202/
http://logs.test-lab.xenproject.org/osstest/logs/178283/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 178089

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-libvirt      7 xen-install         fail pass in 178283-retest
 test-arm64-arm64-libvirt-qcow2 17 guest-start/debian.repeat fail pass in 178283-retest

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt    15 migrate-support-check fail in 178283 never pass
 test-arm64-arm64-libvirt 16 saverestore-support-check fail in 178283 never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 libvirt              6af048339fe6b22fb25cf62f7ec4d1bddb7ad1d6
baseline version:
 libvirt              110d209263022c6029e398116154562518e4a474

Last test of basis   178089  2023-02-22 04:20:19 Z    1 days
Testing same since   178202  2023-02-23 04:18:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Jiri Denemark <jdenemar@redhat.com>
  Laine Stump <laine@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Stefano Brivio <sbrivio@redhat.com>
  Temuri Doghonadze <temuri.doghonadze@gmail.com>
  Weblate <noreply@weblate.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 fail    


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
commit 6af048339fe6b22fb25cf62f7ec4d1bddb7ad1d6
Author: Weblate <noreply@weblate.org>
Date:   Wed Feb 22 15:22:29 2023 +0100

    Update translation files
    
    Updated by "Update PO files to match POT (msgmerge)" hook in Weblate.
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/
    
    Co-authored-by: Weblate <noreply@weblate.org>
    Signed-off-by: Fedora Weblate Translation <i18n@lists.fedoraproject.org>

commit 5e406bdaef016f8da25f680f4dbfb8678f69750c
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Feb 22 15:16:26 2023 +0100

    po: Refresh potfile for v9.1.0
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit 9541ce080a0896411bebb299f47e39112810a648
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Thu Feb 16 15:51:03 2023 +0000

    docs/kbase: fix example for SEV validation
    
    The offline validation example needs to include the firmware path,
    and is also missing line continuation markers.
    
    Reviewed-by: Ján Tomko <jtomko@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit a020a2541a6c1926d3de6a11738ad117932c6252
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Thu Feb 16 14:57:56 2023 +0000

    rpm: add missing deps for the virt-qemu-sev-validate
    
    The RPM automatic deps generator for python does not pick these up
    
    Reviewed-by: Ján Tomko <jtomko@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 4d3b2d77d014fe4a7a1fa8123b71cc7b41ee5beb
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Thu Feb 16 14:55:11 2023 +0000

    docs: refer to --firmware instead of --loader
    
    The --loader syntax was left over from an earlier version of the code
    before it was renamed to --firmware.
    
    Reviewed-by: Ján Tomko <jtomko@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit f62ce81b8a57d8033be4c661e071cbd12b83bf7b
Author: Laine Stump <laine@redhat.com>
Date:   Tue Feb 21 01:16:04 2023 -0500

    qemu: respond to NETDEV_STREAM_DISCONNECTED event
    
    When a QEMU netdev is of type "stream", if the socket it uses for
    connectivity to the host network gets closed, then QEMU will send a
    NETDEV_STREAM_DISCONNECTED event. We know that any stream netdev we've
    created is backed by a passt process, and if the socket was closed,
    that means the passt process has disappeared.
    
    When we receive this event, we can respond by starting a new passt
    process with the same options (including socket path) we originally
    used. If we have previously created the stream netdev device with a
    "reconnect" option, then QEMU will automatically reconnect to this new
    passt process. (If we hadn't used "reconnect", then QEMU will never
    try to reconnect to the new passt process, so there's no point in
    starting it.)
    
    Note that NETDEV_STREAM_DISCONNECTED is an event sent for the netdev
    (ie "host side") of the network device, and so it sends the
    "netdev-id" to specify which device was disconnected. But libvirt's
    virDomainNetDef (the object used to keep track of network devices) is
    the internal representation of both the host-side "netdev", and the
    guest side device, and virDomainNetDef doesn't directly keep track of
    the netdev-id, only of the device's "alias" (which is the "id"
    parameter of the *guest* side of the device). Fortunately, by convention
    libvirt always names the host-side of devices as "host" + alias, so in
    order to search for the affected NetDef, all we need to do is trim the
    1st 4 characters from the netdev-id and look for the NetDef having
    that resulting trimmed string as its alias. (Contrast this to
    NIC_RX_FILTER_CHANGED, which is an event received for the guest side
    of the device, and so directly contains the device alias.)
    
    Resolves: https://bugzilla.redhat.com/2172098
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit acd8333f763f1e45728fac4e727fef4e33141ebf
Author: Laine Stump <laine@redhat.com>
Date:   Mon Feb 20 18:26:51 2023 -0500

    qemu: add reconnect=5 to passt qemu commandline options when available
    
    QEMU's "reconnect" option of "-netdev stream" tells QEMU to
    periodically (period is given in seconds as an argument to the option)
    attempt to reconnect to the same passt socket to which it had
    originally connected to. This is useful in cases where the passt
    process terminates, and libvirtd starts a new passt process in its
    place (which doesn't happen yet, but will happen automatically after
    an upcoming patch in this series).
    
    Since there is no real hueristic for determining the "best" value of
    the reconnect interval, rather than clutter up config with a knob that
    nobody knows how to properly twiddle, we just set the reconnect timer
    to 5 seconds.
    
    "-netdev stream" first appeared in QEMU 7.2.0, but the reconnect
    option won't be available until QEMU 8.0.0, so we need to check QEMU
    capabilities just in case someone is using QEMU 7.2.0 (and thus can
    support passt backend, but not reconnect)
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 70747222a73ffed5cdadcab492bef67fe7e49aa4
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 20 17:25:08 2023 +0100

    qemu: capabilities: Introduce QEMU_CAPS_NETDEV_STREAM_RECONNECT
    
    Detect that the 'stream' netdev backend supports reconnecting.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 771992363e1e85b60fe97dc6a4171d4633402392
Author: Laine Stump <laine@redhat.com>
Date:   Tue Feb 21 01:09:04 2023 -0500

    qemu: remove extraneous error log when qemuPasstStart() fails during hotplug
    
    qemuPasstStart() already logs any error that occurs, so having the
    caller log a generic error message only serves to obscure the actual
    problem.
    
    Fixes: a56f0168d576fa01cec204dc3c67d4d63ab8487f
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit dffc40db695c9b6d089f7fdc1be9fde00f917c58
Author: Laine Stump <laine@redhat.com>
Date:   Mon Feb 20 15:14:23 2023 -0500

    qemu: add check for QEMU_CAPS_NETDEV_STREAM during validation
    
    In commit 5af6134e I had added a new capability that is true if QEMU
    allows "-netdev stream", but somehow neglected to actually check it in
    commit a56f0168d when hooking up passt support to qemu. This isn't
    catastrophic, since QEMU itself will still report an error, but that
    error isn't as easy to understand as a libvirt-generated error.
    
    Fixes: a56f0168d576fa01cec204dc3c67d4d63ab8487f
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit b7a18787de7c193dc68640668cc176ef9d887bc1
Author: Stefano Brivio <sbrivio@redhat.com>
Date:   Tue Feb 21 20:19:07 2023 +0100

    qemu_passt: Remove passt socket file on exit
    
    Just like it can't remove its own PID files, passt can't unlink its
    own socket upon exit (unless the initialisation fails), because it
    has no access to the filesystem at runtime.
    
    Remove the socket file in qemuPasstKill().
    
    Fixes: a56f0168d576 ("qemu: hook up passt config to qemu domains")
    Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
    Reviewed-by: Laine Stump <laine@redhat.com>

commit 4938954ed38fff44b5a81e4a60d11da9b36b41a2
Author: Temuri Doghonadze <temuri.doghonadze@gmail.com>
Date:   Tue Feb 21 12:15:17 2023 +0100

    Translated using Weblate (Georgian)
    
    Currently translated at 3.5% (367 of 10405 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/ka/
    
    Translated using Weblate (Georgian)
    
    Currently translated at 2.1% (223 of 10405 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/ka/
    
    Co-authored-by: Temuri Doghonadze <temuri.doghonadze@gmail.com>
    Signed-off-by: Temuri Doghonadze <temuri.doghonadze@gmail.com>

