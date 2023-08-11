Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51B77923B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582562.912396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTV2-0003sN-AE; Fri, 11 Aug 2023 14:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582562.912396; Fri, 11 Aug 2023 14:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTV2-0003pz-6W; Fri, 11 Aug 2023 14:52:24 +0000
Received: by outflank-mailman (input) for mailman id 582562;
 Fri, 11 Aug 2023 14:52:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUTV0-0003pn-JU; Fri, 11 Aug 2023 14:52:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUTV0-0005Yg-75; Fri, 11 Aug 2023 14:52:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUTUz-0005um-OW; Fri, 11 Aug 2023 14:52:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qUTUz-0006cA-Nm; Fri, 11 Aug 2023 14:52:21 +0000
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
	bh=rGWINyHEYLtjL8xGhPTN7wCtEFOJ0Z/2ghdRxncWhCs=; b=6v1cdcKt5hQQEd39nIKO1ni9NA
	vbnSrDLf/j0COHd5JPH5il/VQey+NOFKuobEsdwm+omG54hh8/uIQLOis3UKbRSoRDrzwcF+8KTFA
	RfePc/FO3YGmi6GkI38UlPHaiVQjh+e4OX8HvQrvabnzt2Y3yIaXPFV9MR5gWov0aRR4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182264-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 182264: trouble: broken/pass
X-Osstest-Failures:
    libvirt:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    libvirt:test-amd64-amd64-libvirt-vhd:host-install(5):broken:regression
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=85688f475f949eb08074343ca936bf513210f505
X-Osstest-Versions-That:
    libvirt=831b5a6bd6d72d58494018b7051894ccc1310c49
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Aug 2023 14:52:21 +0000

flight 182264 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182264/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-libvirt-vhd  5 host-install(5)        broken REGR. vs. 182244

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182244
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182244
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182244
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              85688f475f949eb08074343ca936bf513210f505
baseline version:
 libvirt              831b5a6bd6d72d58494018b7051894ccc1310c49

Last test of basis   182244  2023-08-09 04:20:35 Z    2 days
Testing same since   182264  2023-08-10 17:14:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Peter Krempa <pkrempa@redhat.com>

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
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 broken  


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

broken-job test-amd64-amd64-libvirt-vhd broken
broken-step test-amd64-amd64-libvirt-vhd host-install(5)

Not pushing.

------------------------------------------------------------
commit 85688f475f949eb08074343ca936bf513210f505
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Aug 9 15:14:35 2023 +0200

    virsh: doMigrate: Require --copy-storage-(all|inc) with --migrate-disks
    
    Users need to enable non-shared-storage migration, otherwise the disks
    specified via '--migrate-disks' will be ignored.
    
    Add an error message to inform the users of their wrong config.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 1c2bd205eddecc26245123117af19576ecc82c9e
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Aug 9 15:02:04 2023 +0200

    virsh: doMigrate: Rework virsh option to migration flag conversion
    
    Convert the flags declaratively as in the vast majority of cases it's a
    simple binary addition if the flag exists.
    
    In one instance there was also an additional check, which was moved up
    after the new code, and the error message was fixed.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit ba8ae0532b3039ed308320f733aa1618fbe5758b
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Aug 9 14:18:58 2023 +0200

    qemuMigrationSrcBeginPhase: Require storage migration when 'migrate_disks' parameter is specified
    
    If a user passes a list of disks to migrate but don't actually use
    'VIR_MIGRATE_NON_SHARED_DISK' or 'VIR_MIGRATE_NON_SHARED_INC' flags the
    parameter would be simply ignored without informing the user of the
    error.
    
    Add a proper error in such case.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit deac6f017e9ffaae4060d461b87e0d61ddbb1e3a
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Aug 9 14:10:14 2023 +0200

    qemuMigrationSrcBeginPhase: Properly report error when non-shared storage migration is requested over tunnel
    
    When VIR_MIGRATE_TUNNELLED is used without
    VIR_MIGRATE_NON_SHARED_DISK/VIR_MIGRATE_NON_SHARED_INC
    an error was reported without actually returning failure.
    
    This was caused by a refactor which dropped many error paths.
    
    Fixes: 6111b235224
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit fa1a54baa59d244289ce666f9dc52d9eabca47f1
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Tue Aug 8 15:53:53 2023 +0200

    virStorageBackendLogicalCheckPool: Properly mark empty logical pools as active
    
    The '/dev' filesystem convenience directory for a LVM volume group is
    not created when the volume group is empty.
    
    The logic in 'virStorageBackendLogicalCheckPool' which is used to see
    whether a pool is active was first checking presence of the directory,
    which failed for an empty VG.
    
    Since the second step is virStorageBackendLogicalMatchPoolSource which
    is checking mapping between configured PVs and the VG, we can simply
    rely on the function to also check presence of the pool.
    
    Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2228223
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

