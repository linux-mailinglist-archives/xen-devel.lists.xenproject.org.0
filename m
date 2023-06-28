Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBD37407FC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 04:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556304.868729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEKS8-00070c-KI; Wed, 28 Jun 2023 01:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556304.868729; Wed, 28 Jun 2023 01:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEKS8-0006z0-DS; Wed, 28 Jun 2023 01:58:40 +0000
Received: by outflank-mailman (input) for mailman id 556304;
 Wed, 28 Jun 2023 01:58:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEKS7-0006yq-EW; Wed, 28 Jun 2023 01:58:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEKS7-0002Kr-5y; Wed, 28 Jun 2023 01:58:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEKS6-0008VT-Gb; Wed, 28 Jun 2023 01:58:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEKS6-0007Wh-FZ; Wed, 28 Jun 2023 01:58:38 +0000
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
	bh=I9tI0LfaBNUgTp91aG9Qc38SL0QJgDf6AcdZPQLNbvg=; b=Y58KdUq2dJOfHMEou5Qx/NdaLz
	OYm6awUh7I/G3Oti8QIUoMsFFLbKNe5nv5ow86gQ828TrU2NdcdknX9QUkV0LUSLEf6vuIbfcQOhj
	O4cwliypfRCS5siBG0EUaEniuAdhlxVF/R5/gkT0yK1N4eoPskkyYr6+Ow7fptcK9eF0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181617-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 181617: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-qemuu-nested-amd:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:debian-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:debian-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:debian-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:leak-check/basis(11):fail:allowable
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=04fc8904d5d18a132f5ad67b79ee980b6602c8c6
X-Osstest-Versions-That:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jun 2023 01:58:38 +0000

flight 181617 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181617/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-multivcpu  8 xen-boot                fail REGR. vs. 180278
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 180278
 test-amd64-amd64-libvirt-qcow2 11 leak-check/basis(11)   fail REGR. vs. 180278
 test-amd64-amd64-xl          11 leak-check/basis(11)     fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-ovmf-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-freebsd11-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 180278
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 180278
 test-amd64-amd64-xl-shadow    8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-xsm      12 debian-install           fail REGR. vs. 180278
 test-amd64-amd64-libvirt     12 debian-install           fail REGR. vs. 180278
 test-amd64-amd64-xl-pvhv2-amd 12 debian-install          fail REGR. vs. 180278
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 180278
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 180278
 test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 180278
 test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 180278
 test-amd64-amd64-xl-credit1   8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 180278
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 180278
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 180278
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 16 guest-localmigrate fail REGR. vs. 180278
 test-amd64-amd64-xl-credit2  12 debian-install           fail REGR. vs. 180278
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 180278

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     11 leak-check/basis(11)     fail REGR. vs. 180278

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-examine      8 reboot                       fail  like 180278
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl           8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-raw  8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-qcow2  8 xen-boot                    fail like 180278
 test-armhf-armhf-xl-vhd       8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 180278
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                04fc8904d5d18a132f5ad67b79ee980b6602c8c6
baseline version:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d

Last test of basis   180278  2023-04-16 19:41:46 Z   72 days
Failing since        180281  2023-04-17 06:24:36 Z   71 days  137 attempts
Testing same since   181617  2023-06-27 19:11:24 Z    0 days    1 attempts

------------------------------------------------------------
2871 people touched revisions under test,
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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      pass    
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

(No revision log; it would be 386307 lines long.)

