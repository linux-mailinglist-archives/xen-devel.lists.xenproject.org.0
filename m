Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB08CAE9D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 14:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726895.1131296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9OzG-0003c6-8L; Tue, 21 May 2024 12:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726895.1131296; Tue, 21 May 2024 12:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9OzG-0003a1-5i; Tue, 21 May 2024 12:53:02 +0000
Received: by outflank-mailman (input) for mailman id 726895;
 Tue, 21 May 2024 12:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9OzF-0003Zr-4F; Tue, 21 May 2024 12:53:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9OzE-000471-Vg; Tue, 21 May 2024 12:53:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9OzE-0000xx-JI; Tue, 21 May 2024 12:53:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s9OzE-0003eS-Ir; Tue, 21 May 2024 12:53:00 +0000
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
	bh=SoNKZYf/aVoaqTIWYq++0S5YvWTtSESAnUsZPmu8ezw=; b=Fg9Y+M3LJgCQGJDIn78/51ozJF
	wUkhyqlKGgGMtBKiZwohCz6zqKkq9blWN1tNhmi+czR9YPxe42i/GINi/I850SuGvERu5b6+kPBHB
	kr5PZzLMBMxvOFaqeltr5HxdCefRhLjokGt41X81ZJzmfKsZoSq+6cUKnEG8BbYFVC40=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186052-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186052: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-xl-thunderx:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6
X-Osstest-Versions-That:
    linux=eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 May 2024 12:53:00 +0000

flight 186052 linux-linus real [real]
flight 186061 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186052/
http://logs.test-lab.xenproject.org/osstest/logs/186061/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-thunderx  8 xen-boot            fail pass in 186061-retest
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 186061-retest

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 186061 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 186061 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 186061 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 186061 never pass
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186044
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 186044
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186047
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186047
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186047
 test-armhf-armhf-xl-credit1   8 xen-boot                     fail  like 186047
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186047
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186047
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6
baseline version:
 linux                eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c

Last test of basis   186047  2024-05-20 15:13:33 Z    0 days
Testing same since   186052  2024-05-21 01:42:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Darrick J. Wong" <djwong@kernel.org>
  Abhinav Jain <jain.abhinav177@gmail.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Lobakin <aleksander.lobakin@intel.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Allison Henderson <allison.henderson@oracle.com>
  Amir Goldstein <amir73il@gmail.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Geissler <geissonator@yahoo.com>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  André Draszik <andre.draszik@linaro.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Animesh Agarwal <animeshagarwal28@gmail.com>
  Anjelique Melendez <quic_amelende@quicinc.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arnd Bergmann <arnd@kernel.org>
  Baruch Siach <baruch@tkos.co.il>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Chandan Babu R <chandanbabu@kernel.org>
  Chao Yu <chao@kernel.org>
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wens@csie.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daeho Jeong <daehojeong@google.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Danila Tikhonov <danila@jiaxyga.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David Collins <quic_collinsd@quicinc.com>
  David Ober <dober@lenovo.com>
  Dawei Li <set_pte_at@outlook.com>
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eddie James <eajames@linux.ibm.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Eng Lee Teh <englee.teh@starfivetech.com>
  Eric Dumazet <edumazet@google.com>
  Eric Sandeen <sandeen@redhat.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  foryun.ma <foryun.ma@jaguarmicro.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hamish Martin <hamish.martin@alliedtelesis.co.nz>
  Hannah Peuckmann <hannah.peuckmann@canonical.com>
  Hans Hu <hanshu-oc@zhaoxin.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Herman van Hazendonk <github.com@herrie.org>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jan Kara <jack@suse.cz>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jean Delvare <jdelvare@suse.de>
  Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jisheng Zhang <jszhang@kernel.org>
  Joel Stanley <joel@jms.id.au>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Judith Mendez <jm@ti.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Justin Stitt <justinstitt@google.com>
  Justin Swartz <justin.swartz@risingedge.co.za>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kelly Hung <ppighouse@gmail.com>
  Kelvin Zhang <kelvin.zhang@amlogic.com>
  Krzystof Kozlowski <krzystof.kozlowski@linaro.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Liao Yuanhong <liaoyuanhong@vivo.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Weiss <luca@z3ntu.xyz>
  Lukas Bulwahn <lbulwahn@redhat.com>
  Lukas Bulwahn <lukas.bulwahn@redhat.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Pearson <mpearson-lenovo@squebb.ca>
  Mark Tinguely <mark.tinguely@oracle.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthijs Kooijman <matthijs@stdin.nl>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Michael Kelley <mhklinux@outlook.com>
  Michal Simek <michal.simek@amd.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikita Kiryushin <kiryushin@ancud.ru>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Ninad Palsule <ninad@linux.ibm.com>
  Nipun Gupta <nipun.gupta@amd.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Paul Cercueil <paul@crapouillou.net>
  Peng Fan <peng.fan@nxp.com>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Rosin <peda@axentia.se>
  Peter Yin <peteryin.openbmc@gmail.com>
  Piyush Malgujar <pmalgujar@marvell.com>
  Rafał Miłecki <rafal@milecki.pl>
  Reinette Chatre <reinette.chatre@intel.com>
  Renze Nicolai <renze@rnplus.nl>
  Ricardo Ribalda <ribalda@chromium.org>
  Ritesh Harjani (IBM) <ritesh.list@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Sai Pavan Boddu <sai.pavan.boddu@amd.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Serge Semin <fancer.lancer@gmail.com>
  Shanth Murthy <shanth.murthy@intel.com>
  Shengyu Qu <wiagn233@outlook.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Siarhei Volkau <lis8215@gmail.com>
  Songyang Li <leesongyang@outlook.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Wahren <wahrenst@gmx.net>
  Steven Price <steven.price@arm.com>
  Suneel Garapati <sgarapati@marvell.com>
  Tao Ren <rentao.bupt@gmail.com>
  Tengfei Fan <quic_tengfan@quicinc.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  Thomas Richard <thomas.richard@bootlin.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Blum <thorsten.blum@toblux.com>
  Wenjie Qi <qwjhust@gmail.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wu Bo <bo.wu@vivo.com>
  Xianwei Zhao <xianwei.zhao@amlogic.com>
  Xin Zeng <xin.zeng@intel.com>
  Yahui Cao <yahui.cao@intel.com>
  Yang Chen <yangchen.openbmc@gmail.com>
  Ye Bin <yebin10@huawei.com>
  Yeongjin Gil <youngjin.gil@samsung.com>
  Yi Zhang <yi.zhang@redhat.com>
  Yifan Zhao <zhaoyifan@sjtu.edu.cn>
  Yongzhen Zhang <zhangyongzhen@kylinos.cn>
  Yunlei He <heyunlei@oppo.com>
  Yury Norov <yury.norov@gmail.com>
  Zelong Dong <zelong.dong@amlogic.com>
  Zev Weiss <zev@bewilderbeest.net>
  Zhang Yi <yi.zhang@huawei.com>
  Zhiguo Niu <zhiguo.niu@unisoc.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
   eb6a9339efeb..8f6a15f095a6  8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6 -> tested/linux-linus

