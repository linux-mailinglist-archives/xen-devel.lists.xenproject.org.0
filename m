Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A072E928
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548322.856219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97dK-000468-Do; Tue, 13 Jun 2023 17:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548322.856219; Tue, 13 Jun 2023 17:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97dK-000448-AX; Tue, 13 Jun 2023 17:16:42 +0000
Received: by outflank-mailman (input) for mailman id 548322;
 Tue, 13 Jun 2023 17:16:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q97dI-00043i-NN; Tue, 13 Jun 2023 17:16:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q97dI-0007vk-Ke; Tue, 13 Jun 2023 17:16:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q97dI-0002PB-5n; Tue, 13 Jun 2023 17:16:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q97dI-0002Eo-5K; Tue, 13 Jun 2023 17:16:40 +0000
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
	bh=dg4UQpkAxcOBUD5y6X1ywjO9COyRBJKZbM16Rw77ljU=; b=HuAIgBKP8wkev9ip58RCV/IUjz
	4xiG+zmyC8iZoVWEUMTSbcu/r42sX1lD+UPTLmbCzdEsQq4vx3BDkrvwTJW+H/oMAW3D1/kYKJbDt
	ZbQT8q0T/EpbsDXyEcI06BFFdetk1KWZOjOkBSC/LkAkIA0lsa+d49zpZzHsrJ66yiK4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181401-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 181401: trouble: blocked/broken/pass
X-Osstest-Failures:
    libvirt:build-armhf:<job status>:broken:regression
    libvirt:build-armhf:host-install(4):broken:regression
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=a7ee9eac835324854483a231d7931b9329f259bc
X-Osstest-Versions-That:
    libvirt=97f0bd00b4d055f2329392d2f8b7fe566fc65901
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Jun 2023 17:16:40 +0000

flight 181401 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181401/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181374

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              a7ee9eac835324854483a231d7931b9329f259bc
baseline version:
 libvirt              97f0bd00b4d055f2329392d2f8b7fe566fc65901

Last test of basis   181374  2023-06-11 04:18:49 Z    2 days
Testing same since   181401  2023-06-13 04:20:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ján Tomko <jtomko@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>

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
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit a7ee9eac835324854483a231d7931b9329f259bc
Author: Ján Tomko <jtomko@redhat.com>
Date:   Wed Jun 7 17:40:23 2023 +0200

    conf: virtiofs: validate that the target dir is unique even for hotplug
    
    https://bugzilla.redhat.com/show_bug.cgi?id=2171384
    
    Signed-off-by: Ján Tomko <jtomko@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 063e8b9d621b2bce5560626c70e736d685f77b02
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Mar 23 09:15:35 2023 +0100

    meson: Use dependency().found() instead of conf.has()
    
    So far this change alone doesn't make much sense, but prepares
    code for upcoming change. Unfortunately, some conf.has()
    statements have to stay, because there's no corresponding
    dependency(). But that's okay.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

commit 2ef5876e2bcd6e117eedff4f14c2125fa05c99d9
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Mar 23 09:21:17 2023 +0100

    meson: numactl_dep switch to dependency()
    
    The pkg-config file to libnuma was introduced in 2.0.12 release
    (though the comment mistakenly claims 2.0.14 version). Every
    supported distro ships at least this version, and thus we can
    switch meson detection to dependency().
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

commit dffeef89efc2ed1668cb485d6c3e67ef27b824e8
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Mar 23 09:13:52 2023 +0100

    meson: attr_dep switch to dependency()
    
    The pkg-config file to libattr was introduced in 2.4.48 release.
    Now that every supported distro ships at least this version, we
    can switch meson detection to dependency().
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

commit 63ca3e656c0e8499478cad72cfa70a4e46321812
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Thu Mar 23 09:12:52 2023 +0100

    meson: acl_dep switch to dependency()
    
    The pkg-config file to libacl was introduced in 2.2.53 release.
    Now that every supported distro ships at least this version, we
    can switch meson detection to dependency().
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

