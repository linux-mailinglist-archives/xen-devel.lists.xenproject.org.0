Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F82781674
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 03:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586851.918145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXAxZ-0000P7-M4; Sat, 19 Aug 2023 01:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586851.918145; Sat, 19 Aug 2023 01:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXAxZ-0000NV-IC; Sat, 19 Aug 2023 01:41:01 +0000
Received: by outflank-mailman (input) for mailman id 586851;
 Sat, 19 Aug 2023 01:41:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXAxY-0000NL-I9; Sat, 19 Aug 2023 01:41:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXAxY-0005Nd-Fh; Sat, 19 Aug 2023 01:41:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXAxX-0006jS-TK; Sat, 19 Aug 2023 01:41:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qXAxX-0003Mr-SM; Sat, 19 Aug 2023 01:40:59 +0000
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
	bh=c73PmuLFWdHVfB+LQ5sevjQ6IyHQRj5pRDDNUMzMTbQ=; b=vGH57NPA9M8azOb5zV45PAIXpM
	10nD580qN08+K4khj+ZmEvBr6sr7fVfulO3nYpTTdF1AypT4ql401gEiVvmjH5flx/gib/1Q5aDsJ
	mWgPrPuyPrG8dJEm5Ou6juXgZ9UtqO3dYarKhDWZ7G+Y2NlDlpajctZz6Fesw3k27l+4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182378-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182378: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-credit1:guest-start.2:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=0e8860d2125f51ba9bca67a520d826cb8f66cf42
X-Osstest-Versions-That:
    linux=4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Aug 2023 01:40:59 +0000

flight 182378 linux-linus real [real]
flight 182390 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182378/
http://logs.test-lab.xenproject.org/osstest/logs/182390/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 18 guest-localmigrate/x10 fail REGR. vs. 182357

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-credit2 20 guest-localmigrate/x10 fail pass in 182390-retest
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail pass in 182390-retest
 test-amd64-amd64-xl-credit1  23 guest-start.2       fail pass in 182390-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182357
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182357
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182357
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182357
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182357
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182357
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182357
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182357
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
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
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                0e8860d2125f51ba9bca67a520d826cb8f66cf42
baseline version:
 linux                4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6

Last test of basis   182357  2023-08-16 07:44:20 Z    2 days
Failing since        182371  2023-08-17 15:10:27 Z    1 days    3 attempts
Testing same since   182378  2023-08-18 08:43:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Wu <wuyun.abel@bytedance.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alfred Lee <l00g33k@gmail.com>
  Alok Prasad <palok@marvell.com>
  Andrii Staikov <andrii.staikov@intel.com>
  Artem Chernyshev <artem.chernyshev@red-soft.ru>
  Asad Kamal <asad.kamal@amd.com>
  Christian König <christian.koenig@amd.com>
  Chuck Lever <chuck.lever@oracle.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dave Airlie <airlied@redhat.com>
  David Heidelberg <david@ixit.cz>
  David S. Miller <davem@davemloft.net>
  Dragos Tatulea <dtatulea@nvidia.com>
  Edward Cree <ecree.xilinx@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Florian Westphal <fw@strlen.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Jakub Kicinski <kuba@kernel.org>
  James Zhu <James.Zhu@amd.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jason Xing <kernelxing@tencent.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Jiadong Zhu <Jiadong.Zhu@amd.com>
  John Harrison <John.C.Harrison@Intel.com>
  Julian Anastasov <ja@ssi.bg>
  Justin Chen <justin.chen@broadcom.com>
  Karol Herbst <kherbst@redhat.com>
  Kenneth Feng <kenneth.feng@amd.com>
  Leon Romanovsky <leonro@nvidia.com>
  Liang Chen <liangchen.linux@gmail.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Manish Chopra <manishc@marvell.com>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Maxime Ripard <mripard@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Schmidt <mschmidt@redhat.com>
  Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
  Neil Armstrong <neil.armstrong@linaro.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Petr Machata <petrm@nvidia.com>
  Piotr Gardocki <piotrx.gardocki@intel.com>
  Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
  Prasad Pandit <pjp@fedoraproject.org>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Shakeel Butt <shakeelb@google.com>
  Shay Drory <shayd@nvidia.com>
  Simon Horman <horms@kernel.org>
  Sishuai Gong <sishuai.system@gmail.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Tim Huang <Tim.Huang@amd.com>
  Tomi Leppänen <tomi@tomin.site>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Umio Yasuno <coelacanth_dream@protonmail.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vinay Belgaumkar <vinay.belgaumkar@intel.com>
  Vlad Buslov <vladbu@nvidia.com>
  Wander Lairson Costa <wander@redhat.com>
  Xiang Yang <xiangyang3@huawei.com>
  Xin Long <lucien.xin@gmail.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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

(No revision log; it would be 2590 lines long.)

