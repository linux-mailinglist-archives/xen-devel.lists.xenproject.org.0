Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CE5F58AA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 18:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416323.660993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og7hD-0005Jo-P1; Wed, 05 Oct 2022 16:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416323.660993; Wed, 05 Oct 2022 16:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og7hD-0005Gn-Ka; Wed, 05 Oct 2022 16:56:35 +0000
Received: by outflank-mailman (input) for mailman id 416323;
 Wed, 05 Oct 2022 16:56:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1og7hC-0005Gd-5z; Wed, 05 Oct 2022 16:56:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1og7hB-0004o0-Tr; Wed, 05 Oct 2022 16:56:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1og7hB-0003jY-CD; Wed, 05 Oct 2022 16:56:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1og7hB-0003uv-9I; Wed, 05 Oct 2022 16:56:33 +0000
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
	bh=kDSu8vLvH/ng1F7zSxLl8eWFQ6JC3pbfBrBX/2jzBRo=; b=Gpmko8UiLwzojs5qeA9RK4aMiI
	xTt3hEz/Om086ah7Lp6OIfDCwbRYUaymOQSytFMt1REhpdGZ33Vev28noa5UEUj5an216tCCrXSFR
	mz8MQPTym74jDcGpOLG+cggRFi4h6iWDEwmYfu21ldGTGdbLqIFaisFSZFmSnpJTJj7A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173426-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 173426: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-saverestore.2:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=2bca25eaeba6190efbfcb38ed169bd7ee43b5aaf
X-Osstest-Versions-That:
    linux=0326074ff4652329f2a1a9c8685104576bd8d131
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Oct 2022 16:56:33 +0000

flight 173426 linux-linus real [real]
flight 173432 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173426/
http://logs.test-lab.xenproject.org/osstest/logs/173432/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-freebsd12-amd64 18 guest-saverestore.2 fail pass in 173432-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173421
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173421
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173421
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173421
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173421
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173421
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173421
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173421
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                2bca25eaeba6190efbfcb38ed169bd7ee43b5aaf
baseline version:
 linux                0326074ff4652329f2a1a9c8685104576bd8d131

Last test of basis   173421  2022-10-05 00:13:01 Z    0 days
Testing same since   173426  2022-10-05 08:41:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Skladowski <a39.skl@gmail.com>
  Adrien Grassein <adrien.grassein@gmail.com> # for lontium-lt8912b
  Akhil R <akhilrajeev@nvidia.com>
  Aleksa Savic <savicaleksa83@gmail.com>
  Aleksandr Mezin <mezin.alexander@gmail.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandru Gagniuc <mr.nuke.me@gmail.com>
  Andrew Halaney <ahalaney@redhat.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Armin Wolf <W_Armin@gmx.de>
  Asmaa Mnebhi <asmaa@nvidia.com>
  Axel Lin <axel.lin@ingics.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Chanho Park <chanho61.park@samsung.com>
  Christian Kohlschütter <christian@kohlschutter.com>
  Christian Kohlschütter <christian@kohlschutter.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Corey Minyard <cminyard@mvista.com> # for IPMI
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  David Wu <david.wu@rock-chips.com>
  Dmitry Rokosov <ddrokosov@sberdevices.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Duke Du <dukedu83@gmail.com>
  Eliav Farber <farbere@amazon.com>
  Eugene Shalygin <eugene.shalygin@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Heiko Stuebner <heiko@sntech.de>
  Ibrahim Tilki <Ibrahim.Tilki@analog.com>
  Iskren Chernev <iskren.chernev@gmail.com>
  Jagan Teki <jagan@edgeble.ai>
  Jan Dabros <jsd@semihalf.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jean Delvare <jdelvare@suse.de>
  Jerome Neanne <jneanne@baylibre.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Johan Jonker <jbx6244@gmail.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com> # for iio
  Josef Johansson <josef@oderland.se>
  Juerg Haefliger <juergh@proton.me>
  Justin Ledford <justinledford@google.com>
  Krzysztof Hałasa <khalasa@piap.pl>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Li Yang <leoyang.li@nxp.com>
  Li Zhong <floridsleeves@gmail.com>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lucas Tanure <tanureal@opensource.cirrus.com>
  Mani Milani <mani@chromium.org>
  Marek Behún <kabel@kernel.org> # for leds-turris-omnia
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Markus Schneider-Pargmann <msp@baylibre.com>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Mengda Chen <chenmengda2009@163.com>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michael Shych <michaelsh@nvidia.com>
  Michal Simek <michal.simek@amd.com>
  Miguel Ojeda <ojeda@kernel.org> # for auxdisplay/ht16k33 + auxdisplay/lcd2s
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Naga Sureshkumar Relli <nagasuresh.relli@microchip.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Oleksandr Shamray <oleksandrs@nvidia.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Pavel Machek <pavel@ucw.cz>
  Peng Fan <peng.fan@nxp.com>
  Peter Robinson <pbrobinson@gmail.com>
  Peter Rosin <peda@axentia.se>
  Peter Rosin <peda@axentia.se> # for i2c-mux-*, max9860
  Quan Nguyen <quan@os.amperecomputing.com>
  Richard Acayan <mailingradian@gmail.com>
  Rob Herring <robh@kernel.org>
  Robert Marko <robert.marko@sartura.hr>
  Samuel Holland <samuel@sholland.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sebastian Reichel <sebastian.reichel@collabora.com> # for drivers/power
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Shang XiaoJing <shangxiaojing@huawei.com>
  Shreeya Patel <shreeya.patel@collabora.com>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> # for bmc150-accel-i2c + kxcjk-1013
  Sudarshan Ravula <sudarshan.ravula@intel.com>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
  Tomer Maimon <tmaimon77@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wilken Gottwalt <wilken.gottwalt@posteo.net>
  William Breathitt Gray <william.gray@linaro.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xu Qiang <xuqiang36@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  ye xingchen <ye.xingchen@zte.com.cn>
  Zeng Heng <zengheng4@huawei.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  zhichao.liu <zhichao.liu@mediatek.com>

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
 test-amd64-amd64-freebsd12-amd64                             fail    
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
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-arm64-arm64-xl-seattle                                  pass    
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
   0326074ff465..2bca25eaeba6  2bca25eaeba6190efbfcb38ed169bd7ee43b5aaf -> tested/linux-linus

