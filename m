Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA3D7414D1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 17:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556522.869107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEWzb-0007Ci-0Y; Wed, 28 Jun 2023 15:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556522.869107; Wed, 28 Jun 2023 15:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEWza-0007Bw-TH; Wed, 28 Jun 2023 15:22:02 +0000
Received: by outflank-mailman (input) for mailman id 556522;
 Wed, 28 Jun 2023 15:22:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEWza-0007Bm-2Y; Wed, 28 Jun 2023 15:22:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEWzZ-0006Iq-Ta; Wed, 28 Jun 2023 15:22:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEWzZ-0000dG-Er; Wed, 28 Jun 2023 15:22:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEWzZ-00049c-EL; Wed, 28 Jun 2023 15:22:01 +0000
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
	bh=O2nFc4lNIVQ35rXHTKpzkP90v+kgQnp1UY5v55Sw69k=; b=in6DY1xpv1k0WxNIGtxRQcnNS7
	4Kmw4RhV7hL41cMLDEfZKC4pG+gnNxxv7D1nVlRJswty61NqBuAhcYe0zCbPN4aXfTDQlJbM2OSbf
	WQoG7tW1zcdDwX7fqpLxlIKMX30sP6c1+Css+PYhshBDdloh9E/r2/vQhCuHFQpct6mw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181621-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 181621: tolerable FAIL - PUSHED
X-Osstest-Failures:
    libvirt:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:heisenbug
    libvirt:test-amd64-i386-libvirt-raw:xen-install:fail:heisenbug
    libvirt:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:heisenbug
    libvirt:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
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
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=d725932a283fdc8b827d83cfc5d54b38cf40592b
X-Osstest-Versions-That:
    libvirt=ceb4dc8e17aa077a3254bace82554015d72bd71c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jun 2023 15:22:01 +0000

flight 181621 libvirt real [real]
flight 181625 libvirt real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181621/
http://logs.test-lab.xenproject.org/osstest/logs/181625/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host fail in 181625 pass in 181621
 test-amd64-i386-libvirt-raw   7 xen-install         fail pass in 181625-retest
 test-amd64-i386-libvirt-pair 10 xen-install/src_host fail pass in 181625-retest
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail pass in 181625-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail blocked in 181610
 test-amd64-i386-libvirt-raw 14 migrate-support-check fail in 181625 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181610
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181610
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
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
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              d725932a283fdc8b827d83cfc5d54b38cf40592b
baseline version:
 libvirt              ceb4dc8e17aa077a3254bace82554015d72bd71c

Last test of basis   181610  2023-06-27 04:18:54 Z    1 days
Testing same since   181621  2023-06-28 04:20:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Jiri Denemark <jdenemar@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Nikolai Barybin <nikolai.barybin@virtuozzo.com>
  Weblate <noreply@weblate.org>
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
 test-amd64-i386-libvirt-pair                                 fail    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  fail    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/libvirt.git
   ceb4dc8e17..d725932a28  d725932a283fdc8b827d83cfc5d54b38cf40592b -> xen-tested-master

