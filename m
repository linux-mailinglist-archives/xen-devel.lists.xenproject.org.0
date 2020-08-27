Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF7253F26
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 09:30:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBCMA-0004Pt-Cn; Thu, 27 Aug 2020 07:29:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz+Y=CF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kBCM8-0004PT-Hz
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 07:29:56 +0000
X-Inumbo-ID: 84997a9f-0f30-4438-9bea-2b0cece446b0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84997a9f-0f30-4438-9bea-2b0cece446b0;
 Thu, 27 Aug 2020 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=z/S6edaMtH+bohs1GpS5BILG5EKgeL97lDXQ5jd2VBs=; b=U6EdfdHfQ3Dbguk2rH1pEXkUpv
 i0LW30/Q2PNxvRG2W7p7fCGmyEENympOMKHM3BfEejJmcpX7KHXB4ci7W/VxR7wGc20L2ESKrqJSP
 1Ivbb8ow1z+h0KZFYMXjidBXxj/RpruuBRUEjLGLXXIrz+78/0x0XINPGOxt6/YGsQTc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kBCM1-0007ZD-15; Thu, 27 Aug 2020 07:29:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kBCM0-0004Ae-Ox; Thu, 27 Aug 2020 07:29:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kBCM0-0000ir-Ly; Thu, 27 Aug 2020 07:29:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152862-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 152862: regressions - FAIL
X-Osstest-Failures: linux-linus:test-amd64-i386-xl-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-pair:xen-boot/src_host:fail:regression
 linux-linus:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
 linux-linus:test-amd64-i386-examine:reboot:fail:regression
 linux-linus:test-amd64-i386-libvirt:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-coresched-i386-xl:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-boot:fail:regression
 linux-linus:test-amd64-i386-freebsd10-i386:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-raw:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-pvshim:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-shadow:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-pair:xen-boot/src_host:fail:regression
 linux-linus:test-amd64-i386-libvirt-pair:xen-boot/dst_host:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-examine:reboot:fail:regression
 linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:heisenbug
 linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:heisenbug
 linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:heisenbug
 linux-linus:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:heisenbug
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=2ac69819ba9e3d8d550bb5d2d2df74848e556812
X-Osstest-Versions-That: linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Aug 2020 07:29:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152862 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152862/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm        7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-boot fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-boot fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-boot     fail REGR. vs. 152332
 test-amd64-i386-pair         10 xen-boot/src_host        fail REGR. vs. 152332
 test-amd64-i386-pair         11 xen-boot/dst_host        fail REGR. vs. 152332
 test-amd64-i386-examine       8 reboot                   fail REGR. vs. 152332
 test-amd64-i386-libvirt       7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 152332
 test-amd64-coresched-i386-xl  7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-libvirt-xsm   7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-boot     fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 152332
 test-amd64-i386-freebsd10-i386  7 xen-boot               fail REGR. vs. 152332
 test-amd64-i386-xl-raw        7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-pvshim     7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 152332
 test-amd64-i386-freebsd10-amd64  7 xen-boot              fail REGR. vs. 152332
 test-amd64-i386-xl-shadow     7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 10 xen-boot/src_host        fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 11 xen-boot/dst_host        fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 152332
 test-amd64-i386-xl            7 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1   7 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 152332
 test-armhf-armhf-xl-credit2   7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 152332
 test-armhf-armhf-xl-arndale   7 xen-boot                 fail REGR. vs. 152332

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-raw  7 xen-boot         fail in 152842 pass in 152862
 test-armhf-armhf-xl-multivcpu  7 xen-boot                  fail pass in 152842
 test-armhf-armhf-xl-rtds      7 xen-boot                   fail pass in 152842
 test-armhf-armhf-xl-vhd      15 guest-start/debian.repeat  fail pass in 152842

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check fail in 152842 never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check fail in 152842 never pass
 test-armhf-armhf-xl-rtds    13 migrate-support-check fail in 152842 never pass
 test-armhf-armhf-xl-rtds 14 saverestore-support-check fail in 152842 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 152332
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152332
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 152332
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 linux                2ac69819ba9e3d8d550bb5d2d2df74848e556812
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z   26 days
Failing since        152366  2020-08-01 20:49:34 Z   25 days   29 attempts
Testing same since   152842  2020-08-26 02:46:56 Z    1 days    2 attempts

------------------------------------------------------------
2219 people touched revisions under test,
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
 test-arm64-arm64-xl                                          pass    
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
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

(No revision log; it would be 293362 lines long.)

