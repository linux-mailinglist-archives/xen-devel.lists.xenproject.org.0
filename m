Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0973153D6FA
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 15:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341871.567056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxTb6-0007nY-Do; Sat, 04 Jun 2022 13:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341871.567056; Sat, 04 Jun 2022 13:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxTb6-0007kS-AY; Sat, 04 Jun 2022 13:13:44 +0000
Received: by outflank-mailman (input) for mailman id 341871;
 Sat, 04 Jun 2022 13:13:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nxTb5-0007kI-Ki; Sat, 04 Jun 2022 13:13:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nxTb5-00048U-HK; Sat, 04 Jun 2022 13:13:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nxTb5-00005R-67; Sat, 04 Jun 2022 13:13:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nxTb5-0007R1-5f; Sat, 04 Jun 2022 13:13:43 +0000
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
	bh=PP6gM0v9+0ADDkENwcfEt9wbe15vt5Z1VgnAm9dfkhg=; b=wJSKS5j5wAesubxcZgzue7i9wM
	430NGGx7NcWqwlguvSo+ZXTr9O7nHOAjancMDVFh+2v5y7/yMIjcMVbGrYnpJ1NIzQppUCuZO4JoT
	SFBlmP1w48q/1CmUSLvh82cN5FMIyMbQJkcRyzwoJ9HexlF/v9SGGuya44hgWHK4d0u0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170824-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 170824: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=ca127b3fc247517ec7d4dad291f2c0f90602ce5b
X-Osstest-Versions-That:
    qemuu=70e975203f366f2f30daaeb714bb852562b7b72f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Jun 2022 13:13:43 +0000

flight 170824 qemu-mainline real [real]
flight 170827 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/170824/
http://logs.test-lab.xenproject.org/osstest/logs/170827/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 170820

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-vhd 21 guest-start/debian.repeat fail pass in 170827-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170820
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170820
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170820
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 170820
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170820
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170820
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 170820
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170820
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                ca127b3fc247517ec7d4dad291f2c0f90602ce5b
baseline version:
 qemuu                70e975203f366f2f30daaeb714bb852562b7b72f

Last test of basis   170820  2022-06-03 15:38:21 Z    0 days
Testing same since   170824  2022-06-04 03:08:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dmitry Tikhov <d.tihov@yadro.com>
  Dmitry Tikhov <ddtikhov@gmail.com>
  Klaus Jensen <k.jensen@samsung.com>
  Richard Henderson <richard.henderson@linaro.org>
  zhenwei pi <pizhenwei@bytedance.com>

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
 test-amd64-amd64-xl-qcow2                                    fail    
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
 test-amd64-i386-xl-vhd                                       fail    


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
commit ca127b3fc247517ec7d4dad291f2c0f90602ce5b
Merge: 70e975203f d7fe639cab
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri Jun 3 14:14:24 2022 -0700

    Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging
    
    hw/nvme updates
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQEzBAABCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKaZmgACgkQTeGvMW1P
    # DenI7wgAxY4QtRlUnufzaZqcoi+affFTKlKm0JYKZm/Ldxt2RtHoWxRZDLLIUp8B
    # 4XAlIGJw7VwrafEtSkx4K6cSyKluMJ9Ax8pNd03sEweXBBfdhNizspPprp+Jm9P9
    # hRcH8kSiBp5B451cORBlgmoHguWeWawe1r66uFLTCbEMtfQQNaxNVsTsgAsOvtwv
    # XsjLVFVKGNDWXGRta+lzu4seNNuzfucsAmKWUjg5HN38rstY7XxfLVMzt8ORcwjk
    # oNmQuy3JiKujdPVhE5PVgNRZkigwoDt3hDA1QTncGTBUoA/CtaB5SK9EhcJ5xJVI
    # EHv99S9LQ8ng5BJC2pUSU32yRkaNOQ==
    # =XTXH
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Fri 03 Jun 2022 12:52:08 PM PDT
    # gpg:                using RSA key 522833AA75E2DCE6A24766C04DE1AF316D4F0DE9
    # gpg: Good signature from "Klaus Jensen <its@irrelevant.dk>" [unknown]
    # gpg:                 aka "Klaus Jensen <k.jensen@samsung.com>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: DDCA 4D9C 9EF9 31CC 3468  4272 63D5 6FC5 E55D A838
    #      Subkey fingerprint: 5228 33AA 75E2 DCE6 A247  66C0 4DE1 AF31 6D4F 0DE9
    
    * tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme:
      hw/nvme: add new command abort case
      hw/nvme: deprecate the use-intel-id compatibility parameter
      hw/nvme: bump firmware revision
      hw/nvme: do not report null uuid
      hw/nvme: do not auto-generate uuid
      hw/nvme: do not auto-generate eui64
      hw/nvme: enforce common serial per subsystem
      hw/nvme: fix smart aen
      hw/nvme: fix copy cmd for pi enabled namespaces
      hw/nvme: add missing return statement
      hw/nvme: fix narrowing conversion
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit d7fe639cabf778903f6cab23ff58c905c71375ec
Author: Dmitry Tikhov <d.tihov@yadro.com>
Date:   Wed Apr 20 11:20:44 2022 +0300

    hw/nvme: add new command abort case
    
    NVMe command set specification for end-to-end data protection formatted
    namespace states:
    
        o If the Reference Tag Check bit of the PRCHK field is set to ‘1’ and
          the namespace is formatted for Type 3 protection, then the
          controller:
              ▪ should not compare the protection Information Reference Tag
                field to the computed reference tag; and
              ▪ may ignore the ILBRT and EILBRT fields. If a command is
                aborted as a result of the Reference Tag Check bit of the
                PRCHK field being set to ‘1’, then that command should be
                aborted with a status code of Invalid Protection Information,
                but may be aborted with a status code of Invalid Field in
                Command.
    
    Currently qemu compares reftag in the nvme_dif_prchk function whenever
    Reference Tag Check bit is set in the command. For type 3 namespaces
    however, caller of nvme_dif_prchk - nvme_dif_check does not increment
    reftag for each subsequent logical block. That way commands incorporating
    more than one logical block for type 3 formatted namespaces with reftag
    check bit set, always fail with End-to-end Reference Tag Check Error.
    Comply with spec by handling case of set Reference Tag Check
    bit in the type 3 formatted namespace.
    
    Fixes: 146f720c5563 ("hw/block/nvme: end-to-end data protection")
    Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 8b1e59a6873662a01379cf052384e5dedefe7447
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Tue Apr 19 13:24:23 2022 +0200

    hw/nvme: deprecate the use-intel-id compatibility parameter
    
    Since version 5.2 commit 6eb7a071292a ("hw/block/nvme: change controller
    pci id"), the emulated NVMe controller has defaulted to a non-Intel PCI
    identifier.
    
    Deprecate the compatibility parameter so we can get rid of it once and
    for all.
    
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit fbba243bc700a4e479331e20544c7f6a41ae87b3
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Fri Apr 29 10:33:36 2022 +0200

    hw/nvme: bump firmware revision
    
    The Linux kernel quirks the QEMU NVMe controller pretty heavily because
    of the namespace identifier mess. Since this is now fixed, bump the
    firmware revision number to allow the quirk to be disabled for this
    revision.
    
    As of now, bump the firmware revision number to be equal to the QEMU
    release version number.
    
    Reviewed-by: Keith Busch <kbusch@kernel.org>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 9f2e1acf83c332752f52c39dad390c94ec2ba9f5
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Fri Apr 29 10:33:35 2022 +0200

    hw/nvme: do not report null uuid
    
    Do not report the "null uuid" (all zeros) in the namespace
    identification descriptors.
    
    Reported-by: Luis Chamberlain <mcgrof@kernel.org>
    Reported-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Keith Busch <kbusch@kernel.org>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit bd9f371c6f6eeb8e907dfc770876ad8ef4ff85fc
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Fri Apr 29 10:33:34 2022 +0200

    hw/nvme: do not auto-generate uuid
    
    Do not default to generate an UUID for namespaces if it is not
    explicitly specified.
    
    This is a technically a breaking change in behavior. However, since the
    UUID changes on every VM launch, it is not spec compliant and is of
    little use since the UUID cannot be used reliably anyway and the
    behavior prior to this patch must be considered buggy.
    
    Reviewed-by: Keith Busch <kbusch@kernel.org>
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 36d83272d5e45dff13e988ee0a59f11c58b442ba
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Fri Apr 29 10:33:33 2022 +0200

    hw/nvme: do not auto-generate eui64
    
    We cannot provide auto-generated unique or persistent namespace
    identifiers (EUI64, NGUID, UUID) easily. Since 6.1, namespaces have been
    assigned a generated EUI64 of the form "52:54:00:<namespace counter>".
    This is will be unique within a QEMU instance, but not globally.
    
    Revert that this is assigned automatically and immediately deprecate the
    compatibility parameter. Users can opt-in to this with the
    `eui64-default=on` device parameter or set it explicitly with
    `eui64=UINT64`.
    
    Cc: libvir-list@redhat.com
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit a859eb9f8f64e116671048a43a07d87bc6527a55
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Fri Apr 29 10:33:32 2022 +0200

    hw/nvme: enforce common serial per subsystem
    
    The Identify Controller Serial Number (SN) is the serial number for the
    NVM subsystem and must be the same across all controller in the NVM
    subsystem.
    
    Enforce this.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Keith Busch <kbusch@kernel.org>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 9235a72a5df0fae1ede89f02717b597ef91cf6ad
Author: Klaus Jensen <k.jensen@samsung.com>
Date:   Fri May 6 00:21:47 2022 +0200

    hw/nvme: fix smart aen
    
    Pass the right constant to nvme_smart_event(). The NVME_AER* values hold
    the bit position in the SMART byte, not the shifted value that we expect
    it to be in nvme_smart_event().
    
    Fixes: c62720f137df ("hw/block/nvme: trigger async event during injecting smart warning")
    Acked-by: zhenwei pi <pizhenwei@bytedance.com>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 2e8f952ae7de23b4847937dbbf51f7a1ab10a2af
Author: Dmitry Tikhov <d.tihov@yadro.com>
Date:   Thu Apr 21 13:51:58 2022 +0300

    hw/nvme: fix copy cmd for pi enabled namespaces
    
    Current implementation have problem in the read part of copy command.
    Because there is no metadata mangling before nvme_dif_check invocation,
    reftag error could be thrown for blocks of namespace that have not been
    previously written to.
    
    Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
    Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 51c453266309166c2737623211c0afc12884cccd
Author: Dmitry Tikhov <d.tihov@yadro.com>
Date:   Fri Apr 15 23:48:32 2022 +0300

    hw/nvme: add missing return statement
    
    Since there is no return after nvme_dsm_cb invocation, metadata
    associated with non-zero block range is currently zeroed. Also this
    behaviour leads to segfault since we schedule iocb->bh two times.
    First when entering nvme_dsm_cb with iocb->idx == iocb->nr and
    second because of missing return on call stack unwinding by calling
    blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback.
    
    Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
    Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
    Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

commit 1e64facc015e16d8e4efa239feaeda9e4e9aeb04
Author: Dmitry Tikhov <ddtikhov@gmail.com>
Date:   Tue Apr 12 11:59:09 2022 +0300

    hw/nvme: fix narrowing conversion
    
    Since nlbas is of type int, it does not work with large namespace size
    values, e.g., 9 TB size of file backing namespace and 8 byte metadata
    with 4096 bytes lbasz gives negative nlbas value, which is later
    promoted to negative int64_t type value and results in negative
    ns->moff which breaks namespace
    
    Signed-off-by: Dmitry Tikhov <ddtikhov@gmail.com>
    Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
    Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

