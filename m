Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF567E1105
	for <lists+xen-devel@lfdr.de>; Sat,  4 Nov 2023 21:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627544.978484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzNhq-0004oO-7V; Sat, 04 Nov 2023 20:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627544.978484; Sat, 04 Nov 2023 20:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzNhq-0004my-4E; Sat, 04 Nov 2023 20:57:22 +0000
Received: by outflank-mailman (input) for mailman id 627544;
 Sat, 04 Nov 2023 20:57:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzNho-0004mm-JE; Sat, 04 Nov 2023 20:57:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzNho-0003FW-BE; Sat, 04 Nov 2023 20:57:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzNhn-0000wi-Ts; Sat, 04 Nov 2023 20:57:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qzNhn-0006ir-TL; Sat, 04 Nov 2023 20:57:19 +0000
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
	bh=bX5qJJe4nvTDNmvfCTJn3kBEEGiazBRuzpRd5mBVv1w=; b=3A5kzARdg4ycbdEZqAwLiJSQSO
	36EF8DcftLasonZu9WWyt/FL08jomyTV5IM0XF2F2ZzAejqkBoVVWEn4Ij4DufN8G+Vs51POxXFzR
	dby4klb+291JHoGC7RERGkAJ4XHu3+cDStiJ2jkSGbaFDYshI/6oA2HdJDGnwLbuPSAw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183682-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183682: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
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
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=90b0c2b2edd1adff742c621e246562fbefa11b70
X-Osstest-Versions-That:
    linux=e392ea4d4d00880bf94550151b1ace4f88a4b17a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Nov 2023 20:57:19 +0000

flight 183682 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183682/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 183675
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183675
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183675
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183675
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183675
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183675
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183675
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183675
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
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
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                90b0c2b2edd1adff742c621e246562fbefa11b70
baseline version:
 linux                e392ea4d4d00880bf94550151b1ace4f88a4b17a

Last test of basis   183675  2023-11-04 01:57:54 Z    0 days
Testing same since   183682  2023-11-04 12:12:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Crt Mori <cmo@melexis.com>"
  "Gustavo A. R. Silva" <gustavoars@kernel.org>
  "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
  "Rafael J. Wysocki" <rafael@kernel.org>
  "Ricardo B. Marliere" <ricardo@marliere.net>
  Abdel Alkuor <abdelalkuor@geotab.com>
  Abhijit Gangurde <abhijit.gangurde@amd.com>
  Alain Volmat <alain.volmat@foss.st.com>
  Alan Previn <alan.previn.teres.alexis@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alejandro Colomar <alx@kernel.org>
  Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alexon Oliveira <alexondunkan@gmail.com>
  Alisa-Dariana Roman <alisa.roman@analog.com>
  Amelie Delaunay <amelie.delaunay@foss.st.com>
  Ana-Maria Cusco <ana-maria.cusco@analog.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andrey Konovalov <andreyknvl@gmail.com>
  André Apitzsch <git@apitzsch.eu>
  André Draszik <andre.draszik@linaro.org>
  Andy Shen Shen <shengaoya@inspur.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Antoniu Miclaus <antoniu.miclaus@analog.com>
  Apelete Seketeli <aseketeli@baylibre.com>
  Arnd Bergmann <arnd@arndb.de>
  Arnd Bergmann <arnd@kernel.org>
  Ayush Singh <ayushdevel1325@gmail.com>
  Azeem Shaikh <azeems@google.com>
  Badhri Jagan Sridharan <badhri@google.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Baruch Siach <baruch@tkos.co.il>
  Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  Benjamin Poirier <benjamin.poirier@gmail.com>
  Benson Leung <bleung@chromium.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bo Liu <liubo03@inspur.com>
  Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
  Calvince Otieno <calvncce@gmail.com>
  Cameron Williams <cang1@live.co.uk>
  Carlos Llamas <cmllamas@google.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chengfeng Ye <dg573847474@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Chunyan Zhang <zhang.lyra@gmail.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Conor Dooley <conor.dooley@microchip.com>
  Crescent CY Hsieh <crescentcy.hsieh@moxa.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Golle <daniel@makrotopia.org>
  Daniel Starke <daniel.starke@siemens.com>
  Dave Jiang <dave.jiang@intel.com>
  David Lechner <dlechner@baylibre.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dorcas AnonoLitunya <anonolitunya@gmail.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Erwan Le Ray <erwan.leray@foss.st.com>
  Fabio Estevam <festevam@denx.de>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Florian Eckert <fe@dev.tdt.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Li <Frank.Li@nxp.com>
  Frederic Barrat <fbarrat@linux.ibm.com>
  Gabriel Somlo <gsomlo@gmail.com>
  Gary Rookard <garyrookard@fastmail.org>
  Geert Uytterhoeven <geert+renesas@glider.be>
  George Stark <gnstark@sberdevices.ru>
  Georgi Djakov <djakov@kernel.org>
  Gil Fine <gil.fine@linux.intel.com>
  Gilbert Adikankwu <gilbertadikankwu@gmail.com>
  Grant B Adams <nemith592@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guo Ren <guoren@kernel.org>
  GUO Zihua <guozihua@huawei.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Günther Noack <gnoack@google.com>
  Hanno Böck <hanno@hboeck.de>
  Hans de Goede <hdegoede@redhat.com>
  Hardik Gajjar <hgajjar@de.adit-jv.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Hongren Zheng <i@zenithal.me>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Huqiang Qin <huqiang.qin@amlogic.com>
  Ian Abbott <abbotti@mev.co.uk>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  iuncuim <iuncuim@gmail.com>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Jacky Huang <ychuang3@nuvoton.com>
  Jakub Kicinski <kuba@kernel.org>
  James Clark <james.clark@arm.com>
  James Gruber <jimmyjgruber@gmail.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Nilsson <jesper.nilsson@axis.com>
  Jia-Ju Bai <baijiaju@buaa.edu.cn>
  Jimmy Hu <hhhuuu@google.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jisheng Zhang <jszhang@kernel.org>
  Joe Wang <joe_wang@aspeedtech.com>
  John Ogness <john.ogness@linutronix.de>
  Jonas Blixt <jonas.blixt@actia.se>
  Jonathan Bell <jonathan@raspberrypi.com>
  Jonathan Bergh <bergh.jonathan@gmail.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Neuschäfer <j.neuschaefer@gmx.net>
  Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
  Jose Javier Rodriguez Barbarin <JoseJavier.Rodriguez@duagon.com>
  Julien Malik <julien.malik@unseenlabs.fr>
  Justin Stitt <justinstitt@google.com>
  Kaiwei Liu <kaiwei.liu@unisoc.com>
  Karina Yankevich <k.yankevich@omp.ru>
  Kees Cook <keescook@chromium.org>
  Khalid Aziz <khalid@gonehiking.org>
  Khalid Azzi <khalid@gonehiking.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lars-Peter Clausen <lars@metafoo.de>
  Li Zetao <lizetao1@huawei.com>
  Liam Beguin <liambeguin@gmail.com>
  Liha Sikanen <lihasika@gmail.com>
  LihaSika <lihasika@gmail.com>
  Lijun Pan <lijun.pan@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Luca Weiss <luca@z3ntu.xyz>
  Lucas Tanure <tanure@linux.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Manish Pandey <quic_mapa@quicinc.com>
  Marcus Folkesson <marcus.folkesson@gmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Marius Cristea <marius.cristea@microchip.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin Kaiser <martin@kaiser.cx>
  Martin Kepplinger <martink@posteo.de>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Majewski <m.majewski2@samsung.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Howell <matthew.howell@sealevel.com>
  Matti Lehtimäki <matti.lehtimaki@gmail.com>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Kellermann <max.kellermann@ionos.com>
  Mehdi Djait <mehdi.djait.k@gmail.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael Straube <straube.linux@gmail.com>
  Michael Wu <michael@allwinnertech.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Tipton <quic_mdtipton@quicinc.com>
  Mikhail Kalashnikov <iuncuim@gmail.com>
  Milan Broz <gmazyland@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mrinmay Sarkar <quic_msarkar@quicinc.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Mukesh Ojha <quic_mojha@quicinc.com>
  Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
  Nava kishore Manne <nava.kishore.manne@amd.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikhil Agarwal <nikhil.agarwal@amd.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nipun Gupta <nipun.gupta@amd.com>
  Nitheesh Sekar <quic_nsekar@quicinc.com>
  Nitin Rawat <quic_nitirawa@quicinc.com>
  Oliver Crumrine <ozlinux@hotmail.com>
  Olivier Dautricourt <olivierdautricourt@gmail.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pavan Bobba <opensource206@gmail.com>
  Pavel Krasavin <pkrasavin@imaqliq.com>
  Pawel Laszczak <pawell@cadence.com>
  Peter Chen <peter.chen@kernel.org>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Philipp Hortmann <philipp.g.hortmann@gmail.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Piyush Mehta <piyush.mehta@amd.com>
  Prashant Malani <pmalani@chromium.org>
  Puneet Gupta <puneet.gupta@amd.com>
  Raag Jadav <raag.jadav@intel.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rajan Vaja <rajan.vaja@xilinx.com>
  Ramona Bolboaca <ramona.bolboaca@analog.com>
  Ramona Gradinariu <ramona.gradinariu@analog.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Li <ayaka@soulik.info>
  Raphael Gallais-Pou <rgallaispou@gmail.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Ricardo Lopes <ricardoapl.dev@gmail.com>
  Richard Purdie <richard.purdie@linuxfoundation.org>
  Rob Herring <robh@kernel.org>
  Rodríguez Barbarin, José Javier <josejavier.rodriguez@duagon.com>
  Rohit Agarwal <quic_rohiagar@quicinc.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sanjuán García, Jorge <Jorge.SanjuanGarcia@duagon.com>
  Saravana Kannan <saravanak@google.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sergey Khimich <serghox@gmail.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shuijing Li <shuijing.li@mediatek.com>
  Shuzhen Wang <shuzhenwang@google.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Simon Arlott <simon@octiron.net>
  Soumya Negi <soumya.negi97@gmail.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srinivas Pandruvada<srinivas.pandruvada@linux.intel.com>
  Stanley Chang <stanley_chang@realtek.com>
  Stefan Windfeldt-Prytz <stefan.windfeldt-prytz@axis.com>
  Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
  syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com
  Thierry Reding <treding@nvidia.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richard <thomas.richard@bootlin.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Leemhuis <linux@leemhuis.info>
  Timur Tabi <timur@kernel.org>
  Tom Zanussi <tom.zanussi@linux.intel.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tomer Maimon <tmaimon77@gmail.com>
  Tony Lindgren <tony@atomide.com>
  Tree Davies <tdavies@darkphysics.net>
  Tzuyi Chang <tychang@realtek.com>
  Uday M Bhat <uday.m.bhat@intel.com>
  Udipto Goswami <quic_ugoswami@quicinc.com>
  Umang Jain <umang.jain@ideasonboard.com>
  Utkarsh Patel <utkarsh.h.patel@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Caron <valentin.caron@foss.st.com>
  Valentine Sinitsyn <valesini@yandex-team.ru>
  Varadarajan Narayanan <quic_varada@quicinc.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Lubart <vitaly.lubart@intel.com>
  Wentong Wu <wentong.wu@intel.com>
  Wesley Cheng <quic_wcheng@quicinc.com>
  William Breathitt Gray <william.gray@linaro.org>
  Willy Tarreau <w@1wt.eu>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xu Yilun <yilun.xu@intel.com>
  Xu Yilun <yilun.xu@linux.intel.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yi Yang <yiyang13@huawei.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yue Haibing <yuehaibing@huawei.com>
  Zev Weiss <zev@bewilderbeest.net>
  Zhang Shurong <zhang_shurong@foxmail.com>
  Zhangfei Gao <zhangfei.gao@linaro.org>

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
   e392ea4d4d00..90b0c2b2edd1  90b0c2b2edd1adff742c621e246562fbefa11b70 -> tested/linux-linus

