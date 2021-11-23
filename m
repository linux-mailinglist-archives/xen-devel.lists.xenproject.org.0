Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F123245A9C8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 18:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229843.397418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZNg-0003W9-ET; Tue, 23 Nov 2021 17:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229843.397418; Tue, 23 Nov 2021 17:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZNg-0003St-Ag; Tue, 23 Nov 2021 17:14:56 +0000
Received: by outflank-mailman (input) for mailman id 229843;
 Tue, 23 Nov 2021 17:14:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpZNf-0003Sj-72; Tue, 23 Nov 2021 17:14:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpZNf-0008VA-2L; Tue, 23 Nov 2021 17:14:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpZNe-0000XS-Od; Tue, 23 Nov 2021 17:14:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mpZNe-0004kZ-O7; Tue, 23 Nov 2021 17:14:54 +0000
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
	bh=rR0riRMpHe3ZSCJ87De4Y863kjRerB6C/jhy0Xy9D8A=; b=S/kQnaKGC+hAio99iuX43b105e
	iC6OoR1mkFRqvQeHclCpUPtZbJ96vHyOHjQCdfPvlLPE9tF3/SGL5Z7PqZH/DBhEFIrBAzptRs323
	ILMvocx/yeJdUxYPGNMNusL72EH3HWpcjq2/LTw45PqVZ0q9Lq9/aEwCsLQ/CG9pxYtQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166307-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 166307: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-credit2:debian-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:debian-install:fail:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=3c87012e3887e8a904a3494283c4acfa7ef777dc
X-Osstest-Versions-That:
    qemuu=89d2f9e4c63799f7f03e9180c63b7dc45fc2a04a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Nov 2021 17:14:54 +0000

flight 166307 qemu-mainline real [real]
flight 166316 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166307/
http://logs.test-lab.xenproject.org/osstest/logs/166316/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-credit2  12 debian-install           fail REGR. vs. 166300
 test-amd64-amd64-libvirt-xsm 12 debian-install           fail REGR. vs. 166300

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 166316-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 166316 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 166316 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166300
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166300
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166300
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166300
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166300
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166300
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166300
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166300
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                3c87012e3887e8a904a3494283c4acfa7ef777dc
baseline version:
 qemuu                89d2f9e4c63799f7f03e9180c63b7dc45fc2a04a

Last test of basis   166300  2021-11-22 21:08:31 Z    0 days
Testing same since   166307  2021-11-23 08:11:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eric Blake <eblake@redhat.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Lei Rao <lei.rao@intel.com>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Rao, Lei <lei.rao@intel.com>
  Richard Henderson <richard.henderson@linaro.org>
  Stefan Weil <sw@weilnetz.de>
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
 test-amd64-amd64-libvirt-xsm                                 fail    
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
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
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


Not pushing.

------------------------------------------------------------
commit 3c87012e3887e8a904a3494283c4acfa7ef777dc
Merge: d8a6311dab c5ba621954
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Nov 22 23:21:28 2021 +0100

    Merge tag 'pull-request-2021-11-22' of https://gitlab.com/thuth/qemu into staging
    
    * Documentation updates
    
    # gpg: Signature made Mon 22 Nov 2021 03:05:39 PM CET
    # gpg:                using RSA key 27B88847EEE0250118F3EAB92ED9D774FE702DB5
    # gpg:                issuer "thuth@redhat.com"
    # gpg: Good signature from "Thomas Huth <th.huth@gmx.de>" [full]
    # gpg:                 aka "Thomas Huth <thuth@redhat.com>" [full]
    # gpg:                 aka "Thomas Huth <th.huth@posteo.de>" [unknown]
    # gpg:                 aka "Thomas Huth <huth@tuxfamily.org>" [full]
    
    * tag 'pull-request-2021-11-22' of https://gitlab.com/thuth/qemu:
      docs: Render binary names as monospaced text
      docs: Use double quotes instead of single quotes for COLO
      docs: Drop deprecated 'props' from object-add
      Fix some typos in documentation (found by codespell)
      docs: List more commit-message tags in "submitting-a-patch"
      docs: Fix botched rST conversion of 'submitting-a-patch.rst'
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit d8a6311dabe62b7d3553915511e9d61fc3556eb6
Merge: 89d2f9e4c6 e35574226a
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Nov 22 19:15:05 2021 +0100

    Merge tag 'pull-nbd-2021-11-22' of https://repo.or.cz/qemu/ericb into staging
    
    nbd patches for 2021-11-22
    
    - Eric Blake: Avoid uninitialized memory on client hard disconnect
    - Eric Blake: Take advantage of block layer 64-bit zero/trim
    
    # gpg: Signature made Mon 22 Nov 2021 02:55:07 PM CET
    # gpg:                using RSA key 71C2CC22B1C4602927D2F3AAA7A16B4A2527436A
    # gpg: Good signature from "Eric Blake <eblake@redhat.com>" [full]
    # gpg:                 aka "Eric Blake (Free Software Programmer) <ebb9@byu.net>" [full]
    # gpg:                 aka "[jpeg image of size 6874]" [full]
    
    * tag 'pull-nbd-2021-11-22' of https://repo.or.cz/qemu/ericb:
      nbd/server: Simplify zero and trim
      nbd/server: Don't complain on certain client disconnects
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit c5ba62195427d65a44472901cff3dddffc14b3b3
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Thu Nov 18 20:27:44 2021 +0100

    docs: Render binary names as monospaced text
    
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-Id: <20211118192744.64325-1-philmd@redhat.com>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit eff708a876b40fe71bedb792d084972d7a52166a
Author: Rao, Lei <lei.rao@intel.com>
Date:   Mon Nov 22 15:49:47 2021 +0800

    docs: Use double quotes instead of single quotes for COLO
    
    Signed-off-by: Lei Rao <lei.rao@intel.com>
    Message-Id: <1637567387-28250-2-git-send-email-lei.rao@intel.com>
    Reviewed-by: Markus Armbruster <armbru@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 8f75cae2dda8a55eb3a6c712bd22b18a90c0a5ac
Author: Rao, Lei <lei.rao@intel.com>
Date:   Mon Nov 22 15:49:46 2021 +0800

    docs: Drop deprecated 'props' from object-add
    
    In commit 5024340745 "qapi/qom: Drop deprecated 'props' from
    object-add" (v6.0.0), we also should update documents.
    
    Signed-off-by: Lei Rao <lei.rao@intel.com>
    Message-Id: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
    Reviewed-by: Markus Armbruster <armbru@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit b980c1aec63908074040e5cab135728e3b5db117
Author: Stefan Weil <sw@weilnetz.de>
Date:   Wed Nov 17 22:07:02 2021 +0100

    Fix some typos in documentation (found by codespell)
    
    Signed-off-by: Stefan Weil <sw@weilnetz.de>
    Message-Id: <20211117210702.1393570-1-sw@weilnetz.de>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    [thuth: "what's" --> "what is" as suggested by philmd]
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit 93e86b1664951f02fceed9ac312576f60232d503
Author: Kashyap Chamarthy <kchamart@redhat.com>
Date:   Fri Nov 19 20:31:18 2021 +0100

    docs: List more commit-message tags in "submitting-a-patch"
    
    Add some more examples of commonly used commit-message tags.
    
    (Thanks: Alex Bennée)
    
    Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
    Message-Id: <20211119193118.949698-3-kchamart@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit cd6b1674d61120a77823b99516d27486c4f4f883
Author: Kashyap Chamarthy <kchamart@redhat.com>
Date:   Fri Nov 19 20:31:17 2021 +0100

    docs: Fix botched rST conversion of 'submitting-a-patch.rst'
    
    I completely botched up the merged[0] rST conversion of this document by
    accidentally dropping entire hunks (!) of text. :-(  I made it very hard
    for reviewers to spot it, as the omitted text was buried deep in the
    document.  To fix my hatchet job, I reconverted the "SubmitAPatch"
    wiki[1] page from scratch and replaced the existing rST with it, while
    making sure I incorporated previous feedback.
    
    In summary, in this reconverted edition:
    
    - I did a careful (to the extent my eyes allowed) para-by-para
      comparison of the wiki and the rST to make sure I didn't omit
      anything accidentally.
    
    - I made sure to work in the cosmetic feedback[2] that Thomas Huth
      pointed out in the merged (and botched) edition:
    
       - fix the hyperlinks in "Split up long patches"
    
       - replace ".". with "does not end with a dot" (in "Write a meaningful
         commit message" section)
    
       - replace "---" with ``---`` so that it doesn't render as an em-dash
         (there were two other occurrences; I fixed those too)
    
    - Use "QEMU" spelling consistently in prose usage
    
    - Add a consistent "refer to git-config" link where appropriate
    
    Thanks to Thomas Huth and Alex Bennée for noticing it on IRC.  And sorry
    for my sloppiness.
    
    Fixes: 9f73de8df033 ("docs: rSTify the "SubmitAPatch" wiki")
    
    [0] https://gitlab.com/qemu-project/qemu/-/commit/9f73de8df033
    [1] https://wiki.qemu.org/index.php?title=Contribute/SubmitAPatch&oldid=10387
    [2] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg03600.html
    
    Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
    Message-Id: <20211119193118.949698-2-kchamart@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    [thuth: Some more cosmetical changes, fixed links from external to internal]
    Signed-off-by: Thomas Huth <thuth@redhat.com>

commit e35574226a63f29e32eda8da5cc14832f19850e2
Author: Eric Blake <eblake@redhat.com>
Date:   Wed Nov 17 11:02:30 2021 -0600

    nbd/server: Simplify zero and trim
    
    Now that the block layer supports 64-bit operations (see commit
    2800637a and friends, new to v6.2), we no longer have to self-fragment
    requests larger than 2G, reverting the workaround added in 890cbccb08
    ("nbd: Fix large trim/zero requests", v5.1.0).
    
    Signed-off-by: Eric Blake <eblake@redhat.com>
    Message-Id: <20211117170230.1128262-3-eblake@redhat.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

commit 1644cccea5c71b02b9cf8f78b780e7069a29b189
Author: Eric Blake <eblake@redhat.com>
Date:   Wed Nov 17 11:02:29 2021 -0600

    nbd/server: Don't complain on certain client disconnects
    
    When a client disconnects abruptly, but did not have any pending
    requests (for example, when using nbdsh without calling h.shutdown),
    we used to output the following message:
    
    $ qemu-nbd -f raw file
    $ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)'
    qemu-nbd: Disconnect client, due to: Failed to read request: Unexpected end-of-file before all bytes were read
    
    Then in commit f148ae7, we refactored nbd_receive_request() to use
    nbd_read_eof(); when this returns 0, we regressed into tracing
    uninitialized memory (if tracing is enabled) and reporting a
    less-specific:
    
    qemu-nbd: Disconnect client, due to: Request handling failed in intermediate state
    
    Note that with Unix sockets, we have yet another error message,
    unchanged by the 6.0 regression:
    
    $ qemu-nbd -k /tmp/sock -f raw file
    $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.trim(1,0)'
    qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
    
    But in all cases, the error message goes away if the client performs a
    soft shutdown by using NBD_CMD_DISC, rather than a hard shutdown by
    abrupt disconnect:
    
    $ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)' -c 'h.shutdown()'
    
    This patch fixes things to avoid uninitialized memory, and in general
    avoids warning about a client that does a hard shutdown when not in
    the middle of a packet.  A client that aborts mid-request, or which
    does not read the full server's reply, can still result in warnings,
    but those are indeed much more unusual situations.
    
    CC: qemu-stable@nongnu.org
    Fixes: f148ae7d36 ("nbd/server: Quiesce coroutines on context switch", v6.0.0)
    Signed-off-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    [eblake: defer unrelated typo fixes to later patch]
    Message-Id: <20211117170230.1128262-2-eblake@redhat.com>
    Signed-off-by: Eric Blake <eblake@redhat.com>

