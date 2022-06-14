Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0C54B348
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 16:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349047.575260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o17fE-0000FM-Ns; Tue, 14 Jun 2022 14:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349047.575260; Tue, 14 Jun 2022 14:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o17fE-0000CM-KJ; Tue, 14 Jun 2022 14:37:04 +0000
Received: by outflank-mailman (input) for mailman id 349047;
 Tue, 14 Jun 2022 14:37:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o17fC-0000Ak-7K; Tue, 14 Jun 2022 14:37:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o17fC-0000fU-3B; Tue, 14 Jun 2022 14:37:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o17fB-0001Gz-Fz; Tue, 14 Jun 2022 14:37:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o17fB-0004Ol-FV; Tue, 14 Jun 2022 14:37:01 +0000
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
	bh=ZWC2XlZ6XGQltpFDf+gINKA777VMpDgomZfcfY2mRdA=; b=VlaTP2v/RHYdSxCXn5XzMh7RL3
	ElZy4UPqEIHHGKFsXHlPICopaf/h8jH4URryRYhq8CguK5NdATNu++5yCDWZ5YEj2ezIW6XLCImA/
	LgM/MQNyvEQ1g1haTMSWZZQpL4hF3PvNyf/+l2QuucfObyXnC2U5lfDYjDYtFaV8p9lI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171160-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 171160: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start.2:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-install:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start.2:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
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
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=debd0753663bc89c86f5462a53268f2e3f680f60
X-Osstest-Versions-That:
    qemuu=dcb40541ebca7ec98a14d461593b3cd7282b4fac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Jun 2022 14:37:01 +0000

flight 171160 qemu-mainline real [real]
flight 171163 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/171160/
http://logs.test-lab.xenproject.org/osstest/logs/171163/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    22 guest-start.2            fail REGR. vs. 171149

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail in 171163 pass in 171160
 test-amd64-i386-xl-qemuu-debianhvm-amd64 7 xen-install fail pass in 171163-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     19 guest-start.2           fail blocked in 171149
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171149
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171149
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171149
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171149
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171149
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171149
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171149
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171149
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
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
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                debd0753663bc89c86f5462a53268f2e3f680f60
baseline version:
 qemuu                dcb40541ebca7ec98a14d461593b3cd7282b4fac

Last test of basis   171149  2022-06-13 00:38:22 Z    1 days
Testing same since   171160  2022-06-14 06:39:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bennée <alex.bennee@linaro.org>
  Daniel P. Berrangé <berrange@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
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
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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


Not pushing.

------------------------------------------------------------
commit debd0753663bc89c86f5462a53268f2e3f680f60
Merge: dcb40541eb b56d1ee951
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Jun 13 21:10:57 2022 -0700

    Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging
    
    Various testing fixes:
    
      - fix compiler abi for test-armv6m-undef
      - fix isns suffixes for i386 tcg tests
      - fix gitlab cfi jobs
      - fix makefile docker invocation
      - don't enable xtensa-linux-user builds with system compiler
      - fix CIRRUS_nn var checking
      - don't spam the aarch64/32 runners with too many jobs at once
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQEzBAABCgAdFiEEZoWumedRZ7yvyN81+9DbCVqeKkQFAmKnxfUACgkQ+9DbCVqe
    # KkSksAf/eXGL/k0zUU4RmxmQGWatCPPfbdxWj/pRDJrZl4cvegYK4cqXcfblDkiJ
    # f5kdB4FsSHgJUKic7K7sBSke2xgoi2bvBMeqNIknLo89b+xXZLJSzTE7XCi0W+hm
    # ll3GtHNJMEPjrIhSIAsqiSMFloL5xi7uz+ylBAB49skGF6F3rkCMv4fl7TDFKqaH
    # y5fRzLZMJg+FhlHNwGO0H8O32ZU7FlyqLGQT3JWZywR0n241kQ+gXLykQjQ7//nd
    # 9EbtppXiSOuusbggGCbmUQrEprW93TAEkgxUcuUuQYiAwDp89s66Q0gcwo1qMtcx
    # mORfc+018/WJpBwFF904hBPPjgO08w==
    # =PfzM
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Mon 13 Jun 2022 04:19:17 PM PDT
    # gpg:                using RSA key 6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
    # gpg: Good signature from "Alex Bennée (Master Work Key) <alex.bennee@linaro.org>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 6685 AE99 E751 67BC AFC8  DF35 FBD0 DB09 5A9E 2A44
    
    * tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu:
      .gitlab: use less aggressive nproc on our aarch64/32 runners
      gitlab: compare CIRRUS_nn vars against 'null' not ""
      tests/tcg: disable xtensa-linux-user again
      tests/docker: fix the IMAGE for build invocation
      gitlab-ci: Fix the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs
      tests/tcg/i386: Use explicit suffix on fist insns
      test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b56d1ee9514be227854a589b4e11551bed4448a0
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Mon Jun 13 18:12:58 2022 +0100

    .gitlab: use less aggressive nproc on our aarch64/32 runners
    
    Running on all 80 cores of our aarch64 runner does occasionally
    trigger a race condition which fails the build. However the CI system
    is not the time and place to play with much heisenbugs so turn down
    the nproc to "only" use 40 cores in the build.
    
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Tested-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Message-Id: <20220613171258.1905715-8-alex.bennee@linaro.org>

commit 34776d80f312f36c8cbdf632337dc087e724b568
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Mon Jun 13 18:12:57 2022 +0100

    gitlab: compare CIRRUS_nn vars against 'null' not ""
    
    The GitLab variable comparisons don't have shell like semantics where
    an unset variable compares equal to empty string. We need to explicitly
    test against 'null' to detect an unset variable.
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
    Tested-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Message-Id: <20220608160651.248781-1-berrange@redhat.com>
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Message-Id: <20220613171258.1905715-7-alex.bennee@linaro.org>

commit c48a5c4741d663a77ab3a2b0c1df3a58de6ee340
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Jun 13 18:12:56 2022 +0100

    tests/tcg: disable xtensa-linux-user again
    
    The move from tests/tcg/configure.sh started enabling the container image
    for xtensa-linux-user, which fails because the compiler does not have
    the full set of headers.  The cause is the "xtensa*-softmmu)" case
    in tests/tcg/configure.sh which became just "xtensa*)" in the new
    probe_target_compiler shell function.  Look out for xtensa*-linux-user
    and do not configure it.
    
    Reported-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-Id: <20220608135727.1341946-1-pbonzini@redhat.com>
    Fixes: cd362defbb ("tests/tcg: merge configure.sh back into main configure script")
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Message-Id: <20220613171258.1905715-6-alex.bennee@linaro.org>

commit ab698a4d8b32be717a675880935c774be66f0d03
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Mon Jun 13 18:12:55 2022 +0100

    tests/docker: fix the IMAGE for build invocation
    
    We inadvertently broke the ability to run local builds when the code
    was re-factored. The result was the run stanza failing to find the
    docker image with it's qemu/ prefix.
    
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Fixes: d39eaa2266 ("tests/docker: simplify docker-TEST@IMAGE targets")
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220613171258.1905715-5-alex.bennee@linaro.org>

commit 72ec89bfc5291b8e322a1a60d96d7f43c0375f16
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon Jun 13 18:12:54 2022 +0100

    gitlab-ci: Fix the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs
    
    The job definitions recently got a second "variables:" section by
    accident and thus are failing now if one tries to run them. Merge
    the two sections into one again to fix the issue.
    
    And while we're at it, bump the timeout here (70 minutes are currently
    not enough for the aarch64 job). The jobs are marked as manual anyway,
    so if the user starts them, they want to see their result for sure and
    then it's annoying if the job timeouts too early.
    
    Fixes: e312d1fdbb ("gitlab: convert build/container jobs to .base_job_template")
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    Acked-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220603124809.70794-1-thuth@redhat.com>
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220613171258.1905715-4-alex.bennee@linaro.org>

commit 6012d96379873825ab20d629b828e833023feb9d
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Jun 13 18:12:53 2022 +0100

    tests/tcg/i386: Use explicit suffix on fist insns
    
    Fixes a number of assembler warnings of the form:
    
    test-i386.c: Assembler messages:
    test-i386.c:869: Warning: no instruction mnemonic suffix given
      and no register operands; using default for `fist'
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Message-Id: <20220527171143.168276-1-richard.henderson@linaro.org>
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Message-Id: <20220613171258.1905715-3-alex.bennee@linaro.org>

commit b2df786170a4954d6346c284b8351ca79265d190
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Jun 13 18:12:52 2022 +0100

    test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
    
    GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
    cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Message-Id: <20220604032713.174976-1-richard.henderson@linaro.org>
    Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
    Message-Id: <20220613171258.1905715-2-alex.bennee@linaro.org>

