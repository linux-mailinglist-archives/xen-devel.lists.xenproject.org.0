Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E12957C405
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 08:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372520.604283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEPDt-0006EI-Dr; Thu, 21 Jul 2022 05:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372520.604283; Thu, 21 Jul 2022 05:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEPDt-0006Bi-At; Thu, 21 Jul 2022 05:59:45 +0000
Received: by outflank-mailman (input) for mailman id 372520;
 Thu, 21 Jul 2022 05:59:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEPDr-0006BY-MM; Thu, 21 Jul 2022 05:59:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEPDr-00022y-Ig; Thu, 21 Jul 2022 05:59:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEPDr-00016l-4y; Thu, 21 Jul 2022 05:59:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oEPDr-0008Gg-4X; Thu, 21 Jul 2022 05:59:43 +0000
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
	bh=xhGQUpl+XTz8g81BDPr3OnhfzK9X12fYAUU30/shZkM=; b=YrhJXwEJNs7GV0EHuO+w7tOuqg
	7sP9AEAnjvIfxibOe0faIWUcna6uo3T1mvdPJYNM7JATTEVS2fHC93J4AuL11oiw+n2TA7K2ab99G
	QgzGw6jVCtCY6bGOVDJ1d0R7/vX6/mKiaaanbeurrq80QIO0lPjYgQu8+udUI7cYXMmc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171711-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 171711: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-arm64-arm64-xl-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=f45fd24c90767240735c6161c39699ad86fc38fa
X-Osstest-Versions-That:
    qemuu=68e26e1e812c8b09313d7929271f6cbd47ef4c07
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Jul 2022 05:59:43 +0000

flight 171711 qemu-mainline real [real]
flight 171714 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/171711/
http://logs.test-lab.xenproject.org/osstest/logs/171714/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-vhd     17 guest-start/debian.repeat fail REGR. vs. 171704

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail pass in 171714-retest
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail pass in 171714-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171704
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171704
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171704
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171704
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171704
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171704
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171704
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171704
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                f45fd24c90767240735c6161c39699ad86fc38fa
baseline version:
 qemuu                68e26e1e812c8b09313d7929271f6cbd47ef4c07

Last test of basis   171704  2022-07-20 11:08:20 Z    0 days
Testing same since   171711  2022-07-20 19:41:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brian Cain <bcain@quicinc.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Peter Maydell <peter.maydell@linaro.org>
  Taylor Simpson <tsimpson@quicinc.com>
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
 test-armhf-armhf-xl                                          pass    
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      fail    
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
commit f45fd24c90767240735c6161c39699ad86fc38fa
Merge: 1f64dd76a1 23f13e1986
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Wed Jul 20 14:13:32 2022 +0100

    Merge tag 'pull-request-2022-07-20' of https://gitlab.com/thuth/qemu into staging
    
    * Fixes for s390x floating point vector instructions
    
    # gpg: Signature made Wed 20 Jul 2022 08:14:50 BST
    # gpg:                using RSA key 27B88847EEE0250118F3EAB92ED9D774FE702DB5
    # gpg:                issuer "thuth@redhat.com"
    # gpg: Good signature from "Thomas Huth <th.huth@gmx.de>" [full]
    # gpg:                 aka "Thomas Huth <thuth@redhat.com>" [full]
    # gpg:                 aka "Thomas Huth <huth@tuxfamily.org>" [full]
    # gpg:                 aka "Thomas Huth <th.huth@posteo.de>" [unknown]
    # Primary key fingerprint: 27B8 8847 EEE0 2501 18F3  EAB9 2ED9 D774 FE70 2DB5
    
    * tag 'pull-request-2022-07-20' of https://gitlab.com/thuth/qemu:
      tests/tcg/s390x: test signed vfmin/vfmax
      target/s390x: fix NaN propagation rules
      target/s390x: fix handling of zeroes in vfmin/vfmax
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
    
    # Conflicts:
    #       fpu/softfloat-specialize.c.inc

commit 1f64dd76a1bdf50ec8ab66da0ee7dcfd48ea31e4
Merge: 68e26e1e81 15fc6badbd
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Wed Jul 20 11:51:00 2022 +0100

    Merge tag 'pull-hex-20220719-1' of https://github.com/quic/qemu into staging
    
    Recall that the semantics of a Hexagon mem_noshuf packet are that the
    store effectively happens before the load.  There are two bug fixes
    in this series.
    
    # gpg: Signature made Tue 19 Jul 2022 22:25:19 BST
    # gpg:                using RSA key 3635C788CE62B91FD4C59AB47B0244FB12DE4422
    # gpg: Good signature from "Taylor Simpson (Rock on) <tsimpson@quicinc.com>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 3635 C788 CE62 B91F D4C5  9AB4 7B02 44FB 12DE 4422
    
    * tag 'pull-hex-20220719-1' of https://github.com/quic/qemu:
      Hexagon (target/hexagon) fix bug in mem_noshuf load exception
      Hexagon (target/hexagon) fix store w/mem_noshuf & predicated load
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 15fc6badbd28a126346f84c1acae48e273b66b67
Author: Taylor Simpson <tsimpson@quicinc.com>
Date:   Thu Jul 7 14:05:46 2022 -0700

    Hexagon (target/hexagon) fix bug in mem_noshuf load exception
    
    The semantics of a mem_noshuf packet are that the store effectively
    happens before the load.  However, in cases where the load raises an
    exception, we cannot simply execute the store first.
    
    This change adds a probe to check that the load will not raise an
    exception before executing the store.
    
    If the load is predicated, this requires special handling.  We check
    the condition before performing the probe.  Since, we need the EA to
    perform the check, we move the GET_EA portion inside CHECK_NOSHUF_PRED.
    
    Test case added in tests/tcg/hexagon/mem_noshuf_exception.c
    
    Suggested-by: Alessandro Di Federico <ale@rev.ng>
    Suggested-by: Anton Johansson <anjo@rev.ng>
    Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220707210546.15985-3-tsimpson@quicinc.com>

commit cab86dea1d205f5224770de294cc718be467ccf8
Author: Taylor Simpson <tsimpson@quicinc.com>
Date:   Thu Jul 7 14:05:45 2022 -0700

    Hexagon (target/hexagon) fix store w/mem_noshuf & predicated load
    
    Call the CHECK_NOSHUF macro multiple times: once in the
    fGEN_TCG_PRED_LOAD() and again in fLOAD().
    
    Before this commit, a packet with a store and a predicated
    load with mem_noshuf that gets encoded like this:
    
        { P0 = cmp.eq(R17,#0x0)
          memw(R18+#0x0) = R2
          if (!P0.new) R3 = memw(R17+#0x4) }
    
    ... would end up generating a branch over both the load
    and the store like so:
    
        ...
        brcond_i32 loc17,$0x0,eq,$L1
        mov_i32 loc18,store_addr_1
        qemu_st_i32 store_val32_1,store_addr_1,leul,0
        qemu_ld_i32 loc16,loc7,leul,0
        set_label $L1
        ...
    
    Test cases added to tests/tcg/hexagon/mem_noshuf.c
    
    Co-authored-by: Taylor Simpson <tsimpson@quicinc.com>
    Signed-off-by: Brian Cain <bcain@quicinc.com>
    Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220707210546.15985-2-tsimpson@quicinc.com>

commit 23f13e1986e2ed3a02b65c0bf376c8c61d04ae7a
Author: Ilya Leoshkevich <iii@linux.ibm.com>
Date:   Wed Jul 13 20:26:12 2022 +0200

    tests/tcg/s390x: test signed vfmin/vfmax
    
    Add a test to prevent regressions. Try all floating point value sizes
    and all combinations of floating point value classes. Verify the results
    against PoP tables, which are represented as close to the original as
    possible - this produces a lot of checkpatch complaints, but it seems
    to be justified in this case.
    
    Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220713182612.3780050-4-iii@linux.ibm.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 63dd7bcbea143814924e2c6f1c01a7d9ca8038f5
Author: Ilya Leoshkevich <iii@linux.ibm.com>
Date:   Wed Jul 13 20:26:11 2022 +0200

    target/s390x: fix NaN propagation rules
    
    s390x has the same NaN propagation rules as ARM, and not as x86.
    
    Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: David Hildenbrand <david@redhat.com>
    Message-Id: <20220713182612.3780050-3-iii@linux.ibm.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 13c59eb09bd6d1fbc13f08b708226421f14a232b
Author: Ilya Leoshkevich <iii@linux.ibm.com>
Date:   Wed Jul 13 20:26:10 2022 +0200

    target/s390x: fix handling of zeroes in vfmin/vfmax
    
    vfmin_res() / vfmax_res() are trying to check whether a and b are both
    zeroes, but in reality they check that they are the same kind of zero.
    This causes incorrect results when comparing positive and negative
    zeroes.
    
    Fixes: da4807527f3b ("s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)")
    Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
    Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: David Hildenbrand <david@redhat.com>
    Message-Id: <20220713182612.3780050-2-iii@linux.ibm.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

