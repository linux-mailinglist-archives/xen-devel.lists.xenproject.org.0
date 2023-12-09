Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7F80B3E0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 12:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650917.1016741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBv7H-0002lC-32; Sat, 09 Dec 2023 11:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650917.1016741; Sat, 09 Dec 2023 11:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBv7G-0002i3-Vp; Sat, 09 Dec 2023 11:03:26 +0000
Received: by outflank-mailman (input) for mailman id 650917;
 Sat, 09 Dec 2023 11:03:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBv7E-0002ht-Sz; Sat, 09 Dec 2023 11:03:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBv7E-00079y-Iy; Sat, 09 Dec 2023 11:03:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBv7E-0003sU-7U; Sat, 09 Dec 2023 11:03:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBv7E-000437-6z; Sat, 09 Dec 2023 11:03:24 +0000
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
	bh=aiAeSwJEOyzfyo50IZukx0cu7vn36dNd6BZ7Zfu2uSw=; b=V4rYno/TVU/WIztfjpJqT7XCG3
	vdSiNDlxY21cDQau8YO3lM/8q0z5DIcWP11hT7bY0TYoizAHQdZUDiwuyrH+oKObpH+Db8lXVCaAm
	Qq5jto9yhRgEZN9b9HTF9pZazgkcUYVgmojtGUcglmg9mk6KWvvA9HEZvZgK9njYeLCE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184045-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 184045: regressions - FAIL
X-Osstest-Failures:
    libvirt:build-arm64-xsm:xen-build:fail:regression
    libvirt:build-arm64-pvops:kernel-build:fail:regression
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=1a2f33cb593e6bf4913d97143bf76d5e7f866912
X-Osstest-Versions-That:
    libvirt=06e344f762bb2a31bfbdecbf0da9736373c19cce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Dec 2023 11:03:24 +0000

flight 184045 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184045/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 184033
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 184033

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184033
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184033
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184033
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              1a2f33cb593e6bf4913d97143bf76d5e7f866912
baseline version:
 libvirt              06e344f762bb2a31bfbdecbf0da9736373c19cce

Last test of basis   184033  2023-12-08 04:20:31 Z    1 days
Testing same since   184045  2023-12-09 04:25:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Göran Uddeborg <goeran@uddeborg.se>
  Jim Fehlig <jfehlig@suse.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              fail    
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
commit 1a2f33cb593e6bf4913d97143bf76d5e7f866912
Author: Jim Fehlig <jfehlig@suse.com>
Date:   Thu Dec 7 18:38:22 2023 -0700

    remote: Fix cached hypervisor type
    
    Commit 501825011c switched the remote driver to using g_auto, but missed
    one case of needing to steal a pointer holding the hypervisor type.
    Without it, memory is freed and the output of 'virsh version' has random
    output
    
    Compiled against library: libvirt 10.0.0
    Using library: libvirt 10.0.0
    Using API: ��%�U 10.0.0
    Running hypervisor: ��U 8.1.3
    
    Ths change also fixes random SIGABRT from perl processes running
    libvirt-tck tests.
    
    Signed-off-by: Jim Fehlig <jfehlig@suse.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit fba411a80512d406869e6c54b483988d24844d30
Author: Göran Uddeborg <goeran@uddeborg.se>
Date:   Thu Dec 7 22:43:57 2023 +0100

    Translated using Weblate (Swedish)
    
    Currently translated at 56.3% (5871 of 10417 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/sv/
    
    Co-authored-by: Göran Uddeborg <goeran@uddeborg.se>
    Signed-off-by: Göran Uddeborg <goeran@uddeborg.se>

