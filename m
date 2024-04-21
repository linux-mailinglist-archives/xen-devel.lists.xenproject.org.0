Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0C8ABDCE
	for <lists+xen-devel@lfdr.de>; Sun, 21 Apr 2024 02:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709446.1108598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryKdc-0000A9-4v; Sun, 21 Apr 2024 00:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709446.1108598; Sun, 21 Apr 2024 00:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryKdc-00008b-1Q; Sun, 21 Apr 2024 00:00:56 +0000
Received: by outflank-mailman (input) for mailman id 709446;
 Sun, 21 Apr 2024 00:00:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryKdZ-00008O-UD; Sun, 21 Apr 2024 00:00:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryKdZ-0003TV-Gy; Sun, 21 Apr 2024 00:00:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryKdZ-0004MO-4i; Sun, 21 Apr 2024 00:00:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ryKdZ-000190-3z; Sun, 21 Apr 2024 00:00:53 +0000
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
	bh=wqrC6GkSKUETMd4qGMyLSZ3iRmzMoWstBcngYzclKs4=; b=ElWvnvdxiBwGb/ufb93i6CCWkv
	rupX5r19AtNqQXiRUzT/9141QvXDyo5yiRz1pG+NbFMkxntk0NTrgsB/Gt9okZvulTd/p9EuE6ElN
	AJJoLYmhFAWbyS/G3pXXyazBsqB5Vhks/R1Pk3fPeawCAluwEK5T+NEn/cfZ2vcmOQ+8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185746-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185746: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6741e066ec7633450d3186946035c1f80c4226b8
X-Osstest-Versions-That:
    linux=bf1e3b1cb1e002ed1590c91f1a24433b59322368
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Apr 2024 00:00:53 +0000

flight 185746 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185746/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185299
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185299
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
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

version targeted for testing:
 linux                6741e066ec7633450d3186946035c1f80c4226b8
baseline version:
 linux                bf1e3b1cb1e002ed1590c91f1a24433b59322368

Last test of basis   185299  2024-04-10 14:42:59 Z   10 days
Failing since        185434  2024-04-13 11:42:42 Z    7 days    7 attempts
Testing same since   185746  2024-04-20 18:14:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Dunlap <acdunlap@google.com>
  Alban Boyé <alban.boye@protonmail.com>
  Aleksandr Burakov <a.burakov@rosalinux.ru>
  Alex Constantino <dreaming.about.electric.sheep@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Henrie <alexhenrie24@gmail.com>
  Amit Bernstein <amitbern@amazon.com>
  Andrew Lunn <andrew@lunn.ch>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Ard Biesheuvel <ardb@kernel.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Aric Cyr <aric.cyr@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Arthur Kiyanovski <akiyano@amazon.com>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Baochen Qiang <quic_bqiang@quicinc.com>
  Bharath SM <bharathsm@microsoft.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bo Ye <bo.ye@mediatek.com>
  Boqun Feng <boqun.feng@gmail.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  C Cheng <C.Cheng@mediatek.com>
  Carolina Jubran <cjubran@nvidia.com>
  Chancel Liu <chancel.liu@nxp.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Colin Ian King <colin.i.king@gmail.com>
  Cosmin Ratiu <cratiu@nvidia.com>
  Dai Ngo <dai.ngo@oracle.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Drake <drake@endlessos.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Machon <daniel.machon@microchip.com>
  Daniel Sneddon <daniel.sneddon@linux.intel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David Arinzon <darinzon@amazon.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Edward Adam Davis <eadavis@qq.com>
  Eelco Chaudron <echaudro@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Fudongwang <fudong.wang@amd.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geetha sowjanya <gakula@marvell.com>
  Gergo Koteles <soyer@irl.hu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gwendal Grignou <gwendal@chromium.org>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Ian Rogers <irogers@google.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Maximets <i.maximets@ovn.org>
  Ingo Molnar <mingo@kernel.org>
  Jacob Keller <jacob.e.keller@intel.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jammy Huang <jammy_huang@aspeedtech.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <jasowang@redhat.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jian-Hong Pan <jhp@endlessos.org>
  Jiawei Fu (iBug) <i@ibugone.com>
  Jiawei Fu <i@ibugone.com>
  Jiri Benc <jbenc@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  John Ogness <john.ogness@linutronix.de>
  John Stultz <jstultz@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Justin Tee <justin.tee@broadcom.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karel Balej <balejk@matfyz.cz>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Kevin Loughlin <kevinloughlin@google.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kunwu Chan <chentao@kylinos.cn>
  Leon Romanovsky <leon@kernel.org>
  Lijo Lazar <lijo.lazar@amd.com>
  linke li <lilinke99@qq.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Manjunath Patil <manjunath.b.patil@oracle.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Markus Elfring <elfring@users.sourceforge.net>
  Markuss Broks <markuss.broks@gmail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Maxime Ripard <mripard@kernel.org>
  Maíra Canal <mcanal@igalia.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Luczaj <mhal@rbox.co>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Marshall <hubcap@omnibond.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  mosomate <mosomate@gmail.com>
  Mukesh Sisodiya <mukesh.sisodiya@intel.com>
  Máté Mosonyi <mosomate@gmail.com>
  Namhyung Kim <namhyung@kernel.org>
  Nini Song <nini.song@mediatek.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Petr Tesarik <petr@tesarici.cz>
  Petre Rodan <petre.rodan@subdimension.ro>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Ron Economos <re@w6rz.net>
  Saeed Mahameed <saeedm@nvidia.com>
  Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
  Samuel Dionne-Riel <samuel@dionne-riel.com>
  Sandipan Das <sandipan.das@amd.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  SeongJae Park <sj@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shawn Guo <shawnguo@kernel.org>
  Shay Agroskin <shayagr@amazon.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Sven Eckelmann <sven@narfation.org>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tariq Toukan <tariqt@nvidia.com>
  Tasos Sahanidis <tasos@tasossah.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Huang <Tim.Huang@amd.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Vidya Srinivas <vidya.srinivas@intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  xiabing <xiabing12@h-partners.com>
  Xiang Chen <chenxiang66@hisilicon.com>
  Yann Sionneau<ysionneau@kalrayinc.com>
  Ye Bin <yebin10@huawei.com>
  Yihang Li <liyihang9@huawei.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zheng Yejian <zhengyejian1@huawei.com>

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
   bf1e3b1cb1e0..6741e066ec76  6741e066ec7633450d3186946035c1f80c4226b8 -> tested/linux-6.1

