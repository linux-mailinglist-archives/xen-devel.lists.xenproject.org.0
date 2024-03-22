Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F6886698
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 07:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696647.1087729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnY1H-0002yb-0V; Fri, 22 Mar 2024 06:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696647.1087729; Fri, 22 Mar 2024 06:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnY1G-0002wq-T4; Fri, 22 Mar 2024 06:04:46 +0000
Received: by outflank-mailman (input) for mailman id 696647;
 Fri, 22 Mar 2024 06:04:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnY1G-0002wg-8x; Fri, 22 Mar 2024 06:04:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnY1F-0003Mu-VY; Fri, 22 Mar 2024 06:04:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnY1F-0002Mm-Kc; Fri, 22 Mar 2024 06:04:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rnY1F-0000BT-K6; Fri, 22 Mar 2024 06:04:45 +0000
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
	bh=WB0CebYNAgmoSK9ZCRYjWFhtoICeLp4ousyC9oLjdlY=; b=nNQWnl/1ZHUp2cjrO8GO9jbSDm
	EBXIRi59qdkuZcusH0sQr+Z2nuNPYPFoSyc8YLVNZaaCfVT6Gdsv1zDnfETn7H+5PhVCUUCS4HViz
	jC0gLg0nGgm1n0HD6TUkek5ynpWRxoz1Wfs3xXn+q8WKBru+3DimeZRhJcAsjX0hj0Og=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185136: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-arm64-xsm:xen-build:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=241590e5a1d1b6219c8d3045c167f2fbcc076cbb
X-Osstest-Versions-That:
    linux=23956900041d968f9ad0f30db6dede4daccd7aa9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Mar 2024 06:04:45 +0000

flight 185136 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185136/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 185119

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185119
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185119
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185119
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185119
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185119
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185119
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                241590e5a1d1b6219c8d3045c167f2fbcc076cbb
baseline version:
 linux                23956900041d968f9ad0f30db6dede4daccd7aa9

Last test of basis   185119  2024-03-21 07:40:49 Z    0 days
Testing same since   185136  2024-03-21 21:13:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
  "Moritz C. Weber" <mo.c.weber@gmail.com>
  "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
  "Rafael J. Wysocki" <rafael@kernel.org>
  "Ricardo B. Marliere" <ricardo@marliere.net>
  Abel Vesa <abel.vesa@linaro.org>
  Abhijit Gangurde <abhijit.gangurde@amd.com>
  Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
  Adam Skladowski <a39.skl@gmail.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Romosan <aromosan@gmail.com>
  Alexander Tsoy <alexander@tsoy.me>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alim Akhtar <alim.akhtar@samsung.com> # Samsung
  Amit Dhingra <mechanicalamit@gmail.com>
  Anand Jain <anand.jain@oracle.com>
  Andreas Klinger <ak@it-klinger.de>
  Andrew Davis <afd@ti.com>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrey Skvortsov <andrej.skvortzov@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  andy.shevchenko@gmail.com <andy.shevchenko@gmail.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Antheas Kapenekakis <lkml@antheas.dev>
  Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
  Arnd Bergmann <arnd@arndb.de>
  Artur Rojek <contact@artur-rojek.eu>
  Arturas Moskvinas <arturas.moskvinas@gmail.com>
  Aurélien Jacobs <aurel@gnuage.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Cameron Williams <cang1@live.co.uk>
  Carlos Llamas <cmllamas@google.com>
  CHECK_1234543212345@protonmail.com
  Chen-Yu Tsai <wenst@chromium.org>
  Chengming Zhou <zhouchengming@bytedance.com>
  ChiYuan Huang <cy_huang@richtek.com>
  Chris Leech <cleech@redhat.com>
  Christian Eggers <ceggers@arri.de>
  Christian Häggström <christian.haggstrom@orexplore.com>
  Christian König <christian.koenig@amd.com>
  Christoph Winklhofer <cj.winklhofer@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Colin Ian King <colin.i.king@intel.com>
  Conor Dooley <conor.dooley@microchip.com>
  Dalton Durst <dalton@ubports.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vogelbacher <daniel@chaospixel.com>
  Danila Tikhonov <danila@jiaxyga.com>
  David Lechner <dlechner@baylibre.com>
  David Sterba <dsterba@suse.com>
  Dawei Li <dawei.li@shingroup.cn>
  Denis Benato <benato.denis96@gmail.com>
  Dimitri Fedrau <dima.fedrau@gmail.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dorine Tipo <dorine.a.tipo@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Dumitru Ceclan <mitrutzceclan@gmail.com>
  Elad Nachman <enachman@marvell.com>
  Elbert Mai <code@elbertmai.com>
  Eli Billauer <eli.billauer@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Erick Archer <erick.archer@gmx.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Li <Frank.Li@nxp.com>
  Gabor Juhos <j4g8y7@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Georgi Djakov <djakov@kernel.org>
  Gil Fine <gil.fine@linux.intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Guan-Yu Lin <guanyulin@google.com>
  Guanjun <guanjun@linux.alibaba.com>
  Hans de Goede <hdegoede@redhat.com>
  Haotien Hsu <haotienh@nvidia.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Helge Deller <deller@gmx.de> # parisc STI console
  Hoorad Farrokh <hourrad.f@gmail.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Ian Abbott <abbotti@mev.co.uk>
  Icenowy Zheng <icenowy@aosc.io>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  James Clark <james.clark@arm.com>
  Jameson Thies <jthies@google.com>
  Jan Kundrát <jan.kundrat@cesnet.cz>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Javier Carrasco <javier.carrasco@wolfvision.net>
  Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
  Jesus Gonzalez <jesusmgh@gmail.com>
  Jinlong Mao <quic_jinlmao@quicinc.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Joakim Zhang <joakim.zhang@cixtech.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <jth@kernel.org>
  John Garry <john.g.garry@oracle.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  John Stultz <jstultz@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonas Gorski <jonas.gorski@gmail.com>
  Jonathan Bergh <bergh.jonathan@gmail.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio
  Jonathan LoBue <jlobue10@gmail.com>
  Josua Mayer <josua@solid-run.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Jun Yan <jerrysteve1101@gmail.com>
  Justin Stitt <justinstitt@google.com>
  Kalyani Akula <Kalyani.akula@amd.com>
  Karina Yankevich <k.yankevich@omp.ru>
  Kees Cook <keescook@chromium.org>
  Keng-Yu Lin <keng-yu.lin@hpe.com>
  Kim Seer Paller <kimseer.paller@analog.com>
  Klara Modin <klarasmodin@gmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krishna chaitanya chundru <quic_krichai@quicinc.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Lee Jones <lee@kernel.org>
  Li Zhijian <lizhijian@fujitsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lizhe <sensor1010@163.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luca Weiss <luca.weiss@fairphone.com>
  Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3
  Luis Chamberalin <mcgrof@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Luke D. Jones <luke@ljones.dev>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Madhan Sai <madhan.singaraju@candelatech.com>
  Manikanta Guntupalli <manikanta.guntupalli@amd.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mao Jinlong <quic_jinlmao@quicinc.com>
  Marc Dietrich <marvin24@gmx.de>
  Marc Herbert <marc.herbert@intel.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Marco Pagani <marpagan@redhat.com>
  Marius Cristea <marius.cristea@microchip.com>
  Mark Brown <broonie@kernel.org>
  Mark Greer <mgreer@animalcreek.com>
  Markus Schneider-Pargmann <msp@baylibre.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matt Hsiao <matt.hsiao@hpe.com>
  Matthias Kaehlcke <mka@chromium.org>
  Matthias Yee <mgyee9@gmail.com>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Maximilian Luz <luzmaximilian@gmail.com>  # for platform/surface
  Meir Elisha <meir6264@Gmail.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael Kelley <mhklinux@outlook.com>
  Michael Straube <straube.linux@gmail.com>
  Michal Pecio <michal.pecio@gmail.com>
  Michal Simek <michal.simek@amd.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Looijmans <mike.looijmans@topic.nl>
  Mohammad Rahimi <rahimi.mhmmd@gmail.com>
  Mohammed Billoo <mab.kernel@gmail.com>
  Moritz C. Weber <mo.c.weber@gmail.com>
  Mukesh Ojha <quic_mojha@quicinc.com>
  Mårten Lindahl <marten.lindahl@axis.com>
  Nadav Amit <nadav.amit@gmail.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Naresh Solanki <naresh.solanki@9elements.com>
  Neel Natu <neelnatu@google.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nghia Nguyen <nghia.nguyen.jg@renesas.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nikhil Agarwal <nikhil.agarwal@amd.com>
  Nikita Mikhailevich <ermyril@gmail.com>
  Niklas Neronin <niklas.neronin@intel.com>
  Niklas Neronin <niklas.neronin@linux.intel.com>
  Niklas Söderlund <niklas.soderlund@ragnatech.se>
  Niko Mauno <niko.mauno@vaisala.com>
  Nilesh Javali <njavali@marvell.com>
  Nipun Gupta <nipun.gupta@amd.com>
  Nuno Das Neves <nunodasneves@linux.microsoft.com>
  Nuno Sa <nuno.sa@analog.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Oleksandr Natalenko <oleksandr@natalenko.name>
  Oliver Neukum <oneukum@suse.com>
  Olivier Moysan <olivier.moysan@foss.st.com>
  Ondrej Jirman <megi@xff.cz>
  Ondřej Jirman <megi@xff.cz>
  Paul Cercueil <paul@crapouillou.net>
  Peng Fan <peng.fan@nxp.com>
  Peter Collingbourne <pcc@google.com>
  Peter Korsgaard <peter@korsgaard.com>
  Petre Rodan <petre.rodan@subdimension.ro>
  Philipp Hortmann <philipp.g.hortmann@gmail.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Pranav Athreya <pranavsubbu@gmail.com>
  Prashanth K <quic_prashk@quicinc.com>
  Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>
  Purna Pavan Chandra Aekkaladevi <paekkaladevi@linux.microsoft.com>
  Quentin Schulz <quentin.schulz@theobroma-systems.com>
  Ramona Gradinariu <ramona.gradinariu@analog.com>
  Ran Wang <ran.wang_1@nxp.com>
  Randy Dunlap <rdunlap@infradead.org>
  Raphael Gallais-Pou <rgallaispou@gmail.com>
  RD Babiera <rdbabiera@google.com>
  Rengarajan S <rengarajan.s@microchip.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rob Herring <robh@kernel.org>
  Rodolfo Giometti <giometti@enneenne.com>
  Roger Quadros <rogerq@kernel.org>
  Rohan Kollambalath <rkollamb@digi.com>
  Roman Žilka <roman.zilka@gmail.com>
  Rui Miguel Silva <rui.silva@linaro.org>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sanath S <Sanath.S@amd.com>
  Saravana Kannan <saravanak@google.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Sean Anderson <sean.anderson@seco.com>
  Sean Rhodes <sean@starlabs.systems>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Serge Semin <fancer.lancer@gmail.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shahar Avidar <ikobh7@gmail.com>
  Shoji Keita <awaittrot@shjk.jp>
  Sibi Sankar <quic_sibis@quicinc.com>
  Sing-Han Chen <singhanc@nvidia.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stanley Chang <stanley_chang@realtek.com>
  Stefan Eichenberger <stefan.eichenberger@toradex.com>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Stephen Boyd <swboyd@chromium.org>
  Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Tamseel Shams <m.shams@samsung.com>
  Tanmay Shah <tanmay.shah@amd.com>
  Tao Zhang <quic_taozha@quicinc.com>
  Tarak Reddy <tarak.reddy@amd.com>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com> # Tegra
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Haemmerle <thomas.haemmerle@leica-geosystems.com>
  Thomas Huth <thuth@redhat.com>
  Thorsten Scherer <t.scherer@eckelmann.de>
  Tomas Winkler <tomas.winkler@intel.com>
  Toru Katagiri <Toru.Katagiri@tdk.com>
  Tree Davies <tdavies@darkphysics.net>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Uday Bhat <uday.m.bhat@intel.com>
  Uday M Bhat <uday.m.bhat@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vaibhav Agarwal <vaibhav.sr@gmail.com>
  Vaibhav Gupta <vaibhavgupta40@gmail.com>
  Valentin Caron <valentin.caron@foss.st.com>
  Vitaly Lubart <vitaly.lubart@intel.com>
  Wayne Chang <waynec@nvidia.com>
  Wei Liu <wei.liu@kernel.org>
  Wesley Cheng <quic_wcheng@quicinc.com>
  William-tw Lin <william-tw.lin@mediatek.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xu Yilun <yilun.xu@intel.com>
  Xu Yilun <yilun.xu@linux.intel.com>
  Yang Jihong <yangjihong1@huawei.com>
  Yang Xiwen <forbidden405@outlook.com>
  Yuezhang Mo <Yuezhang.Mo@sony.com>
  Yury Norov <yury.norov@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              fail    
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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


Not pushing.

(No revision log; it would be 17062 lines long.)

