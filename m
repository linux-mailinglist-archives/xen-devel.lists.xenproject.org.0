Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7686F038D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 11:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526907.818973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryA0-0008Ak-GU; Thu, 27 Apr 2023 09:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526907.818973; Thu, 27 Apr 2023 09:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryA0-00087z-D8; Thu, 27 Apr 2023 09:43:32 +0000
Received: by outflank-mailman (input) for mailman id 526907;
 Thu, 27 Apr 2023 09:43:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pry9y-00087p-7j; Thu, 27 Apr 2023 09:43:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pry9x-00005N-Uk; Thu, 27 Apr 2023 09:43:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pry9x-0002B3-Bb; Thu, 27 Apr 2023 09:43:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pry9x-0007Pt-Ar; Thu, 27 Apr 2023 09:43:29 +0000
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
	bh=LBML6giS2pxWxCT2pKB8jf5+bvHZnpw89+uMzqQA02k=; b=61mtEMVV/KkfP92UAw+865MNyI
	HL8Gr8sJ4FHgd5P8LkkwUDr9RMDKO4k6xhdfSyqOR+YxvZzUPPdUl+9B3xoU+vjYwZCubyoOXudo/
	Hs8/e6E9rBT94pa2DcnNvnb3QlV9B2QzcLTp6hIGqKn7bcUvEceQ7syZ7zoZbUC8SduU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180428-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 180428: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-pair:guest-start/debian:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ea7862c507eca54ea6caad9dcfc8bba5e749fbde
X-Osstest-Versions-That:
    linux=58f42ed1cd31238745bddd943c4f5849dc83a2ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Apr 2023 09:43:29 +0000

flight 180428 linux-5.4 real [real]
flight 180441 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180428/
http://logs.test-lab.xenproject.org/osstest/logs/180441/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 180369
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 180441 REGR. vs. 180369

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit1  14 guest-start      fail in 180441 pass in 180428
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail pass in 180441-retest
 test-amd64-i386-pair         25 guest-start/debian  fail pass in 180441-retest
 test-armhf-armhf-xl-multivcpu 14 guest-start        fail pass in 180441-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 180441 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 180441 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180369
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180369
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180369
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180369
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180369
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180369
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180369
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180369
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180369
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180369
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180369
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180369
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ea7862c507eca54ea6caad9dcfc8bba5e749fbde
baseline version:
 linux                58f42ed1cd31238745bddd943c4f5849dc83a2ac

Last test of basis   180369  2023-04-21 21:43:52 Z    5 days
Testing same since   180428  2023-04-26 09:43:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alyssa Ross <hi@alyssa.is>
  Anders Roxell <anders.roxell@linaro.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Baokun Li <libaokun1@huawei.com>
  Bhavya Kapoor <b-kapoor@ti.com>
  Brian Masney <bmasney@redhat.com>
  Chandan Babu R <chandan.babu@oracle.com>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  Christoph Hellwig <hch@lst.de>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <error27@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Darrick J. Wong <darrick.wong@oracle.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Young <dyoung@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Raillard <douglas.raillard@arm.com>
  Ekaterina Orlova <vorobushek.ok@gmail.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Gao Xiang <hsiangkao@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gwangun Jung <exsociety@gmail.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Ingo Molnar <mingo@kernel.org>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim<jhs@mojatatu.com>
  Jason Wang <jasowang@redhat.com>
  Jianqun Xu <jay.xu@rock-chips.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Denose <jdenose@chromium.org>
  Jonathan Denose <jdenose@google.com>
  Juergen Gross <jgross@suse.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Marc Gonzalez <mgonzalez@freebox.fr>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Naama Meir <naamax.meir@linux.intel.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Pingfan Liu <kernelfans@gmail.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Ritesh Harjani <riteshh@linux.ibm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sasha Levin <sashal@kernel.org>
  Sebastian Basierski <sebastianx.basierski@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <thierry.reding@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tomas Henzl <thenzl@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>
  Yanjun Zhang <zhangyanjun@cestc.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>
  Álvaro Fernández Rojas <noltari@gmail.com>

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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
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

(No revision log; it would be 1535 lines long.)

