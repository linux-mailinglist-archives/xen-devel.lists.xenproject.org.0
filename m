Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F94F061A
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 22:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297915.507523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nak8r-0008A2-4g; Sat, 02 Apr 2022 20:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297915.507523; Sat, 02 Apr 2022 20:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nak8q-00088D-W1; Sat, 02 Apr 2022 20:14:36 +0000
Received: by outflank-mailman (input) for mailman id 297915;
 Sat, 02 Apr 2022 20:14:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nak8p-000883-Oz; Sat, 02 Apr 2022 20:14:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nak8p-0001GQ-Kn; Sat, 02 Apr 2022 20:14:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nak8o-00056A-4q; Sat, 02 Apr 2022 20:14:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nak8o-00007O-4K; Sat, 02 Apr 2022 20:14:34 +0000
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
	bh=4rcwtAlgqd7obI6fn5fDnrkhIW7GtxsJswSQLkeonSg=; b=DOG4HbLapNmhEKY2zS7Pr2rEkd
	1U/TtfYtHObVi9E6tkRp+zRsi6GyTV0HGwC4duxkfKEBjEoWJG5k75LpjEnM2rv4zwzhBNH0SSfBh
	T9EuAlqM541V69wUiZOo/h22vWin7ftUKKtU9v9e/DC/AjFnKOjN+VwPrZ/DYTg3UBJ8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169123-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 169123: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-pair:guests-nbd-mirror/debian:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guests-nbd-mirror/debian:fail:regression
    linux-linus:test-armhf-armhf-libvirt:host-ping-check-xen:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
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
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8467b0ed6ce37f7e3f87aa3826627dc9cc55ecb2
X-Osstest-Versions-That:
    linux=e8b767f5e04097aaedcd6e06e2270f9fe5282696
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 02 Apr 2022 20:14:34 +0000

flight 169123 linux-linus real [real]
flight 169133 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169123/
http://logs.test-lab.xenproject.org/osstest/logs/169133/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-pair        22 guests-nbd-mirror/debian fail REGR. vs. 169100
 test-amd64-amd64-libvirt-pair 22 guests-nbd-mirror/debian fail REGR. vs. 169100

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt     10 host-ping-check-xen fail pass in 169133-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 169133 like 169100
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 169133 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169100
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
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8467b0ed6ce37f7e3f87aa3826627dc9cc55ecb2
baseline version:
 linux                e8b767f5e04097aaedcd6e06e2270f9fe5282696

Last test of basis   169100  2022-04-01 04:55:02 Z    1 days
Testing same since   169123  2022-04-02 01:11:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Sean O'Brien" <seobrien@chromium.org>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Ali Pouladi <quic_apouladi@quicinc.com>
  Almog Khaikin <almogkh@gmail.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Anton Eidelman <anton.eidelman@gmail.com>
  Anton Eidelman <anton@lightbitslabs.com>
  Anup Patel <anup.patel@wdc.com>
  Anup Patel <apatel@ventanamicro.com>
  Anup Patel <apatel@vetanamicro.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Atish Patra <atishp@rivosinc.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
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
  David Disseldorp <ddiss@suse.de>
  David Howells <dhowells@redhat.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry Vyukov <dvyukov@google.com>
  Dongli Zhang <dongli.zhang@oracle.com>
  Dylan Yudaken <dylany@fb.com>
  Elliot Berman <quic_eberman@quicinc.com>
  Fangrui Song <maskray@google.com>
  fengping.yu <fengping.yu@mediatek.com>
  Hans de Goede <hdegoede@redhat.com>
  Haowen Bai <baihaowen@meizu.com>
  Harald Freudenberger <freude@de.ibm.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hugh Dickins <hughd@google.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Hyunchul Lee <hyc.lee@gmail.com>
  Jackie Liu <liuyun01@kylinos.cn>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jeff LaBundy <jeff@labundy.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jiaxin Yu <jiaxin.yu@mediatek.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby <jslaby@suse.cz>
  Joey Gouly <joey.gouly@arm.com>
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
  Lars Ellenberg <lars.ellenberg@linbit.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Loic Poulain <loic.poulain@linaro.org>
  Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
  Marcos Alano <marcoshalano@gmail.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Markuss Broks <markuss.broks@gmail.com>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthew Haughton <snafu109@gmail.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mattijs Korpershoek <mkorpershoek@baylibre.com>
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
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nikita Shubin <n.shubin@yadro.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pankaj Raghav <p.raghav@samsung.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Hutterer <peter.hutterer@who-t.net>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Raul E Rangel <rrangel@chromium.org>
  Rik van Riel <riel@surriel.com>
  Rob Herring <robh@kernel.org>
  Roger Pau Monné <roger.pau@citrix.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell Currey <ruscur@russell.cc>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Samuel Holland <samuel@sholland.org>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sergiu Moga <sergiu.moga@microchip.com>
  Shengjiu Wang <shengjiu.wang@gmail.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Stephen Boyd <swboyd@chromium.org> # coachz, wormdingler
  Steve French <stfrench@microsoft.com>
  Sungup Moon <sungup.moon@samsung.com>
  Takashi Iwai <tiwai@suse.de>
  Tobias Klauser <tklauser@distanz.ch>
  Tom Rix <trix@redhat.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Tony Lindgren <tony@atomide.com>
  Valentin Vidic <vvidic@valentin-vidic.from.hr>
  Vasant Karasulli <vkarasulli@suse.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Victor Erminpour <victor.erminpour@oracle.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Rodionov <vitalyr@opensource.cirrus.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wu Caize <zepan@sipeed.com>
  Xiaomeng Tong <xiam0nd.tong@gmail.com>
  Xin Hao <xhao@linux.alibaba.com>
  Yinan Zhang <zhangyinan2019@email.szu.edu.cn>
  Yu Liao <liaoyu15@huawei.com>
  Yuezhang Mo <Yuezhang.Mo@sony.com>
  Yunus Bas <y.bas@phytec.de>
  Zhang Wensheng <zhangwensheng5@huawei.com>
  Zheng Bin <zhengbin13@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>

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
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
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


Not pushing.

(No revision log; it would be 6148 lines long.)

