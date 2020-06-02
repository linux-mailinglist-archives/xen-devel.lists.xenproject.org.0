Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB81EB4F1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 07:13:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfzEF-0006sm-Ig; Tue, 02 Jun 2020 05:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiWU=7P=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jfzED-0006s2-TD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 05:12:45 +0000
X-Inumbo-ID: ad2b2488-a48f-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad2b2488-a48f-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 05:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=40E6PteJwaLi+rniTnFJJa2rRB8PWrUrgseei4uYSd8=; b=bRNyqSKHv1hJ6By9kaBUrkjsq
 Oqxi1alqlg5t25FBstLujEZwf8bMoJVehr1BhQDCUUyDrO9Poi3ZYdHGA1h3p2r9J8jf1QMcvbaBA
 IvBGYMt4uMfCoW7Ryo0Z3X7lF90YO/SUomWQTQj+HAA4Szuu4NFy9WzdkrDJTMrPYfuD0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jfzE5-000284-AS; Tue, 02 Jun 2020 05:12:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jfzE4-0005sc-Up; Tue, 02 Jun 2020 05:12:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jfzE4-0002Nc-Tv; Tue, 02 Jun 2020 05:12:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150606-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150606: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-linus:test-amd64-amd64-xl-rtds:guest-saverestore:fail:allowable
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=9bf9511e3d9f328c03f6f79bfb741c3d18f2f2c0
X-Osstest-Versions-That: linux=3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Jun 2020 05:12:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150606 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150606/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     15 guest-saverestore        fail REGR. vs. 150590

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150590
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150590
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150590
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150590
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150590
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150590
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150590
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150590
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150590
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 linux                9bf9511e3d9f328c03f6f79bfb741c3d18f2f2c0
baseline version:
 linux                3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162

Last test of basis   150590  2020-06-01 02:00:27 Z    1 days
Testing same since   150606  2020-06-01 19:40:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  AceLan Kao <acelan.kao@canonical.com>
  Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
  Aishwarya R <aishwaryarj100@gmail.com>
  Aishwarya R <raishwar@visteon.com>
  Akinobu Mita <akinobu.mita@gmail.com>
  Alex Qiu <xqiu@google.com>
  Alistair Francis <alistair@alistair23.me>
  Andrej Picej <andpicej@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Angelo Dureghello <angelo.dureghello@timesys.com>
  Anson Huang <Anson.Huang@nxp.com>
  Ard Biesheuvel <ardb@kernel.org>
  Aristeu Rozanski <aris@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Ashish Kumar <Ashish.kumar@nxp.com>
  Baolin Wang <baolin.wang7@gmail.com>
  Barry Song <song.bao.hua@hisilicon.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Benjamin Gaignard <benjamin.gaignard@st.com>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov <bp@suse.de>
  Bruno Meneguele <bmeneg@redhat.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chris Ruehl <chris.ruehl@gtsys.com.hk>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Kerello <christophe.kerello@st.com>
  Christopher Hill <ch6574@gmail.com>
  Clement Leger <cleger@kalray.eu>
  Colin Ian King <colin.king@canonical.com>
  Corentin Labbe <clabbe.montjoie@gmail.com>
  Corentin Labbe <clabbe@baylibre.com>
  Daniel Jordan <daniel.m.jordan@oracle.com>
  Dejin Zheng <zhengdejin5@gmail.com>
  dillon min <dillon.minfei@gmail.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dinh Nguyen <dinguyen@kernel.org>
  Eric Biggers <ebiggers@google.com>
  Ethon Paul <ethp@qq.com>
  Etienne Carriere <etienne.carriere@st.com>
  Evan Green <evgreen@chromium.org>
  Feng Tang <feng.tang@intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>
  Gilad Ben-Yossef <gilad@benyossef.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Hadar Gat <hadar.gat@arm.com>
  hailizheng <haili.zheng@powercore.com.cn>
  Han Xu <han.xu@nxp.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hao Fang <fanghao11@huawei.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hui Tang <tanghui20@huawei.com>
  Iskren Chernev <iskren.chernev@gmail.com>
  Iuliana Prodan <iuliana.prodan@nxp.com>
  J. Bruce Fields <bfields@redhat.com>
  Jacko Dirks <jdirks.linuxdev@gmail.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
  Jason Yan <yanaijie@huawei.com>
  Jay Fang <f.fangjian@huawei.com>
  John Garry <john.garry@huawei.com>
  Jonathan Bakker <xc-racer2@live.ca>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Lehan <krellan@google.com>
  Jules Irenge <jbi.octave@gmail.com>
  Jungseung Lee <js07.lee@samsung.com>
  Justin Chen <justinpopo6@gmail.com>
  Kai Ye <yekai13@huawei.com>
  Kamal Dasu <kdasu.kdev@gmail.com>
  Kangmin Park <l4stpr0gr4m@gmail.com>
  kbuild test robot <lkp@intel.com>
  Kees Cook <keescook@chromium.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Kuldeep Singh <kuldeep.singh@nxp.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Lee Jones <lee.jones@linaro.org>
  Liang Jin J <liang.j.jin@ericsson.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lionel Debieve <lionel.debieve@st.com>
  Longfang Liu <liulongfang@huawei.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Marco Felsch <m.felsch@pengutronix.de>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Markus Elfring <elfring@users.sourceforge.net>
  Martin Sperl <kernel@martin.sperl.org>
  Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michael Walle <michael@walle.cc>
  Michal Orzel <michalorzel.eng@gmail.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mihai Carabas <mihai.carabas@oracle.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Naveen Krishna Chatradhi <nchatrad@amd.com>
  Nicolas Pitre <npitre@baylibre.com>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Nicolas Toromanoff <nicolas.toromanoff@st.com>
  Pali Rohár <pali@kernel.org>
  Patrice Chotard <patrice.chotard@st.com>
  Pavel Tatashin <pasha.tatashin@soleen.com>
  Peng Fan <peng.fan@nxp.com>
  Peng Ma <peng.ma@nxp.com>
  Peter Rosin <peda@axentia.se>
  Petr Mladek <pmladek@suse.com>
  Qiuxu Zhuo <qiuxu.zhuo@intel.com>
  Rafał Hibner <rafal.hibner@secom.com.pl>
  Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Reinette Chatre <reinette.chatre@intel.com>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Robin Gong <yibin.gong@nxp.com>
  Sanjay R Mehta <sanju.mehta@amd.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sebastian Duda <sebastian.duda@fau.de>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
  Shengju Zhang <zhangshengju@cmss.chinamobile.com>
  Shreyas Joshi <shreyas.joshi@biamp.com>
  Shukun Tan <tanshukun1@huawei.com>
  Stephan Mueller <smueller@chronox.de>
  Stephan Müller <smueller@chronox.de>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Hebb <tommyhebb@gmail.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tim Harvey <tharvey@gateworks.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Luck <tony.luck@intel.com>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Weili Qian <qianweili@huawei.com>
  WeiXiong Liao <liaoweixiong@allwinnertech.com>
  Wolfram Sang <wsa@kernel.org>
  Yang Shen <shenyang39@huawei.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yuechao Zhao <yuechao.zhao@advantech.com.cn>
  Zaibo Xu <xuzaibo@huawei.com>
  Zhang Shengju <zhangshengju@cmss.chinamobile.com>
  Zhou Wang <wangzhou1@hisilicon.com>
  zhouchuangao <chuangaozhou@gmail.com>
  zhouchuangao <zhouchuangao@xiaomi.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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
   3d77e6a8804a..9bf9511e3d9f  9bf9511e3d9f328c03f6f79bfb741c3d18f2f2c0 -> tested/linux-linus

