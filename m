Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F71987961
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 20:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805852.1217089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sttWR-0007Wa-B4; Thu, 26 Sep 2024 18:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805852.1217089; Thu, 26 Sep 2024 18:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sttWR-0007UX-87; Thu, 26 Sep 2024 18:47:27 +0000
Received: by outflank-mailman (input) for mailman id 805852;
 Thu, 26 Sep 2024 18:47:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sttWQ-0007UN-Ja; Thu, 26 Sep 2024 18:47:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sttWQ-000588-68; Thu, 26 Sep 2024 18:47:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sttWP-0004Sy-I1; Thu, 26 Sep 2024 18:47:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sttWP-00014T-HR; Thu, 26 Sep 2024 18:47:25 +0000
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
	bh=TTZb6VwwpW+zOwtnliGB8cOfr9fhvgtGShLmRrVfbPA=; b=31gfcNDpZBfQI/D5qwZ/Jr2+gI
	CtDP1efKqtmcyZ8laaPoKl57qI/lNTczmpVrxg9YSh6KYyxE/hYfRPyYntmwZfeuSwHAkg80Zgy6v
	rs/sFoPsGmlo3AQ7naFcK8HSwbzZqFm646G0Tjvifx5OTqZsPTl7mVBwyVDwwNk6TfkQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187860-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187860: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=11a299a7933e03c83818b431e6a1c53ad387423d
X-Osstest-Versions-That:
    linux=abf2050f51fdca0fd146388f83cddd95a57a008d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Sep 2024 18:47:25 +0000

flight 187860 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187860/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187848
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187848
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187848
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187848
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187848
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187848
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                11a299a7933e03c83818b431e6a1c53ad387423d
baseline version:
 linux                abf2050f51fdca0fd146388f83cddd95a57a008d

Last test of basis   187848  2024-09-24 16:43:02 Z    2 days
Testing same since   187860  2024-09-26 03:58:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhishek Tamboli <abhishektamboli9@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Mantel <alexmantel93@mailbox.org>
  Alex Shi <alexs@kernel.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Dahl <ada@thorsis.com>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexei Pastuchov <alexei.pastuchov@ionos.com>
  Alice Ryhl <aliceryhl@google.com>
  Amelie Delaunay <amelie.delaunay@foss.st.com>
  Andrea Righi <andrea.righi@linux.dev>
  Andreas Hindborg <a.hindborg@samsung.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andreas Kemnade <andreas@kemnade.info> # Tolino Shine2HD
  Andreas Larsson <andreas@gaisler.com>
  Andrew Davis <afd@ti.com>
  Andrey Konovalov <andreyknvl@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Anna Schumaker <anna.schumaker@oracle.com>
  Anumula Murali Mohan Reddy <anumula@chelsio.com>
  Arnd Bergmann <arnd@arndb.de>
  Aurelien Aptel <aaptel@nvidia.com>
  Baoquan He <bhe@redhat.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Beleswar Padhi <b-padhi@ti.com>
  Benno Lossin <benno.lossin@proton.me>
  Billy Tsai <billy_tsai@aspeedtech.com>
  Binbin Zhou <zhoubinbin@loongson.cn>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Boqun Feng <boqun.feng@gmail.com>
  Cai Huoqing <caihuoqing@baidu.com>
  Carlos Song <carlos.song@nxp.com>
  Chandramohan Akula <chandramohan.akula@broadcom.com>
  Changbin Du <changbin.du@huawei.com>
  Chao Yu <chao@kernel.org>
  Charles Wang <charles.goodix@gmail.com>
  Charlie Jenkins <charlie@rivosinc.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wens@csie.org>
  Cheng Xu <chengyou@linux.alibaba.com>
  Chengchang Tang <tangchengchang@huawei.com>
  Chiara Meiohas <cmeiohas@nvidia.com>
  Chris Mi <cmi@nvidia.com>
  Christian Heusel <christian@heusel.eu>
  Christian Marangi <ansuelsmth@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Clark Wang <xiaoning.wang@nxp.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daeho Jeong <daehojeong@google.com>
  Daejun Park <daejun7.park@samsung.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Aloni <dan.aloni@vastdata.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Gomez <da.gomez@samsung.com>
  Daniel Yang <danielyangkang@gmail.com>
  Danilo Krummrich <dakr@kernel.org>
  Danny Tsen <dtsen@linux.ibm.com>
  David Hildenbrand <david@redhat.com>
  David Lechner <dlechner@baylibre.com>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dongliang Cui <dongliang.cui@unisoc.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  Fabio Estevam <festevam@denx.de>
  Fan Wu <wufan@linux.microsoft.com>
  Felix Moessbauer <felix.moessbauer@siemens.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Li <Frank.Li@nxp.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Gary Guo <gary@garyguo.net>
  Gatlin Newhouse <gatlin.newhouse@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Ungerer <gerg@linux-m68k.org>
  Grzegorz Prajsner <grzegorz.prajsner@ionos.com>
  Guenter Roeck <linux@roeck-us.net>
  Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Haibo Xu <haibo1.xu@intel.com>
  Hanjun Guo <guohanjun@huawei.com>
  Hannes Reinecke <hare@kernel.org>
  Hari Nagalla <hnagalla@ti.com>
  Henrik Rydberg <rydberg@bitmath.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hongbo Li <lihongbo22@huawei.com>
  Hongguang Gao <hongguang.gao@broadcom.com>
  Ingo Franzki <ifranzki@linux.ibm.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jacky Bai <ping.bai@nxp.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jaewook Kim <jw5454.kim@samsung.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jan Stancek <jstancek@redhat.com>
  Jann Horn <jannh@google.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Liu <jason.hui.liu@nxp.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jay Lee <jay_lee@pixart.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jesse Taube <jesse@rivosinc.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Jisheng Zhang <jszhang@kernel.org>
  Joanne Koong <joannelkoong@gmail.com>
  Joel Granados <j.granados@samsung.com>
  John B. Wyatt IV <jwyatt@redhat.com>
  John B. Wyatt IV <sageofredondo@gmail.com>
  Jon Xie <jon_xie@pixart.com>
  Jose Fernandez <jose.fernandez@linux.dev>
  Josef Bacik <josef@toxicpanda.com>
  Julian Sun <sunjunchao2870@gmail.com>
  Junxian Huang <huangjunxian6@hisilicon.com>
  Kaixin Wang <kxwang23@m.fudan.edu.cn>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Kanchan Joshi <joshi.k@samsung.com>
  Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
  Kartik Prajapati <kartikprajapati987@gmail.com>
  Kees Cook <kees@kernel.org>
  Keith Busch <kbusch@kernel.org>
  kernel test robot <oliver.sang@intel.com>
  Konstantin Ryabitsev <konstantin@linuxfoundation.org>
  Kris Van Hees <kris.van.hees@oracle.com>
  Krishnamoorthi M <krishnamoorthi.m@amd.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Leon Romanovsky <leon@kernel.org>
  Li Lingfeng <lilingfeng3@huawei.com>
  Liao Chen <liaochen4@huawei.com>
  Liao Yuanhong <liaoyuanhong@vivo.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  liuderong <liuderong@oppo.com>
  liujinbao1 <liujinbao1@xiaomi.com>
  Long Li <longli@microsoft.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@redhat.com>
  Maher Sanalla <msanalla@nvidia.com>
  Marco Elver <elver@google.com>
  Marge Yang <marge.yang@tw.synaptics.com>
  Mark Bloch <mbloch@nvidia.com>
  Mark Brown <broonie@kernel.org>
  Martyn Welch <martyn.welch@collabora.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matt Gilbride <mattgilbride@google.com>
  Matthew Maurer <mmaurer@google.com>
  Max Gurtovoy <mgurtovoy@nvidia.com>
  Mayuresh Chitale <mchitale@ventanamicro.com>
  Md Haris Iqbal <haris.iqbal@ionos.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Guralnik <michaelgur@nvidia.com>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael Margolin <mrgolin@amazon.com>
  Michael Vetter <jubalh@iodoru.org>
  Michael Walle <mwalle@kernel.org>
  Mickaël Salaün <mic@digikod.net>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Rapoport (Microsoft) <rppt@kernel.org>
  Mike Snitzer <snitzer@kernel.org>
  Mikhail Lobanov <m.lobanov@rosalinux.ru>
  Miklos Szeredi <mszeredi@redhat.com>
  Min-Hua Chen <minhuadotchen@gmail.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Naina Mehta <quic_nainmeht@quicinc.com>
  Nam Cao <namcao@linutronix.de>
  Namjae Jeon <linkinjeon@kernel.org>
  Narayana Murty N <nnmlinux@linux.ibm.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Gompa <neal@gompa.dev>
  NeilBrown <neilb@suse.de>
  NeilBrown <neilb@suse.de> # eliminated wait_for_completion
  NeilBrown <neilb@suse.de> # nfs_open_local_fh
  Nick Desaulniers <nick.desaulniers@gmail.com>
  Nicolin Chen <nicolinc@nvidia.com>
  Nikita Travkin <nikita@trvn.ru>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Niklāvs Koļesņikovs <pinkflames.linux@gmail.com>
  Nuno Sa <nuno.sa@analog.com>
  Olivier Langlois <olivier@trillion01.com>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pat Somaru <patso@likewhatevs.io>
  Patrisious Haddad <phaddad@nvidia.com>
  Paul Moore <paul@paul-moore.com>
  Paul Moore <paul@paul-moore.com> (LSM/SELinux)
  Peng Fan <peng.fan@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter-Jan Gootzen <pgootzen@nvidia.com>
  Petr Tesarik <petr@tesarici.cz>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Qiu-ji Chen <chenqiuji666@gmail.com>
  R Nageswara Sastry <rnsastry@linux.ibm.com>
  Richard Acayan <mailingradian@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Roi Azarzar <roi.azarzar@vastdata.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Ryo Takakura <takakura@valinux.co.jp>
  Sam James <sam@gentoo.org>
  Sami Tolvanen <samitolvanen@google.com>
  Samuel Holland <samuel.holland@sifive.com>
  Saravanan Vajravel <saravanan.vajravel@broadcom.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shen Lichuan <shenlichuan@vivo.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Showrya M N <showrya@chelsio.com>
  Shu Han <ebpqwerty472123@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Siddh Raman Pant <siddh.raman.pant@oracle.com>
  Stanislav Jakubek <stano.jakubek@gmail.com>
  Steffen Persvold <spersvold@gmail.com>
  Stephen Brennan <stephen.s.brennan@oracle.com>
  Stephen Smalley <stephen.smalley.work@gmail.com>
  Stuart Menefy <stuart.menefy@codasip.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Sungjong Seo <sj1557.seo@samsung.com>
  syzbot+044fdf24e96093584232@syzkaller.appspotmail.com
  Tahera Fahimi <fahimitahera@gmail.com>
  Tanmay Shah <tanmay.shah@amd.com>
  Tejun Heo <tj@kernel.org>
  Tengfei Fan <quic_tengfan@quicinc.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tony Battersby <tonyb@cybernetics.com>
  Trevor Gross <tmgross@umich.edu>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tóth János <gomba007@gmail.com>
  Udit Kumar <u-kumar1@ti.com>
  Utsav Agarwal <utsav.agarwal@analog.com>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Valentin Caron <valentin.caron@foss.st.com>
  Vincent Huang <Vincent.Huang@tw.synaptics.com>
  Vineet Gupta <vgupta@kernel.org>
  Vitaliy Shevtsov <v.shevtsov@maxima.ru>
  Wadim Egorov <w.egorov@phytec.de>
  Wedson Almeida Filho <wedsonaf@gmail.com>
  Wei Yang <richard.weiyang@gmail.com>
  wenglianfa <wenglianfa@huawei.com>
  Wenjie Cheng <cwjhust@gmail.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Weston Andros Adamson <dros@primarydata.com>
  Will Deacon <will@kernel.org>
  Wu Bo <bo.wu@vivo.com>
  Xi Ruoyao <xry111@xry111.site>
  Xiao Wang <xiao.w.wang@intel.com>
  yangyun <yangyun50@huawei.com>
  Yehuda Yitschak <yehuday@amazon.com>
  Yeongjin Gil <youngjin.gil@samsung.com>
  Yi Liu <yi.l.liu@intel.com>
  Yi Zhang <yi.zhang@redhat.com>
  Ying Sun <sunying@isrc.iscas.ac.cn>
  Yishai Hadas <yishaih@nvidia.com>
  Yu Liao <liaoyu15@huawei.com>
  Yue Haibing <yuehaibing@huawei.com>
  Yuezhang Mo <Yuezhang.Mo@sony.com>
  Yunhui Cui <cuiyunhui@bytedance.com>
  Zhang Zekun <zhangzekun11@huawei.com>
  Zhaoyang Huang <zhaoyang.huang@unisoc.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhiguo Niu <zhiguo.niu@unisoc.com>
  Zhu Yanjun <yanjun.zhu@linux.dev>
  Zijie Wang <wangzijie1@honor.com>
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
   abf2050f51fd..11a299a7933e  11a299a7933e03c83818b431e6a1c53ad387423d -> tested/linux-linus

