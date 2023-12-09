Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC880B505
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 16:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651049.1016781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBz8W-0006pt-EJ; Sat, 09 Dec 2023 15:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651049.1016781; Sat, 09 Dec 2023 15:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBz8W-0006oK-Aa; Sat, 09 Dec 2023 15:21:00 +0000
Received: by outflank-mailman (input) for mailman id 651049;
 Sat, 09 Dec 2023 15:20:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBz8U-0006oA-UU; Sat, 09 Dec 2023 15:20:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBz8U-0003RF-O4; Sat, 09 Dec 2023 15:20:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBz8U-0006iE-7P; Sat, 09 Dec 2023 15:20:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBz8U-0007sL-4O; Sat, 09 Dec 2023 15:20:58 +0000
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
	bh=QSPeG3bjGHlhoKmIsQaZvCGi9VW5HmkxmSS0Kmty2Ww=; b=CB8yAq3XTCtiVTE8yTIZpzQKph
	zFKfTqdOY7DwErO6LRRoprxv8yy0q9syxwU4m1gU2GMZKvWK9+4Fcbr+9cMTG3fKv1yYDGxtwYZbz
	qlb1WUBP3RvNk0IAq57KNSqdUClfLxl92MTyASsovqKUrRdcFw3InXVe7UA4xFp+VKxg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184047-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184047: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-i386-pvops:kernel-build:fail:regression
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
X-Osstest-Versions-That:
    linux=815fb87b753055df2d9e50f6cd80eb10235fe3e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Dec 2023 15:20:58 +0000

flight 184047 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184047/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-pvops              6 kernel-build             fail REGR. vs. 183973

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183973
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183973
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183973
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183973
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183973
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183973
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183973
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183973
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
baseline version:
 linux                815fb87b753055df2d9e50f6cd80eb10235fe3e9

Last test of basis   183973  2023-12-02 07:48:26 Z    7 days
Failing since        183977  2023-12-03 00:12:06 Z    6 days   13 attempts
Testing same since   184047  2023-12-09 05:50:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Luke D. Jones" <luke@ljones.dev>
  "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
  <urbinek@gmail.com>
  Adam Ford <aford173@gmail.com>
  Adrián Larumbe <adrian.larumbe@collabora.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
  Alex Bee <knaerzche@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexis Belmonte <alexbelm48@gmail.com>
  Alvin Lee <alvin.lee2@amd.com>
  Alyssa Ross <hi@alyssa.is>
  Andrew Jones <ajones@ventanamicro.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Antoniu Miclaus <antoniu.miclaus@analog.com>
  Antti Palosaari <crope@iki.fi>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Baoquan He <bhe@redhat.com>
  Bin Li <bin.li@canonical.com>
  Bitao Hu <yaoma@linux.alibaba.com>
  Björn Töpel <bjorn@rivosinc.com>
  Brett Creeley <brett.creeley@amd.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chancel Liu <chancel.liu@nxp.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Charlie Jenkins <charlie@rivosinc.com>
  Chen Wang <unicorn_wang@outlook.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Chester Lin <clin@suse.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  ChunHao Lin <hau@realtek.com>
  Clément Léger <cleger@rivosinc.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  D. Wythe <alibuda@linux.alibaba.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniel Xu <dxu@dxuuu.xyz>
  Daniil Maximov <daniil31415it@gmail.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Jeffery <djeffery@redhat.com>
  David Lin <CTLIN0@nuvoton.com>
  David Rau <David.Rau.opensource@dm.renesas.com>
  David S. Miller <davem@davemloft.net>
  David Thompson <davthompson@nvidia.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Safonov <dima@arista.com>
  Douglas Anderson <dianders@chromium.org>
  Erhard Furtner <erhard_f@mailbox.org>
  Eric DeVolder <eric_devolder@yahoo.com>
  Eric Dumazet <edumazet@google.com>
  Eric Woudstra <ericwouds@gmail.com>
  Eugen Hristev <eugen.hristev@collabora.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fabio Estevam <festevam@denx.de>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Wunderlich <frank-w@public-files.de>
  Geetha sowjanya <gakula@marvell.com>
  Geethasowjanya Akula <gakula@marvell.com>
  Georg Gottleuber <ggo@tuxedocomputers.com>
  Grant Grundler <grundler@chromium.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grzegorz Prajsner <grzegorz.prajsner@ionos.com>
  Guangwu Zhang <guazhang@redhat.com>
  Guenter Roeck <linux@roeck-us.net>
  Haibo Chen <haibo.chen@nxp.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Hayes Wang <hayeswang@realtek.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko.stuebner@cherry.de>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  heminhong <heminhong@kylinos.cn>
  Hsin-Yi Wang <hsinyi@chromium.org>
  Hugh Dickins <hughd@google.com>
  Hui Zhou <hui.zhou@corigine.com>
  Ido Schimmel <idosch@nvidia.com>
  Ignat Korchagin <ignat@cloudflare.com>       [compile-time only]
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Inki Dae <inki.dae@samsung.com>
  Ivan Lipski <ivlipski@amd.com>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Ivan Vecera <ivecera@redhat.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jason Zhang <jason.zhang@rock-chips.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jeremy Soller <jeremy@system76.com>
  Jerome Forissier <jerome.forissier@linaro.org>
  Jiadong Zhu <Jiadong.Zhu@amd.com>
  Jianheng Zhang <Jianheng.Zhang@synopsys.com>
  Jiexun Wang <wangjiexun@tinylab.org>
  Jijie Shao <shaojijie@huawei.com>
  Jiri Olsa <jolsa@kernel.org>
  Joao Martins <joao.m.martins@oracle.com>
  Johan Hovold <johan+linaro@kernel.org>
  John Fastabend <john.fastabend@gmail.com>
  Jonas Karlman <jonas@kwiboo.se>
  JP Kobryn <inwardvessel@gmail.com>
  Juergen Gross <jgross@suse.com>
  Junxian Huang <huangjunxian6@hisilicon.com>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Kamil Duljas <kamil.duljas@gmail.com>
  Keith Busch <kbusch@kernel.org>
  Kelly Kane <kelly@hawknetworks.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Laurence Oberman <loberman@redhat.com>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leon@kernel.org>
  Li Ma <li.ma@amd.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Shixin <liushixin2@huawei.com>
  Liu Ying <victor.liu@nxp.com>
  Lizhi Xu <lizhi.xu@windriver.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lorenzo Pieralisi <lpieralisi@kernel.org>
  Louis Peens <louis.peens@corigine.com>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Lukasz Luba <lukasz.luba@arm.com>
  Luke D. Jones <luke@ljones.dev>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maciej Strozek <mstrozek@opensource.cirrus.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Malcolm Hart <malcolm@5harts.com>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Marian Postevca <posteuca@mutex.one>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Hasemeyer <markhas@chromium.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthias Reichl <hias@horus.com>
  Matus Malych <matus@malych.org>
  Md Haris Iqbal <haris.iqbal@ionos.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <mwalle@kernel.org>
  Michal Smulski <michal.smulski@ooma.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Ming Lei <ming.lei@redhat.com>
  Mustafa Ismail <mustafa.ismail@intel.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Rossi <nathan.rossi@digi.com>
  Naveen Mamindlapalli <naveenm@marvell.com>
  Neal Cardwell <ncardwell@google.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nico Pache <npache@redhat.com>
  Nitesh Shetty <nj.shetty@samsung.com>
  Nithin Dabilpuram <ndabilpuram@marvell.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Oleg Nesterov <oleg@redhat.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Pascal Noël <pascal@pascalcompiles.com>
  Paulo Alcantara (SUSE) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Xu <peterx@redhat.com>
  Petr Pavlu <petr.pavlu@suse.com>
  Phil Sutter <phil@nwl.cc>
  Philip Mueller <philm@manjaro.org>
  Philipp Zabel <p.zabel@pengutronix.de>
  Phillip Susi <phill@thesusis.net>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Rahul Bhansali <rbhansali@marvell.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Rodrigo Siqueira <rodrigo.siqueira@amd.com>
  Roland Hieber <rhi@pengutronix.de>
  Roman Gushchin (Cruise) <roman.gushchin@linux.dev>
  Roman Gushchin <roman.gushchin@linux.dev>
  Roman Li <Roman.Li@amd.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sam Edwards <CFSworks@gmail.com>
  Samuel Holland <samuel.holland@sifive.com>
  Santosh Kumar Pradhan <santosh.pradhan@ionos.com>
  Sarah Grant <s@srd.tw>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sean Christopherson <seanjc@google.com>
  Sean Nyekjaer <sean@geanix.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  SeongJae Park <sj@kernel.org>
  Shakeel Butt <shakeelb@google.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shawn Guo <shawn.guo@linaro.org>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shifeng Li <lishifeng1992@126.com>
  Shifeng Li <lishifeng@sangfor.com.cn>
  Shigeru Yoshida <syoshida@redhat.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuming Fan <shumingf@realtek.com>
  Sidhartha Kumar <sidhartha.kumar@oracle.com>
  Simon Horman <horms@kernel.org> # build-tested
  Song Liu <song@kernel.org>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stefan Eichenberger <stefan.eichenberger@toradex.com>
  Stefan Kerkmann <s.kerkmann@pengutronix.de>
  Stefan Wahren <wahrenst@gmx.net>
  Stefano Garzarella <sgarzare@redhat.com>
  Steve French <stfrench@microsoft.com>
  Steve Sistare <steven.sistare@oracle.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Su Hui <suhui@nfschina.com>
  Subbaraya Sundeep <sbhatta@marvell.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Suman Ghosh <sumang@marvell.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sumit Garg <sumit.garg@linaro.org>
  Sunil Goutham <sgoutham@marvell.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tejun Heo <tj@kernel.org>
  Thinh Tran <thinhtr@linux.vnet.ibm.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Reichinger <thomas.reichinger@sohard.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Bosse <flinn@timbos.se>
  Tim Crawford <tcrawford@system76.com>
  Tim Van Patten <timvp@google.com>
  Timothy Pearson <tpearson@raptorengineering.com>
  Timur Tabi <ttabi@nvidia.com>
  Tobias Waldekranz <tobias@waldekranz.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Venkata Sai Duggi <venkata.sai.duggi@ibm.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wen Gu <guwen@linux.alibaba.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Woody Suwalski <terraluna977@gmail.com>
  wuqiang.matt <wuqiang.matt@bytedance.com>
  Xiang Yang <xiangyang3@huawei.com>
  Xiao Ni <xni@redhat.com>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Yang Wang <kevinyang.wang@amd.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yewon Choi <woni9911@gmail.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yonglong Liu <liuyonglong@huawei.com>
  Yu Kuai <yukuai3@huawei.com>
  Zhipeng Lu <alexious@zju.edu.cn>

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
 build-i386-pvops                                             fail    
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


Not pushing.

(No revision log; it would be 9989 lines long.)

