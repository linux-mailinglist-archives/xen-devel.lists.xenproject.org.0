Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33044832ECB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 19:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669122.1041762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQtVB-0001bO-0B; Fri, 19 Jan 2024 18:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669122.1041762; Fri, 19 Jan 2024 18:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQtVA-0001ZM-QZ; Fri, 19 Jan 2024 18:22:00 +0000
Received: by outflank-mailman (input) for mailman id 669122;
 Fri, 19 Jan 2024 18:21:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQtV9-0001ZC-NL; Fri, 19 Jan 2024 18:21:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQtV9-0000kk-EA; Fri, 19 Jan 2024 18:21:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQtV9-00046D-0A; Fri, 19 Jan 2024 18:21:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rQtV8-0006f5-Vs; Fri, 19 Jan 2024 18:21:58 +0000
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
	bh=kzJjbRcN8Ra8lYvidli7ynm5sQ3U8QEhga4MPsQTu3A=; b=WiQhw5qX1juit8F3RZglcap/UH
	DwLMfY28osb+SYzBCplhM+TRE3qnvm4Ak5K69ymXCwKagn7g8gwA9cKw6rr0Zi8OErlKPgoNRLXJ6
	UpHkmDGta//oruVHnrcZAOYHhj04aoSdw39vmYHKAbInf8UfMmxodc9/VZvreDV+5630=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184402-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184402: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
X-Osstest-Versions-That:
    linux=b0d326da462e20285236e11e4cbc32085de9f363
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Jan 2024 18:21:58 +0000

flight 184402 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184402/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184396
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184396
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184396
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184396
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184396
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184396
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184396
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184396
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
baseline version:
 linux                b0d326da462e20285236e11e4cbc32085de9f363

Last test of basis   184396  2024-01-18 20:42:11 Z    0 days
Testing same since   184402  2024-01-19 05:57:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@linaro.org>
  Akinobu Mita <akinobu.mita@gmail.com>
  Alain Volmat <alain.volmat@foss.st.com>
  Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
  Alex Bee <knaerzche@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexei Starovoitov <ast@kernel.org>
  Alison Schofield <alison.schofield@intel.com>
  Amit Cohen <amcohen@nvidia.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andreas Kemnade <andreas@kemnade.info>
  Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Yan <andy.yan@rock-chips.com>
  Anshul Dalal <anshulusr@gmail.com>
  Antoniu Miclaus <antoniu.miclaus@analog.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Ashish Mhetre <amhetre@nvidia.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bart Van Assche <bvanassche@acm.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benjamin Poirier <benjamin.poirier@gmail.com>
  Benjamin Poirier <bpoirier@nvidia.com>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Breno Leitao <leitao@debian.org>
  Brett Creeley <brett.creeley@amd.com>
  Can Guo <quic_cang@quicinc.com>
  Changyuan Lyu <changyuanl@google.com>
  Chintan Vankar <c-vankar@ti.com>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christian Heusel <christian@heusel.eu>
  Christian Loehle <christian.loehle@arm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wagner <dwagner@suse.de>
  Danny Lin <danny@kdrag0n.dev>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Jiang <dave.jiang@intel.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Stevens <stevensd@chromium.org>
  Davidlohr Bueso <dave@stgolabs.net>
  Dennis Zhou <dennis@kernel.org>
  Derek Chickles <dchickles@marvell.com>
  Dhruva Gole <d-gole@ti.com>
  Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Safonov <dima@arista.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmytro Maluka <dmaluka@chromium.org>
  Dragos Tatulea <dtatulea@nvidia.com>
  Eric Dumazet <edumazet@google.com>
  Erick Archer <erick.archer@gmx.com>
  Esteban Blanc <eblanc@baylibre.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Feng Liu <feliu@nvidia.com>
  Flavio Suligoi <f.suligoi@asem.it>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guixin Liu <kanie@linux.alibaba.com>
  Halil Pasic <pasic@linux.ibm.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Hu <hanshu-oc@zhaoxin.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hao Sun <sunhao.th@gmail.com>
  Harry Wentland <harry.wentland@amd.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Hector Martin <marcan@marcan.st>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Hermes Zhang <chenhuiz@axis.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Huang Ying <ying.huang@intel.com>
  Huang, Ying <ying.huang@intel.com>
  Ido Schimmel <idosch@nvidia.com>
  Ira Weiny <ira.weiny@intel.com>
  Isaac J. Manjarres <isaacmanjarres@google.com>
  Jacky Huang <ychuang3@nuvoton.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jean Delvare <jdelvare@suse.de>
  Jeff LaBundy <jeff@labundy.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jim Cromie <jim.cromie@gmail.com> # for SCX
  Jim Harris <jim.harris@samsung.com>
  Jim.Lin <jim.chihjung.lin@gmail.com>
  Jim.Lin <jim.lin@siliconmotion.com>
  Jiri Pirko <jiri@nvidia.com>
  Jiri Valek - 2N <jiriv@axis.com>
  Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
  Jochen Friedrich <jochen@scram.de>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  John Crispin <john@phrozen.org>
  John Fastabend <john.fastabend@gmail.com>
  John Moon <quic_johmoo@quicinc.com>
  Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
  Julian Anastasov <ja@ssi.bg>
  Kai Huang <kai.huang@intel.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Laurentiu Tudor <laurentiu.tudor@nxp.com>
  Lee Jones <lee@kernel.org>
  Leonardo Bras <leobras@redhat.com>
  Li RongQing <lirongqing@baidu.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Longfang Liu <liulongfang@huawei.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luca Weiss <luca@z3ntu.xyz>
  Ludvig Pärsson <ludvig.parsson@axis.com>
  Lukas Wunner <lukas@wunner.de>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcin Wojtas <marcin.s.wojtas@gmail.com>
  Marcus Folkesson <marcus.folkesson@gmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Markus Schneider-Pargmann <msp@baylibre.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maurizio Lombardi <mlombard@redhat.com>
  Max Gurtovoy <mgurtovoy@nvidia.com>
  Mete Durlu <meted@linux.ibm.com>
  Mia Lin <mimi05633@gmail.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <mwalle@kernel.org>
  Michal Simek <michal.simek@amd.com>
  Mickaël Salaün <mic@digikod.net>
  Mike Christie <michael.christie@oracle.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Naveen Mamindlapalli <naveenm@marvell.com>
  Naveen N Rao <naveen@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
  Nicky Chorley <ndchorley@gmail.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nicolin Chen <nicolinc@nvidia.com>
  Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nithin Dabilpuram <ndabilpuram@marvell.com>
  Oliver Graute <oliver.graute@kococonnector.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Pasha Tatashin <pasha.tatashin@soleen.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pavel Begunkov <asml.silence@gmail.com>
  Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
  Petr Machata <petrm@nvidia.com>
  Petr Vorel <petr.vorel@gmail.com>
  Petr Vorel <pvorel@suse.cz>
  Philipp Zabel <p.zabel@pengutronix.de>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qiang Ma <maqianga@uniontech.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rajendra Nayak <quic_rjendra@quicinc.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Rohit Agarwal <quic_rohiagar@quicinc.com>
  Roland Hieber <rhi@pengutronix.de>
  Romain Gantois <romain.gantois@bootlin.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sam Ravnborg <sam@ravnborg.org>
  Sanjuán García, Jorge <Jorge.SanjuanGarcia@duagon.com>
  Sean Young <sean@mess.org>
  Sergey Senozhatsky <senozhatsky@chromium.org>
  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shiyang Ruan <ruansy.fnst@fujitsu.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sibi Sankar <quic_sibis@quicinc.com>
  Simon Horman <horms@kernel.org>
  Smita-Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
  Sneh Shah <quic_snehshah@quicinc.com>
  Song Liu <song@kernel.org>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stefan Eichenberger <eichest@gmail.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Su Hui <suhui@nfschina.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Sven Peter <sven@svenpeter.dev>
  Taehee Yoo <ap420073@gmail.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  Thomas Richard <thomas.richard@bootlin.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Winkler <twinkler@linux.ibm.com>
  Tim Lunn <tim@feathertop.org>
  Tina Zhang <tina.zhang@intel.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tzvetomir Stoyanov (VMware) <tz.stoyanov@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Caron <valentin.caron@foss.st.com>
  Vasant Hegde <vasant.hegde@amd.com>
  Victor Nogueira <victor@mojatatu.com>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Lypak <vladimir.lypak@gmail.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Jinchao <wangjinchao@xfusion.com>
  Wenjia Zhang <wenjia@linux.ibm.com>
  Wenkai Lin <linwenkai6@hisilicon.com>
  Will Deacon <will@kernel.org>
  William Butler <wab@google.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>
  ye xingchen <ye.xingchen@zte.com.cn>
  Yi Liu <yi.l.liu@intel.com>
  Yishai Hadas <yishaih@nvidia.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yu Kuai <yukuai3@huawei.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zhangfei Gao <zhangfei.gao@linaro.org>
  ZhangPeng <zhangpeng362@huawei.com>
  Zhao Mengmeng <zhaomengmeng@kylinos.cn>
  Zhu Yanjun <yanjun.zhu@linux.dev>
  Íñigo Huguet <ihuguet@redhat.com>

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
   b0d326da462e..9d1694dc91ce  9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847 -> tested/linux-linus

