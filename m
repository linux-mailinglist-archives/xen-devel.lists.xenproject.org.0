Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF5C743EF2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 17:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557560.871030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFG6t-000169-TJ; Fri, 30 Jun 2023 15:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557560.871030; Fri, 30 Jun 2023 15:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFG6t-00012m-QP; Fri, 30 Jun 2023 15:32:35 +0000
Received: by outflank-mailman (input) for mailman id 557560;
 Fri, 30 Jun 2023 15:32:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFG6s-00012Y-Ia; Fri, 30 Jun 2023 15:32:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFG6s-0001WP-Bq; Fri, 30 Jun 2023 15:32:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFG6r-0001TC-T2; Fri, 30 Jun 2023 15:32:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qFG6r-0004Q7-SZ; Fri, 30 Jun 2023 15:32:33 +0000
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
	bh=fxh5G+43wDwcR/Rb0Y0zBoAIYPl7yUTjBDfT11Rihr4=; b=3g/7typw/uEU6X6h6H/vJ6OQme
	Qg/NvrEa2i7W7cry9RQiL4+C0JcP3iA5t4AlC9bGGtBc6nyX2qI/mYacONnkGtnYr0hl+bFj1CiFu
	rZbwLMLblBWPh5c5NVA1FJAryKp23waYB3owKBlmfn/90f520q4PgZZcvlN8WUpLmptA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181649-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 181649: trouble: broken/pass
X-Osstest-Failures:
    libvirt:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    libvirt:test-armhf-armhf-libvirt-raw:host-install(5):broken:regression
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=63792a286d4ac2646bd9a6fa564da3aff04b00eb
X-Osstest-Versions-That:
    libvirt=d7fb8deb6aa862a8098d8d933dd32a79931cd4dc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Jun 2023 15:32:33 +0000

flight 181649 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181649/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw    <job status>                 broken
 test-armhf-armhf-libvirt-raw  5 host-install(5)        broken REGR. vs. 181635

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181635
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181635
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              63792a286d4ac2646bd9a6fa564da3aff04b00eb
baseline version:
 libvirt              d7fb8deb6aa862a8098d8d933dd32a79931cd4dc

Last test of basis   181635  2023-06-29 04:21:51 Z    1 days
Testing same since   181649  2023-06-30 04:18:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Han Han <hhan@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Yuri Chornoivan <yurchor@ukr.net>
  김인수 <simmon@nplob.com>

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
commit 63792a286d4ac2646bd9a6fa564da3aff04b00eb
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Jun 29 08:46:04 2023 +0200

    Revert "lxc_fuse: Tell FUSE that /proc/meminfo is nonseekable"
    
    After v8.1.0-61-g030faee28d it is no longer necessary to make the
    /proc/meminfo file nonseekable as our code that fills the file
    with spoofed values can handle seeking just fine.
    
    Previously, `free(1)` was okay with failed lseek(), but this was
    ages ago and meanwhile the procps project moved to creating a
    library and moved the file parsing code under an exported
    function. In attempt to make the function callable multiple
    times, it can lseek() multiple times and failure to do so is
    fatal.
    
    This reverts commit 766495508650bebd5f4ac23224ecd0a2ee2ca9eb
    
    Resolves: https://gitlab.com/libvirt/libvirt/-/issues/492
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 4163dcc4cb694efc76ed299fa5ab0a57a74ba1e0
Author: Yuri Chornoivan <yurchor@ukr.net>
Date:   Thu Jun 29 06:21:01 2023 +0200

    Translated using Weblate (Ukrainian)
    
    Currently translated at 100.0% (10395 of 10395 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/uk/
    
    Co-authored-by: Yuri Chornoivan <yurchor@ukr.net>
    Signed-off-by: Yuri Chornoivan <yurchor@ukr.net>

commit a9e7d5c587802d358b8949449208d3f020ee55b9
Author: 김인수 <simmon@nplob.com>
Date:   Thu Jun 29 06:21:00 2023 +0200

    Translated using Weblate (Korean)
    
    Currently translated at 100.0% (10395 of 10395 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/ko/
    
    Co-authored-by: 김인수 <simmon@nplob.com>
    Signed-off-by: 김인수 <simmon@nplob.com>

commit 28141adfdc054071f9b4644b3f769881651257eb
Author: Han Han <hhan@redhat.com>
Date:   Mon Jun 5 15:40:13 2023 +0800

    scripts: Fix the flake8 syntax-check failures
    
    Fix the syntax-check failures (which can be seen after
    python3-flake8-import-order package is installed) with the help
    of isort[1]:
    
    289/316 libvirt:syntax-check / flake8   FAIL   5.24s   exit status 2
    
    [1]: https://pycqa.github.io/isort/
    
    Signed-off-by: Han Han <hhan@redhat.com>
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

