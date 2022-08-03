Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B8A58857E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 03:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379490.612963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ3S8-00027Y-V4; Wed, 03 Aug 2022 01:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379490.612963; Wed, 03 Aug 2022 01:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ3S8-00025m-Px; Wed, 03 Aug 2022 01:45:40 +0000
Received: by outflank-mailman (input) for mailman id 379490;
 Wed, 03 Aug 2022 01:45:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ3S7-00025c-As; Wed, 03 Aug 2022 01:45:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ3S7-0002kY-7V; Wed, 03 Aug 2022 01:45:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ3S6-0004Zi-Ao; Wed, 03 Aug 2022 01:45:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ3S6-0001eo-AK; Wed, 03 Aug 2022 01:45:38 +0000
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
	bh=TDg09yWdOQUkCBRHp1EU6yx/eUYzm3GNKYFUwUAoNfs=; b=dbvtviJKFKCidN7R7LkJzmB21i
	+u7pEWJMENjQUDbjBTgJNwBr3SOWCEdCuVYxeOkBNG4o4+226oFI5CH/CexiM6kFYJgjnYlYGa27x
	jeI6+CjTik5ufohEuYBTUYSW8gRmEYMuLGex/TZ1HWcculuH2JCCiIS/wtfUUeZI3R5E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172084-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 172084: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1
X-Osstest-Versions-That:
    linux=9de1f9c8ca5100a02a2e271bdbde36202e251b4b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Aug 2022 01:45:38 +0000

flight 172084 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172084/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 172074
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 172074
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172074
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172074
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172074
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 172074
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 172074
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 172074
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1
baseline version:
 linux                9de1f9c8ca5100a02a2e271bdbde36202e251b4b

Last test of basis   172074  2022-08-02 02:01:19 Z    0 days
Testing same since   172084  2022-08-02 16:41:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Abel Vesa <abel.vesa@linaro.org>
  Abel Vesa <abel.vesa@nxp.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Akash Gajjar <akash@openedev.com>
  Akhil R <akhilrajeev@nvidia.com>
  Alec Su <ae40515@yahoo.com.tw>
  Alexander Martinz <amartinz@shiftphones.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Alexandre Torgue <alexandre.torgue@foss.st.com>
  Alim Akhtar <alim.akhtar@samsung.com>
  Allen-KH Cheng <allen-kh.cheng@mediatek.com>
  Anand Gore <anand.gore@broadcom.com>
  Andre Przywara <andre.przywara@arm.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
  Andrey Konovalov <andrey.konovalov@linaro.org>
  André Almeida <andrealmeid@collabora.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Anton Bambura <jenneron@protonmail.com>
  Arnd Bergmann <arnd@arndb.de>
  Aswath Govindraju <a-govindraju@ti.com>
  Baruch Siach <baruch@tkos.co.il>
  Bhadram Varka <vbhadram@nvidia.com>
  Bharat Uppal <bharat.uppal@samsung.com>
  Bhupesh Sharma <bhupesh.sharma@linaro.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Caleb Connolly <caleb@connolly.tech>
  Chanho Park <chanho61.park@samsung.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Chris Paterson <chris.paterson2@renesas.com>
  Christian Lamparter <chunkeey@gmail.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Chun-Kuang Hu <chunkuang.hu@kernel.org>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Clément Léger <clement.leger@bootlin.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Williams <dan.j.williams@intel.com>
  Dang Huynh <danct12@riseup.net>
  David Heidelberg <david@ixit.cz>
  David Virag <virag.david003@gmail.com>
  David Wang <David_Wang6097@jabil.com>
  Denys Drozdov <denys.drozdov@toradex.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Douglas Anderson <dianders@chromium.org>
  Dylan Van Assche <me@dylanvanassche.be>
  Emma Anholt <emma@anholt.net>
  Enric Balletbo i Serra <enric.balletbo@collabora.com>
  Eric Chanudet <echanude@redhat.com>
  Fabien Dessenne <fabien.dessenne@foss.st.com>
  Fabien Parent <fparent@baylibre.com>
  Fabio Estevam <festevam@denx.de>
  Fabio Estevam <festevam@gmail.com>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Frank Wunderlich <frank-w@public-files.de>
  Furkan Kardame <f.kardame@manjaro.org>
  Gabriel Fernandez <gabriel.fernandez@foss.st.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Georgi Djakov <djakov@kernel.org>
  Gregari Ivanov <llamashere@posteo.de>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume La Roque <glaroque@baylibre.com>
  Gwendal Grignou <gwendal@chromium.org>
  Heiko Stuebner <heiko@sntech.de>
  Herve Codina <herve.codina@bootlin.com>
  Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Hsin-Yi Wang <hsinyi@chromium.org>
  Jacek Anaszewski <jacek.anaszewski@gmail.com>
  Jayesh Choudhary <j-choudhary@ti.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiang Jian <jiangjian@cdjrlc.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Jonker <jbx6244@gmail.com>
  John Garry <john.garry@huawei.com>
  Jonathan Marek <jonathan@marek.ca>
  Jonathan McDowell <noodles@earth.li>
  Joseph S. Barrera III <joebar@chromium.org>
  Juerg Haefliger <juerg.haefliger@canonical.com>
  Juerg Haefliger <juergh@canonical.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kartik <kkartik@nvidia.com>
  Kaushal Kumar <quic_kaushalk@quicinc.com>
  Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
  Kevin Hilman <khilman@baylibre.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Konrad Dybcio <konrad.dybcio@somainline.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Kursad Oney <kursad.oney@broadcom.com>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Lee Jones <lee.jones@linaro.org>
  Leonard Göhrs <l.goehrs@pengutronix.de>
  Liang He <windhl@126.com>
  Lin, Meng-Bo <linmengbo0689@protonmail.com>
  Linh Phung <linh.phung.jy@renesas.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Luca Weiss <luca@z3ntu.xyz>
  Lucas Stach <l.stach@pengutronix.de>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lv Ruyi <lv.ruyi@zte.com.cn>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Zyngier <maz@kernel.org>
  Marcel Ziswiler <marcel.ziswiler@toradex.com>
  Marek Behún <kabel@kernel.org>
  Marek Vasut <marex@denx.de>
  Marijn Suijten <marijn.suijten@somainline.org>
  Mark Brown <broonie@kernel.org>
  Markus Niebel <Markus.Niebel@tq-group.com>
  Markuss Broks <markuss.broks@gmail.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin Jücker <martin.juecker@gmail.com>
  Martin Kaiser <martin@kaiser.cx>
  Martin Kepplinger <martin.kepplinger@puri.sm>
  Matthias Brugger <matthias.bgg@gmail.com>
  Matthias Kaehlcke <mka@chromium.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Max Krummenacher <max.krummenacher@toradex.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Riesch <michael.riesch@wolfvision.net>
  Michael Trimarchi <michael@amarulasolutions.com>
  Michael Walle <michael@walle.cc>
  Michal Simek <michal.simek@amd.com>
  Michal Simek <michal.simek@xilinx.com>
  Mikko Perttunen <mperttunen@nvidia.com>
  Molly Sophia <mollysophia379@gmail.com>
  Moudy Ho <moudy.ho@mediatek.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <narmstrong@baylibre.com>
  Nick Hainke <vincent@systemli.org>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
  Nishanth Menon <nm@ti.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
  Pali Rohár <pali@kernel.org>
  Parikshit Pareek <quic_ppareek@quicinc.com>
  Paweł Anikiel <pan@semihalf.com>
  Peng Fan <peng.fan@nxp.com>
  Peng Wu <wupeng58@huawei.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Robinson <pbrobinson@gmail.com>
  Phil Edworthy <phil.edworthy@renesas.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Philippe Schenker <philippe.schenker@toradex.com>
  qianfan Zhao <qianfanguijin@163.com>
  Qin Jian <qinjian@cqplus1.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rex-BC Chen <rex-bc.chen@mediatek.com>
  Rob Herring <robh@kernel.org>
  Robert Foss <robert.foss@linaro.org>
  Robert Hancock <robert.hancock@calian.com>
  Robert Marko <robimarko@gmail.com>
  Robin van der Gracht <robin@protonic.nl>
  Roger Lu <roger.lu@mediatek.com>
  Rohit Agarwal <quic_rohiagar@quicinc.com>
  Runyang Chen <runyang.chen@mediatek.com>
  Sameer Pujar <spujar@nvidia.com>
  Samuel Holland <samuel@sholland.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sean Anderson <sean.anderson@seco.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Sibi Sankar <quic_sibis@quicinc.com>
  Simon Holesch <simon.holesch@bshg.com>
  Simon Horman <horms@verge.net.au>
  Sireesh Kodali <sireeshkodali1@gmail.com>
  Sjoerd Simons <sjoerd@collabora.com>
  Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
  Steev Klimaszewski <steev@kali.org>
  Stefan Agner <stefan.agner@toradex.com>
  Stefan Hansson <newbie13xd@gmail.com>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sumit Garg <sumit.garg@linaro.org>
  Sumit Gupta <sumitg@nvidia.com>
  Tamás Szűcs <tszucs@protonmail.ch>
  Tanmay Shah <tanmay.shah@xilinx.com>
  Teh Wen Ping <wen.ping.teh@intel.com>
  Teresa Remmet <t.remmet@phytec.de>
  Thara Gopinath <thara.gopinath@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Tho Vu <tho.vu.wh@renesas.com>
  Tim Harvey <tharvey@gateworks.com>
  Timo Alho <talho@nvidia.com>
  Tomer Maimon <tmaimon77@gmail.com>
  Tony Lindgren <tony@atomide.com>
  Ulrich Ölmann <u.oelmann@pengutronix.de>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadym Kochan <vadym.kochan@plvision.eu>
  Venkata Prasad Potturu <quic_potturu@quicinc.com>
  Vinod Koul <vkoul@kernel.org>
  Vinod Polimera <quic_vpolimer@quicinc.com>
  Viorel Suman <viorel.suman@nxp.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
  Vladimir Zapolskiy <vz@mleia.com>
  William Zhang <william.zhang@broadcom.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiang wangx <wangxiang@cdjrlc.com>
  Xiangsheng Hou <xiangsheng.hou@mediatek.com>
  XueBing Chen <chenxuebing@jari.cn>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yassine Oudjana <y.oudjana@protonmail.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zelong Dong <zelong.dong@amlogic.com>

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
   9de1f9c8ca51..7d0d3fa7339e  7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1 -> tested/linux-linus

