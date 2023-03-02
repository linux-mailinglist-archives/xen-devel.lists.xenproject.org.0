Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1F6A803A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 11:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504835.777253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXgSC-00008g-1L; Thu, 02 Mar 2023 10:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504835.777253; Thu, 02 Mar 2023 10:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXgSB-00005h-UA; Thu, 02 Mar 2023 10:46:27 +0000
Received: by outflank-mailman (input) for mailman id 504835;
 Thu, 02 Mar 2023 10:46:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXgSA-00005T-VI; Thu, 02 Mar 2023 10:46:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXgSA-0006OD-S6; Thu, 02 Mar 2023 10:46:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXgSA-0001sM-EP; Thu, 02 Mar 2023 10:46:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pXgSA-00021w-Dx; Thu, 02 Mar 2023 10:46:26 +0000
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
	bh=x0xydYzj8DGsDgr2doZiWykROrkcN6zOxXJUIlF74+0=; b=2u9Y48pos9SCGSJBM4dVziqIPU
	oncEwzrwvVocMBmMur6AzajmOzvAL2WO9NLFxpDovQc+fB8OT8eoLL4DlFGGEtwgBvEbZgDKov7oB
	kTbJKpa/vwGD8LOTMwOwqWbLoGmBssLZLJWS/L/2lyfQ1lenqFvOyfRp1g/DRBLCcP/8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178942-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 178942: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    libvirt:build-arm64:xen-build:fail:regression
    libvirt:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    libvirt:build-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:build-armhf-libvirt:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    libvirt:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    libvirt=3ba5974034a282370f5551d71afead6a3a5cadc6
X-Osstest-Versions-That:
    libvirt=541670dd5cc33f621f1199e5421efd2c79c25b1a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Mar 2023 10:46:26 +0000

flight 178942 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178942/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 178838
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 178838

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 libvirt              3ba5974034a282370f5551d71afead6a3a5cadc6
baseline version:
 libvirt              541670dd5cc33f621f1199e5421efd2c79c25b1a

Last test of basis   178838  2023-03-01 04:20:25 Z    1 days
Testing same since   178942  2023-03-02 04:20:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Jiri Denemark <jdenemar@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Peter Krempa <pkrempa@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-arm64-arm64-libvirt-raw                                 blocked 
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
commit 3ba5974034a282370f5551d71afead6a3a5cadc6
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Wed Mar 1 18:48:43 2023 +0100

    qemu: Align arguments correctly
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>

commit 20e063c2fd3b19439f7440b27e894c4cd966422f
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 27 12:34:47 2023 +0100

    ci: Regenerate gitlab CI config with latest lcitool
    
    The latest 'lcitool' now generates the CI config in a way which
    allows users to kick off pipelines with the upstream projects container
    environment rather than building a throwaway updated environment each
    time and enables a gitlab feature to time individual script lines.
    Pull it into libvirt.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

commit 61233dfbee616e36af6c495493cace0f3370f37b
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Feb 27 10:22:28 2023 +0100

    qemu_monitor: Decouple switch()-es in qemuMonitorJSONGetMemoryDeviceInfo()
    
    There are two switch() statements over the same variable inside
    of qemuMonitorJSONGetMemoryDeviceInfo(). Join them together into
    one switch.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Kristina Hanicova <khanicov@redhat.com>

commit f173f6a79c759b5d286940f5a58d43f38366ebae
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Feb 27 10:58:27 2023 +0100

    qemu_monitor: Switch to virDomainMemoryModel enum in qemuMonitorJSONGetMemoryDeviceInfo()
    
    When processing memory devices (as a reply from QEMU), a bunch of
    STREQ()-s is used. Fortunately, the set of strings we process is
    the same as virDomainMemoryModel enum. Therefore, we can use
    virDomainMemoryModelTypeFromString() and then use integer
    comparison (well, switch()). This has an upside: introducing a
    new memory model lets us see what places need adjusting
    immediately at compile time.
    
    NB, this is in contrast with cmd line generator
    (qemuBuildMemoryDeviceProps()), where more specific models are
    generated (e.g. "pc-dimm", "virtio-mem-pci", etc.). But QEMU
    reports back the parent model, instead of specific child
    instance.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Kristina Hanicova <khanicov@redhat.com>

commit b4851deb799c3e48cfb5e4c44f5560500e1ad6c7
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Feb 27 10:31:43 2023 +0100

    libvirt_private.syms: Export virDomainMemoryModelTypeFromString()
    
    The virDomainMemoryModelTypeFromString() is not exported, though
    the enum translation functions are declared in
    src/conf/domain_conf.h.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Kristina Hanicova <khanicov@redhat.com>

commit 590a6c1b781b1484352beb5af489d9124597f8a8
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 27 09:10:08 2023 +0100

    kbase: virtiofs: Add a note that virtiofs is not migratable
    
    Note that certain operations will not work.
    
    Resolves: https://gitlab.com/libvirt/libvirt/-/issues/452
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 5d591421220c850aa64a640eaf2a151ba7866400
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Feb 27 11:00:34 2023 +0100

    ci: Regenerate gitlab config with latest lcitool
    
    The 'cirrus-run' and 'check-dco' containers are now exported as
    ':latest' instead of ':master'.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 3b7d109a177d01e92481ca5dd082104fdce5b08c
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Mar 1 11:15:06 2023 +0100

    Post-release version bump to 9.2.0
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit 96d015a1cf790575c5e5f8c64c22fc7e3ea26b4a
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Wed Mar 1 11:10:41 2023 +0100

    Release of libvirt-9.1.0
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit ab992fd193ebd420f44302dd2cf59013c6399573
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Mar 1 09:38:29 2023 +0100

    NEWS: Document my contributions for upcoming release
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Jiri Denemark <jdenemar@redhat.com>

commit f29d75cc0fc00d19bb35c3f9b4e82f2235e7978d
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Feb 28 22:32:35 2023 +0100

    NEWS: Clarify limitations of passt support
    
    Let users know that we're working on lifting the limitations
    and that they should not use the feature in production until
    then.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Laine Stump <laine@redhat.com>

