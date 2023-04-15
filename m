Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B906E320E
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 17:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521472.810187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnhYJ-0007SP-Rc; Sat, 15 Apr 2023 15:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521472.810187; Sat, 15 Apr 2023 15:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnhYJ-0007Pc-Oo; Sat, 15 Apr 2023 15:10:59 +0000
Received: by outflank-mailman (input) for mailman id 521472;
 Sat, 15 Apr 2023 15:10:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnhYH-0007PQ-R1; Sat, 15 Apr 2023 15:10:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnhYH-0005vs-MM; Sat, 15 Apr 2023 15:10:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnhYH-0005hX-4h; Sat, 15 Apr 2023 15:10:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pnhYH-0007jZ-49; Sat, 15 Apr 2023 15:10:57 +0000
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
	bh=k/DsF+cJyXIpRr5gpUwirITGrgt8HdHdifHnYioC/Qo=; b=ZifWHNAZS24B/iIXzCwC89qEmb
	mf7hEvJ7eb0608qU0vGWUaVWRdKLqkcTEq1pOhpdMjQ+GqhYGJQkH3x9fqaaYb6yzxk5Q1TTk2pC+
	4rUBY8r8Pbg0uG2k2W6s6s2KwOWsYSjnAaPLPx2gqC9blhqEgEHrA6vYu5uEU3fSsEhI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180267-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 180267: trouble: broken/pass
X-Osstest-Failures:
    libvirt:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    libvirt:test-armhf-armhf-libvirt-raw:host-install(5):broken:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=7cbbd45af115c24dba1b1be9631a32d6215ff0cc
X-Osstest-Versions-That:
    libvirt=ebd004a03dbddc52dd1b47bd6bc4607f553d5e70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Apr 2023 15:10:57 +0000

flight 180267 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180267/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw    <job status>                 broken

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw  5 host-install(5)       broken starved in 180255
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt   16 saverestore-support-check fail starved in 180255
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail starved in 180255

version targeted for testing:
 libvirt              7cbbd45af115c24dba1b1be9631a32d6215ff0cc
baseline version:
 libvirt              ebd004a03dbddc52dd1b47bd6bc4607f553d5e70

Last test of basis   180255  2023-04-14 04:18:49 Z    1 days
Testing same since   180267  2023-04-15 04:20:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
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
 test-armhf-armhf-libvirt-raw                                 broken  
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

broken-job test-armhf-armhf-libvirt-raw broken
broken-step test-armhf-armhf-libvirt-raw host-install(5)

Not pushing.

------------------------------------------------------------
commit 7cbbd45af115c24dba1b1be9631a32d6215ff0cc
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 08:39:22 2023 +0200

    virsh-domain-event: Make 'virshEventIOError(Reason)Print' translation friendly
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 24b56900f8eb1e508a7aa83ca5a47ce8404c6bbc
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 08:39:22 2023 +0200

    virsh-domain-event: Make 'virshEventWatchdogPrint' translation friendly
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 4c531e0130f5e4ba82b8df893740dba2367f4586
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 08:39:22 2023 +0200

    virsh-domain-event: Make 'virshEventTrayChangePrint' translation friendly
    
    Remove construction of the event string from sub-strings marked as
    translatable. Without context it's impossible to translate it correctly.
    
    This slightly increases verbosity of the code but actually makes it more
    readable as everything is inline.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 9dc2a41f1e2df7c16ffad8b8a33e44f05ad4fa5a
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 09:31:34 2023 +0200

    virsh: event: Introduce virshEventPrintf
    
    Extract internals of virshEventPrint into a function that can take the
    format string. The function will be used in upcoming patches which make
    the event formatting translatable.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 13af21fb7490e4aae1514ee1318c7096eea07fcc
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 09:19:27 2023 +0200

    vshPrint: Add version using 'va_list'
    
    Add a version for functions which may already need to take a printf
    format string.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 620d9427490144a5234001c0ea80bf74dab48a03
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 09:44:05 2023 +0200

    virshGraphicsAddressToString: Remove pointless translation
    
    There's no point in marking the protocol name as translatable.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 2fbb8e9a7b955ae4544fafe6cf48af0cb1147d0d
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Apr 13 08:30:21 2023 +0200

    Don't translate strings used with VIR_DEBUG
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit b108a73a7bcedb65a324eed692712478101848ef
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Apr 12 14:46:04 2023 +0200

    virCgroupV1GetBlkioIo(Device)Serviced: Refactor extraction of cgroup data
    
    Rewrite the code to improve maintainability and also re-do construction
    of error messages which are assembled from non-translatable parts.
    
    Closes: https://gitlab.com/libvirt/libvirt/-/issues/455
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 194cfb44e77ce25d99240f24321559f569251e68
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Fri Apr 14 10:37:10 2023 +0200

    qemu: Fix incorrect command name in error messages
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>

