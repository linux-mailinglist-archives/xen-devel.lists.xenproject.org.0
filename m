Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6543BF39A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152819.282306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Iyt-0000m3-Pq; Thu, 08 Jul 2021 01:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152819.282306; Thu, 08 Jul 2021 01:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Iyt-0000k9-Ke; Thu, 08 Jul 2021 01:37:35 +0000
Received: by outflank-mailman (input) for mailman id 152819;
 Thu, 08 Jul 2021 01:37:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Iys-0000jz-84; Thu, 08 Jul 2021 01:37:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Iyr-0001wc-Vt; Thu, 08 Jul 2021 01:37:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Iyr-0007c6-Hc; Thu, 08 Jul 2021 01:37:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Iyr-0006BM-Gn; Thu, 08 Jul 2021 01:37:33 +0000
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
	bh=NMVTG0JHQ6/5qM9wcUiSjAFqjVr25XzQn3rmeRg1vAc=; b=nxZBesBb8zh+TImXJPz/VJbDSx
	xyHxoOo9pxyk3AEt67r67sML50lv9BbqqSRao6d86Sb0/tv5k8MjqYoirFz2Gv8QNT26KIxjoAQSc
	Uicle2/QvxnqepnSvzI3uUqnM2fFkNP+9fbajLc8Z0RJuq0iQgEihU/1hRD/LrSaFy/8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163402-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 163402: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:regression
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:host-install(5):broken:regression
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8b24c7edc2f285b2eff7af7dcf02f752ae03b5b6
X-Osstest-Versions-That:
    linux=82ffbc138a1fc9076f55e626bd8352fc9a2ca9e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Jul 2021 01:37:33 +0000

flight 163402 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163402/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <job status>       broken
 test-amd64-i386-libvirt-xsm     <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)     broken REGR. vs. 163198
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 163198
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 163198
 test-amd64-i386-libvirt-xsm   5 host-install(5)        broken REGR. vs. 163198
 test-armhf-armhf-xl-vhd     17 guest-start/debian.repeat fail REGR. vs. 163198

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 163198
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 163198
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 163198
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 163198
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 163198
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 163198
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 163198
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 163198
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 163198
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 163198
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 163198
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8b24c7edc2f285b2eff7af7dcf02f752ae03b5b6
baseline version:
 linux                82ffbc138a1fc9076f55e626bd8352fc9a2ca9e9

Last test of basis   163198  2021-06-30 13:43:03 Z    7 days
Testing same since   163402  2021-07-07 12:42:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Christian König <christian.koenig@amd.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hulk Robot <hulkrobot@huawei.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Johannes Berg <johannes.berg@intel.com>
  Leon Romanovsky <leonro@nvidia.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  ManYi Li <limanyi@uniontech.com>
  Mark Bloch <mbloch@nvidia.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Sasha Levin <sashal@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  YueHaibing <yuehaibing@huawei.com>

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
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  broken  
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
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
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
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

broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-i386-libvirt-xsm host-install(5)

Not pushing.

------------------------------------------------------------
commit 8b24c7edc2f285b2eff7af7dcf02f752ae03b5b6
Author: Sasha Levin <sashal@kernel.org>
Date:   Wed Jul 7 08:29:57 2021 -0400

    Linux 5.4.130
    
    Tested-by: Guenter Roeck <linux@roeck-us.net>
    Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
    Tested-by: Shuah Khan <skhan@linuxfoundation.org>
    Tested-by: Hulk Robot <hulkrobot@huawei.com>
    Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

commit 5e8519c4083bfd937f72c729659c714e7b8d5b29
Author: Mark Bloch <mbloch@nvidia.com>
Date:   Mon Jun 7 11:03:12 2021 +0300

    RDMA/mlx5: Block FDB rules when not in switchdev mode
    
    commit edc0b0bccc9c80d9a44d3002dcca94984b25e7cf upstream.
    
    Allow creating FDB steering rules only when in switchdev mode.
    
    The only software model where a userspace application can manipulate
    FDB entries is when it manages the eswitch. This is only possible in
    switchdev mode where we expose a single RDMA device with representors
    for all the vports that are connected to the eswitch.
    
    Fixes: 52438be44112 ("RDMA/mlx5: Allow inserting a steering rule to the FDB")
    Link: https://lore.kernel.org/r/e928ae7c58d07f104716a2a8d730963d1bd01204.1623052923.git.leonro@nvidia.com
    Reviewed-by: Maor Gottlieb <maorg@nvidia.com>
    Signed-off-by: Mark Bloch <mbloch@nvidia.com>
    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
    Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
    [sudip: manually backport to old file]
    Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit c5fb49e12f2c3c7ea04a343fdba4af265e91b61e
Author: Johannes Berg <johannes.berg@intel.com>
Date:   Fri Jun 25 10:37:34 2021 +0200

    gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
    
    [ Upstream commit c6414e1a2bd26b0071e2b9d6034621f705dfd4c0 ]
    
    Both of these drivers use ioport_map(), so they need to
    depend on HAS_IOPORT_MAP. Otherwise, they cannot be built
    even with COMPILE_TEST on architectures without an ioport
    implementation, such as ARCH=um.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>
    Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

commit cf5eb82097234b5c77107a58eccf0509c925fa8c
Author: Christian König <christian.koenig@amd.com>
Date:   Fri Jun 11 14:34:50 2021 +0200

    drm/nouveau: fix dma_address check for CPU/GPU sync
    
    [ Upstream commit d330099115597bbc238d6758a4930e72b49ea9ba ]
    
    AGP for example doesn't have a dma_address array.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20210614110517.1624-1-christian.koenig@amd.com
    Signed-off-by: Sasha Levin <sashal@kernel.org>

commit 3edfd34f1338a6c5e105499287a93dec2a80284f
Author: ManYi Li <limanyi@uniontech.com>
Date:   Fri Jun 11 17:44:02 2021 +0800

    scsi: sr: Return appropriate error code when disk is ejected
    
    [ Upstream commit 7dd753ca59d6c8cc09aa1ed24f7657524803c7f3 ]
    
    Handle a reported media event code of 3. This indicates that the media has
    been removed from the drive and user intervention is required to proceed.
    Return DISK_EVENT_EJECT_REQUEST in that case.
    
    Link: https://lore.kernel.org/r/20210611094402.23884-1-limanyi@uniontech.com
    Signed-off-by: ManYi Li <limanyi@uniontech.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

commit a6c85a8433e0606a8ad63a44c1aa32963b61a1a2
Author: YueHaibing <yuehaibing@huawei.com>
Date:   Fri Nov 15 21:08:30 2019 +0800

    x86/efi: remove unused variables
    
    [ Upstream commit 6f090192f8225f52ba95d08785989688cb768cca ]
    
    commit ad723674d675 ("x86/efi: move common keyring handler functions
    to new file") leave this unused.
    
    Fixes: ad723674d675 ("x86/efi: move common keyring handler functions to new file")
    Reported-by: Hulk Robot <hulkci@huawei.com>
    Signed-off-by: YueHaibing <yuehaibing@huawei.com>
    Link: https://lore.kernel.org/r/20191115130830.13320-1-yuehaibing@huawei.com
    Signed-off-by: Sasha Levin <sashal@kernel.org>

