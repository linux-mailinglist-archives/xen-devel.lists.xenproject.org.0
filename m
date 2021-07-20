Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C053CF9B9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 14:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158724.292054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5ozZ-0002AO-Px; Tue, 20 Jul 2021 12:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158724.292054; Tue, 20 Jul 2021 12:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5ozZ-00028N-Lk; Tue, 20 Jul 2021 12:36:57 +0000
Received: by outflank-mailman (input) for mailman id 158724;
 Tue, 20 Jul 2021 12:36:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5ozY-00028D-06; Tue, 20 Jul 2021 12:36:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5ozX-00011I-Rv; Tue, 20 Jul 2021 12:36:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5ozX-0007K9-Hu; Tue, 20 Jul 2021 12:36:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m5ozX-0003yA-HN; Tue, 20 Jul 2021 12:36:55 +0000
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
	bh=44oljdy76n1hbHryxroipm8arwDHfALICF7cdS8sJTU=; b=h82wQm9k4heeglMtUoWmeM/7kx
	E+dWEKDVMejU+Edy1JH9cqY002fR6ue/wGU2vuAfjPSKiRUEMaVQ45XA/iW1ew31HX0v5LpVr6Lz9
	N6c7Xr4A1eDwiOaT09IksbQsp+uymr6x6L2jyLDV2FANDHvxiO/ny5k3GCTTe5P2VYY4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163824-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 163824: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-examine:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-raw:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-pvshim:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-i386:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:regression
    linux-linus:test-amd64-coresched-i386-xl:xen-install:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:debian-fixup:fail:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:guest-stop:fail:regression
    linux-linus:test-arm64-arm64-xl:debian-fixup:fail:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:guest-stop:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-arm64-arm64-libvirt-xsm:debian-fixup:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-thunderx:debian-fixup:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=2734d6c1b1a089fb593ef6a23d4b70903526fe0c
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Jul 2021 12:36:55 +0000

flight 163824 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163824/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
 test-amd64-i386-examine       6 xen-install              fail REGR. vs. 152332
 test-amd64-i386-libvirt       7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-libvirt-xsm   7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl            7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-xsm        7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 152332
 test-amd64-i386-pair         11 xen-install/dst_host     fail REGR. vs. 152332
 test-amd64-i386-freebsd10-amd64  7 xen-install           fail REGR. vs. 152332
 test-amd64-i386-xl-raw        7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-pvshim     7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-freebsd10-i386  7 xen-install            fail REGR. vs. 152332
 test-amd64-i386-xl-shadow     7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-coresched-i386-xl  7 xen-install              fail REGR. vs. 152332
 test-arm64-arm64-xl-credit1  13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm      13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2  13 debian-fixup             fail REGR. vs. 152332
 test-amd64-amd64-amd64-pvgrub 20 guest-stop              fail REGR. vs. 152332
 test-arm64-arm64-xl          13 debian-fixup             fail REGR. vs. 152332
 test-amd64-amd64-i386-pvgrub 20 guest-stop               fail REGR. vs. 152332
 test-arm64-arm64-xl-thunderx 14 guest-start    fail in 163801 REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm 14 guest-start    fail in 163801 REGR. vs. 152332

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail in 163801 pass in 163824
 test-arm64-arm64-libvirt-xsm 13 debian-fixup               fail pass in 163801
 test-arm64-arm64-xl-thunderx 13 debian-fixup               fail pass in 163801
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10     fail pass in 163801

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 163801 like 152332
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 152332
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152332
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152332
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                2734d6c1b1a089fb593ef6a23d4b70903526fe0c
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  353 days
Failing since        152366  2020-08-01 20:49:34 Z  352 days  601 attempts
Testing same since   163801  2021-07-19 08:10:02 Z    1 days    2 attempts

------------------------------------------------------------
6700 people touched revisions under test,
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
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

(No revision log; it would be 1978200 lines long.)

