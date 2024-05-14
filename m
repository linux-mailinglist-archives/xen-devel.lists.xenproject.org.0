Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60868C4A71
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 02:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721106.1124254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6g1N-0002Gx-Rt; Tue, 14 May 2024 00:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721106.1124254; Tue, 14 May 2024 00:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6g1N-0002Ep-OZ; Tue, 14 May 2024 00:27:57 +0000
Received: by outflank-mailman (input) for mailman id 721106;
 Tue, 14 May 2024 00:27:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6g1M-0002Ef-1c; Tue, 14 May 2024 00:27:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6g1L-0001Dd-Tl; Tue, 14 May 2024 00:27:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6g1L-0003Wr-Gk; Tue, 14 May 2024 00:27:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s6g1L-0002KS-GD; Tue, 14 May 2024 00:27:55 +0000
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
	bh=yJvm0iTW9VkAjCgt5CIzq2UDQwKWWfBZOCgFOWF87r8=; b=orisucgla9jNDAxLEyzTzAOHP1
	tWGnSaZW8c5sm8KpAPfyHStDlcWS/hIrjr+ctWYaIPK83SVJZvHLijf6++vBPRJem52VV/4JDq+hR
	1KMjaKkTR0jtmOjz91zVLsb0DTRREAbcNjtA7Ko9JcORmdNVByvfH76zs+QiqEkIG7kQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185990-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185990: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:host-ping-check-xen:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6d1346f1bcbf2724dee8af013cdab9f7b581435b
X-Osstest-Versions-That:
    linux=a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 May 2024 00:27:55 +0000

flight 185990 linux-linus real [real]
flight 185991 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185990/
http://logs.test-lab.xenproject.org/osstest/logs/185991/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt     10 host-ping-check-xen fail pass in 185991-retest
 test-armhf-armhf-xl-credit1   8 xen-boot            fail pass in 185991-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 185991 like 185986
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 185991 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 185991 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 185991 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185986
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185986
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185986
 test-armhf-armhf-xl           8 xen-boot                     fail  like 185986
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 185986
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185986
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185986
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                6d1346f1bcbf2724dee8af013cdab9f7b581435b
baseline version:
 linux                a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6

Last test of basis   185986  2024-05-12 23:41:44 Z    1 days
Testing same since   185990  2024-05-13 16:43:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Jason J. Herne" <jjherne@linux.ibm.com>
  Abel Vesa <abel.vesa@linaro.org>
  Adam Ford <aford173@gmail.com>
  Akhil R <akhilrajeev@nvidia.com>
  Alain Volmat <alain.volmat@foss.st.com>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa9352LA/CA
  Alexandre Torgue <alexandre.torgue@foss.st.com>
  Alexey Minnekhanov <alexeymin@postmarketos.org>
  Alice Guo <alice.guo@nxp.com>
  Alim Akhtar <alim.akhtar@samsung.com>
  Anand Moon <anand@edgeble.ai>
  Andre Przywara <andre.przywara@arm.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
  Andrew Davis <afd@ti.com>
  André Draszik <andre.draszik@linaro.org>
  Andy Yan <andyshrk@163.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anton Bambura <jenneron@postmarketos.org>
  Aren Moynihan <aren@peacevolution.org>
  Arnd Bergmann <arnd@arndb.de>
  Arthur Demchenkov <spinal.by@gmail.com>
  Artur Weber <aweber.kernel@gmail.com>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Balint Dobszay <balint.dobszay@arm.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bhavya Kapoor <b-kapoor@ti.com>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Brandon Brnich <b-brnich@ti.com>
  Caleb Connolly <caleb.connolly@linaro.org>
  Carlos Song <carlos.song@nxp.com>
  Catalin Udma <catalin-dan.udma@nxp.com>
  Chen Wang <unicorn_wang@outlook.com>
  Chris Morgan <macromorgan@hotmail.com>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christopher Obbard <chris.obbard@collabora.com>
  Chukun Pan <amadeus@jmu.edu.cn>
  Chun-Kuang Hu <chunkuang.hu@kernel.org>
  Ciprian Costea <ciprianmarian.costea@nxp.com>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Connor Abbott <cwabbott0@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Danzberger <dd@embedd.com>
  Danila Tikhonov <danila@jiaxyga.com>
  Dario Binacchi <dario.binacchi@amarulasolutions.com>
  Dasnavis Sabiya <sabiya.d@ti.com>
  Dave Stevenson <dave.stevenson@raspberrypi.com>
  David Heidelberg <david@ixit.cz>
  David Hildenbrand <david@redhat.com>
  David Jander <david@protonic.nl>
  Denis Burkov <hitechshell@mail.ru>
  Diederik de Haas <didi.debian@cknow.org>
  Dinh Nguyen <dinguyen@kernel.org>
  Diogo Ivo <diogo.ivo@siemens.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Yashin <dmt.yashin@gmail.com>
  Dong Aisheng <aisheng.dong@nxp.com>
  Douglas Anderson <dianders@chromium.org>
  Dragan Simic <dsimic@manjaro.org>
  Duy Nguyen <duy.nguyen.rh@renesas.com>
  Elliot Berman <quic_eberman@quicinc.com>
  Elliot Berman <quic_eberman@quicinc.com> # sm8650-qrd
  Erico Nunes <nunes.erico@gmail.com>
  Fabio Estevam <festevam@denx.de>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Folker Schwesinger <dev@folker-schwesinger.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Li <Frank.Li@nxp.com>
  Frank Oltmanns <frank@oltmanns.dev>
  Gabor Juhos <j4g8y7@gmail.com>
  Gabriel Fernandez <gabriel.fernandez@foss.st.com>
  Garrett Giordano <ggiordano@phytec.com>
  Gatien Chevallier <gatien.chevallier@foss.st.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
  Gilles Talis <gilles.talis@gmail.com>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guo Ren <guoren@kernel.org>
  Haibo Chen <haibo.chen@nxp.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko.stuebner@cherry.de>
  Heiko Stuebner <heiko@sntech.de>
  Hiago De Franco <hiago.franco@toradex.com>
  Holger Dengler <dengler@linux.ibm.com>
  Hugues Fruchet <hugues.fruchet@foss.st.com>
  Hui Liu <quic_huliu@quicinc.com>
  Huisong Li <lihuisong@huawei.com>
  Ian Ray <ian.ray@gehealthcare.com>
  Icenowy Zheng <uwu@icenowy.me>
  Inochi Amaoto <inochiama@outlook.com>
  Ivan T. Ivanov <iivanov@suse.de>
  Jacopo Mondi <jacopo@jmondi.org>
  Jai Luthra <j-luthra@ti.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jason J. Herne <jjherne@linux.ibm.com>
  Jason-ch Chen <Jason-ch.Chen@mediatek.com>
  Jason-JH.Lin <jason-jh.lin@mediatek.com>
  Jean Delvare <jdelvare@suse.de>
  Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jianfeng Liu <liujianfeng1994@gmail.com>
  Jianhua Lu <lujianhua000@gmail.com>
  Jimmy Hon <honyuenkwun@gmail.com>
  Jing Luo <jing@jing.rocks>
  Jisheng Zhang <jszhang@kernel.org>
  Joe Mason <buddyjojo06@outlook.com>
  Johan Hovold <johan+linaro@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josua Mayer <josua@solid-run.com>
  Joy Zou <joy.zou@nxp.com>
  Judith Mendez <jm@ti.com>
  Jun Nie <jun.nie@linaro.org>
  Justin Stitt <justinstitt@google.com>
  Kathiravan Thirumoorthy <quic_kathirav@quicinc.com> # IPQ9574 and IPQ5332
  Komal Bajaj <quic_kbajaj@quicinc.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Konrad Dybcio <konradybcio@kernel.org>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Li Zhijian <lizhijian@fujitsu.com>
  Ling Xu <quic_lxu5@quicinc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Loic Poulain <loic.poulain@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Luca Weiss <luca@z3ntu.xyz>
  Lucas Stach <l.stach@pengutronix.de>
  Luke Wang <ziniu.wang_1@nxp.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marek Vasut <marex@denx.de>
  Markus Schneider-Pargmann <msp@baylibre.com>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maulik Shah <quic_mkshah@quicinc.com>
  Max Krummenacher <max.krummenacher@toradex.com>
  Maxime Ripard <mripard@kernel.org>
  Maximilian Luz <luzmaximilian@gmail.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael Riesch <michael.riesch@wolfvision.net>
  Michael Walle <mwalle@kernel.org>
  Miles Alan <m@milesalan.com>
  Mirela Rabulea <mirela.rabulea@nxp.com>
  Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
  Muhammed Efe Cetin <efectn@protonmail.com>
  Mukesh Ojha <quic_mojha@quicinc.com>
  Nathan Morrisson <nmorrisson@phytec.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicolas Chauvet <kwizart@gmail.com>
  Niklas Cassel <cassel@kernel.org>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nina Schoetterl-Glausch <nsg@linux.ibm.com>
  Nishanth Menon <nm@ti.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
  Ondrej Jirman <megi@xff.cz>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pankaj Gupta <pankaj.gupta@nxp.com>
  Parthiban Nallathambi <parthiban@linumiz.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Patrick Delaunay <patrick.delaunay@foss.st.com>
  Paweł Owoc <frut3k7@gmail.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Griffin <peter.griffin@linaro.org>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Poovendhan Selvaraj <quic_poovendh@quicinc.com>
  Rafał Miłecki <rafal@milecki.pl>
  Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
  Raymond Hackley <raymondhackley@protonmail.com>
  Richard Acayan <mailingradian@gmail.com>
  Ritesh Kumar <quic_riteshk@quicinc.com>
  Rob Herring (Arm) <robh@kernel.org>
  Rob Herring <robh@kernel.org>
  Robert Nelson <robertcnelson@gmail.com>
  Roger Quadros <rogerq@kernel.org>
  Rong Zhang <i@rong.moe>
  Ryan Walklin <ryan@testtoast.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sebastian Raase <linux@sraa.de>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sebastian Reichel <sre@kernel.org>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Sicelo A. Mhlongo <absicsz@gmail.com>
  Siddharth Manthan <siddharth.manthan@gmail.com>
  Stanislav Jakubek <stano.jakubek@gmail.com>
  Steen Hegelund <Steen.Hegelund@microchip.com>
  Stefan Eichenberger <stefan.eichenberger@toradex.com>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stefan Wahren <wahrenst@gmx.net>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sukrut Bellary <sukrut.bellary@linux.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sumit Garg <sumit.garg@linaro.org>
  Sven Schnelle <svens@linux.ibm.com>
  Thanh Le <thanh.le.xv@renesas.com>
  Thanh Quan <thanh.quan.xn@renesas.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Tim Harvey <tharvey@gateworks.com>
  Tom Brautaset <tbrautaset@gmail.com>
  Tommaso Merciai <tomm.merciai@gmail.com>
  Tony Lindgren <tony@atomide.com>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Udipto Goswami <quic_ugoswami@quicinc.com>
  Udit Kumar <u-kumar1@ti.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Umang Chheda <quic_uchheda@quicinc.com>
  Umang Jain <umang.jain@ideasonboard.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Uwe Kleine-König <uwe@kleine-koenig.org>
  Varun Sethi <v.sethi@nxp.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vineeth Vijayan <vneethv@linux.ibm.com>
  Vitor Soares <vitor.soares@toradex.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>
  Wadim Mueller <wafgo01@gmail.com>
  wangkaiyuan <wangkaiyuan@inspur.com>
  Wei Fang <wei.fang@nxp.com>
  Wei Xu <xuwei5@hisilicon.com>
  Xilin Wu <wuxilin123@gmail.com> # on QCS8550 AYN Odin 2
  Xu Yang <xu.yang_2@nxp.com>
  Yang Xiwen <forbidden405@outlook.com>
  Yangyu Chen <cyy@cyyself.name>
  Yannick Fertre <yannick.fertre@foss.st.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zev Weiss <zev@bewilderbeest.net>

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
 test-armhf-armhf-xl                                          fail    
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
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-armhf-armhf-libvirt-vhd                                 fail    
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
   a38297e3fb01..6d1346f1bcbf  6d1346f1bcbf2724dee8af013cdab9f7b581435b -> tested/linux-linus

