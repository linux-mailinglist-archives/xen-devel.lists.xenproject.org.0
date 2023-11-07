Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C007E361B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 08:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628599.980225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0GrD-0001gz-KF; Tue, 07 Nov 2023 07:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628599.980225; Tue, 07 Nov 2023 07:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0GrD-0001f7-Hi; Tue, 07 Nov 2023 07:50:43 +0000
Received: by outflank-mailman (input) for mailman id 628599;
 Tue, 07 Nov 2023 07:50:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0GrC-0001ex-07; Tue, 07 Nov 2023 07:50:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0GrB-0003Dp-Oy; Tue, 07 Nov 2023 07:50:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0GrB-00020m-Be; Tue, 07 Nov 2023 07:50:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r0GrB-0003rc-B9; Tue, 07 Nov 2023 07:50:41 +0000
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
	bh=g6XQrmB3aB6tXIuocArJDi4KqXgS5fL0Gzf+1RoXNRQ=; b=whvCkscAEsevsu7XGkE8PCIpHJ
	0/CKeepJ+oTQJqpSNAKAJ0tLH4bJ7xeL9jfQsD+fpFdFyQcx9rSLsjh8UM6w2D0A4OrSmE011+LY8
	nbVq6eWaniwbbN+TP51THK6i4HcALqcFCA7AtrTNXqWgH0ITmA1bFHeRLOQoFubE43r4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183698-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183698: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
X-Osstest-Versions-That:
    linux=d2f51b3516dade79269ff45eae2a7668ae711b25
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Nov 2023 07:50:41 +0000

flight 183698 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183698/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail blocked in 183692
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183692
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183692
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183692
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183692
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183692
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183692
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183692
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
baseline version:
 linux                d2f51b3516dade79269ff45eae2a7668ae711b25

Last test of basis   183692  2023-11-06 03:32:37 Z    1 days
Testing same since   183698  2023-11-06 23:42:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrey Konovalov <andrey.konovalov@linaro.org>
  Arnd Bergmann <arnd@arndb.de>
  Benjamin Gaignard <benjamin.gaignard@collabora.com>
  Benjamin Mugnier <benjamin.mugnier@foss.st.com> (st-vgxy61)
  Biju Das <biju.das.jz@bp.renesas.com>
  Bingbu Cao <bingbu.cao@intel.com>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb3 # db410c
  Chen Jiahao <chenjiahao16@huawei.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Chengfeng Ye <dg573847474@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniele Alessandrelli <daniele.alessandrelli@intel.com>
  Dave Stevenson <dave.stevenson@raspberrypi.com>
  Fabio Estevam <festevam@denx.de>
  Fei Shao <fshao@chromium.org>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guoniu.zhou <guoniu.zhou@nxp.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hao Yao <hao.yao@intel.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Irui Wang <irui.wang@mediatek.com>
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Jai Luthra <j-luthra@ti.com>
  Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Juerg Haefliger <juerg.haefliger@canonical.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Julien Massot <julien.massot@collabora.com>
  Kate Hsuan <hpa@redhat.com>
  Katya Orlova <e.orlova@ispras.ru>
  Kees Cook <keescook@chromium.org>
  Ken Lin <ken_lin5@hotmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Hałasa <khalasa@piap.pl>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Li Zetao <lizetao1@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Ma Ke <make_ruc2021@163.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marex@denx.de>
  Martin Dørum <dorum@noisolation.com>
  Martin Tůma <martin.tuma@digiteqautomotive.com>
  Marvin Lin <milkfafa@gmail.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxime Ripard <mripard@kernel.org>
  Mikhail Rudenko <mike.rudenko@gmail.com>
  Ming Qian <ming.qian@nxp.com>
  Moudy Ho <moudy.ho@mediatek.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Patrick Whewell <patrick.whewell@sightlineapplications.com>
  Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  Pratyush Yadav <p.yadav@ti.com>
  Qingwu Zhang <qingwu.zhang@intel.com>
  Rajeshwar R Shinde <coolrrsh@gmail.com>
  rasheed.hsueh <rasheed.hsueh@lcfc.corp-partner.google.com>
  Reka Norman <rekanorman@chromium.org>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rob Herring <robh@kernel.org>
  Ross Zwisler <zwisler@google.com>
  Ruan Jinjie <ruanjinjie@huawei.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sean Young <sean@mess.org>
  Shravan Chippa <shravan.chippa@microchip.com>
  Sicelo A. Mhlongo <absicsz@gmail.com>
  Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
  Stefan Adolfsson <sadolfsson@chromium.org>
  Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
  Takashi Iwai <tiwai@suse.de>
  Tomasz Figa <tfiga@chromium.org>
  Tommaso Merciai <tomm.merciai@gmail.com>
  Umang Jain <umang.jain@ideasonboard.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vaishnav Achath <vaishnav.a@ti.com>
  Vikash Garodia <quic_vgarodia@quicinc.com>
  Wang Ming <machel@vivo.com>
  Wentong Wu <wentong.wu@intel.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Yu Liao <liaoyu15@huawei.com>
  Yue Haibing <yuehaibing@huawei.com>
  Yunfei Dong <yunfei.dong@mediatek.com>
  Zelong Dong <zelong.dong@amlogic.com>
  Zheng Wang <zyytlz.wz@163.com>

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
 test-amd64-amd64-dom0pvh-xl-amd                              starved 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   d2f51b3516da..be3ca57cfb77  be3ca57cfb777ad820c6659d52e60bbdd36bf5ff -> tested/linux-linus

