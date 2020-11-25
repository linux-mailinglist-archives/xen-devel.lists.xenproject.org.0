Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C32C3654
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 02:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37098.69282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khjws-0003p6-Fk; Wed, 25 Nov 2020 01:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37098.69282; Wed, 25 Nov 2020 01:50:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khjws-0003ob-8q; Wed, 25 Nov 2020 01:50:22 +0000
Received: by outflank-mailman (input) for mailman id 37098;
 Wed, 25 Nov 2020 01:50:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khjwq-0003oS-MA; Wed, 25 Nov 2020 01:50:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khjwq-0000BF-Er; Wed, 25 Nov 2020 01:50:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khjwq-00048I-8A; Wed, 25 Nov 2020 01:50:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1khjwq-0005Bu-72; Wed, 25 Nov 2020 01:50:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khjwq-0003oS-MA; Wed, 25 Nov 2020 01:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=nzitLm/BtpSdU4EreKfFQdnpFuysXh3BG/retvMbD+M=; b=Bd76ZahCLc/WK9sQnsMFZqd99h
	8hBSVsmmpaUUfMl1dI0ZtVO/RIgeLntwzt33CVlJfYRwtQthUBRiCzOYZQjaoPCsY+l+OCGIBrWTp
	bc0nvQpMcWFLp9YBGC+a35pL+46DwlbANLo5DqAa3B7GTG3Z1KVkqXmYZ5grJwrX9QYs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khjwq-0000BF-Er; Wed, 25 Nov 2020 01:50:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khjwq-00048I-8A; Wed, 25 Nov 2020 01:50:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khjwq-0005Bu-72; Wed, 25 Nov 2020 01:50:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156984-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 156984: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=9f4b26f3ea18cb2066c9e58a84ff202c71739a41
X-Osstest-Versions-That:
    linux=fc8334619167ce90b6d3f76e3dce9284dbe14fa2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Nov 2020 01:50:20 +0000

flight 156984 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156984/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156942
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156942
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156942
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail like 156942
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156942
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156942
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156942
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156942
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156942
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156942
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156942
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156942
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds      3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                9f4b26f3ea18cb2066c9e58a84ff202c71739a41
baseline version:
 linux                fc8334619167ce90b6d3f76e3dce9284dbe14fa2

Last test of basis   156942  2020-11-22 09:40:34 Z    2 days
Testing same since   156984  2020-11-24 13:11:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Lewis <aaronlewis@google.com>
  Adam Ford <aford173@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de> # stpmic1
  Alejandro Concepcion Rodriguez <alejandro@acoro.eu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexei Starovoitov <ast@kernel.org>
  Anant Thazhemadam <anant.thazhemadam@gmail.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arvind Sankar <nivedita@alum.mit.edu>
  Aya Levin <ayal@nvidia.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov <bp@suse.de>
  Brian O'Keefe <bokeefe@alum.wpi.edu>
  Can Guo <cang@codeaurora.org>
  Charan Teja Reddy <charante@codeaurora.org>
  Chen Yu <yu.c.chen@intel.com>
  Chen-Yu Tsai <wens@csie.org>
  Chris Co <chrco@microsoft.com>
  Christoph Hellwig <hch@lst.de>
  Claire Chang <tientzu@chromium.org>
  Clément Péron <peron.clem@gmail.com>
  Colin Ian King <colin.king@canonical.com>
  Corentin Labbe <clabbe.montjoie@gmail.com>
  Corentin Labbe <clabbe@baylibre.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Murphy <dmurphy@ti.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Darrick J. Wong <darrick.wong@oracle.com>
  David Rientjes <rientjes@google.com>
  Denis Yulevich <denisyu@nvidia.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dongli Zhang <dongli.zhang@oracle.com>
  Edwin Peer <edwin.peer@broadcom.com>
  Eli Cohen <elic@nvidia.com>
  Emilio López <emilio@elopez.com.ar>
  Enric Balletbo i Serra <enric.balletbo@collabora.com>
  Fabien Parent <fparent@baylibre.com>
  Fabio Estevam <festevam@gmail.com>
  Faiz Abbas <faiz_abbas@ti.com>
  Felix Fietkau <nbd@nbd.name>
  Filip Moc <dev@moc6.cz>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <fugang.duan@nxp.com>
  Gerald Schaefer <gerald.schaefer@linux.ibm.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Harry Cutts <hcutts@chromium.org>
  Hauke Mehrtens <hauke@hauke-m.de>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Ido Schimmel <idosch@nvidia.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Dike <jdike@akamai.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@siol.net>
  Jianqun Xu <jay.xu@rock-chips.com>
  Jimmy Assarsson <extja@kvaser.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Olsa <jolsa@redhat.com>
  Joakim Tjernlund <joakim.tjernlund@infinera.com>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Kailang Yang <kailang@realtek.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Kees Cook <keescook@chromium.org>
  Leo Yan <leo.yan@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Loris Fauster <loris.fauster@ttcontrol.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Lucas Stach <l.stach@pengutronix.de>
  Lukas Wunner <lukas@wunner.de>
  Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
  Luo Meng <luomeng12@huawei.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Chan <michael.chan@broadcom.com>
  Michael Guralnik <michaelgur@nvidia.com>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Kalderon <michal.kalderon@marvell.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mickaël Salaün <mic@linux.microsoft.com>
  Muchun Song <songmuchun@bytedance.com>
  Neal Cardwell <ncardwell@google.com>
  Necip Fazil Yildiran <fazilyildiran@gmail.com>
  Nenad Peric <nperic@gmail.com>
  Nishanth Menon <nm@ti.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Barker <pbarker@konsulko.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Machek <pavel@ucw.cz>
  PeiSen Hou <pshou@realtek.com>
  Peter Hutterer <peter.hutterer@who-t.net>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qinglang Miao <miaoqinglang@huawei.com>
  Quentin Perret <qperret@google.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ralph Siemsen <ralph.siemsen@linaro.org>
  Randy Dunlap <rdunlap@infradead.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Gushchin <guro@fb.com>
  Ryan Sharpelletti <sharpelletti@google.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sam Nobs <samuel.nobs@taitradio.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sasha Levin <sashal@kernel.org>
  Sean Nyekjaer <sean@geanix.com>
  Sean Tranchetti <stranche@codeaurora.org>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sergey Matyukevich <geomatsi@gmail.com>
  Shawn Guo <shawnguo@kernel.org>
  Shisong Qin <qinshisong1205@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Soheil Hassas Yeganeh <soheil@google.com>
  Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
  Stefan Haberland <sth@linux.ibm.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Van Asbroeck <thesven73@gmail.com>
  Sven Van Asbroeck <thesven73@gmail.com> # arm imx6 lan7430
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tariq Toukan <tariqt@nvidia.com>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tobias Waldekranz <tobias@waldekranz.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  V Sujith Kumar Reddy <vsujithk@codeaurora.org>
  Vadim Fedorenko <vfedorenko@novek.ru>
  Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vladimir Oltean <olteanv@gmail.com>
  Vladyslav Tarasiuk <vladyslavt@nvidia.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wang Hai <wanghai38@huawei.com>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  Wu Bo <wubo.oduw@gmail.com>
  Xie He <xie.he.0141@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Yi-Hung Wei <yihung.wei@gmail.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yu Kuai <yukuai3@huawei.com>
  Yuchung Cheng <ycheng@google.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  Zhenzhong Duan <zhenzhong.duan@gmail.com>

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
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
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
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
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
   fc8334619167..9f4b26f3ea18  9f4b26f3ea18cb2066c9e58a84ff202c71739a41 -> tested/linux-5.4

