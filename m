Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159A6076D7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 14:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427645.676919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olr1b-0007sK-29; Fri, 21 Oct 2022 12:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427645.676919; Fri, 21 Oct 2022 12:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olr1a-0007pP-VC; Fri, 21 Oct 2022 12:21:18 +0000
Received: by outflank-mailman (input) for mailman id 427645;
 Fri, 21 Oct 2022 12:21:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olr1Z-0007pF-9q; Fri, 21 Oct 2022 12:21:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olr1Z-0001ob-2z; Fri, 21 Oct 2022 12:21:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olr1Y-0005aE-Mp; Fri, 21 Oct 2022 12:21:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1olr1Y-0001Gq-M6; Fri, 21 Oct 2022 12:21:16 +0000
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
	bh=zRfY3cygQlvcWYSxA8EHVvffzDDMnvMCZu0VOM2tLeg=; b=E20i21FPfiWLf8RbPRucAFfzWX
	r4jXpHHd8HLdtpbkumyLLDxiNLSTX6hpzKWRxwD536tNLK6FzUEuJInFrsLj4Dt5ksKqpI0g9wDmN
	Tu4ODLHqwPHBBoN1wKPMd/TgLzwKBS10hhnNnyZeK6Bb/d2HBOSAFkS661pEgcuf1Oug=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-4.16-testing test] 174136: tolerable FAIL - PUSHED
X-Osstest-Failures:
    qemu-upstream-4.16-testing:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=62dd49f2172fb7dfe8d4223bfa45aede05155328
X-Osstest-Versions-That:
    qemuu=107951211a8d17658e1aaa0c23a8cf29f8806ad8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Oct 2022 12:21:16 +0000

flight 174136 qemu-upstream-4.16-testing real [real]
flight 174191 qemu-upstream-4.16-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/174136/
http://logs.test-lab.xenproject.org/osstest/logs/174191/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install   fail pass in 174191-retest
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 174191-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168659
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168659
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 168659
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 168659
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168659
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168659
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168659
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168659
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                62dd49f2172fb7dfe8d4223bfa45aede05155328
baseline version:
 qemuu                107951211a8d17658e1aaa0c23a8cf29f8806ad8

Last test of basis   168659  2022-03-17 11:11:40 Z  218 days
Testing same since   174136  2022-10-20 14:10:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Haochen Tong <i@hexchain.org>
  Jason Wang <jasowang@redhat.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/qemu-xen.git
   107951211a..62dd49f217  62dd49f2172fb7dfe8d4223bfa45aede05155328 -> stable-4.16

