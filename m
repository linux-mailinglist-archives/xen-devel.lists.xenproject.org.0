Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4374F08EA
	for <lists+xen-devel@lfdr.de>; Sun,  3 Apr 2022 13:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298003.507608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nay3z-0003Hs-8d; Sun, 03 Apr 2022 11:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298003.507608; Sun, 03 Apr 2022 11:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nay3z-0003En-4a; Sun, 03 Apr 2022 11:06:31 +0000
Received: by outflank-mailman (input) for mailman id 298003;
 Sun, 03 Apr 2022 11:06:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nay3y-0003Ed-AX; Sun, 03 Apr 2022 11:06:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nay3y-00028u-6P; Sun, 03 Apr 2022 11:06:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nay3x-0004jR-Rd; Sun, 03 Apr 2022 11:06:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nay3x-000864-R6; Sun, 03 Apr 2022 11:06:29 +0000
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
	bh=Ng4P1HYiuEkVk3GoqlVjbrossMPTUdYmjKppjoT2MJE=; b=bfzCg0+e8Dng1ZBt3zVTlOob35
	v1lkPMau5gBK7kFXYkd5iDS0gMBfFwjg7KPxft8AT3A9L75dWWcbM02BIP8O/5xEB+uVIE4qXHaTb
	5OPUsc9GQOUwQJbMXpF4gf5l6RogaKoVAOBUthjqeTpYOuYizjmeFmRLwX1D/9yhWZNY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169134-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 169134: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
X-Osstest-Versions-That:
    linux=e8b767f5e04097aaedcd6e06e2270f9fe5282696
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 Apr 2022 11:06:29 +0000

flight 169134 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169134/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169100
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 169100
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 169100
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 169100
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 169100
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 169100
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 169100
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 169100
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
baseline version:
 linux                e8b767f5e04097aaedcd6e06e2270f9fe5282696

Last test of basis   169100  2022-04-01 04:55:02 Z    2 days
Failing since        169123  2022-04-02 01:11:38 Z    1 days    2 attempts
Testing same since   169134  2022-04-02 20:17:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Sean O'Brien" <seobrien@chromium.org>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Ali Pouladi <quic_apouladi@quicinc.com>
  Almog Khaikin <almogkh@gmail.com>
  Alyssa Ross <hi@alyssa.is>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Anton Eidelman <anton.eidelman@gmail.com>
  Anton Eidelman <anton@lightbitslabs.com>
  Anup Patel <anup.patel@wdc.com>
  Anup Patel <apatel@ventanamicro.com>
  Anup Patel <apatel@vetanamicro.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Atish Patra <atishp@rivosinc.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Benson Leung <bleung@chromium.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boqun Feng <boqun.feng@gmail.com>
  Carlos Llamas <cmllamas@google.com>
  Charan Teja Kalla <quic_charante@quicinc.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chris Leech <cleech@redhat.com>
  Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Clément Léger <clement.leger@bootlin.com>
  Colin Ian King <colin.i.king@gmail.com>
  Danilo Krummrich <danilokrummrich@dk-develop.de>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David Disseldorp <ddiss@suse.de>
  David Gow <davidgow@google.com>
  David Howells <dhowells@redhat.com>
  David Matlack <dmatlack@google.com>
  David Woodhouse <dwmw2@infradead.org>
  David Woodhouse <dwmw@amazon.co.uk>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry Vyukov <dvyukov@google.com>
  Dongli Zhang <dongli.zhang@oracle.com>
  Dylan Yudaken <dylany@fb.com>
  Elliot Berman <quic_eberman@quicinc.com>
  Eric Dumazet <edumazet@google.com>
  Fangrui Song <maskray@google.com>
  fengping.yu <fengping.yu@mediatek.com>
  Guo Xuenan <guoxuenan@huawei.com>
  Gwendal Grignou <gwendal@chromium.org>
  Hans de Goede <hdegoede@redhat.com>
  Haowen Bai <baihaowen@meizu.com>
  Harald Freudenberger <freude@de.ibm.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hou Wenlong <houwenlong.hwl@antgroup.com>
  Hugh Dickins <hughd@google.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Hyunchul Lee <hyc.lee@gmail.com>
  Ian Rogers <irogers@google.com>
  Jackie Liu <liuyun01@kylinos.cn>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jeff LaBundy <jeff@labundy.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jiaxin Yu <jiaxin.yu@mediatek.com>
  Jim Mattson <jmattson@google.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby <jslaby@suse.cz>
  Joey Gouly <joey.gouly@arm.com>
  John Garry <john.garry@huawei.com>
  Jonghyeon Kim <tome01@ajou.ac.kr>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  José Expósito <jose.exposito89@gmail.com>
  Juergen Christ <jchrist@linux.ibm.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kees Cook <keescook@chromium.org>
  Kirill Tkhai <kirill.tkhai@openvz.org>
  Kris Bahnsen <kris@embeddedTS.com>
  Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
  Kuldeep Singh <singh.kuldeep87k@gmail.com>
  Lai Jiangshan <jiangshan.ljs@antgroup.com>
  Lars Ellenberg <lars.ellenberg@linbit.com>
  Li RongQing <lirongqing@baidu.com>
  Like Xu <likexu@tencent.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Loic Poulain <loic.poulain@linaro.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
  Marcos Alano <marcoshalano@gmail.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Markuss Broks <markuss.broks@gmail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthew Haughton <snafu109@gmail.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Mattijs Korpershoek <mkorpershoek@baylibre.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maíra Canal <maira.canal@usp.br>
  Meng Tang <tangmeng@uniontech.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michal Hocko <mhocko@suse.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Milan Broz <gmazyland@gmail.com>
  Ming Lei <ming.lei@redhat.com>
  Mohan Kumar <mkumard@nvidia.com>
  Monish Kumar R <monish.kumar.r@intel.com>
  Muchun Song <songmuchun@bytedance.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Naoya Horiguchi <naoya.horiguchi@nec.com>
  Nathan Chancellor <nathan@kernel.org>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nikita Shubin <n.shubin@yadro.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pankaj Raghav <p.raghav@samsung.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Gonda <pgonda@google.com>
  Peter Hutterer <peter.hutterer@who-t.net>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Prashant Malani <pmalani@chromium.org>
  Randy Dunlap <rdunlap@infradead.org>
  Raul E Rangel <rrangel@chromium.org>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Rik van Riel <riel@surriel.com>
  Rob Herring <robh@kernel.org>
  Roger Pau Monné <roger.pau@citrix.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell Currey <ruscur@russell.cc>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Samuel Holland <samuel@sholland.org>
  Sean Christopherson <seanjc@google.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sedat Dilek <sedat.dilek@gmail.com>
  Sergiu Moga <sergiu.moga@microchip.com>
  Shengjiu Wang <shengjiu.wang@gmail.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Stephen Boyd <swboyd@chromium.org> # coachz, wormdingler
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sungup Moon <sungup.moon@samsung.com>
  Takashi Iwai <tiwai@suse.de>
  Tal Zussman <tz2294@columbia.edu>
  Tanu M <tanu235m@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tobias Klauser <tklauser@distanz.ch>
  Tom Rix <trix@redhat.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Tony Lindgren <tony@atomide.com>
  Tzung-Bi Shih <tzungbi@google.com>
  Valentin Vidic <vvidic@valentin-vidic.from.hr>
  Vasant Karasulli <vkarasulli@suse.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Victor Erminpour <victor.erminpour@oracle.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vitaly Rodionov <vitalyr@opensource.cirrus.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wu Caize <zepan@sipeed.com>
  Xiaoke Wang <xkernel.wang@foxmail.com>
  Xiaomeng Tong <xiam0nd.tong@gmail.com>
  Xin Hao <xhao@linux.alibaba.com>
  Yi Liu <liu.yi24@zte.com.cn>
  Yi Wang <wang.yi59@zte.com.cn>
  Yinan Zhang <zhangyinan2019@email.szu.edu.cn>
  Yu Liao <liaoyu15@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Yuezhang Mo <Yuezhang.Mo@sony.com>
  Yunus Bas <y.bas@phytec.de>
  Zhang Wensheng <zhangwensheng5@huawei.com>
  Zheng Bin <zhengbin13@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>

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
   e8b767f5e040..be2d3ecedd99  be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf -> tested/linux-linus

