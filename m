Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4648D316
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 08:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256997.441369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ulh-0007QP-WA; Thu, 13 Jan 2022 07:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256997.441369; Thu, 13 Jan 2022 07:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ulh-0007Nb-Sf; Thu, 13 Jan 2022 07:43:33 +0000
Received: by outflank-mailman (input) for mailman id 256997;
 Thu, 13 Jan 2022 07:43:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n7ulg-0007NR-61; Thu, 13 Jan 2022 07:43:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n7ulg-0006jo-3V; Thu, 13 Jan 2022 07:43:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n7ulf-0003qs-Qe; Thu, 13 Jan 2022 07:43:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n7ulf-0006Fa-QA; Thu, 13 Jan 2022 07:43:31 +0000
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
	bh=c1E9NLtjbWm9+TCyZeJsj1RbioMqDSgOrmE4XP4VsvI=; b=pPbffj0LX2EFchzdAF2HtRNZJ7
	WgunWRYtZV928XokwJi/RNOOYzQqLbON7eNFFFkObRJqUC3PcrqdZWfTUArpCEC6e4l4io854fyOn
	VYrObDGjF1rmyNU3cDHSAkQRR3Ey+cHZnl99UDQzkYnHU29LYt3g5cs6HF14xAGxwAVo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167679: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=81ff0be4b9e3bcfee022d71cf89d72f7e2ed41ba
X-Osstest-Versions-That:
    linux=daadb3bd0e8d3e317e36bc2c1542e86c528665e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Jan 2022 07:43:31 +0000

flight 167679 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167679/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167668
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167668
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167668
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167668
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167668
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167668
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167668
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167668
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                81ff0be4b9e3bcfee022d71cf89d72f7e2ed41ba
baseline version:
 linux                daadb3bd0e8d3e317e36bc2c1542e86c528665e5

Last test of basis   167668  2022-01-12 01:56:17 Z    1 days
Testing same since   167679  2022-01-12 19:42:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdun Nihaal <abdun.nihaal@gmail.com>
  Abel Vesa <abel.vesa@nxp.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alberto Merciai <alb3rt0.m3rciai@gmail.com>
  Alyssa Ross <hi@alyssa.is>
  Amelie Delaunay <amelie.delaunay@foss.st.com>
  Amjad Ouled-Ameur <aouledameur@baylibre.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Arnd Bergmann <arnd@arndb.de>
  Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Cai Huoqing <cai.huoqing@linux.dev>
  Cai Huoqing <caihuoqing@baidu.com>
  Candy Febriyanto <cfebriyanto@gmail.com>
  Changcheng Deng <deng.changcheng@zte.com.cn>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Clément Léger <clement.leger@bootlin.com>
  Colin Foster <colin.foster@in-advantage.com>
  Colin Ian King <colin.i.king@gmail.com>
  Colin Ian King <colin.i.king@googlemail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Mack <daniel@zonque.org>
  Daniel Scally <djrscally@gmail.com>
  David E. Box <david.e.box@linux.intel.com>
  David Heidelberg <david@ixit.cz>
  David Rientjes <rientjes@google.com>
  David Virag <virag.david003@gmail.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Davidlohr Bueso <dbueso@suse.de>
  Denis Efremov <efremov@linux.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dirk Müller <dmueller@suse.de>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dominik Kobinski <dominikkobinski314@gmail.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Emil Renner Berthing <kernel@esmil.dk>
  Eric Biggers <ebiggers@google.com>
  Erwan Le Ray <erwan.leray@foss.st.com>
  Fabio Estevam <festevam@gmail.com>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <fugang.duan@nxp.com>
  Gabriel Goller <gabrielgoller123@gmail.com>
  Gaston Gonzalez <gascoar@gmail.com>
  Gautam Menghani <gautammenghani14@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geliang Tang <geliang.tang@suse.com>
  Gil Fine <gil.fine@intel.com>
  Giulio Benetti <giulio.benetti@benettiengineering.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guo Zhengkui <guozhengkui@vivo.com>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  GuoYong Zheng <zhenggy@chinatelecom.cn>
  Haimin Zhang <tcs.kernel@gmail.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hao Xu <haoxu@linux.alibaba.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herve Codina <herve.codina@bootlin.com>
  Ingo Molnar <mingo@kernel.org>
  Ira Weiny <ira.weiny@intel.com>
  Ismayil Mirzali <ismayilmirzeli@gmail.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jacky Bai <ping.bai@nxp.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <wangborong@cdjrlc.com>
  Jay Dolan <jay.dolan@accesio.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Taube <Mr.Bossman075@gmail.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jing Yao <yao.jing2@zte.com.cn>
  Jiri Slaby <jslaby@suse.cz>
  Joe Thornber <ejt@redhat.com>
  Joey Gouly <joey.gouly@arm.com>
  Johan Hovold <johan@kernel.org>
  John Garry <john.garry@huawei.com>
  John Keeping <john@metanate.com>
  Jonathan McDowell <noodles@earth.li>
  Juergen Gross <jgross@suse.com>
  Julia Lawall <julia.lawall@inria.fr>
  Julian Braha <julianbraha@gmail.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Karolina Drobnik <karolinadrobnik@gmail.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  kernel test robot <lkp@intel.com>
  Kiran Kumar S <kiran.kumar1.s@intel.com>
  Kohei Tarumizu <tarumizu.kohei@fujitsu.com>
  Konrad Dybcio <konrad.dybcio@somainline.org>
  Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> [NFC]
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
  lianzhi chang <changlianzhi@uniontech.com>
  Lino Sanfilippo <LinoSanfilippo@gmx.de>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linyu Yuan <quic_linyyuan@quicinc.com>
  Liu Junqi <liujunqi@pku.edu.cn>
  Lizhi Hou <lizhi.hou@xilinx.com>
  Logan Gunthorpe <logang@deltatee.com>
  Loic Poulain <loic.poulain@linaro.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  luo penghao <luo.penghao@zte.com.cn>
  Magnus Damm <damm+renesas@opensource.se>
  Manish Narani <manish.narani@xilinx.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
  Mark Greer <mgreer@animalcreek.com>
  Mark Pearson <markpearson@lenovo.com>
  Mark-PK Tsai <mark-pk.tsai@mediatek.com>
  Martin Kaiser <martin@kaiser.cx>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Miaoqian Lin <linmq006@gmail.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Straube <straube.linux@gmail.com>
  Michal Suchanek <msuchanek@suse.de>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@redhat.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Minchan Kim <minchan@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Liu <neal_liu@aspeedtech.com>
  NeilBrown <neilb@suse.de>
  Ngo Tak Fong <simon.fodin@gmail.com>
  Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Noralf Trønnes <noralf@tronnes.org>
  Paolo Valente <paolo.valente@linaro.org>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
  Pavankumar Kondeti <quic_pkondeti@quicinc.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Pavel Hofman <pavel.hofman@ivitera.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Chen <peter.chen@kernel.or> # for chipidea part
  Peter Chen <peter.chen@kernel.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Phil Elwell <phil@raspberrypi.com>
  Philipp Hortmann <philipp.g.hortmann@gmail.com>
  Phillip Potter <phil@philpotter.co.uk>
  Prasad Sodagudi <psodagud@codeaurora.org>
  Qihang Hu <huqihang@oppo.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rajaram Regupathy <rajaram.regupathy@intel.com>
  Rajendra Nayak <rnayak@codeaurora.org>
  Randy Dunlap <rdunlap@infradead.org>
  Razvan Heghedus <heghedus.razvan@gmail.com>
  Richard Genoud <richard.genoud@gmail.com>
  Rob Herring <robh@kernel.org>
  Rob Landley <rob@landley.net>
  Robert Schlabbach <robert_s@gmx.net>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sam Ravnborg <sam@ravnborg.org>
  Saranya Gopal <saranya.gopal@intel.com>
  Saurav Girepunje <saurav.girepunje@gmail.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Sherry Sun <sherry.sun@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Sidong Yang <realwakka@gmail.com>
  Song Liu <song@kernel.org>
  Song Liu <songliubraving@fb.com>
  syzbot <syzbot+28a66a9fbc621c939000@syzkaller.appspotmail.com>
  syzbot+643e4ce4b6ad1347d372@syzkaller.appspotmail.com
  Tasos Sahanidis <tasos@tasossah.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thierry Reding <treding@nvidia.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Tinghan Shen <tinghan.shen@mediatek.com>
  Tommaso Merciai <tomm.merciai@gmail.com>
  Tommaso Merciai <tommaso.merciai@gmail.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vaibhav Gupta <vaibhavgupta40@gmail.com>
  Valentin Caron <valentin.caron@foss.st.com>
  Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
  Vihas Mak <makvihas@gmail.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vishal Verma <vverma@digitalocean.com>
  Wander Lairson Costa <wander@redhat.com>
  Wedson Almeida Filho <wedsonaf@google.com>
  Wei Ming Chen <jj251510319013@gmail.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Xiang wangx <wangxiang@cdjrlc.com>
  Xianwei Zhao <xianwei.zhao@amlogic.com>
  Xiao Ni <xni@redhat.com>
  Xiaoke Wang <xkernel.wang@foxmail.com>
  Xiongwei Song <sxwjean@gmail.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yanteng Si <siyanteng01@gmail.com>
  Yanteng Si <siyanteng@loongson.cn>
  Ye Bin <yebin10@huawei.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yu Tu <yu.tu@amlogic.com>
  Zameer Manji <zmanji@gmail.com>

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
   daadb3bd0e8d..81ff0be4b9e3  81ff0be4b9e3bcfee022d71cf89d72f7e2ed41ba -> tested/linux-linus

