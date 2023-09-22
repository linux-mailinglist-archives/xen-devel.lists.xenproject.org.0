Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A067AA775
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 05:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606694.944696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjXEA-00056r-2W; Fri, 22 Sep 2023 03:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606694.944696; Fri, 22 Sep 2023 03:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjXE9-000559-Uj; Fri, 22 Sep 2023 03:53:13 +0000
Received: by outflank-mailman (input) for mailman id 606694;
 Fri, 22 Sep 2023 03:53:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjXE8-00054x-Ot; Fri, 22 Sep 2023 03:53:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjXE8-0003vG-EW; Fri, 22 Sep 2023 03:53:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjXE7-0006WO-VK; Fri, 22 Sep 2023 03:53:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qjXE7-0005Kz-UR; Fri, 22 Sep 2023 03:53:11 +0000
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
	bh=Ph37avv0iK/AqVA4GXESYgMq0qMYoLSgT8av5IkrAIs=; b=2X6z6b3xdbcyejLJKrePQm1+jk
	EBWev1xa/nI0Cj7dWP9PfbKFHY1qo8u1Dtzfy051zZ6uStiFji84HWO81c5IfRmVujtKlIAaWbYHb
	1oh8XFaCRgpeh6R7glDwjfIzIVLTdibzwFhhOWvY2EeqMvaCGAPu2xA9M/Fj/1VKKg8o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.15-testing test] 183108: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-4.15-testing:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    xen-4.15-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-4.15-testing:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:heisenbug
    xen-4.15-testing:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    xen-4.15-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=3a9a2901cc8b24f28dbdc6fb63f57006c77a1f47
X-Osstest-Versions-That:
    xen=0517763e771f2e2582bc492fafa42a86400ab957
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Sep 2023 03:53:11 +0000

flight 183108 xen-4.15-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183108/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 182658

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail in 183095 pass in 183108
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host       fail pass in 183095
 test-amd64-amd64-xl-qcow2    21 guest-start/debian.repeat  fail pass in 183095

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182658
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182658
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182658
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182658
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182658
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182658
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182658
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182658
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182658
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182658
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182658
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182658
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  3a9a2901cc8b24f28dbdc6fb63f57006c77a1f47
baseline version:
 xen                  0517763e771f2e2582bc492fafa42a86400ab957

Last test of basis   182658  2023-09-06 09:50:17 Z   15 days
Testing same since   183081  2023-09-20 10:06:38 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
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


Not pushing.

------------------------------------------------------------
commit 3a9a2901cc8b24f28dbdc6fb63f57006c77a1f47
Author: Jan Beulich <JBeulich@suse.com>
Date:   Wed Sep 20 10:36:06 2023 +0100

    x86/shadow: defer releasing of PV's top-level shadow reference
    
    sh_set_toplevel_shadow() re-pinning the top-level shadow we may be
    running on is not enough (and at the same time unnecessary when the
    shadow isn't what we're running on): That shadow becomes eligible for
    blowing away (from e.g. shadow_prealloc()) immediately after the
    paging lock was dropped. Yet it needs to remain valid until the actual
    page table switch occurred.
    
    Propagate up the call chain the shadow entry that needs releasing
    eventually, and carry out the release immediately after switching page
    tables. Handle update_cr3() failures by switching to idle pagetables.
    Note that various further uses of update_cr3() are HVM-only or only act
    on paused vCPU-s, in which case sh_set_toplevel_shadow() will not defer
    releasing of the reference.
    
    While changing the update_cr3() hook, also convert the "do_locking"
    parameter to boolean.
    
    This is CVE-2023-34322 / XSA-438.
    
    Reported-by: Tim Deegan <tim@xen.org>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>
    (cherry picked from commit fb0ff49fe9f784bfee0370c2a3c5f20e39d7a1cb)

commit d7b78041dc819efde0350f27754a61cb01a93496
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 30 20:24:25 2023 +0100

    x86/spec-ctrl: Mitigate the Zen1 DIV leakage
    
    In the Zen1 microarchitecure, there is one divider in the pipeline which
    services uops from both threads.  In the case of #DE, the latched result from
    the previous DIV to execute will be forwarded speculatively.
    
    This is an interesting covert channel that allows two threads to communicate
    without any system calls.  In also allows userspace to obtain the result of
    the most recent DIV instruction executed (even speculatively) in the core,
    which can be from a higher privilege context.
    
    Scrub the result from the divider by executing a non-faulting divide.  This
    needs performing on the exit-to-guest paths, and ist_exit-to-Xen.
    
    Alternatives in IST context is believed safe now that it's done in NMI
    context.
    
    This is XSA-439 / CVE-2023-20588.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit b5926c6ecf05c28ee99c6248c42d691ccbf0c315)

commit b007f82a708bb5119314677168318e301038b0f8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 15 12:13:51 2023 +0100

    x86/amd: Introduce is_zen{1,2}_uarch() predicates
    
    We already have 3 cases using STIBP as a Zen1/2 heuristic, and are about to
    introduce a 4th.  Wrap the heuristic into a pair of predicates rather than
    opencoding it, and the explanation of the heuristic, at each usage site.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit de1d265001397f308c5c3c5d3ffc30e7ef8c0705)

commit dac906062088f11a0577e9d7ef2642c5d8663432
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 13 13:53:33 2023 +0100

    x86/spec-ctrl: Issue VERW during IST exit to Xen
    
    There is a corner case where e.g. an NMI hitting an exit-to-guest path after
    SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
    flush to scrub potentially sensitive data from uarch buffers.
    
    In order to compensate, issue VERW when exiting to Xen from an IST entry.
    
    SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
    and we're about to add a third.  Load the field into %ebx, and list the
    register as clobbered.
    
    %r12 has been arranged to be the ist_exit signal, so add this as an input
    dependency and use it to identify when to issue a VERW.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 3ee6066bcd737756b0990d417d94eddc0b0d2585)

commit d39e5cf76f2a15120491b3b020d973d04c181388
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 13 12:20:12 2023 +0100

    x86/entry: Track the IST-ness of an entry for the exit paths
    
    Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
    entry/exit asm, so it only needs setting in the IST path.
    
    As this is subtle and fragile, add check_ist_exit() to be used in debugging
    builds to cross-check that the ist_exit boolean matches the entry vector.
    
    Write check_ist_exit() it in C, because it's debug only and the logic more
    complicated than I care to maintain in asm.
    
    For now, we only need to use this signal in the exit-to-Xen path, but some
    exit-to-guest paths happen in IST context too.  Check the correctness in all
    exit paths to avoid the logic bit-rotting.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 21bdc25b05a0f8ab6bc73520a9ca01327360732c)
    
    x86/entry: Partially revert IST-exit checks
    
    The patch adding check_ist_exit() didn't account for the fact that
    reset_stack_and_jump() is not an ABI-preserving boundary.  The IST-ness in
    %r12 doesn't survive into the next context, and is a stale value C.
    
    This shows up in Gitlab CI for the Clang build:
    
      https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5112783827
    
    and in OSSTest for GCC 8:
    
      http://logs.test-lab.xenproject.org/osstest/logs/183045/test-amd64-amd64-xl-qemuu-debianhvm-amd64/serial-pinot0.log
    
    There's no straightforward way to reconstruct the IST-exit-ness on the
    exit-to-guest path after a context switch.  For now, we only need IST-exit on
    the return-to-Xen path.
    
    Fixes: 21bdc25b05a0 ("x86/entry: Track the IST-ness of an entry for the exit paths")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 9b57c800b79b96769ea3dcd6468578fa664d19f9)

commit d75cb6dab86763b65210d69a40ac59bce90e1bb8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 13 13:48:16 2023 +0100

    x86/entry: Adjust restore_all_xen to hold stack_end in %r14
    
    All other SPEC_CTRL_{ENTRY,EXIT}_* helpers hold stack_end in %r14.  Adjust it
    for consistency.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 7aa28849a1155d856e214e9a80a7e65fffdc3e58)

commit 93504b3a6c92a1f2821af5e0960be8fda066ad77
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 30 20:11:50 2023 +0100

    x86/spec-ctrl: Improve all SPEC_CTRL_{ENTER,EXIT}_* comments
    
    ... to better explain how they're used.
    
    Doing so highlights that SPEC_CTRL_EXIT_TO_XEN is missing a VERW flush for the
    corner case when e.g. an NMI hits late in an exit-to-guest path.
    
    Leave a TODO, which will be addressed in subsequent patches which arrange for
    VERW flushing to be safe within SPEC_CTRL_EXIT_TO_XEN.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 45f00557350dc7d0756551069803fc49c29184ca)

commit 67b97438604c6a7ff7ee3dd5c98fff3f5669f6d7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 1 11:38:44 2023 +0100

    x86/spec-ctrl: Turn the remaining SPEC_CTRL_{ENTRY,EXIT}_* into asm macros
    
    These have grown more complex over time, with some already having been
    converted.
    
    Provide full Requires/Clobbers comments, otherwise missing at this level of
    indirection.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 7125429aafb9e3c9c88fc93001fc2300e0ac2cc8)

commit 806893afb66fe7fa96ec495f2b7561bb396053ee
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 12 17:03:16 2023 +0100

    x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into it's single user
    
    With the SPEC_CTRL_EXIT_TO_XEN{,_IST} confusion fixed, it's now obvious that
    there's only a single EXIT_TO_XEN path.  Fold DO_SPEC_CTRL_EXIT_TO_XEN into
    SPEC_CTRL_EXIT_TO_XEN to simplify further fixes.
    
    When merging labels, switch the name to .L\@_skip_sc_msr as "skip" on its own
    is going to be too generic shortly.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 694bb0f280fd08a4377e36e32b84b5062def4de2)

commit 094cd5cb851d267feda3681d034ad46e91c60532
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 12 15:06:49 2023 +0100

    x86/spec-ctrl: Fix confusion between SPEC_CTRL_EXIT_TO_XEN{,_IST}
    
    c/s 3fffaf9c13e9 ("x86/entry: Avoid using alternatives in NMI/#MC paths")
    dropped the only user, leaving behind the (incorrect) implication that Xen had
    split exit paths.
    
    Delete the unused SPEC_CTRL_EXIT_TO_XEN and rename SPEC_CTRL_EXIT_TO_XEN_IST
    to SPEC_CTRL_EXIT_TO_XEN for consistency.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 1c18d73774533a55ba9d1cbee8bdace03efdb5e7)

commit db3386e6cad6065c2a9155d4056b59164edb64dd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 23 09:26:36 2023 +0200

    x86/AMD: extend Zenbleed check to models "good" ucode isn't known for
    
    Reportedly the AMD Custom APU 0405 found on SteamDeck, models 0x90 and
    0x91, (quoting the respective Linux commit) is similarly affected. Put
    another instance of our Zen1 vs Zen2 distinction checks in
    amd_check_zenbleed(), forcing use of the chickenbit irrespective of
    ucode version (building upon real hardware never surfacing a version of
    0xffffffff).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    (cherry picked from commit 145a69c0944ac70cfcf9d247c85dee9e99d9d302)
(qemu changes not included)

