Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61328C935C
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2024 05:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725475.1130004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8XWu-0002p9-Mh; Sun, 19 May 2024 03:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725475.1130004; Sun, 19 May 2024 03:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8XWu-0002mn-JB; Sun, 19 May 2024 03:48:12 +0000
Received: by outflank-mailman (input) for mailman id 725475;
 Sun, 19 May 2024 03:48:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s8XWt-0002md-Lv; Sun, 19 May 2024 03:48:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s8XWt-00071t-HO; Sun, 19 May 2024 03:48:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s8XWt-0005Or-8x; Sun, 19 May 2024 03:48:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s8XWt-0002uR-8X; Sun, 19 May 2024 03:48:11 +0000
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
	bh=TQGtvF3l0vOMFJ4D1X+WNzClK8hzBRgAHr6JVi3m+Vk=; b=YkLj+WL5mLVGf395eHUuNgX6fq
	D9FopGPKtwVEroi97mQRUuAVSHVzJw81/x1/uWHtCGcTBziAPQdIxFnvTMVLaOVEiqqcnJXAYhwi0
	YCwlOy6uUUjR8OfjakmfKa8MnXM7f3ovMh0OiGXKI/ZjyEeWMJFRuQnfX7nLaIBuuHjk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186036-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186036: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=25f4874662fb0d43fc1d934dd7802b740ed2ab5f
X-Osstest-Versions-That:
    linux=4b377b4868ef17b040065bd468668c707d2477a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 May 2024 03:48:11 +0000

flight 186036 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186036/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186035
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186035
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186035
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186035
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186035
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186035
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                25f4874662fb0d43fc1d934dd7802b740ed2ab5f
baseline version:
 linux                4b377b4868ef17b040065bd468668c707d2477a5

Last test of basis   186035  2024-05-18 13:41:54 Z    0 days
Testing same since   186036  2024-05-18 21:13:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@linaro.org>
  Aleksandr Aprelkov <aaprelkov@usergate.com>
  Alexandre Mergnat <amergnat@baylibre.com>
  Andrew Davis <afd@ti.com>
  André Draszik <andre.draszik@linaro.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Babis Chalios <bchalios@amazon.es>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Binbin Zhou <zhoubinbin@loongson.cn>
  Bjorn Andersson <andersson@kernel.org>
  Bob Pearson <rpearsonhpe@gmail.com>
  Boshi Yu <boshiyu@linux.alibaba.com>
  Breno Leitao <leitao@debian.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Catalin Popescu <catalin.popescu@leica-geosystems.com>
  Chengchang Tang <tangchengchang@huawei.com>
  Chiara Meiohas <cmeiohas@nvidia.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Colin Ian King <colin.i.king@gmail.com>
  Cong Dang <cong.dang.xn@renesas.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Marussi <cristian.marussi@arm.com>
  David Jander <david@protonic.nl>
  David Rientjes <rientjes@google.com>
  Dimitri Sivanich <sivanich@hpe.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Rokosov <ddrokosov@salutedevices.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Erick Archer <erick.archer@outlook.com>
  Fabio Estevam <festevam@denx.de>
  Frank Oltmanns <frank@oltmanns.dev>
  Gabor Juhos <j4g8y7@gmail.com>
  Gabriel Fernandez <gabriel.fernandez@foss.st.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Georgi Djakov <quic_c_gdjako@quicinc.com>
  Günther Noack <gnoack@google.com>
  Hanjun Guo <guohanjun@huawei.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Herman van Hazendonk <github.com@herrie.org>
  Huacai Chen <chenhuacai@loongson.cn>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Inochi Amaoto <inochiama@outlook.com>
  Ivanov Mikhail <ivanov.mikhail1@huawei-partners.com>
  Jaewon Kim <jaewon02.kim@samsung.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jingqi Liu <Jingqi.liu@intel.com>
  Joerg Roedel <jroedel@suse.de>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jules Irenge <jbi.octave@gmail.com>
  Junxian Huang <huangjunxian6@hisilicon.com>
  Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
  Klara Modin <klarasmodin@gmail.com>
  Konstantin Taranov <kotaranov@microsoft.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Luca Weiss <luca@z3ntu.xyz>
  Lucas Stach <l.stach@pengutronix.de>
  Marc Gonzalez <mgonzalez@freebox.fr>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Michael Guralnik <michaelgur@nvidia.com>
  Michael Margolin <mrgolin@amazon.com>
  Michael Shavit <mshavit@google.com>
  Michal Schmidt <mschmidt@redhat.com>
  Mickaël Salaün <mic@digikod.net>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
  Nick Desaulniers <ndesaulniers@google.com> # Boot
  Nicolin Chen <nicolinc@nvidia.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Or Har-Toov <ohartoov@nvidia.com>
  Pasha Tatashin <pasha.tatashin@soleen.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Griffin <peter.griffin@linaro.org>
  Rob Herring (Arm) <robh@kernel.org>
  Rob Herring <robh@kernel.org>
  Roberto Sassu <roberto.sassu@huawei.com>
  Robin Murphy <robin.murphy@arm.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shreeya Patel <shreeya.patel@collabora.com>
  Stephen Boyd <sboyd@kernel.org>
  Sudan Landge <sudanl@amazon.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Thanh Le <thanh.le.xv@renesas.com>
  Thanh Quan <thanh.quan.xn@renesas.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Leemhuis <linux@leemhuis.info>
  Tina Zhang <tina.zhang@intel.com>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasant Hegde <vasant.hegde@amd.com>
  Vladimir Zapolskiy <vz@mleia.com>
  Wang Yao <wangyao@lemote.com>
  Wei Huang <wei.huang2@amd.com>
  Wei Lei <quic_leiwei@quicinc.com>
  Wenchao Hao <haowenchao2@huawei.com>
  wenglianfa <wenglianfa@huawei.com>
  Will Deacon <will@kernel.org>
  Yangyang Li <liyangyang20@huawei.com>
  Yi Liu <yi.l.liu@intel.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Zhengping Zhang <zhengping.zhang@airoha.com>
  Zhu Yanjun <yanjun.zhu@linux.dev>

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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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
   4b377b4868ef..25f4874662fb  25f4874662fb0d43fc1d934dd7802b740ed2ab5f -> tested/linux-linus

