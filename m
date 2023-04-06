Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA46D90FD
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 10:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518763.805601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkKXb-00067a-2R; Thu, 06 Apr 2023 08:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518763.805601; Thu, 06 Apr 2023 08:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkKXa-00065W-Uk; Thu, 06 Apr 2023 08:00:18 +0000
Received: by outflank-mailman (input) for mailman id 518763;
 Thu, 06 Apr 2023 08:00:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkKXa-00065G-B8; Thu, 06 Apr 2023 08:00:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkKXa-0003J3-5p; Thu, 06 Apr 2023 08:00:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkKXZ-00082A-ME; Thu, 06 Apr 2023 08:00:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pkKXZ-0000Vr-Ln; Thu, 06 Apr 2023 08:00:17 +0000
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
	bh=IIsLIH/neFqcWgqz19FvOG2UWrYlycCuOvqI7ySeylo=; b=c1yQ59Q4/bY3X05mp7VW6twTPL
	YxeRZyg1zvaocZrVY86rFlXCt9Qnag/pW3/aLDvjhdreR1/VtTw1aKl2fRkn4qu77iXNT0VVAFXn6
	RCCdEgGxYjhaPz5gVI9Xha8qgEOj8h8S74hwqzA8UZKqAJFRCd4XC2X05iq4BYIX51dE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180149-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 180149: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
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
    linux=32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
X-Osstest-Versions-That:
    linux=09b1a76e7879184fb35d71a221cae9451b895fff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Apr 2023 08:00:17 +0000

flight 180149 linux-5.4 real [real]
flight 180165 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180149/
http://logs.test-lab.xenproject.org/osstest/logs/180165/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl            7 xen-install         fail pass in 180165-retest
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 180165-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180066
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180066
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180066
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180066
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180066
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180066
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180066
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180066
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180066
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
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
 linux                32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
baseline version:
 linux                09b1a76e7879184fb35d71a221cae9451b895fff

Last test of basis   180066  2023-03-30 13:12:10 Z    6 days
Testing same since   180149  2023-04-05 09:43:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrien Thierry <athierry@redhat.com>
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Aring <aahringo@redhat.com>
  Alexander Lobakin <aleksander.lobakin@intel.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Ghiti <alex@ghiti.fr>
  Alexei Starovoitov <ast@kernel.org>
  Alvin Šipraga <alsi@bang-olufsen.dk>
  Anand Jain <anand.jain@oracle.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>
  Bharath SM <bharathsm@microsoft.com>
  Caleb Sander <csander@purestorage.com>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea@microchip.com> # on SAMA7G5
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  Corinna Vinschen <vinschen@redhat.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniil Tatianin <d-tatianin@yandex-team.ru>
  David Disseldorp <ddiss@suse.de>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dragos-Marian Panait <dragos.panait@windriver.com>
  Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  Enrico Sau <enrico.sau@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@denx.de>
  Faicker Mo <faicker.mo@ucloud.cn>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Fietkau <nbd@nbd.name>
  Finn Thain <fthain@linux-m68k.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Frank Crawford <frank@crawford.emu.id.au>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Geoff Levand <geoff@infradead.org>
  George Kennedy <george.kennedy@oracle.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Ivan Bornyakov <i.bornyakov@metrotek.ru>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Jakob Koschel <jkl820.git@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jan Kara via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Joel Selvaraj <joelselvaraj.oss@gmail.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Juergen Gross <jgross@suse.com>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Li Zetao <lizetao1@huawei.com>
  Liang He <windhl@126.com>
  Lin Li <lilin@redhat.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenz Bauer <lmb@isovalent.com>
  Lorenz Bauer <lorenz.bauer@isovalent.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lucas Stach <l.stach@pengutronix.de>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Maher Sanalla <msanalla@nvidia.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Szlosek <marek.szlosek@intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Maurizio Lombardi <mlombard@redhat.com>
  Meena Shanmugam <meenashanmugam@google.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Schmitz <schmitzmic@gmail.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  msizanoen <msizanoen@qtmlabs.xyz>
  Nathan Huckleberry <nhuck@google.com>
  NeilBrown <neilb@suse.de>
  Nilesh Javali <njavali@marvell.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara (SUSE) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pawel Laszczak <pawell@cadence.com>
  Peter Chen <peter.chen@kernel.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Radoslaw Tyl <radoslawx.tyl@intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Kagan <rkagan@amazon.de>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sasha Levin <sashal@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shawn Guo <shawnguo@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Song Liu <song@kernel.org>
  SongJingyi <u201912584@hust.edu.cn>
  Stan Johnson <userm57@yahoo.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Steffen Bätz <steffen@innosonix.de>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Steve French <stfrench@microsoft.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Szymon Heidrich <szymon.heidrich@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tomas Henzl <thenzl@redhat.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Vasily Gorbik <gor@linux.ibm.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Wei Chen <harperchen1110@gmail.com>
  Wolfram Sang <wsa@kernel.org>
  Xu Yang <xu.yang_2@nxp.com>
  Yaroslav Furman <yaro330@gmail.com>
  Ye Bin <yebin10@huawei.com>
  Yu Kuai <yukuai3@huawei.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  Zhang Qiao <zhangqiao22@huawei.com>
  Zheng Wang <zyytlz.wz@163.com>
  Zubin Mithra <zsm@google.com>
  Álvaro Fernández Rojas <noltari@gmail.com>

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
 test-amd64-i386-xl                                           fail    
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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
   09b1a76e7879..32bea3bac5ca  32bea3bac5ca484c6f7e302c8c96fc686f62e7b4 -> tested/linux-5.4

