Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA2588AF6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 13:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379800.613578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJCKg-0002Wd-NU; Wed, 03 Aug 2022 11:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379800.613578; Wed, 03 Aug 2022 11:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJCKg-0002TJ-KT; Wed, 03 Aug 2022 11:14:34 +0000
Received: by outflank-mailman (input) for mailman id 379800;
 Wed, 03 Aug 2022 11:14:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJCKf-0002T9-A2; Wed, 03 Aug 2022 11:14:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJCKf-0006ee-6I; Wed, 03 Aug 2022 11:14:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJCKe-00010r-RH; Wed, 03 Aug 2022 11:14:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJCKe-0001A2-Nb; Wed, 03 Aug 2022 11:14:32 +0000
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
	bh=qOBVakpRAEEeGMj68FwwN42DRuhcufishqb5tK0wH2E=; b=YIzdNbWcCM3Xqzu/Effv4SJ5n7
	OcvJpJY7TwEAjYCCW/yBfof/5h9Ji/0qjRfHVhAZNEPJKdD1g/4wFvQk2i51kI5X7zMP8BfFTQ1gJ
	7GaX3EThd/EKKbPp1DgCFHQooW1Dad3LBad/KRjd6Jo0Q5T2+IwQ+0w79fjwuaejnLlM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172093-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 172093: tolerable FAIL - PUSHED
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
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c2a24a7a036b3bd3a2e6c66730dfc777cae6540a
X-Osstest-Versions-That:
    linux=7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Aug 2022 11:14:32 +0000

flight 172093 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172093/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 172084
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 172084
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172084
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172084
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172084
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 172084
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 172084
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 172084
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                c2a24a7a036b3bd3a2e6c66730dfc777cae6540a
baseline version:
 linux                7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1

Last test of basis   172084  2022-08-02 16:41:39 Z    0 days
Testing same since   172093  2022-08-03 01:58:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Wujek <dev_public@wujek.eu>
  Adithya K V <adithya.kv@samsung.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Alejandro González <alejandro.gonzalez.correo@gmail.com>
  Aleksa Savic <savicaleksa83@gmail.com>
  Aleksander Mazur <deweloper@wp.pl>
  Alexandru Gagniuc <mr.nuke.me@gmail.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Allen-KH Cheng <allen-kh.cheng@mediatek.com>
  Amit Kucheria <amitk@kernel.org>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrei Vagin <avagin@gmail.com>
  Andrew Davis <afd@ti.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Strachuk <strochuk@ispras.ru>
  Andy Chiu <andy.chiu@sifive.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antoine Tenart <atenart@kernel.org>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Ard Biesheuvel <ardb@kernel.org>
  Armin Wolf <W_Armin@gmx.de>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
  Axel Lin <axel.lin@ingics.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Baoquan He <bhe@redhat.com>
  Bart Van Assche <bvanassche@acm.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bo Liu <liubo03@inspur.com>
  Borislav Petkov <bp@suse.de>
  Breno Leitao <leitao@debian.org>
  Bryan Brattlof <bb@ti.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chanho Park <chanho61.park@samsung.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chen Yu <yu.c.chen@intel.com>
  ChiYuan Huang <cy_huang@richtek.com>
  Christian Brauner (Microsoft) <brauner@kernel.org>
  Christian Göttsche <cgzones@googlemail.com>
  Christian Kohlschütter <christian@kohlschutter.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuanhong Guo <gch981213@gmail.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Coiby Xu <coxu@redhat.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Corentin Labbe <clabbe.montjoie@gmail.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Daire McNamara <daire.mcnamara@microchip.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Latypov <dlatypov@google.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Lezcano <daniel.lezcano@linexp.org>
  David Ahern <dsahern@kernel.org>
  David Fries <David@Fries.net>
  David Jander <david@protonic.nl>
  David Rientjes <rientjes@google.com>
  David Sterba <dsterba@suse.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Douglas Anderson <dianders@chromium.org>
  Dylan Yudaken <dylany@fb.com>
  Eddie James <eajames@linux.ibm.com>
  Eiichi Tsukata <eiichi.tsukata@nutanix.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Eugene Shalygin <eugene.shalygin@gmail.com>
  Fabien Parent <fparent@baylibre.com>
  Fabio M. De Francesco <fmdefrancesco@gmail.com>
  Florian Fainelli <f.fainelli@gmail.com>
  George D Sworo <george.d.sworo@intel.com>
  Georgi Djakov <djakov@kernel.org>
  Gilad Ben-Yossef <gilad@benyossef.com>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  GONG, Ruiqi <gongruiqi1@huawei.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guo Mengqi <guomengqi3@huawei.com>
  GUO Zihua <guozihua@huawei.com>
  GuoYong Zheng <zhenggy@chinatelecom.cn>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Hao Xu <howeyxu@tencent.com>
  Heiko Carstens <hca@linux.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hsin-Yi Wang <hsinyi@chromium.org>
  huhai <huhai@kylinos.cn>
  Ignat Korchagin <ignat@cloudflare.com>
  Jack Doan <me@jackdoan.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jakub Kicinski <kuba@kernel.org>
  James Morris <jamorris@linux.microsoft.com>
  Jan Kara <jack@suse.cz>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <wangborong@cdjrlc.com>
  Jason Yan <yanaijie@huawei.com>
  Jean Delvare <jdelvare@suse.de>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jens Axboe <axboe@kernel.dk>
  JeongHyeon Lee <jhs2.lee@samsung.com>
  Jia-Wei Chang <jia-wei.chang@mediatek.com>
  Jiang Jian <jiangjian@cdjrlc.com>
  Jianglei Nie <niejianglei2021@163.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jilin Yuan <yuanjilin@cdjrlc.com>
  Jin Xiaoyun <jinxiaoyun2@huawei.com>
  Jinke Han <hanjinke.666@bytedance.com>
  Johannes Berg <johannes@sipsolutions.net>
  John Allen <john.allen@amd.com>
  John Garry <john.garry@huawei.com>
  Johnson Wang <johnson.wang@mediatek.com>
  Jonas Lindner <jolindner@gmx.de>
  Julia Lawall <Julia.Lawall@inria.fr>
  Justin Stitt <justinstitt@google.com>
  Kai Ye <yekai13@huawei.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  keliu <liuke94@huawei.com>
  Kevin Hilman <khilman@baylibre.com>
  Krishna Yarlagadda <kyarlagadda@nvidia.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lee Jones <lee.jones@linaro.org>
  Lee Jones <lee@kernel.org>
  lei he <helei.sig11@bytedance.com>
  Len Brown <len.brown@intel.com>
  Li Chen <lchen@ambarella.com>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Song <liusong@linux.alibaba.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukasz Luba <lukasz.luba@arm.com>
  Luo Meng <luomeng12@huawei.com>
  Manyi Li <limanyi@uniontech.com>
  Marc Ferland <ferlandm@amotus.ca>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcello Sylvester Bauer <sylv@sylv.io>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marek Behún <kabel@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Markus Mayer <mmayer@broadcom.com>
  Martin Sperl <kernel@martin.sperl.org>
  Matt Ranostay <mranostay@ti.com>
  Matthias Kaehlcke <mka@chromium.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Micah Morton <mortonm@chromium.org>
  Michael Carns <mike@carns.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Koutný <mkoutny@suse.com>
  Michal Suchanek <msuchanek@suse.de>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Ming Lei <ming.lei@redhat.com>
  Mårten Lindahl <marten.lindahl@axis.com>
  Nandhini Srikandan <nandhini.srikandan@intel.com>
  Naresh Solanki <Naresh.Solanki@9elements.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Huckleberry <nhuck@google.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Nick Hawkins <nick.hawkins@hpe.com>
  Nikita Travkin <nikita@trvn.ru>
  Niklas Cassel <niklas.cassel@wdc.com>
  Noam <lnoam@marvell.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Ofer Heifetz <oferh@marvell.com>
  Pali Rohár <pali@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Paul Fertser <fercerpav@gmail.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Peng Wu <wupeng58@huawei.com>
  Phil Elwell <phil@raspberrypi.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qian Cai <quic_qiancai@quicinc.com>
  Qifu Zhang <zhangqifu@bytedance.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Raz Adashi <raza@marvell.com>
  Ren Zhijie <renzhijie2@huawei.com>
  Rijo Thomas <Rijo-john.Thomas@amd.com>
  Riwen Lu <luriwen@kylinos.cn>
  Rob Herring <robh@kernel.org>
  Robert Marko <robimarko@gmail.com>
  Robert Schmidt <r-schmidt@web.de>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Saravanan Sekar <sravanhome@gmail.com>
  Schspa Shi <schspa@gmail.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Serge Hallyn <serge@hallyn.com>
  Serge Semin <fancer.lancer@gmail.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergiu Moga <sergiu.moga@microchip.com>
  Shady Nawara <shady.nawara@outlook.com>
  shaom Deng <dengshaomin@cdjrlc.com>
  Shijith Thotton <sthotton@marvell.com>
  Shivnandan Kumar <quic_kshivnan@quicinc.com>
  Shreenidhi Shedi <sshedi@vmware.com>
  Shreenidhi Shedi <yesshedi@gmail.com>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Simo Sorce <simo@redhat.com>
  Slark Xiao <slark_xiao@163.com>
  Slawomir Stepien <slawomir.stepien@nokia.com>
  Song Liu <song@kernel.org>
  Song Liu <song@kernel.org> (for the md changes)
  Stefan Roesch <shr@fb.com>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Stephen Kitt <steve@sk2.org>
  Steven Lung <1030steven@gmail.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>
  syzbot <syzbot+358c9ab4c93da7b7238c@syzkaller.appspotmail.com>
  Taehee Yoo <ap420073@gmail.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <thierry.reding@gmail.com>
  Todd Brandt <todd.e.brandt@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomasz Kowallik <tomaszx.kowalik@intel.com>
  Tomer Maimon <tmaimon77@gmail.com>
  Tony Luck <tony.luck@intel.com>
  Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Ulf Hansson <ulf.hansson@linaro.org> # For MMC
  Uros Bizjak <ubizjak@gmail.com>
  Urs Schroffenegger <nabajour@lampshade.ch>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadym Kochan <vadym.kochan@plvision.eu>
  Vaishnav Achath <vaishnav.a@ti.com>
  Vasily Khoruzhick <anarsoul@gmail.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vladimir Zapolskiy <vz@mleia.com>
  Vladis Dronov <vdronov@redhat.com>
  Weili Qian <qianweili@huawei.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiang wangx <wangxiang@cdjrlc.com>
  XiaoYan Li <lxy.lixiaoyan@gmail.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yi Zhang <yi.zhang@redhat.com>
  YiFei Zhu <zhuyifei@google.com>
  Yin Fengwei <fengwei.yin@intel.com>
  Ying Sun <sunying@nj.iscas.ac.cn>
  Yoan Picchi <yoan.picchi@arm.com>
  Yuan Can <yuancan@huawei.com>
  Zhang Jiaming <jiaming@nfschina.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhao Liu <zhao1.liu@linux.intel.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Zhou Wang <wangzhou1@hisilicon.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
   7d0d3fa7339e..c2a24a7a036b  c2a24a7a036b3bd3a2e6c66730dfc777cae6540a -> tested/linux-linus

