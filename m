Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0AA6C91BA
	for <lists+xen-devel@lfdr.de>; Sun, 26 Mar 2023 00:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514785.797263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgDVn-0002FL-E2; Sat, 25 Mar 2023 23:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514785.797263; Sat, 25 Mar 2023 23:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgDVn-0002D2-B5; Sat, 25 Mar 2023 23:41:27 +0000
Received: by outflank-mailman (input) for mailman id 514785;
 Sat, 25 Mar 2023 23:41:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgDVl-0002Cs-RL; Sat, 25 Mar 2023 23:41:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgDVl-0000ol-O2; Sat, 25 Mar 2023 23:41:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgDVl-0007r8-9o; Sat, 25 Mar 2023 23:41:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgDVl-0000b5-9K; Sat, 25 Mar 2023 23:41:25 +0000
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
	bh=KjEHSyYkQLAZzU8SFPGt3ouyQDFXrOdXGvLqNb6Ve2k=; b=n0RU6hIT3lW25AqqQkeS5ypJSz
	Se9a7uKaijRSLTzAHo/miOTrH8D8TfC5ahQygfE8BUHuTJkUlQTkPp65lHG5/NWDKnaiqqAzqD3v0
	vl3R9Q7a5Pb1RdpIj4bmC0oT9ueC4J9PNieFtjbSA7f79w0G6T05+IX+rPzwdLBjGPtA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179962-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 179962: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    libvirt:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:build-armhf-libvirt:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    libvirt:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    libvirt=e9adb4dcb1e51a098a530d0e68f697ad0fff579f
X-Osstest-Versions-That:
    libvirt=7944700b40374a0ed33883e75667303f217f7a9c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Mar 2023 23:41:25 +0000

flight 179962 libvirt real [real]
flight 179978 libvirt real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/179962/
http://logs.test-lab.xenproject.org/osstest/logs/179978/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 179923

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 libvirt              e9adb4dcb1e51a098a530d0e68f697ad0fff579f
baseline version:
 libvirt              7944700b40374a0ed33883e75667303f217f7a9c

Last test of basis   179923  2023-03-24 11:40:00 Z    1 days
Testing same since   179962  2023-03-25 08:39:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Martin Kletzander <mkletzan@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>

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
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
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
commit e9adb4dcb1e51a098a530d0e68f697ad0fff579f
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Mar 24 16:41:05 2023 +0100

    Revert "ci: Disable optimization on macos-12"
    
    This reverts commit 1f76b5365ec78b1e9a36038db8e13ec0025bbe7a.
    
    There were two issues with this commit.  First is the missing propagation
    of CFLAGS into the build environment and second is the fact that this is
    not enough to disable the check for -fsemantic-interposition.  The
    proper fix would require setting MESON_OPTS or similar and also add the
    propagation of such variable into the cirrus builds etc., but at this
    point I burned so much time on this trivial piece of rubbish that I
    think it's easier to just wait for macos to gain a newer clang =D
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit d05ad0f15e737fa2327dd68870a485821505b58f
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Fri Mar 24 12:03:28 2023 +0100

    esx: Change the default username when connecting to VCenter
    
    While it's true that the default username is:
    
      administrator@${SSO-Domain}
    
    in majority of cases the ${SSO-Domain} is "vsphere.local". But
    our code (and what virsh displays then) says it's just
    "administrator".
    
    This is wrong also from a different POV: the username must
    contain the suffix no matter what and our default suggests
    otherwise.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2181234
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 2c13a2a7c9c368ea81eccd4ba12d9cf34bdd331b
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Mar 22 16:33:32 2023 +0100

    virt-host-validate: Detect SMMU support on ARMs
    
    In vir-host-validate we do two checks related to IOMMU:
    
      1) hardware support, and
      2) kernel support.
    
    While users are usually interested in the latter, the former also
    makes sense. And for the former (hardware support) we have this
    huge if-else block for nearly every architecture, except ARM.
    
    Now, IOMMU is called SMMU in ARM world, and while there's
    certainly a definitive way of detecting SMMU support (e.g. via
    dumping some registers in asm), we can work around this - just
    like we do for Intel and AMD - and check for an ACPI table
    presence.
    
    In ARM world, there's I/O Remapping Table (IORT) which describes
    SMMU capabilities on given host and is exposed in sysfs
    (regardless of arm_smmu module).
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2178885
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 1f76b5365ec78b1e9a36038db8e13ec0025bbe7a
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Mar 24 13:15:30 2023 +0100

    ci: Disable optimization on macos-12
    
    This enables our CI to run tests on on macos-12 after commit
    7944700b4037.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>

commit 1b0c07db7547ad0d55c22ca4ebc5302dcc9a1d1a
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Fri Mar 24 09:37:48 2023 +0100

    ci: Refresh CI files with current lcitool
    
    This updates to FreeBSD 12.4 which has clang that supports
    -fsemantic-interposition, plus of course updates the system.
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

