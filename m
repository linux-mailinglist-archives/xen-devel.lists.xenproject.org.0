Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EC52FA8B
	for <lists+xen-devel@lfdr.de>; Sat, 21 May 2022 12:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334671.558739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsLv3-0003Fh-VM; Sat, 21 May 2022 10:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334671.558739; Sat, 21 May 2022 10:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsLv3-0003Cc-Rb; Sat, 21 May 2022 10:01:09 +0000
Received: by outflank-mailman (input) for mailman id 334671;
 Sat, 21 May 2022 10:01:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nsLv2-0003CS-C4; Sat, 21 May 2022 10:01:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nsLv2-0004wC-7I; Sat, 21 May 2022 10:01:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nsLv1-00083b-Qt; Sat, 21 May 2022 10:01:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nsLv1-00055i-QO; Sat, 21 May 2022 10:01:07 +0000
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
	bh=Gi+8kj0MMzoyuB/MvuHRIHfF0ESB1goZAJcjbAeBrKA=; b=OJy4aU9IJBwSj/EMdehaMXrQkb
	z8edqU2ol/kHslP65MLJfr8f34r9K0dkf5MoCjGOqKgfor9tIAnnLgW3FAXYs3rwkD4048MOrERtf
	vTNW69J9iWi12hYK9RrZ+XxrzsqId/mVpPb3Tlq4sDjw/+4/gcpZdogbe+mzyq6vQ2A4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170611-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 170611: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:host-install(5):broken:regression
    qemu-mainline:test-arm64-arm64-xl-seattle:debian-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=3757b0d08b399c609954cf57f273b1167e5d7a8d
X-Osstest-Versions-That:
    qemuu=3a650ac995ca36fb9974b82ba50aac8d1fd18b6a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 21 May 2022 10:01:07 +0000

flight 170611 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170611/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-qcow2    <job status>                 broken
 test-armhf-armhf-libvirt-raw    <job status>                 broken
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 170578
 test-armhf-armhf-xl-arndale   5 host-install(5)        broken REGR. vs. 170578
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 170578
 test-armhf-armhf-libvirt-raw  5 host-install(5)        broken REGR. vs. 170578
 test-armhf-armhf-xl-credit2   5 host-install(5)        broken REGR. vs. 170578
 test-arm64-arm64-xl-seattle  12 debian-install           fail REGR. vs. 170578

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170578
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170578
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 170578
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170578
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170578
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 170578
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                3757b0d08b399c609954cf57f273b1167e5d7a8d
baseline version:
 qemuu                3a650ac995ca36fb9974b82ba50aac8d1fd18b6a

Last test of basis   170578  2022-05-19 20:39:37 Z    1 days
Testing same since   170611  2022-05-20 19:08:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>
  Thomas Huth <thuth@redhat.com>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          broken  
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               broken  
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

broken-job test-armhf-armhf-libvirt-qcow2 broken
broken-job test-armhf-armhf-libvirt-raw broken
broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-arndale broken
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)

Not pushing.

------------------------------------------------------------
commit 3757b0d08b399c609954cf57f273b1167e5d7a8d
Merge: 3a650ac995 83602083b4
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri May 20 08:04:30 2022 -0700

    Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging
    
    * Remove Ubuntu 18.04 containers (not supported anymore)
    * Improve the cleanup of the QEMU binary in case of failing qtests
    * Update the Windows support statement
    * Remove the capstone submodule (and rely on Capstone of the distros instead)
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQJFBAABCAAvFiEEJ7iIR+7gJQEY8+q5LtnXdP5wLbUFAmKEovQRHHRodXRoQHJl
    # ZGhhdC5jb20ACgkQLtnXdP5wLbXXtxAAsjL2M/kUcr1KBSfkaMhTa0D3OKPQ+p/e
    # Bac/9+l7UhZZLLffzg53lSsCmlj9cSr5cVUkooT7IFS03wauH7ZJ/wuefIS8IYED
    # jREmeMWXmVTTfQo4QQZ+6T+XknG2DWjzXQ3sNat71LH4RbHXO5um3zYIdDUaujP+
    # v4sAKKH+F/FUsEXMP1rFmZpkaWOcvsuSwP/H4kEfhlovebAZINPow26eYYRrTM2t
    # Ifs7HelO12TlmqlBFn0UzHj8bV8MZkqcjj0efocVzuYMQ8DVcxE7IPc3tft2PuUu
    # Ia+Czh1hLsLA1zYiO/nN9bVIIewFGOErASzjlYWUlQwNRc1nLik+m+p4Cl9WOEhL
    # JpkN/yY3pTI5uC6a4KgxDQGTeFUR4D5la6Hg7yQjQbTBMEeGFCV50iOdkItdnRBx
    # ByReVctXS3oIhsDqHMb8qydlBkPp5pUrAXdj43IBCUb3UsrHmCxH+z8U5BhHvv4D
    # OleykLKyMcuff6HcEpC1fBQNIFJX5uS69EtAXYtyo2kb5zAJWezCv65UPldAZJCT
    # kRT4beueQ+d5t+4LZn1qNePdoyeFArdCLlOqg/3Fx08kM5eEv22pSQhOtWclE7U3
    # tgorikFybClvKJ+YnXBAxD7oFKe+h9L+RYCFOgoTebrbMX54IjjJfeo2DydhHTt7
    # IaJnsI+vvAA=
    # =z6e9
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Wed 18 May 2022 12:40:36 AM PDT
    # gpg:                using RSA key 27B88847EEE0250118F3EAB92ED9D774FE702DB5
    # gpg:                issuer "thuth@redhat.com"
    # gpg: Good signature from "Thomas Huth <th.huth@gmx.de>" [undefined]
    # gpg:                 aka "Thomas Huth <thuth@redhat.com>" [undefined]
    # gpg:                 aka "Thomas Huth <th.huth@posteo.de>" [unknown]
    # gpg:                 aka "Thomas Huth <huth@tuxfamily.org>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 27B8 8847 EEE0 2501 18F3  EAB9 2ED9 D774 FE70 2DB5
    
    * tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu:
      capstone: Remove the capstone submodule
      capstone: Allow version 3.0.5 again
      tests/vm: Add capstone to the NetBSD and OpenBSD VMs
      docs/about: Update the support statement for Windows
      tests/qtest: use prctl(PR_SET_PDEATHSIG) as fallback to kill QEMU
      tests/qtest: fix registration of ABRT handler for QEMU cleanup
      Remove Ubuntu 18.04 container support from the repository
      gitlab-ci: Switch the container of the 'check-patch' & 'check-dco' jobs
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 83602083b4ada6ceb86bfb327e83556ebab120fc
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon May 16 16:58:23 2022 +0200

    capstone: Remove the capstone submodule
    
    Now that we allow compiling with Capstone v3.0.5 again, all our supported
    build hosts should provide at least this version of the disassembler
    library, so we do not need to ship this as a submodule anymore.
    
    Message-Id: <20220516145823.148450-4-thuth@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 43ecd16678b74b281c3cc7de0dd62a36279b6025
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon May 16 16:58:22 2022 +0200

    capstone: Allow version 3.0.5 again
    
    According to
    
     https://lore.kernel.org/qemu-devel/20200921174118.39352-1-richard.henderson@linaro.org/
    
    there was an issue with Capstone 3.0.4 from Ubuntu 18, which was the reason
    for bumping our minimum Capstone requirement to version 4.0. And indeed,
    compiling with that version 3.0.4 from Ubuntu 18.04 still fails (after
    allowing it with a hack in meson.build). But now that we've dropped support
    for Ubuntu 18.04, that issue is not relevant anymore. Compiling with Capstone
    version 3.0.5 (e.g. used in Ubuntu 20.04) seems to work fine, so let's allow
    that version again.
    
    Message-Id: <20220516145823.148450-3-thuth@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 28e7e95e6bc374262a3f03cf7b6fb7a1b3c3ebbe
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon May 16 16:58:21 2022 +0200

    tests/vm: Add capstone to the NetBSD and OpenBSD VMs
    
    The Capstone library that is shipped with NetBSD and OpenBSD works
    fine when compiling QEMU, so let's enable this in our build-test
    VMs to get a little bit more build-test coverage.
    
    Message-Id: <20220516145823.148450-2-thuth@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 0ce9b08c10d043307d125709032a897d05c80bdd
Author: Thomas Huth <thuth@redhat.com>
Date:   Fri May 13 08:39:58 2022 +0200

    docs/about: Update the support statement for Windows
    
    Our support statement for Windows currently talks about "Vista / Server
    2008" - which is related to the API of Windows, and this is not easy
    to understand for the non-technical users. Additionally, glib sets the
    _WIN32_WINNT macro to 0x0601 already, which indicates the Windows 7 API,
    so QEMU effectively depends on the Windows 7 API, too.
    
    Thus let's bump the _WIN32_WINNT setting in QEMU to the same level as
    glib uses and adjust our support statement in the documentation to
    something similar that we're using for Linux and the *BSD systems
    (i.e. only the two most recent versions), which should hopefully be
    easier to understand for the users now.
    
    And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
    itself, I think we could mention this build environment here, too.
    
    Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Reviewed-by: Stefan Weil <sw@weilnetz.de>
    Message-Id: <20220513063958.1181443-1-thuth@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 6cbde91a27587ca27a3c1979fe7f5f0d28eb6db9
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Fri May 13 16:49:06 2022 +0100

    tests/qtest: use prctl(PR_SET_PDEATHSIG) as fallback to kill QEMU
    
    Although we register a ABRT handler to kill off QEMU when g_assert()
    triggers, we want an extra safety net. The QEMU process might be
    non-functional and thus not have responded to SIGTERM. The test script
    might also have crashed with SEGV, in which case the cleanup handlers
    won't ever run.
    
    Using the Linux specific prctl(PR_SET_PDEATHSIG) syscall, we
    can ensure that QEMU gets sent SIGKILL as soon as the controlling
    qtest exits, if nothing else has correctly told it to quit.
    
    Note, technically the death signal is sent when the *thread* that
    called fork() exits. IOW, if you are calling qtest_init() in one
    thread, letting that thread exit, and then expecting to run
    qtest_quit() in a different thread, things are not going to work
    out. Fortunately that is not a scenario that exists in qtests,
    as pairs of qtest_init and qtest_quit are always called from the
    same thread.
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20220513154906.206715-3-berrange@redhat.com>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 83f79d4efc8dac7e511bc4375d0f9d90ff9db731
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Fri May 13 16:49:05 2022 +0100

    tests/qtest: fix registration of ABRT handler for QEMU cleanup
    
    qtest_init registers a hook to cleanup the running QEMU process
    should g_assert() fire before qtest_quit is called. When the first
    hook is registered, it is supposed to triggere registration of the
    SIGABRT handler. Unfortunately the logic in hook_list_is_empty is
    inverted, so the SIGABRT handler never gets registered, unless
    2 or more QEMU processes are run concurrently. This caused qtest
    to leak QEMU processes anytime g_assert triggers.
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20220513154906.206715-2-berrange@redhat.com>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit f3f0cbaf97c78b1fc1f3855f576e46ea6ad4f34c
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon May 16 13:59:12 2022 +0200

    Remove Ubuntu 18.04 container support from the repository
    
    According to our "Supported build platforms" policy, we now do not support
    Ubuntu 18.04 anymore. Remove the related container files and entries from
    our CI.
    
    Message-Id: <20220516115912.120951-1-thuth@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit e4e68c31db5472111fbff528d7348a7e6b2ae07d
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon May 16 10:23:10 2022 +0200

    gitlab-ci: Switch the container of the 'check-patch' & 'check-dco' jobs
    
    The 'check-patch' and 'check-dco' jobs only need Python and git for
    checking the patches, so it's not really necessary to use a container
    here that has all the other build dependencies installed. By using a
    lightweight Alpine container, we can improve the runtime here quite a
    bit, cutting it down from ca. 1:30 minutes to ca. 45 seconds.
    
    Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20220516082310.33876-1-thuth@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Reviewed-by: John Snow <jsnow@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

