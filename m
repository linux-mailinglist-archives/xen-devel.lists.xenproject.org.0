Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A49331D2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 21:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759769.1169445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTno2-00005b-Le; Tue, 16 Jul 2024 19:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759769.1169445; Tue, 16 Jul 2024 19:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTno2-0008Us-I6; Tue, 16 Jul 2024 19:25:46 +0000
Received: by outflank-mailman (input) for mailman id 759769;
 Tue, 16 Jul 2024 19:25:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTno1-0008Ui-CM; Tue, 16 Jul 2024 19:25:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTno1-0006Gx-8E; Tue, 16 Jul 2024 19:25:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTno0-0002nt-M7; Tue, 16 Jul 2024 19:25:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTno0-0000QO-La; Tue, 16 Jul 2024 19:25:44 +0000
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
	bh=McYVvCxsqZ8WINEnA2E/OjH12ywy5NieaD/liqXjNKs=; b=X6H5dqgD0XH/M5a0SoxuORNlop
	HQV1uRDtUxMloFFbBZ+tBk9aRo8nvc3Hq94AZqQA5fcSmmvrqzr3fuBnjIRIdF6nKiw1PQcuKv0Lt
	jX1SaAH/Ze0EajGtZ0ZVLk6Xxjz3Q0c9QGbTlzBUEZOrxoZR1/Wg9f+aUrpNjP0vLqsM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186816-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186816: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-vhd:guest-start/debian.repeat:fail:regression
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:host-ping-check-xen:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d67978318827d06f1c0fa4c31343a279e9df6fde
X-Osstest-Versions-That:
    linux=3e7819886281e077e82006fe4804b0d6b0f5643b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jul 2024 19:25:44 +0000

flight 186816 linux-linus real [real]
flight 186824 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186816/
http://logs.test-lab.xenproject.org/osstest/logs/186824/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-vhd 17 guest-start/debian.repeat fail REGR. vs. 186811

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-vhd  8 xen-boot         fail in 186824 pass in 186816
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 186824-retest
 test-armhf-armhf-xl-arndale  10 host-ping-check-xen fail pass in 186824-retest
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 186824-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 186824 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 186824 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 186824 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 186824 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186811
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186811
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 186811
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186811
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186811
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186811
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass

version targeted for testing:
 linux                d67978318827d06f1c0fa4c31343a279e9df6fde
baseline version:
 linux                3e7819886281e077e82006fe4804b0d6b0f5643b

Last test of basis   186811  2024-07-15 23:14:03 Z    0 days
Testing same since   186816  2024-07-16 09:44:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@linaro.org>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandr Mezin <mezin.alexander@gmail.com>
  Alex Vdovydchenko <xzeol@yahoo.com>
  Alexey Makhalov <alexey.makhalov@broadcom.com>
  Alina Yu <alina_yu@richtek.com>
  Alison Schofield <alison.schofield@intel.com>
  Allen Pais <allen.lkml@gmail.com>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
  Amit Pundir <amit.pundir@linaro.org>
  Amna Waseem <Amna.Waseem@axis.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrea della Porta <andrea.porta@suse.com>
  Andrea Parri <parri.andrea@gmail.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Davis <afd@ti.com>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Andy Shevchenko <andy@kernel.org>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Ashish Kalra <ashish.kalra@amd.com>
  Aubin Constans <aubin.constans@microchip.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bastien Curutchet <bastien.curutchet@bootlin.com>
  Ben Walsh <ben@jubnut.com>
  Bert Karwatzki <spasswolf@web.de>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Brian Johannesmeyer <bjohannesmeyer@gmail.com>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Caleb Connolly <caleb.connolly@linaro.org> # OnePlus 8T
  Catalin Marinas <catalin.marinas@arm.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen Ridong <chenridong@huawei.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Christian Heusel <christian@heusel.eu>
  Christian Loehle <christian.loehle@arm.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christopher S. Hall <christopher.s.hall@intel.com>
  Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Costa Shulyupin <costa.shul@redhat.com>
  Daisuke Nojiri <dnojiri@chromium.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Lechner <dlechner@baylibre.com>
  David Wang <00107082@163.com>
  Dev Jain <dev.jain@arm.com>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Drew Fustini <dfustini@baylibre.com>
  Dustin L. Howett <dustin@howett.net>
  Eddie James <eajames@linux.ibm.com>
  Eng Lee Teh <englee.teh@starfivetech.com>
  Etienne Buira <etienne.buira@free.fr>
  Eugene Shalygin <eugene.shalygin@gmail.com>
  Fabio Estevam <festevam@denx.de>
  Fabio Estevam <festevam@gmail.com>
  Frank Li <Frank.Li@nxp.com>
  Frederic Weisbecker <frederic@kernel.org>
  Frieder Schrempf <frieder.schrempf@kontron.de>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hagar Hemdan <hagarhem@amazon.com>
  Haibo Chen <haibo.chen@nxp.com>
  Hanjun Guo <guohanjun@huawei.com>
  Heiko Stuebner <heiko.stuebner@cherry.de>
  Hongyu Chen <hongyu.chen1@amlogic.com>
  Huichun Feng <foxhoundsk.tw@gmail.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jagadeesh Kona <quic_jkona@quicinc.com>
  Jai Arora <jai.arora@samsung.com>
  James Morse <james.morse@arm.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
  Jianyong Wu <jianyong.wu@arm.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Johannes Thumshirn <jth@kernel.org>
  Johannes Weiner <hannes@cmpxchg.org>
  John Allen <john.allen@amd.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Julia Lawall <Julia.Lawall@inria.fr>
  Junyi Zhao <junyi.zhao@amlogic.com>
  Kai Huang <kai.huang@intel.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kanak Shilledar <kanakshilledar111@protonmail.com>
  Kanak Shilledar <kanakshilledar@gmail.com>
  Kelvin Zhang <kelvin.zhang@amlogic.com>
  Kent Gibson <warthog618@gmail.com>
  Kevin Brodsky <kevin.brodsky@arm.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Krzysztof Wilczyński <kw@linux.com>
  Kuldeep Singh <kuldeep.singh@nxp.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lai Jiangshan <jiangshan.ljs@antgroup.com>
  Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
  Lee Jones <lee@kernel.org>
  Leem ChaeHoon <infinite.run@gmail.com>
  Ley Foon Tan <leyfoon.tan@starfivetech.com>
  Li kunyu <kunyu@nfschina.com>
  Li zeming <zeming@nfschina.com>
  Liming Sun <limings@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Wei <liuwei09@cestc.cn>
  Manikandan Muralidharan <manikandan.m@microchip.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Zyngier <maz@kernel.org>
  Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
  Marco Elver <elver@google.com>
  Marius Zachmann <mail@mariuszachmann.de>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Markus Stockhausen <markus.stockhausen@gmx.de>
  Martin Kaiser <martin@kaiser.cx>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Guzik <mjguzik@gmail.com>
  Michael Hennerich <michael.hennerich@analog.com>
  Michal Koutný <mkoutny@suse.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Miguel Luis <miguel.luis@oracle.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Naina Mehta <quic_nainmeht@quicinc.com>
  Naresh Solanki <naresh.solanki@9elements.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD, SM8650-QRD & SM8650-HDK
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
  Nianyao Tang <tangnianyao@huawei.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nicola Di Lieto <nicola.dilieto@gmail.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nikolay Borisov <nik.borisov@suse.com>
  Noah Wang <noahwang.wang@outlook.com>
  Nuno Sa <nuno.sa@analog.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Oleg Nesterov <oleg@redhat.com>
  Pali Rohár <pali@kernel.org>
  Patrick Delaunay <patrick.delaunay@foss.st.com>
  Paul E. McKenney <paulmck@kernel.org>
  Peng Fan <peng.fan@nxp.com>
  Peter Collingbourne <pcc@google.com>
  Peter Robinson <pbrobinson@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
  Pratik Farkase <pratik.farkase@wsisweden.com>
  Pratik Farkase <pratikfarkase94@gmail.com>
  Puranjay Mohan <puranjay@kernel.org>
  Qiuxu Zhuo <qiuxu.zhuo@intel.com>
  Raag Jadav <raag.jadav@intel.com>
  Radu Sabau <radu.sabau@analog.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rob Barnes <robbarnes@google.com>
  Rob Herring (Arm) <robh@kernel.org>
  Robert Marko <robimarko@gmail.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sander Vanheule <sander@svanheule.net>
  Sean Anderson <sean.anderson@linux.dev>
  Sean Christopherson <seanjc@google.com>
  Sean Young <sean@mess.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Seongsu Park <sgsu.park@samsung.com>
  Sergiu Cuciurean <sergiu.cuciurean@analog.com>
  Shenwei Wang <shenwei.wang@nxp.com>
  Shiji Yang <yangshiji66@outlook.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Trimmer <simont@opensource.cirrus.com>
  Stanislav Jakubek <stano.jakubek@gmail.com>
  Stanislav Spassov <stanspas@amazon.de>
  Stefan Wahren <wahrenst@gmx.net>
  Stephen Horvath <s.horvath@outlook.com.au>
  Sudeep Holla <sudeep.holla@arm.com>
  Sunny Luo <sunny.luo@amlogic.com>
  Tao Liu <ltao@redhat.com>
  Tejun Heo <tj@kernel.org>
  Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Huth <thuth@redhat.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tim Merrifield <tim.merrifield@broadcom.com>
  Tony Luck <tony.luck@intel.com>
  Trevor Gamblin <tgamblin@baylibre.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Uwe Kleine-König <ukleinek@baylibre.com>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vasyl Gomonovych <gomonovych@gmail.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vishnu Pajjuri <vishnu@os.amperecomputing.com>
  Vitor Soares <vitor.soares@toradex.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Waiman Long <longman@redhat.com>
  Wayne Tung <chineweff@gmail.com>
  Wenchao Hao <haowenchao22@gmail.com>
  Wilken Gottwalt <wilken.gottwalt@posteo.net>
  Will Deacon <will@kernel.org>
  William Breathitt Gray <wbg@kernel.org>
  Willy Tarreau <w@1wt.eu>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xianwei Zhao <xianwei.zhao@amlogic.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Youwan Wang <youwan@nfschina.com>
  Yu Liao <liaoyu15@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zqiang <qiang.zhang1211@gmail.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
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


Not pushing.

(No revision log; it would be 15284 lines long.)

