Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E91766BE37
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 13:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478609.741881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOyo-0006PG-D1; Mon, 16 Jan 2023 12:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478609.741881; Mon, 16 Jan 2023 12:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOyo-0006NN-9k; Mon, 16 Jan 2023 12:52:50 +0000
Received: by outflank-mailman (input) for mailman id 478609;
 Mon, 16 Jan 2023 12:52:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pHOym-0006ND-H0; Mon, 16 Jan 2023 12:52:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pHOym-00069e-ED; Mon, 16 Jan 2023 12:52:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pHOyl-00051X-W8; Mon, 16 Jan 2023 12:52:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pHOyl-0001zK-Ve; Mon, 16 Jan 2023 12:52:47 +0000
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
	bh=aaZyxGFttHT4S57IUhauiYRRD7ipOLp4kLSjcXzwCzc=; b=NQMLH33Lrdk4xor6eXw1ER+1Ij
	SXgJfHTtq4tJbXVvqWtX6ycnMv1G/gUeMIii5d3fhHsQOkdilO7CtUdtST/Ixxc+Md37RIVL6+fHM
	eMLx+Ev7iSn1MZa+J4a3DmDXm925dNcZTecDGW9xlN1tvSgalFigjadyTnCMB/1X05Q8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175917-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 175917: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    libvirt:build-amd64:<job status>:broken:regression
    libvirt:build-amd64-pvops:<job status>:broken:regression
    libvirt:build-amd64-xsm:<job status>:broken:regression
    libvirt:build-arm64:<job status>:broken:regression
    libvirt:build-arm64-pvops:<job status>:broken:regression
    libvirt:build-arm64-xsm:<job status>:broken:regression
    libvirt:build-armhf:<job status>:broken:regression
    libvirt:build-armhf-pvops:<job status>:broken:regression
    libvirt:build-armhf:host-install(4):broken:regression
    libvirt:build-armhf-pvops:host-build-prep:fail:regression
    libvirt:build-amd64:host-build-prep:fail:regression
    libvirt:build-amd64-xsm:host-build-prep:fail:regression
    libvirt:build-arm64:host-build-prep:fail:regression
    libvirt:build-amd64-pvops:host-build-prep:fail:regression
    libvirt:build-arm64-pvops:host-build-prep:fail:regression
    libvirt:build-arm64-xsm:host-build-prep:fail:regression
    libvirt:build-i386-xsm:xen-build:fail:regression
    libvirt:build-i386:xen-build:fail:regression
    libvirt:build-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-i386-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    libvirt=46aee2a9255adf842ab44a9292acb46189a726f7
X-Osstest-Versions-That:
    libvirt=12a3bee3899cdba8b637a7286f24ade1214b6420
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Jan 2023 12:52:47 +0000

flight 175917 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175917/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 175736
 build-armhf-pvops             5 host-build-prep          fail REGR. vs. 175736
 build-amd64                   5 host-build-prep          fail REGR. vs. 175736
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 175736
 build-arm64                   5 host-build-prep          fail REGR. vs. 175736
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 175736
 build-arm64-pvops             5 host-build-prep          fail REGR. vs. 175736
 build-arm64-xsm               5 host-build-prep          fail REGR. vs. 175736
 build-i386-xsm                6 xen-build                fail REGR. vs. 175736
 build-i386                    6 xen-build                fail REGR. vs. 175736

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              46aee2a9255adf842ab44a9292acb46189a726f7
baseline version:
 libvirt              12a3bee3899cdba8b637a7286f24ade1214b6420

Last test of basis   175736  2023-01-12 04:18:57 Z    4 days
Testing same since   175917  2023-01-16 04:18:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anton Fadeev <anton.fadeev@red-soft.ru>
  antonios-f <anton.fadeev@red-soft.ru>
  Erik Skultety <eskultet@redhat.com>
  Han Han <hhan@redhat.com>
  Ján Tomko <jtomko@redhat.com>
  Laine Stump <laine@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Yuri Chornoivan <yurchor@ukr.net>
  김인수 <simmon@nplob.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               fail    
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 


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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 46aee2a9255adf842ab44a9292acb46189a726f7
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Fri Jan 13 10:24:38 2023 +0100

    NEWS: Document virDomainFDAssociate and NULL dereference in virXMLPropStringRequired
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 6ce7cebea32148372ebd567ba25b380d8ab49781
Author: Laine Stump <laine@redhat.com>
Date:   Thu Jan 12 23:42:18 2023 -0500

    tests: remove unused qemu .args file
    
    net-user-passt.args was generated early during testing of the passt
    qemu commandline, when qemuxml2argvtest was using
    DO_TEST("net-user-passt"). This was later changed to
    DO_TEST_CAPS_LATEST(), so the file net-user-passt.x86_64-latest.args
    is used instead, but the original (now unused) test file was
    accidentally added to the original patch. This patch removes it.
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Jiri Denemark <jdenemar@redhat.com>

commit a2042a45165938f2d747edd17f12ca03eea51791
Author: Laine Stump <laine@redhat.com>
Date:   Thu Jan 12 23:42:17 2023 -0500

    qemu: remove commented-out option in passt qemu commandline setup
    
    This commented-out option was pointed out by jtomko during review, but
    I missed taking it out when addressing his comments.
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Jiri Denemark <jdenemar@redhat.com>

commit 3592b81c4c717f01f34362e0b578989f9f93676f
Author: Laine Stump <laine@redhat.com>
Date:   Thu Jan 12 23:42:16 2023 -0500

    conf: remove <backend upstream='xxx'/> attribute
    
    This attribute was added to support setting the --interface option for
    passt, but in a post-push/pre-9.0-release review, danpb pointed out
    that it would be better to use the existing <source dev='xxx'/>
    attribute to set --interface rather than creating a new attribute (in
    the wrong place). So we remove backend/upstream, and change the passt
    commandline creation to grab the name for --interface from source/dev.
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Jiri Denemark <jdenemar@redhat.com>

commit 8ff8fe3f8a7bb67a150c7f4801c2df5ef743aa8f
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Jan 5 09:51:07 2023 +0100

    qemuBuildThreadContextProps: Generate ThreadContext less frequently
    
    Currently, the ThreadContext object is generated whenever we see
    .host-nodes attribute for a memory-backend-* object. The idea was
    that when the backend is pinned to a specific set of host NUMA
    nodes, then the allocation could be happening on CPUs from those
    nodes too. But this may not be always possible.
    
    Users might configure their guests in such way that vCPUs and
    corresponding guest NUMA nodes are on different host NUMA nodes
    than emulator thread. In this case, ThreadContext won't work,
    because ThreadContext objects live in context of the emulator
    thread (vCPU threads are moved around by us later, when emulator
    thread finished its setup and spawned vCPU threads - see
    qemuProcessSetupVcpus()). Therefore, memory allocation is done by
    emulator thread which is pinned to a subset of host NUMA nodes,
    but tries to create a ThreadContext object with a disjoint subset
    of host NUMA nodes, which fails.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2154750
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit ed6b8a30b90807d5a4d6bc0a5d0ec99fd5f040ff
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Tue Jan 3 10:29:01 2023 +0100

    security_selinux: Set and restore /dev/sgx_* labels
    
    For SGX type of memory, QEMU needs to open and talk to
    /dev/sgx_vepc and /dev/sgx_provision files. But we do not set nor
    restore SELinux labels on these files when starting a guest.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit a50e6f649b49ee89e25a4afba4ad8d537014e33f
Author: Ján Tomko <jtomko@redhat.com>
Date:   Wed Jan 11 16:04:23 2023 +0100

    NEWS: document external swtpm backend addition
    
    Signed-off-by: Ján Tomko <jtomko@redhat.com>
    Reviewed-by: Andrea Bolognani <abologna@redhat.com>

commit 08e3bf0b6f8b9612bb2fc02e7d30fc75d6b10daf
Author: 김인수 <simmon@nplob.com>
Date:   Thu Jan 12 09:59:36 2023 +0100

    Translated using Weblate (Korean)
    
    Currently translated at 99.5% (10362 of 10405 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/ko/
    
    Co-authored-by: 김인수 <simmon@nplob.com>
    Signed-off-by: 김인수 <simmon@nplob.com>

commit d07a7793dab57d49b3dec166a62f8e82137e17a9
Author: Yuri Chornoivan <yurchor@ukr.net>
Date:   Thu Jan 12 09:59:36 2023 +0100

    Translated using Weblate (Ukrainian)
    
    Currently translated at 100.0% (10405 of 10405 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/uk/
    
    Co-authored-by: Yuri Chornoivan <yurchor@ukr.net>
    Signed-off-by: Yuri Chornoivan <yurchor@ukr.net>

commit 9233f0fa8c8e031197c647f7bc980dee45283641
Author: antonios-f <anton.fadeev@red-soft.ru>
Date:   Thu Nov 17 09:53:23 2022 +0000

    src/util/vircgroupv2.c: interpret neg quota as "max"
    
    Because of kernel doesn't allow passing negative values to
    cpu.max as quota, it's needing to convert negative values to "max" token.
    
    Signed-off-by: Anton Fadeev <anton.fadeev@red-soft.ru>
    Reviewed-by: Pavel Hrdina <phrdina@redhat.com>

commit f41d1a2e751549c8817326740c5761a0775a1fb6
Author: Han Han <hhan@redhat.com>
Date:   Thu Jan 12 12:10:21 2023 +0800

    docs: drvqemu: Fix a typo
    
    Fixes: a677ea928a65fceb1463e14044b23d7fba6acd3d
    Signed-off-by: Han Han <hhan@redhat.com>
    Reviewed-by: Andrea Bolognani <abologna@redhat.com>

commit ad00beffa6f3ca8b7c09e454a70a8281fa656524
Author: Erik Skultety <eskultet@redhat.com>
Date:   Thu Jan 12 07:57:58 2023 +0100

    ci: integration: Set an expiration on logs artifacts
    
    The default expiry time is 30 days. Since the RPM artifacts coming from
    the previous pipeline stages are set to expire in 1 day we can set the
    failed integration job log artifacts to the same value. The sentiment
    here is that if an integration job legitimately failed (i.e. not with
    an infrastructure failure) unless it was fixed in the meantime it will
    fail the next day with the scheduled pipeline again, meaning, that even
    if the older log artifacts are removed, they'll be immediately
    replaced with fresh ones.
    
    Signed-off-by: Erik Skultety <eskultet@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

