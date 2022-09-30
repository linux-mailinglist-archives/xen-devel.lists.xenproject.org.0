Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E55F0664
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 10:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414075.658160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeBO5-0006Yf-51; Fri, 30 Sep 2022 08:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414075.658160; Fri, 30 Sep 2022 08:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeBO5-0006Wq-15; Fri, 30 Sep 2022 08:28:49 +0000
Received: by outflank-mailman (input) for mailman id 414075;
 Fri, 30 Sep 2022 08:28:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeBO3-0006Wg-MB; Fri, 30 Sep 2022 08:28:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeBO3-0004Pl-Hr; Fri, 30 Sep 2022 08:28:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeBO3-00065Z-AT; Fri, 30 Sep 2022 08:28:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeBO3-0002o5-9z; Fri, 30 Sep 2022 08:28:47 +0000
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
	bh=4O3ibnnXtBfHvRSmgiYjZHtysRD/5ClbbR7hR5dUt0s=; b=lHGQJjAc1Th5Ol/FGYzuBvHDis
	bBRmM2OvTjZvBfJ2QntAk0hu8Jrd0wE9WtIRDbJ1WmGicFLkKoGvGh2Lg+2nm8ZrohVsvXGN+gpXt
	21mlI7HddtrzjpYwQ6PwyU+WzW8tNhq33B/lJ+AIi1yOBsKuKB6lx/6D5uZXJJ9ChYeE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173381-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 173381: regressions - trouble: blocked/broken/pass
X-Osstest-Failures:
    libvirt:build-armhf:<job status>:broken:regression
    libvirt:build-armhf:host-build-prep:fail:regression
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=85aafea4499b20a43d5c208143fc1582ab3d6c84
X-Osstest-Versions-That:
    libvirt=8ead926cb46f1892116cb56aa89390d194ce0b71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Sep 2022 08:28:47 +0000

flight 173381 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173381/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   5 host-build-prep          fail REGR. vs. 173345

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              85aafea4499b20a43d5c208143fc1582ab3d6c84
baseline version:
 libvirt              8ead926cb46f1892116cb56aa89390d194ce0b71

Last test of basis   173345  2022-09-28 04:20:21 Z    2 days
Testing same since   173381  2022-09-30 04:18:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kristina Hanicova <khanicov@redhat.com>
  Lin Ma <lma@suse.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
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
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
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

broken-job build-armhf broken

Not pushing.

------------------------------------------------------------
commit 85aafea4499b20a43d5c208143fc1582ab3d6c84
Author: Lin Ma <lma@suse.com>
Date:   Thu Sep 8 15:07:22 2022 +0800

    qemu: Remove host-passthrough validation check for host-phys-bits=on
    
    Besides the -cpu host, The host-phys-bits=on applies to custom or max
    cpu model, So the host-passthrough validation check is unnecessary for
    maxphysaddr with mode='passthrough'.
    
    Signed-off-by: Lin Ma <lma@suse.com>
    Reviewed-by: Jim Fehlig <jfehlig@suse.com>

commit ba884de786e07e2a3addd68f2e587e306ee16cab
Author: Kristina Hanicova <khanicov@redhat.com>
Date:   Thu Sep 29 13:56:30 2022 +0200

    virdomainjob: preserveJob: memdup the cb structure instead of copying it
    
    In case of variable 'oldjob' (job structure) in
    qemuProcessReconnect() the cb pointer was just copied from the
    existing job structure in virDomainObjPreserveJob(). This caused
    the job and oldjob sharing the same pointer, which was later
    freed at the end of the qemuProcessReconnect() function by
    automatic call to virDomainObjClearJob(). This caused an invalid
    read in and subsequent daemon crash as the job structure was
    trying to read cb which had been already freed.
    
    This patch changes the copying to g_memdup that allocates
    different pointer, which can be later safely freed.
    
    Signed-off-by: Kristina Hanicova <khanicov@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

