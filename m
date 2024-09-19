Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2A97CCE0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 19:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800850.1210862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srKb4-0001PS-Va; Thu, 19 Sep 2024 17:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800850.1210862; Thu, 19 Sep 2024 17:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srKb4-0001NM-SW; Thu, 19 Sep 2024 17:05:38 +0000
Received: by outflank-mailman (input) for mailman id 800850;
 Thu, 19 Sep 2024 17:05:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srKb3-0001NC-KH; Thu, 19 Sep 2024 17:05:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srKb3-0002XO-HF; Thu, 19 Sep 2024 17:05:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srKb2-0007aC-WE; Thu, 19 Sep 2024 17:05:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1srKb2-0002f1-Vi; Thu, 19 Sep 2024 17:05:36 +0000
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
	bh=phhPunZHKSDEBTcLIhX0OyfqSGHkCELrjZ7XXv55y4k=; b=35idzwxkbrMk5fcpwErABXJ4ec
	RraNPdx3M8N8TVnlFqNB8qYCGxMM9bXJMKzW6WaD8jKwwN/V7Fa7vlktZUExnP7j4WyEWfhC7Y0CX
	bkmvTAFohFQL17qkBHgOIE/IJlKlcy6Oz25s96kRjO0/hOS6qcHg2o9Cnv9/lwmXQ5No=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187751-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187751: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:allowable
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
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
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
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
X-Osstest-Versions-That:
    linux=bdf56c7580d267a123cc71ca0f2459c797b76fde
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Sep 2024 17:05:36 +0000

flight 187751 linux-linus real [real]
flight 187762 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187751/
http://logs.test-lab.xenproject.org/osstest/logs/187762/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail pass in 187762-retest

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     18 guest-localmigrate       fail REGR. vs. 187743

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187743
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187743
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187743
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187743
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187743
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187743
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
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
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
baseline version:
 linux                bdf56c7580d267a123cc71ca0f2459c797b76fde

Last test of basis   187743  2024-09-18 08:12:50 Z    1 days
Testing same since   187751  2024-09-18 22:14:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
  "Peter Zijlstra (Intel)" <peterz@infradead.org>
  Adhemerval Zanella <adhemerval.zanella@linaro.org>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alexander Dahl <ada@thorsis.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Allen Pais <apais@linux.microsoft.com>
  Andres Salomon <dilinger@queued.net>
  Andrew Davis <afd@ti.com>
  Andrew Kreimer <algonell@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Andy Shevchenko <andy@kernel.org>
  Animesh Agarwal <animeshagarwal28@gmail.com>
  Ard Biesheuvel <ardb@kernel.org>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Arnd Bergmann <arnd@kernel.org>
  Arthur Borsboom <arthurborsboom@gmail.com>
  Artur Weber <aweber.kernel@gmail.com>
  Ashish Mhetre <amhetre@nvidia.com>
  Asmaa Mnebhi <asmaa@nvidia.com>
  Attila <attila@fulop.one>
  Avri Altman <avri.altman@wdc.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Gainey <ben.gainey@arm.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Brian Mak <makb@juniper.net>
  Brian Norris <computersforpeace@gmail.com>
  Chanh Nguyen <chanh@os.amperecomputing.com>
  Chanwoo Lee <cw9316.lee@samsung.com>
  Charles Han <hanchunchao@inspur.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen Ridong <chenridong@huawei.com>
  Chen Wang <unicorn_wang@outlook.com>
  Chen-Yu Tsai <wens@csie.org>
  Cheng Ming Lin <chengminglin@mxic.com.tw>
  Chris Morgan <macromorgan@hotmail.com>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Clark Wang <xiaoning.wang@nxp.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Conor Dooley <conor@kernel.org>
  Cryolitia PukNgae <Cryolitia@gmail.com>
  Csókás, Bence <csokas.bence@prolan.hu>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Golle <daniel@makrotopia.org>
  Dario Binacchi <dario.binacchi@amarulasolutions.com>
  David Lechner <dlechner@baylibre.com>
  Denis Pauk <pauk.denis@gmail.com>
  Derek J. Clark <derekjohn.clark@gmail.com>
  Detlev Casanova <detlev.casanova@collabora.com>
  Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
  Dharma Balasubiramani <dharma.b@microchip.com>
  Dhruva Gole <d-gole@ti.com>
  Dikshita Agarwal <quic_dikshita@quicinc.com>
  Dimitri Fedrau <dima.fedrau@gmail.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Rokosov <ddrokosov@salutedevices.com>
  Doug Brown <doug@schmorgal.com>
  Drew Fustini <drew@pdp7.com> # TH1520
  Dustin L. Howett <dustin@howett.net>
  Eliav Bar-ilan <eliavb@nvidia.com>
  Fabio Estevam <festevam@denx.de>
  Finley Xiao <finley.xiao@rock-chips.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frank Li <Frank.Li@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  George Stark <gnstark@salutedevices.com>
  Guenter Roeck <linux@roeck-us.net>
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Henrik Grimler <henrik@grimler.se>
  Hongbo Li <lihongbo22@huawei.com>
  Huacai Chen <chenhuacai@kernel.org>
  Ingo Molnar <mingo@kernel.org>
  Inochi Amaoto <inochiama@outlook.com>
  Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi
  Ivor Wanders <ivor@iwanders.net>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  James Clark <james.clark@linaro.org>
  Jared McArthur <j-mcarthur@ti.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jeff Xu <jeffxu@chromium.org>
  Jens Remus <jremus@linux.ibm.com>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jingyi Wang <quic_jingyw@quicinc.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <olsajiri@gmail.com>
  Joerg Roedel <jroedel@suse.de>
  Johannes Kirchmair <johannes.kirchmair@skidata.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Corbet <corbet@lwn.net>
  Joshua Tam <csinaction@pm.me>
  Judith Mendez <jm@ti.com>
  Justin Stitt <justinstitt@google.com>
  Kaixin Wang <kxwang23@m.fudan.edu.cn>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <kees@kernel.org>
  Kevin Greenberg <kdgreenberg234@protonmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Konrad Dybcio <konradybcio@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Liao Chen <liaochen4@huawei.com>
  Liming Sun <limings@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Ying <victor.liu@nxp.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luo Gengkun <luogengkun@huaweicloud.com>
  Madhavan Srinivasan <maddy@linux.ibm.com>
  Manuel Traut <manut@mecka.net>
  Marc Gonzalez <mgonzalez@freebox.fr>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Rutland <mark.rutland@arm.com>
  Martyn Welch <martyn.welch@collabora.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Maximilian Luz <luzmaximilian@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Walle <mwalle@kernel.org>
  Michal Simek <michal.simek@amd.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Rapoport (Microsoft) <rppt@kernel.org>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mirsad Todorovac <mtodorovac69@gmail.com>
  Mostafa Saleh <smostafa@google.com>
  Namhyung Kim <namhyung@kernel.org>
  Nate Watterson <nwatterson@nvidia.com>
  Nathan Chancellor <nathan@kernel.org>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nicolin Chen <nicolinc@nvidia.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nikunj Kela <quic_nkela@quicinc.com>
  Nuno Sa <nuno.sa@analog.com>
  Oleg Nesterov <oleg@redhat.com>
  Pali Rohár <pali@kernel.org>
  Parth Menon <parthasarathymenon@gmail.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Philip Müller <philm@manjaro.org>
  Philippe Simons <simons.philippe@gmail.com>
  Pratyush Yadav <pratyush@kernel.org>
  Raghavendra Kakarla <quic_rkakarla@quicinc.com>  # qcm6490 with PREEMPT_RT set
  Randy Dunlap <rdunlap@infradead.org>
  Riyan Dhiman <riyandhiman14@gmail.com>
  Rob Clark <robdclark@chromium.org>
  Rob Herring (Arm) <robh@kernel.org>
  Robert Marko <robimarko@gmail.com>
  Roger Quadros <rogerq@kernel.org>
  Roman Kisel <romank@linux.microsoft.com>
  Rong Qianfeng <rongqianfeng@vivo.com>
  Sanjay K Kumar <sanjay.k.kumar@intel.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Seunghwan Baek <sh8267.baek@samsung.com>
  Shan-Chun Hung <shanchun1218@gmail.com>
  Shawn Lin <shawn.lin@rock-chips.com>
  Shen Lichuan <shenlichuan@vivo.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Saini <shyamsaini@linux.microsoft.com>
  Stanislav Jakubek <stano.jakubek@gmail.com>
  Stefan Wahren <wahrenst@gmx.net>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  syzbot+f7a1c2c2711e4a780f19@syzkaller.appspotmail.com
  Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tina Zhang <tina.zhang@intel.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vasant Hegde <vasant.hegde@amd.com>
  Vikash Garodia <quic_vgarodia@quicinc.com>
  Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
  Wen Yang <wen.yang@linux.dev>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xi Ruoyao <xry111@xry111.site>
  Yan Zhen <yanzhen@vivo.com>
  Yang Ruibin <11162571@vivo.com>
  Yi Liu <yi.l.liu@intel.com>
  ying zuxin <yingzuxin@vivo.com>
  Yu Jiaoliang <yujiaoliang@vivo.com>
  Yue Haibing <yuehaibing@huawei.com>
  Yuntao Liu <liuyuntao12@huawei.com>
  Zhang Zekun <zhangzekun11@huawei.com>
  zhangjiao <zhangjiao2@cmss.chinamobile.com>
  Zhenhua Huang <quic_zhenhuah@quicinc.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Zhu Jun <zhujun2@cmss.chinamobile.com>

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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
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
 test-amd64-amd64-xl-rtds                                     fail    
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
   bdf56c7580d26..4a39ac5b7d626  4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d -> tested/linux-linus

