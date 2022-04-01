Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BA4EE772
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 06:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297216.506255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na9Hp-0005DG-Ol; Fri, 01 Apr 2022 04:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297216.506255; Fri, 01 Apr 2022 04:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na9Hp-0005BP-Hd; Fri, 01 Apr 2022 04:53:25 +0000
Received: by outflank-mailman (input) for mailman id 297216;
 Fri, 01 Apr 2022 04:53:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1na9Hn-0005BF-KX; Fri, 01 Apr 2022 04:53:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1na9Hn-0004Ox-Dn; Fri, 01 Apr 2022 04:53:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1na9Hn-0002VL-5R; Fri, 01 Apr 2022 04:53:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1na9Hn-0005aY-4x; Fri, 01 Apr 2022 04:53:23 +0000
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
	bh=j8KEnp8i73HAAr6ZrzOTE+X86dU4F1o11VSSZ4Bs9ZE=; b=ZR0F+tDZaEJMsr81G3J6+sfGmI
	fnFPl+zvkxvZlzn+aeOGu8xyTXmjILta96Idizinkj9VSlEB7PHYa9LQ+I+eQKJu4goZkr6tJ6khD
	Og6WpfzQMxwFMC9NEpRW2VY4ELIX4LZRnx/eOvSb5hKN3FY6GZEaoSbZBpSqqgjTMfos=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169055-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 169055: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-libvirt-xsm:debian-fixup:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=787af64d05cd528aac9ad16752d11bb1c6061bb9
X-Osstest-Versions-That:
    linux=13776ebb9964b2ea66ffb8c824c0762eed6da784
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Apr 2022 04:53:23 +0000

flight 169055 linux-linus real [real]
flight 169095 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169055/
http://logs.test-lab.xenproject.org/osstest/logs/169095/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-xsm       8 xen-boot            fail pass in 169095-retest
 test-arm64-arm64-libvirt-xsm 13 debian-fixup        fail pass in 169095-retest

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 169095 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 169095 never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 169095 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 169095 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168997
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168997
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168997
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168997
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168997
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168997
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168997
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168997
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                787af64d05cd528aac9ad16752d11bb1c6061bb9
baseline version:
 linux                13776ebb9964b2ea66ffb8c824c0762eed6da784

Last test of basis   168997  2022-03-29 20:43:57 Z    2 days
Testing same since   169055  2022-03-31 02:32:32 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@nxp.com>
  Adam Wujek <dev_public@wujek.eu>
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Alain Volmat <alain.volmat@foss.st.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Alistair Delva <adelva@google.com>
  Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
  Amelie Delaunay <amelie.delaunay@foss.st.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
  Bartosz Dudziak <bartosz.dudziak@snejp.pl>
  Benjamin Coddington <bcodding@redhat.com>
  Bhupesh Sharma <bhupesh.sharma@linaro.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Cai Huoqing <cai.huoqing@linux.dev>
  Caleb Connolly <caleb@connolly.tech>
  Chen-Yu Tsai <wenst@chromium.org>
  ChiYuan Huang <cy_huang@richtek.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Clemens Gruber <clemens.gruber@pqgruber.com>
  Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daire McNamara <daire.mcnamara@microchip.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Latypov <dlatypov@google.com>
  Daniel Mack <daniel@zonque.org>
  Dave Gerlach <d-gerlach@ti.com>
  Dave Jiang <dave.jiang@intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  Dave Wysochanski <dwysocha@redhat.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dirk Buchwalder <buchwalder@posteo.de>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Osipenko <dmitry.osipenko@collabora.com> # T30 Nexus7
  Drew Fustini <dfustini@baylibre.com>
  Emil Renner Berthing <kernel@esmil.dk>
  Florian Fainelli <f.fainelli@gmail.com>
  Gabriel Fernandez <gabriel.fernandez@foss.st.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Giulio Benetti <giulio.benetti@benettiengineering.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Haimin Zhang <tcs_kernel@tencent.com>
  Hector Martin <marcan@marcan.st>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Jacky Bai <ping.bai@nxp.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jami Kettunen <jami.kettunen@somainline.org>
  Jamie Iles <quic_jiles@quicinc.com>
  Jeff LaBundy <jeff@labundy.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jesse Taube <Mr.Bossman075@gmail.com>
  Jie Hai <haijie1@huawei.com>
  Johann Neuhauser <jneuhauser@dh-electronics.com>
  John David Anglin <dave.anglin@bell.net>
  Jonathan McDowell <noodles@earth.li>
  Jonathan Neuschäfer <j.neuschaefer@gmx.net>
  José Expósito <jose.exposito89@gmail.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kajol Jain <kjain@linux.ibm.com>
  Konrad Dybcio <konrad.dybcio@somainline.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee.jones@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lionel Vitte <lionel.vitte@free.fr>
  Lionel Vitte <lionel.vitte@gmail.com>
  Loic Poulain <loic.poulain@linaro.org>
  Luca Weiss <luca@z3ntu.xyz>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
  Marek Vasut <marex@denx.de>
  Marijn Suijten <marijn.suijten@somainline.org>
  Mark Brown <broonie@kernel.org>
  Martin Botka <martin.botka@somainline.org>
  Martin Povišer <povik+lin@cutebit.org>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maxime Ripard <maxime@cerno.tech>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Tretter <m.tretter@pengutronix.de>
  Michal Simek <michal.simek@xilinx.com>
  Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
  Nageswara R Sastry <rnsastry@linux.ibm.com>
  Neil Armstrong <narmstrong@baylibre.com>
  NeilBrown <neilb@suse.de>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  Olga Kornievskaia <kolga@netapp.com>
  Olivier Dautricourt <olivier.dautricourt@orolia.com>
  Padmarao Begari <padmarao.begari@microchip.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul Cercueil <paul@crapouillou.net>
  Pavel Skripkin <paskripkin@gmail.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Vorel <petr.vorel@gmail.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Pratyush Yadav <p.yadav@ti.com>
  Puranjay Mohan <p-mohan@ti.com>
  Qing Wang <wangqing@vivo.com>
  Quentin Schulz <quentin.schulz@theobroma-systems.com>
  Rakesh Pillai <pillair@codeaurora.org>
  Rob Herring <robh@kernel.org>
  Robert Marko <robimarko@gmail.com>
  Rohit Agarwal <quic_rohiagar@quicinc.com>
  Sanjay R Mehta <sanju.mehta@amd.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Sinthu Raja <sinthu.raja@ti.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Suman Anna <s-anna@ti.com>
  Sven Peter <sven@svenpeter.dev>
  Taniya Das <tdas@codeaurora.org>
  Thierry Reding <thierry.reding@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Tim Blechmann <tim@klingt.org>
  Tom Rix <trix@redhat.com>
  Tomasz Moń <tomasz.mon@camlingroup.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Ulrich Hecht <uli+renesas@fpond.eu>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
  Vinod Koul <vkoul@kernel.org>
  Wang Qing <wangqing@vivo.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xin Xiong <xiongx18@fudan.edu.cn>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Yang Li <yang.lee@linux.alibaba.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  zhaoxiao <zhaoxiao@uniontech.com>
  Zhou Wang <wangzhou1@hisilicon.com>
  Zi Yan <ziy@nvidia.com>
  Zixun LI <admin@hifiphile.com>
  Zong Li <zong.li@sifive.com>

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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
   13776ebb9964..787af64d05cd  787af64d05cd528aac9ad16752d11bb1c6061bb9 -> tested/linux-linus

