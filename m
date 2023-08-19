Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA2781984
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 14:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587037.918365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXL6T-0007Do-Be; Sat, 19 Aug 2023 12:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587037.918365; Sat, 19 Aug 2023 12:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXL6T-0007Aq-8b; Sat, 19 Aug 2023 12:30:53 +0000
Received: by outflank-mailman (input) for mailman id 587037;
 Sat, 19 Aug 2023 12:30:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXL6R-0007Ag-Py; Sat, 19 Aug 2023 12:30:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXL6R-0004gK-Mw; Sat, 19 Aug 2023 12:30:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXL6R-0000sD-5T; Sat, 19 Aug 2023 12:30:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qXL6R-0004IZ-4p; Sat, 19 Aug 2023 12:30:51 +0000
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
	bh=QSjOMz+h0YeFkTgDcY7zUG/CqKebKbG/K7/FFTurKp4=; b=mG1/amipvOPXS8s/Eruh8nNsRm
	cWdy3f8+CclUlajws/BPloB3aroUMkfq8YbXdZ4qxreebuyDrj78R+Or9OlZV2hjERomBn7POHW6K
	NrUvy5/gTdZcH+cstrTblGSL9AyKJpf6EfxVtBzvtm4+jPbFzQ41bpaixndrNblZtOnY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182391-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182391: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-vhd:guest-localmigrate/x10:fail:heisenbug
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
    linux=d4ddefee5160dc477d0e30c9d7a10ce8861c3007
X-Osstest-Versions-That:
    linux=4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Aug 2023 12:30:51 +0000

flight 182391 linux-linus real [real]
flight 182395 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182391/
http://logs.test-lab.xenproject.org/osstest/logs/182395/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-vhd   19 guest-localmigrate/x10 fail pass in 182395-retest

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
 linux                d4ddefee5160dc477d0e30c9d7a10ce8861c3007
baseline version:
 linux                4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6

Last test of basis   182357  2023-08-16 07:44:20 Z    3 days
Failing since        182371  2023-08-17 15:10:27 Z    1 days    4 attempts
Testing same since   182391  2023-08-19 01:56:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Wu <wuyun.abel@bytedance.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alfred Lee <l00g33k@gmail.com>
  Alok Prasad <palok@marvell.com>
  Andrej Picej <andrej.picej@norik.com>
  Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
  Andrii Staikov <andrii.staikov@intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Artem Chernyshev <artem.chernyshev@red-soft.ru>
  Asad Kamal <asad.kamal@amd.com>
  Aurelien Jarno <aurelien@aurel32.net>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bjorn Andersson <andersson@kernel.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Celeste Liu <CoelacanthusHex@gmail.com>
  Christian König <christian.koenig@amd.com>
  Christopher Obbard <chris.obbard@collabora.com>
  Chuck Lever <chuck.lever@oracle.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Baluta <daniel.baluta@nxp.com>
  Dave Airlie <airlied@redhat.com>
  David Heidelberg <david@ixit.cz>
  David S. Miller <davem@davemloft.net>
  dengxiang <dengxiang@nfschina.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dragos Tatulea <dtatulea@nvidia.com>
  Drew Fustini <dfustini@baylibre.com>
  Edward Cree <ecree.xilinx@gmail.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@denx.de>
  Felix Yan <felixonmars@archlinux.org>
  Florian Westphal <fw@strlen.de>
  Folker Schwesinger <dev@folker-schwesinger.de>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Stuebner <heiko@sntech.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  jairaj-arava <jairaj.arava@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  James Zhu <James.Zhu@amd.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jason Xing <kernelxing@tencent.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Jiadong Zhu <Jiadong.Zhu@amd.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Joel Stanley <joel@jms.id.au>
  John Harrison <John.C.Harrison@Intel.com>
  Julian Anastasov <ja@ssi.bg>
  Justin Chen <justin.chen@broadcom.com>
  Kailang Yang <kailang@realtek.com>
  Karol Herbst <kherbst@redhat.com>
  Kenneth Feng <kenneth.feng@amd.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Leon Romanovsky <leonro@nvidia.com>
  Liang Chen <liangchen.linux@gmail.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Lin Ma <linma@zju.edu.cn>
  Lin Yujun <linyujun809@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Manish Chopra <manishc@marvell.com>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Marek Behún <kabel@kernel.org>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org
  Mark Brown <broonie@kernel.org>
  Maxime Ripard <mripard@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Michal Schmidt <mschmidt@redhat.com>
  Michal Simek <michal.simek@amd.com>
  Mingzheng Xing <xingmingzheng@iscas.ac.cn>
  Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
  Nam Cao <namcaov@gmail.com>
  Nathan Chancellor <nathan@kernel.org>
  Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Ninad Naik <quic_ninanaik@quicinc.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Petr Machata <petrm@nvidia.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Piotr Gardocki <piotrx.gardocki@intel.com>
  Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
  Prasad Pandit <pjp@fedoraproject.org>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  Rob Herring <robh@kernel.org>
  Robert Nelson <robertcnelson@gmail.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ruizhe Pan <c141028@gmail.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Scott Mayhew <smayhew@redhat.com>
  Shakeel Butt <shakeelb@google.com>
  Shawn Guo <shawnguo@kernel.org>
  Shay Drory <shayd@nvidia.com>
  Shazad Hussain <quic_shazhuss@quicinc.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shengyu Qu <wiagn233@outlook.com>
  Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
  Shuming Fan <shumingf@realtek.com
  Shuming Fan <shumingf@realtek.com>
  Simon Horman <horms@kernel.org>
  Sishuai Gong <sishuai.system@gmail.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steve French <stfrench@microsoft.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Tim Huang <Tim.Huang@amd.com>
  Tomi Leppänen <tomi@tomin.site>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Umio Yasuno <coelacanth_dream@protonmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vinay Belgaumkar <vinay.belgaumkar@intel.com>
  Vlad Buslov <vladbu@nvidia.com>
  Wander Lairson Costa <wander@redhat.com>
  Wei Chen <harperchen1110@gmail.com>
  Xia Fukun <xiafukun@huawei.com>
  Xiang Yang <xiangyang3@huawei.com>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yangtao Li <frank.li@vivo.com>
  Yibin Ding <yibin.ding@unisoc.com>
  Yogesh Hegde <yogi.kernel@gmail.com>
  Zev Weiss <zev@bewilderbeest.net>
  Zhang Shurong <zhang_shurong@foxmail.com>
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
 test-amd64-amd64-xl-vhd                                      fail    
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
   4853c74bd7ab..d4ddefee5160  d4ddefee5160dc477d0e30c9d7a10ce8861c3007 -> tested/linux-linus

