Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EC6A0017
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 01:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499812.771091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUzVM-0003jJ-Fj; Thu, 23 Feb 2023 00:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499812.771091; Thu, 23 Feb 2023 00:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUzVM-0003hf-CP; Thu, 23 Feb 2023 00:30:36 +0000
Received: by outflank-mailman (input) for mailman id 499812;
 Thu, 23 Feb 2023 00:30:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pUzVL-0003hV-HX; Thu, 23 Feb 2023 00:30:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pUzVL-0003Sk-Db; Thu, 23 Feb 2023 00:30:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pUzVL-0003Ln-1o; Thu, 23 Feb 2023 00:30:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pUzVL-00007Y-1G; Thu, 23 Feb 2023 00:30:35 +0000
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
	bh=IEv7ZPbtKTTdAKzE99LKV7xkAdr5e0O/5rqiaA2Y2kA=; b=O8H1qP4OnSmoLnH4Ko8cbYcy7/
	/Ect0b9d8UsBxxMeU/84oGR3hbCWbKJkuRQomnpvCFGQZES1wYWZVFJZmpLrXJ4ZlKxqhcMCJp2nK
	HPBpSGE/OQKOdXpEN2L+oiaredlmJOZfQHFMFfJJdAr4e/OYwHfPDW+zKSjEH7c69j18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178125-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 178125: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-5.4:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=64121e2adf7d6fe2e684eec09ec9b9986d951d42
X-Osstest-Versions-That:
    linux=59342376e8f0c704299dc7a2c14fed07ffb962e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Feb 2023 00:30:35 +0000

flight 178125 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178125/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install             fail like 176460
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176722
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install             fail like 176810
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176810
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 176810
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176810
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176810
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176810
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176810
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 176810
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176810
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                64121e2adf7d6fe2e684eec09ec9b9986d951d42
baseline version:
 linux                59342376e8f0c704299dc7a2c14fed07ffb962e2

Last test of basis   176810  2023-02-10 03:27:19 Z   12 days
Testing same since   178125  2023-02-22 12:17:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Thompson <dev@aaront.org>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Potapenko <glider@google.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Amit Engel <Amit.Engel@dell.com>
  Anand Jain <anand.jain@oracle.com>
  Andrea Righi <andrea.righi@canonical.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andreas Schwab <schwab@suse.de>
  Andrei Gherzan <andrei.gherzan@canonical.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andrey.konovalov@linaro.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
  Anton Gusev <aagusev@ispras.ru>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Artemii Karasev <karasev@ispras.ru>
  Bart Van Assche <bvanassche@acm.org>
  Bo Liu <bo.liu@senarytech.com>
  Brian Foster <bfoster@redhat.com>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Chandan Babu R <chandan.babu@oracle.com>
  Chandan Kumar Rout <chandanx.rout@intel.com> (A Contingent Worker at Intel)
  Chao Yu <chao@kernel.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chris Healy <healych@amazon.com>
  Christian Hopps <chopps@chopps.org>
  Christoph Hellwig <hch@lst.de>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <error27@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Darrick J. Wong <darrick.wong@oracle.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dean Luick <dean.luick@cornelisnetworks.com>
  Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
  Dennis Wassenberg <dennis.wassenberg@secunet.com>
  Devid Antonio Filoni <devid.filoni@egluetechnologies.com>
  Ding Hui <dinghui@sangfor.com.cn>
  Dmitry Perchanov <dmitry.perchanov@intel.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dongliang Mu <dzm91@hust.edu.cn>
  Dragos Tatulea <dtatulea@nvidia.com>
  Eduard Zingerman <eddyz87@gmail.com>
  Eelco Chaudron <echaudro@redhat.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Riemann <felix.riemann@sma.de>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  FUKAUMI Naoki <naoki@radxa.com>
  George Kennedy <george.kennedy@oracle.com>
  Gilles BULOZ <gilles.buloz@kontron.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Gurucharan G <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Gwendal Grignou <gwendal@chromium.org>
  Hangbin Liu <liuhangbin@gmail.com>
  Hannes Reinecke <hare@suse.de>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hulk Robot <hulkrobot@huawei.com>
  Hyunwoo Kim <v4bel@theori.io>
  Ido Schimmel <idosch@nvidia.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Andrysiak <jakub.andrysiak@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Xing <kernelxing@tencent.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jeff Moyer <jmoyer@redhat.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jim Minter <jimminter@microsoft.com>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  Johannes Zink <j.zink@pengutronix.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Kailang Yang <kailang@realtek.com>
  Kajol Jain<kjain@linux.ibm.com>
  Kalle Valo <kvalo@kernel.org>
  Kees Cook <keescook@chromium.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Longlong Xia <xialonglong1@huawei.com>
  Luiz Capitulino <luizcap@amazon.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Marius Dinu <marius@psihoexpert.ro>
  Mark Brown <broonie@kernel.org>
  Mark Pearson <mpearson-lenovo@squebb.ca>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <mwilck@suse.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Maxim Korotkov <korotkov.maxim.s@gmail.com>
  Mengchi Cheng <mengcc@amazon.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Miko Larsson <mikoxyzzz@gmail.com>
  Minsuk Kang <linuxlovemin@yonsei.ac.kr>
  Miroslav Zatko <mzatko@mirexoft.com>
  Muchun Song <songmuchun@bytedance.com>
  Munehisa Kamata <kamatam@amazon.com>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Natalia Petrova <n.petrova@fintech.ru>
  Neel Patel <neel.patel@amd.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Olivier Moysan <olivier.moysan@foss.st.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Parav Pandit <parav@nvidia.com>
  Peter Suti <peter.suti@streamunlimited.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Xu <peterx@redhat.com>
  Peter Zijlstra <peterz@infradead.org>
  Phillip Lougher <phillip@squashfs.org.uk>
  Pierluigi Passaro <pierluigi.p@variscite.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Pietro Borrello <borrello@diag.uniroma1.it>
  Prashant Malani <pmalani@chromium.org>
  Qi Zheng <zhengqi.arch@bytedance.com>
  Qingfang DENG <dqfext@gmail.com>
  Rafał Miłecki <rafal@milecki.pl>
  Randy Dunlap <rdunlap@infradead.org>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sasha Levin <sashal@kernel.org>
  Seth Jenkins <sethjenkins@google.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shaoying Xu <shaoyi@amazon.com>
  Shawn Guo <shawnguo@kernel.org>
  Shiju Jose <shiju.jose@huawei.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shunsuke Mie <mie@igel.co.jp>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Suren Baghdasaryan <surenb@google.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Murphy <murphyt7@tcd.ie>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Udipto Goswami <quic_ugoswami@quicinc.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Gorbik <gor@linux.ibm.com>
  Vyacheslav Bocharov <adeep@lexina.in>
  Werner Sembach <wse@tuxedocomputers.com>
  Wesley Cheng <wcheng@codeaurora.org>
  Wolfram Sang <wsa@kernel.org>
  Xin Long <lucien.xin@gmail.com>
  Xingyuan Mo <hdthky0@gmail.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Xiubo Li <xiubli@redhat.com>
  Xu Yilun <yilun.xu@intel.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yuan Can <yuancan@huawei.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       pass    


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
   59342376e8f0..64121e2adf7d  64121e2adf7d6fe2e684eec09ec9b9986d951d42 -> tested/linux-5.4

