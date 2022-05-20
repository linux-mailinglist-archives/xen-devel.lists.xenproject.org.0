Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01A52F5E4
	for <lists+xen-devel@lfdr.de>; Sat, 21 May 2022 00:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334533.558564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsBWC-0002Sd-K7; Fri, 20 May 2022 22:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334533.558564; Fri, 20 May 2022 22:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsBWC-0002Pe-Gj; Fri, 20 May 2022 22:54:48 +0000
Received: by outflank-mailman (input) for mailman id 334533;
 Fri, 20 May 2022 22:54:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nsBWA-0002PU-EK; Fri, 20 May 2022 22:54:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nsBWA-0000un-6W; Fri, 20 May 2022 22:54:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nsBW9-0005IJ-OB; Fri, 20 May 2022 22:54:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nsBW9-0007Br-Nh; Fri, 20 May 2022 22:54:45 +0000
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
	bh=gTj7/NCrR+Zo8I5+CBRI4eQyjZj15ikduOphM+k2fsQ=; b=c0mNmt9IWGS+RC30qCUMEH0KND
	tvQ8tG6SkY7Dzzj9UMcEawnMqlYqPBbFOpg1F1SZdi9pxndGf4PWhBIldNEHMoQQxeZwp1jx7A/ns
	+1QqdWjoYtBR9wun222ogR8DrMBMIGfucnBu+LwYWrQ+Q9osLtYh/1Ebh9rfMvsuaNq8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170606-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 170606: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-examine:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ec0cce125b8b9fccde3fa825b8ee963083b5de3b
X-Osstest-Versions-That:
    xen=43aa3f6e72d340a85d3943b86350f6196a87289c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 May 2022 22:54:45 +0000

flight 170606 xen-unstable real [real]
flight 170614 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/170606/
http://logs.test-lab.xenproject.org/osstest/logs/170614/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-examine       6 xen-install              fail REGR. vs. 170586

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170586
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170586
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170586
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170586
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 170586
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 170586
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170586
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170586
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170586
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 170586
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 170586
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170586
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  ec0cce125b8b9fccde3fa825b8ee963083b5de3b
baseline version:
 xen                  43aa3f6e72d340a85d3943b86350f6196a87289c

Last test of basis   170586  2022-05-20 01:51:50 Z    0 days
Testing same since   170606  2022-05-20 15:06:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com> # Arm
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
 test-arm64-arm64-xl                                          pass    
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
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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
commit ec0cce125b8b9fccde3fa825b8ee963083b5de3b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:24:43 2022 +0200

    AMD/IOMMU: return old PTE from {set,clear}_iommu_pte_present()
    
    In order to free intermediate page tables when replacing smaller
    mappings by a single larger one callers will need to know the full PTE.
    Flush indicators can be derived from this in the callers (and outside
    the locked regions). First split set_iommu_pte_present() from
    set_iommu_ptes_present(): Only the former needs to return the old PTE,
    while the latter (like also set_iommu_pde_present()) doesn't even need
    to return flush indicators. Then change return types/values and callers
    accordingly.
    
    Note that for subsequent changes returning merely a boolean (old.pr) is
    not going to be sufficient; the next_level field will also be required.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 0e461c2d7f45c50fcf4d26c7730cdd7cde77eb1f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:24:11 2022 +0200

    AMD/IOMMU: walk trees upon page fault
    
    This is to aid diagnosing issues and largely matches VT-d's behavior.
    Since I'm adding permissions output here as well, take the opportunity
    and also add their displaying to amd_dump_page_table_level().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit ba3fcb5f52eb2d3cc43b64bad2fc78507ad4fc7a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:23:31 2022 +0200

    IOMMU: have iommu_{,un}map() split requests into largest possible chunks
    
    Introduce a helper function to determine the largest possible mapping
    that allows covering a request (or the next part of it that is left to
    be processed).
    
    In order to not add yet more recurring dfn_add() / mfn_add() to the two
    callers of the new helper, also introduce local variables holding the
    values presently operated on.
    
    Note that strictly speaking iommu_unmap() doen't need to consult
    mapping_order(), as unmapping doesn't require superpage support. This,
    however, prevents freeing of deep hierarchies of page tables in vendor
    code (once suitably enabled), which otherwise would require dealing with
    preemption needs.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit e0de7c2ee63dc440b41c79c203707abde3a473dc
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:22:24 2022 +0200

    IOMMU: add order parameter to ->{,un}map_page() hooks
    
    Or really, in the case of ->map_page(), accommodate it in the existing
    "flags" parameter. All call sites will pass 0 for now.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com> # Arm

commit 09e4ac7bc071ad0549adcb24d82d8a3c4e72d05c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:21:49 2022 +0200

    IOMMU: simplify unmap-on-error in iommu_map()
    
    As of 68a8aa5d7264 ("iommu: make map and unmap take a page count,
    similar to flush") there's no need anymore to have a loop here.
    
    Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit d029b9cf13875823532ee6e4201421dba16c81d4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:21:10 2022 +0200

    AMD/IOMMU: correct potentially-UB shifts
    
    Recent changes (likely 5fafa6cf529a ["AMD/IOMMU: have callers specify
    the target level for page table walks"]) have made Coverity notice a
    shift count in iommu_pde_from_dfn() which might in theory grow too
    large. While this isn't a problem in practice, address the concern
    nevertheless to not leave dangling breakage in case very large
    superpages would be enabled at some point.
    
    Coverity ID: 1504264
    
    While there also address a similar issue in set_iommu_ptes_present().
    It's not clear to me why Coverity hasn't spotted that one.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 444b555dc9e09fa3ce90f066e0c88dec9b47f422
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:20:35 2022 +0200

    PCI: don't allow "pci-phantom=" to mark real devices as phantom functions
    
    IOMMU code mapping / unmapping devices and interrupts will misbehave if
    a wrong command line option declared a function "phantom" when there's a
    real device at that position. Warn about this and adjust the specified
    stride (in the worst case ignoring the option altogether).
    
    Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 6a2ea1a2370a0c8a0210accac0ae62e68c185134
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Fri May 20 12:19:45 2022 +0200

    ns16550: use poll mode if INTERRUPT_LINE is 0xff
    
    Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
    by the PCI Local Bus Specification Revision 3.0 (from 2004) as
    "unknown"/"no connection". Fallback to poll mode in this case.
    The 0xff handling is x86-specific, the surrounding code is guarded with
    CONFIG_X86 anyway.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 488a15a669e5b83267590ed8dad2428a5216ee87
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 20 12:19:06 2022 +0200

    xen/cpupool: limit number of cpupools
    
    Today the number of cpupools in a system is unlimited. This can lead to
    multiple problems (e.g. duplicate cpupool-id or scalability issues).
    
    Limit the number of cpupools to twice the number of maximum possible
    cpus, allowing to have one cpupool per physical cpu plus some spare
    cpupools for special means (there are already existing use cases for
    such spare cpupools).
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 77bbea1bafe2d5155e6325bdd782c9f19f8a6aea
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 20 12:18:50 2022 +0200

    tools/libs/light: update xenstore entry when setting max domain memory
    
    libxl_domain_setmaxmem() called during "xl mem-max" should update the
    domain's memory/static-max Xenstore node, as otherwise "xl mem-set"
    won't be able to set the memory size to the new maximum.
    
    Adjust the related comments and documentation accordingly.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit c038304b46ffb3d3d314819d1331ca61e9ff668b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri May 20 12:17:52 2022 +0200

    VT-d: fix !HVM build
    
    EPT is of no interest when !HVM. While I'm observing gcc11 to fully
    eliminate the function, older gcc's DCE looks to not be as good.
    CONFIG_UBSAN apparently also limits how aggressively dead code is
    eliminated. Aid the compiler in eliminating the accesses of
    opt_hap_{2mb,1gb}, which otherwise cause undefined symbol errors when
    linking.
    
    While there adjust types.
    
    Fixes: c479415610f0 ("x86/P2M: p2m.c is HVM-only")
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
(qemu changes not included)

