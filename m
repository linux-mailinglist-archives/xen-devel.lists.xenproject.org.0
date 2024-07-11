Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CC92F07C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 22:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757691.1166800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0pD-0001Vi-9U; Thu, 11 Jul 2024 20:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757691.1166800; Thu, 11 Jul 2024 20:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0pD-0001UC-6R; Thu, 11 Jul 2024 20:55:35 +0000
Received: by outflank-mailman (input) for mailman id 757691;
 Thu, 11 Jul 2024 20:55:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS0pB-0001U2-W6; Thu, 11 Jul 2024 20:55:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS0pB-0004rD-RW; Thu, 11 Jul 2024 20:55:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS0pB-0007c8-DM; Thu, 11 Jul 2024 20:55:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sS0pB-0005ZV-Cn; Thu, 11 Jul 2024 20:55:33 +0000
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
	bh=5bz9njl8qGqLNdjTZZR5YplrHosNNesajzZfFJCDGRY=; b=KCufPqUCW1z6qsYZE3kc8RjSav
	+6Ex55UecDxo17awGH62uGBF5fYendnoGvPWJ0LmFMyDzrTEWoabTPptwP/TT9yrGZ5DM97dcifC6
	KMsPqLeQ2MZZQZl5NmnbVRT18RInXpo/J5C1ui7Srz9nvrDQIJ/4qA2XlKaX3UkrYsYw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186763-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186763: tolerable FAIL - PUSHED
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
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=266ee8e06d5baa186a0b5b8727eb99ae2d00dc9c
X-Osstest-Versions-That:
    linux=7753af06eebfb56b44673bbfcb0b78d73a54ede9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Jul 2024 20:55:33 +0000

flight 186763 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186763/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186712
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186712
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186712
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186712
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186712
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186712
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                266ee8e06d5baa186a0b5b8727eb99ae2d00dc9c
baseline version:
 linux                7753af06eebfb56b44673bbfcb0b78d73a54ede9

Last test of basis   186712  2024-07-06 07:09:54 Z    5 days
Testing same since   186763  2024-07-11 11:12:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ajay Singh <ajay.kathat@microchip.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexis Lothoré <alexis.lothore@bootlin.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Armin Wolf <W_Armin@gmx.de>
  Bjorn Andersson <andersson@kernel.org>
  Chao Yu <chao@kernel.org>
  Chenghai Huang <huangchenghai2@huawei.com>
  Chris Mi <cmi@nvidia.com>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Corinna Vinschen <vinschen@redhat.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dave Jiang <dave.jiang@intel.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Diederik de Haas <didi.debian@cknow.org>
  Dima Ruinskiy <dima.ruinskiy@intel.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dragan Simic <dsimic@manjaro.org>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Erick Archer <erick.archer@outlook.com>
  Erico Nunes <nunes.erico@gmail.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Fietkau <nbd@nbd.name>
  Florian Westphal <fw@strlen.de>
  Gautam Menghani <gautam@linux.ibm.com>
  George Stark <gnstark@salutedevices.com>
  Ghadi Elie Rahme <ghadi.rahme@canonical.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Kurz <groug@kaod.org>
  Guangwu Zhang <guazhang@redhat.com>
  GUO Zihua <guozihua@huawei.com>
  Hailey Mothershead <hailmo@amazon.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  hmtheboy154 <buingoc67@gmail.com>
  Holger Dengler <dengler@linux.ibm.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jean Delvare <jdelvare@suse.de>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jerry Dai <jerry.dai@intel.com>
  Jian-Hong Pan <jhp@endlessos.org>
  Jianbo Liu <jianbol@nvidia.com>
  Jim Wylder <jwylder@google.com>
  Jimmy Assarsson <extja@kvaser.com>
  Jinliang Zheng <alexjlzheng@tencent.com>
  John Johansen <john.johansen@canonical.com>
  John Meneghini <jmeneghi@redhat.com>
  John Schoenick <johns@valvesoftware.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jose E. Marchesi <jose.marchesi@oracle.com>
  Jozef Hopko <jozef.hopko@altana.com>
  Justin Stitt <justinstitt@google.com>
  Kalle Valo <kvalo@kernel.org>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kemal <kmal@cock.li>
  kernelci.org bot <bot@kernelci.org>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Kundan Kumar <kundan.kumar@samsung.com>
  Lee Jones <lee@kernel.org>
  Len Brown <len.brown@intel.com>
  Leon Romanovsky <leon@kernel.org>
  Lu Yao <yaolu@kylinos.cn>
  Luca Weiss <luca.weiss@fairphone.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lyude Paul <lyude@redhat.com>
  Ma Jun <Jun.Ma2@amd.com>
  Ma Ke <make24@iscas.ac.cn>
  Mahesh Salgaonkar <mahesh@linux.ibm.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Schwartz <mattschwartz@gwu.edu>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Michael Bunk <micha@freedict.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Guralnik <michaelgur@nvidia.com>
  Michael Krummsdorf <michael.krummsdorf@tq-group.com>
  Michal Hocko <mhocko@suse.com>
  Mickaël Salaün <mic@digikod.net>
  Mike Marshall <hubcap@omnibond.com>
  Miles Chen <miles.chen@mediatek.com>
  Mingming Su <mingming.su@mediatek.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Naama Meir <naamax.meir@linux.intel.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Nicholas Piggin <npiggin@gmail.com>
  Niklas Neronin <niklas.neronin@linux.intel.com>
  Nilay Shroff <nilay@linux.ibm.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Phillip Potter <phil@philpotter.co.uk>
  Pin-yen Lin <treapking@chromium.org>
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
  Qiang Yu <yuq825@gmail.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Richard Weinberger <richard@nod.at>
  Roberto Sassu <roberto.sassu@huawei.com>
  Robin Murphy <robin.murphy@arm.com>
  Ron Economos <re@w6rz.net>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Salvatore Bonaccorso <carnil@debian.org>
  Sam Sun <samsun1006219@gmail.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Sasha Neftin <sasha.neftin@intel.com>
  Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>
  Saurav Kashyap <skashyap@marvell.com>
  SeongJae Park <sj@kernel.org>
  Shigeru Yoshida <syoshida@redhat.com>
  Shirisha Ganta <shirisha@linux.ibm.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <horms@kernel.org>
  Song Shuai <songshuaishuai@tinylab.org>
  Sourabh Jain <sourabhjain@linux.ibm.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Stephen Boyd <sboyd@kernel.org>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tim Huang <Tim.Huang@amd.com>
  Tomas Henzl <thenzl@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Val Packett <val@packett.cool>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Vitaly Lifshits <vitaly.lifshits@intel.com>
  Waiman Long <longman@redhat.com>
  Wang Yong <wang.yong12@zte.com.cn>
  Wayne Lin <wayne.lin@amd.com>
  Witold Sadowski <wsadowski@marvell.com>
  Wren Turkal <wt@penguintechs.org>
  Xiaochun Lu <xiaochun.lu@bytedance.com>
  Xin Long <lucien.xin@gmail.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yuchung Cheng <ycheng@google.com>
  Yue Sun <samsun1006219@gmail.com>
  Zijian Zhang <zijianzhang@bytedance.com>
  Zijun Hu <quic_zijuhu@quicinc.com>

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
   7753af06eebf..266ee8e06d5b  266ee8e06d5baa186a0b5b8727eb99ae2d00dc9c -> tested/linux-6.1

