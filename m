Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0866538AE2
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 07:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339096.563917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvuSj-0007QM-ON; Tue, 31 May 2022 05:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339096.563917; Tue, 31 May 2022 05:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvuSj-0007OE-L9; Tue, 31 May 2022 05:30:37 +0000
Received: by outflank-mailman (input) for mailman id 339096;
 Tue, 31 May 2022 05:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuSh-0007O4-W7; Tue, 31 May 2022 05:30:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuSh-0003ai-UB; Tue, 31 May 2022 05:30:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuSh-0005Vd-HE; Tue, 31 May 2022 05:30:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuSh-0005cf-CY; Tue, 31 May 2022 05:30:35 +0000
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
	bh=4hTGaqK5R39Ljbe2H+KDsB8pYsKY8+iTbyywDzOLicA=; b=eC7I59Gvtbk5famZXJfaMibuQo
	tUTDUdu4PJeyUxQa8yoawwfPst50aYhu89lCOLH+vFe2oOdVA+FTUR/4cgPutLBngbumAUZwv5Nb2
	lxbvUG6OD3THGhJFZ1s8lVEDFHPUeKjIBQWPjQfZlWRI+mvWRjZa5xex6pZne1SZpfLA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170779-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 170779: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    linux-linus:test-amd64-amd64-pair:guest-start/debian:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:guest-start:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-examine-bios:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-start:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This:
    linux=8ab2afa23bd197df47819a87f0265c0ac95c5b6a
X-Osstest-Versions-That:
    linux=d6ecaa0024485effd065124fe774de2e22095f2d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 May 2022 05:30:35 +0000

flight 170779 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170779/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 170714
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 170714
 test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 170714
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 170714
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 170714
 test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 170714
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 170714
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 170714
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 170714
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 170714
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 170714
 test-amd64-amd64-freebsd11-amd64 13 guest-start          fail REGR. vs. 170714
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 170714
 test-amd64-amd64-xl-credit2  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 170714
 test-amd64-amd64-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 170714
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 170714
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-libvirt-pair 12 xen-boot/src_host       fail REGR. vs. 170714
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 170714
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 170714
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 170714
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 170714
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
 test-arm64-arm64-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 170714
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 170714

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 170714

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170714
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170714
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170714
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170714

version targeted for testing:
 linux                8ab2afa23bd197df47819a87f0265c0ac95c5b6a
baseline version:
 linux                d6ecaa0024485effd065124fe774de2e22095f2d

Last test of basis   170714  2022-05-24 03:27:44 Z    7 days
Failing since        170716  2022-05-24 11:12:06 Z    6 days   20 attempts
Testing same since   170779  2022-05-30 21:42:54 Z    0 days    1 attempts

------------------------------------------------------------
1946 people touched revisions under test,
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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
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

(No revision log; it would be 217025 lines long.)

