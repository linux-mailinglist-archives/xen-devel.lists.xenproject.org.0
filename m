Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080636125AA
	for <lists+xen-devel@lfdr.de>; Sat, 29 Oct 2022 23:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432426.685159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ootiv-0000Tl-Ag; Sat, 29 Oct 2022 21:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432426.685159; Sat, 29 Oct 2022 21:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ootiv-0000RF-7a; Sat, 29 Oct 2022 21:50:37 +0000
Received: by outflank-mailman (input) for mailman id 432426;
 Sat, 29 Oct 2022 21:50:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ootit-0000R0-Ee; Sat, 29 Oct 2022 21:50:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ootit-0003Ab-BD; Sat, 29 Oct 2022 21:50:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ootis-0001dr-KD; Sat, 29 Oct 2022 21:50:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ootis-00011i-Jo; Sat, 29 Oct 2022 21:50:34 +0000
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
	bh=OvZqTPBGoXu1YRo/Oxa4T4DCzP9WJjbOaQoT6bHYbfQ=; b=kqMeqKbKOQTebZF3jnml7eiHzI
	rnTUYPR60pGj8DV7MHSxBGoGtEqA78/opl1X9LXiI1tiEy1z4o22LRL+nMgtt9LNyTDd8HEDNpEo0
	O+FHF6j/FcAWD/JC+CdNjiWhf1zXws/RJsl0nJdwro/frGHc/4Q0MA8bkrmytbk/TEmk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174539-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 174539: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=576e61cea1e4b66f52f164dee0edbe4b1c999997
X-Osstest-Versions-That:
    linux=9d84bb40bcb30a7fa16f33baa967aeb9953dda78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Oct 2022 21:50:34 +0000

flight 174539 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174539/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 173462
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-arndale   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 173462
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-libvirt-qcow2  8 xen-boot               fail REGR. vs. 173462
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 173462

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173462
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173462
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                576e61cea1e4b66f52f164dee0edbe4b1c999997
baseline version:
 linux                9d84bb40bcb30a7fa16f33baa967aeb9953dda78

Last test of basis   173462  2022-10-07 18:41:45 Z   22 days
Failing since        173470  2022-10-08 06:21:34 Z   21 days   31 attempts
Testing same since   174535  2022-10-29 01:13:15 Z    0 days    2 attempts

------------------------------------------------------------
1496 people touched revisions under test,
not listing them all

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
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 139382 lines long.)

