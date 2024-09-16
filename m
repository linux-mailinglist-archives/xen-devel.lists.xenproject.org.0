Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B297A924
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 00:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799726.1209720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqK5l-0005z5-MJ; Mon, 16 Sep 2024 22:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799726.1209720; Mon, 16 Sep 2024 22:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqK5l-0005x9-IN; Mon, 16 Sep 2024 22:21:09 +0000
Received: by outflank-mailman (input) for mailman id 799726;
 Mon, 16 Sep 2024 22:21:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqK5k-0005wz-CI; Mon, 16 Sep 2024 22:21:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqK5k-0005rp-10; Mon, 16 Sep 2024 22:21:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqK5j-0003UO-G6; Mon, 16 Sep 2024 22:21:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sqK5j-0001eD-Fe; Mon, 16 Sep 2024 22:21:07 +0000
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
	bh=uDT+2X6GKx94EZz9WkAoGOUcwV8YPlkWB5BJXM0K+r8=; b=B3gaVpZKAQ1gPXclDW33K7rGQn
	qUUuijdWacspuRUhKCB26lV67EoRU7U9YOJvrb7QmS/2dLtDQRF5Ax4wy0wwjp0xRV5s0EK9lh2RJ
	9a8NTW7jobQrMl7TCdgxPQsK8Ef+VaJxCzfjQWUuI0qY9L2RC5zEARzcjs2GHSWGTpL8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187721: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
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
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=adfc3ded5c33d67e822525f95404ef0becb099b8
X-Osstest-Versions-That:
    linux=114143a595895c03fbefccfd8346fc51fb4908ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Sep 2024 22:21:07 +0000

flight 187721 linux-linus real [real]
flight 187724 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187721/
http://logs.test-lab.xenproject.org/osstest/logs/187724/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 187717

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187717
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187717
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187717
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187717
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187717
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187717
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
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
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                adfc3ded5c33d67e822525f95404ef0becb099b8
baseline version:
 linux                114143a595895c03fbefccfd8346fc51fb4908ed

Last test of basis   187717  2024-09-16 05:13:22 Z    0 days
Testing same since   187721  2024-09-16 12:44:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aboorva Devarajan <aboorvad@linux.ibm.com>
  Adam Lackorzynski <adam@l4re.org>
  Adam Young <ayoung@amperecomputing.com>
  Adrian Ratiu <adrian.ratiu@collabora.com>
  Adrien Destugues <adrien.destugues@opensource.viveris.fr>
  al0uette@outlook.com
  Aleksa Sarai <cyphar@cyphar.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alvaro Parker <alparkerdf@gmail.com>
  Amit Vadhavana <av2082000@gmail.com>
  Anand Moon <linux.amoon@gmail.com>
  Anastasia Belova <abelova@astralinux.ru>
  Andrew Jones <ajones@ventanamicro.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anuj Gupta <anuj20.g@samsung.com>
  Anup Patel <anup@brainfault.org>
  Anup Patel <apatel@ventanamicro.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Artur Paszkiewicz <artur.paszkiewicz@intel.com>
  Atish Patra <atishp@rivosinc.com>
  Baokun Li <libaokun1@huawei.com>
  Bibo Mao <maobibo@loongson.cn>
  Binbin Zhou <zhoubinbin@loongson.cn>
  Bjorn Helgaas <bhelgaas@google.com>
  Björn Töpel <bjorn@rivosinc.com>
  Boris Burkov <boris@bur.io>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wens@csie.org>
  Chenliang Li <cliang01.li@samsung.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunhai Guo <guochunhai@vivo.com>
  Clément Léger <cleger@rivosinc.com>
  Colin Ian King <colin.i.king@gmail.com>
  Colton Lewis <coltonlewis@google.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Lezcano <daniel.lezcano@linaro.org> # rk3399-rock960
  Danila Tikhonov <danila@jiaxyga.com>
  Dave Jiang <dave.jiang@intel.com>
  David Howells <dhowells@redhat.com>
  David Sterba <dsterba@suse.com>
  David Wang <00107082@163.com>
  Dennis Lam <dennis.lamerice@gmail.com>
  Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
  Dhruva Gole <d-gole@ti.com>
  Eric Biggers <ebiggers@google.com>
  Esther Shimanovich <eshimanovich@chromium.org>
  Fabio Estevam <festevam@denx.de>
  Felix Moessbauer <felix.moessbauer@siemens.com>
  Filipe Manana <fdmanana@suse.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  George Stark <gnstark@salutedevices.com>
  Grzegorz Prajsner <grzegorz.prajsner@ionos.com>
  Haibo Xu <haibo1.xu@intel.com>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hannes Reinecke <hare@kernel.org>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Holmberg <hans.holmberg@wdc.com>
  Hongbo Li <lihongbo22@huawei.com>
  Hongzhen Luo <hongzhen@linux.alibaba.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Huan Yang <link@vivo.com>
  Huisong Li <lihuisong@huawei.com>
  Ian Kent <raven@themaw.net>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jakub Kicinski <kuba@kernel.org>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
  Jintack Lim <jintack.lim@linaro.org>
  Joe Damato <jdamato@fastly.com>
  Joel Savitz <jsavitz@redhat.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Johannes Thumshirn <jthumshirn@wdc.com>
  John B. Wyatt IV <jwyatt@redhat.com>
  John B. Wyatt IV <sageofredondo@gmail.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jose Marinho <jose.marinho@arm.com>
  Josef Bacik <josef@toxicpanda.com>
  Julian Sun <sunjunchao2870@gmail.com>
  Junchao Sun <sunjunchao2870@gmail.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kanchan Joshi <joshi.k@samsung.com>
  Keith Busch <kbusch@kernel.org>
  Kevin Hilman <khilman@baylibre.com>
  Kienan Stewart <kstewart@efficios.com>
  Konstantin Ovsepian <ovs@ovs.to>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kundan Kumar <kundan.kumar@samsung.com>
  Leo Martins <loemra.dev@gmail.com>
  Li Chen <me@linux.beauty>
  Li RongQing <lirongqing@baidu.com>
  Li Zetao <lizetao1@huawei.com>
  Li Zhang <zhanglikernel@gmail.com>
  Li Zhijian <lizhijian@fujitsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Jing <liujing@cmss.chinamobile.com>
  Luca Stefani <luca.stefani.ge1@gmail.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Luke D. Jones <luke@ljones.dev>
  Marc Aurèle La France <tsi@tuyoix.net>
  Marc Zyngier <maz@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin Karsten <mkarsten@uwaterloo.ca>
  Mateusz Guzik <mjguzik@gmail.com>
  Mateusz Kusiak <mateusz.kusiak@intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Md Haris Iqbal <haris.iqbal@ionos.com>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michal Hocko <mhocko@suse.com>
  Mike Galbraith <umgwanakikbuti@gmail.com>
  Mike Rapoport (Microsoft) <rppt@kernel.org>
  Mikhail Lobanov <m.lobanov@rosalinux.ru>
  Ming Lei <ming.lei@redhat.com>
  Mohit0404 <mohitpawar@mitaoe.ac.in>
  Muhammad Qasim Abdul Majeed <qasim.majeed20@gmail.com>
  Niklas Cassel <cassel@kernel.org>
  Nikunj Kela <quic_nkela@quicinc.com>
  Nishanth Menon <nm@ti.com>
  Ofir Gal <ofir.gal@volumez.com>
  Olaf Hering <olaf@aepfle.de>
  Oliver Upton <oliver.upton@linux.dev>
  Olivier Langlois <olivier@trillion01.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Begunkov <asml.silence@gmail.com>
  Pei Xiao <xiaopei01@kylinos.cn>
  Peng Fan <peng.fan@nxp.com>
  Peter Kästle <peter@piie.net>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Phillip Lougher <phillip@squashfs.org.uk>
  Punit Agrawal <punit.agrawal@bytedance.com>
  Puranjay Mohan <pjy@amazon.com>
  Qais Yousef <qyousef@layalina.io>
  Qianqiang Liu <qianqiang.liu@163.com>
  Qu Wenruo <wqu@suse.com>
  R Sundar <prosunofficial@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raphael Gallais-Pou <rgallaispou@gmail.com>
  Ricardo Koller <ricarkol@google.com>
  Ricardo Neri <ricardo.neri-calderon@linux.intel.com> # scale invariance
  Riyan Dhiman <riyandhiman14@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saket Dumbre <saket.dumbre@intel.com>
  Sandeep Dhavale <dhavale@google.com>
  Sanket Goswami <Sanket.Goswami@amd.com>
  Sean Christopherson <seanjc@google.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sebastian Ene <sebastianene@google.com>
  Seiji Nishikawa <snishika@redhat.com>
  Shen Lichuan <shenlichuan@vivo.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Sia Jee Heng <jeeheng.sia@starfivetech.com>
  Snehal Koukuntla <snehalreddy@google.com>
  Song Gao <gaosong@loongson.cn>
  Song Liu <song@kernel.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stuart Hayes <stuart.w.hayes@gmail.com>
  Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>
  Sunil V L <sunilvl@ventanamicro.com>
  syzbot+4fc98ed414ae63d1ada2@syzkaller.appspotmail.com
  Tamim Khan <tamim@fusetak.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Todd Brandt <todd.e.brandt@linux.intel.com>
  Uros Bizjak <ubizjak@gmail.com>
  Vasily Khoruzhick <anarsoul@gmail.com>
  vderp@icloud.com
  Vineet Gupta <vgupta@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wang Long <w@laoqinren.net>
  Werner Sembach <wse@tuxedocomputers.com>
  Will Deacon <will@kernel.org>
  Wouter Verhelst <w@uter.be>
  Xiao Ni <xni@redhat.com>
  Xiaxi Shen <shenxiaxi26@gmail.com>
  Xueqin Luo <luoxueqin@kylinos.cn>
  Yan Zhen <yanzhen@vivo.com>
  Yang Ruibin <11162571@vivo.com>
  Yiyang Wu <toolmanp@tlmp.cc>
  Yo-Jung (Leo) Lin <0xff07@gmail.com>
  Youling Tang <tangyouling@kylinos.cn>
  Yu Jiaoliang <yujiaoliang@vivo.com>
  Yu Kuai <yukuai3@huawei.com>
  Yue Haibing <yuehaibing@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Yuesong Li <liyuesong@vivo.com>
  Yujie Liu <yujie.liu@intel.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhang Zekun <zhangzekun11@huawei.com>

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


Not pushing.

(No revision log; it would be 17686 lines long.)

