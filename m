Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394DB1B6326
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 20:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRgRJ-0002En-Ly; Thu, 23 Apr 2020 18:19:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HETR=6H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRgRI-0002Ei-Hj
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 18:19:08 +0000
X-Inumbo-ID: e76ccf2c-858e-11ea-93ec-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e76ccf2c-858e-11ea-93ec-12813bfff9fa;
 Thu, 23 Apr 2020 18:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRrrpyhUu7D8FU4vfcEaOX1N/2rxRtQoCxY4akLybB8=; b=tiw3qXK+OTYZ8krZ/FZzuiOgg
 QtXRKmoh8iuZH94XSs6NtboIOyuyyNBU2bWL5PweD/dazDFGFsnWqNZudyBK6014u4QNyx9h1rQwk
 FpNjyuwIDlHC9vqcPbjuUJmNECkeIqbW52GJUOFbBTp52i+ErpNGzoD+esSHwdWQb+YGY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRgRA-0002VY-0G; Thu, 23 Apr 2020 18:19:00 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRgR9-0003pN-GB; Thu, 23 Apr 2020 18:18:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRgR9-0006Ps-FH; Thu, 23 Apr 2020 18:18:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149749-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 149749: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures: linux-5.4:test-amd64-amd64-xl-rtds:guest-saverestore:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-coresched-i386-xl:hosts-allocate:starved:nonblocking
 linux-5.4:test-amd64-coresched-amd64-xl:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: linux=0c418786cb3aa175823f0172d939679df9ab9a54
X-Osstest-Versions-That: linux=6ccc74c083c0d472ac64f3733f5b7bf3f99f261e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Apr 2020 18:18:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149749 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149749/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     15 guest-saverestore            fail  like 149709
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 149728
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-coresched-i386-xl  2 hosts-allocate               starved  n/a
 test-amd64-coresched-amd64-xl  2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                0c418786cb3aa175823f0172d939679df9ab9a54
baseline version:
 linux                6ccc74c083c0d472ac64f3733f5b7bf3f99f261e

Last test of basis   149728  2020-04-22 00:08:28 Z    1 days
Testing same since   149749  2020-04-23 09:09:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Huang <ahuang12@lenovo.com>
  Alan Maguire <alan.maguire@oracle.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Aya Levin <ayal@mellanox.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Baruch Siach <baruch@tkos.co.il>
  Ben Skeggs <bskeggs@redhat.com>
  Björn Töpel <bjorn.topel@intel.com>
  Bob Moore <robert.moore@intel.com>
  Borislav Petkov <bp@suse.de>
  Chao Yu <yuchao0@huawei.com>
  Chen-Yu Tsai <wens@csie.org>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Kerello <christophe.kerello@st.com>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chuck Lever <chuck.lever@oracle.com>
  cki-project@redhat.com
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Darrick J. Wong <darrick.wong@oracle.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Osipenko <digetx@gmail.com>
  Domenico Andreoli <domenico.andreoli@linux.com>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Sandeen <sandeen@redhat.com>
  Erik Kaneda <erik.kaneda@intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Frank Rowand <frank.rowand@sony.com>
  Frieder Schrempf <frieder.schrempf@kontron.de>
  Gabriel Krisman Bertazi <krisman@collabora.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Grygorii Strashko <grygorii.strashko@ti.com>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Champagne <champagne.guillaume.c@gmail.com>
  Guo Ren <guoren@linux.alibaba.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Ilya Dryomov <idryomov@gmail.com>
  Jacek Anaszewski <jacek.anaszewski@gmail.com>
  Jack Zhang <Jack.Zhang1@amd.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jan Kara <jack@suse.cz>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeffery Miller <jmiller@neverware.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@siol.net>
  Jerome Brunet <jbrunet@baylibre.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Jonker <jbx6244@gmail.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Corbet <corbet@lwn.net>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Jonathan Neuschäfer <j.neuschaefer@gmx.net>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Karol Herbst <kherbst@redhat.com>
  Kevin Grandemange <kevin.grandemange@allegrodvt.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  KP Singh <kpsingh@google.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Laurentiu Tudor <laurentiu.tudor@nxp.com>
  Li Bin <huawei.libin@huawei.com>
  Li RongQing <lirongqing@baidu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Yi L <yi.l.liu@intel.com>
  Long Li <longli@microsoft.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Lucas Stach <l.stach@pengutronix.de>
  Luke Nelson <luke.r.nels@gmail.com>
  Luke Nelson <lukenels@cs.washington.edu>
  Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Martin Fuzzey <martin.fuzzey@flowbird.group>
  Martin K. Petersen <martin.petersen@oracle.com>
  Maxime Ripard <maxime@cerno.tech>
  Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael Walle <michael@walle.cc>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
  Murphy Zhou <jencce.kernel@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Nirmoy Das <nirmoy.das@amd.com>
  Olga Kornievskaia <kolga@netapp.com>
  Olga Kornievskaia <olga.kornievskaia@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Valente <paolo.valente@linaro.org>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Mackerras <paulus@ozlabs.org>
  Pavel Machek <pavel@ucw.cz>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qian Cai <cai@lca.pw>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ralph Campbell <rcampbell@nvidia.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ricardo Ribalda Delgado <ribalda@kernel.org>
  Richard Weinberger <richard@nod.at>
  Rob Herring <robh@kernel.org>
  Roman Gushchin <guro@fb.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@mellanox.com>
  Sahitya Tummala <stummala@codeaurora.org>
  Sasha Levin <sashal@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shawn Guo <shawnguo@kernel.org>
  Slava Bacherikov <slava@bacher09.org>
  Sowjanya Komatineni <skomatineni@nvidia.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Steve French <stfrench@microsoft.com>
  Steven Price <steven.price@arm.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Tianyu Lan <Tianyu.Lan@microsoft.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vegard Nossum <vegard.nossum@oracle.com>
  Vidya Sagar <vidyas@nvidia.com>
  Waiman Long <longman@redhat.com>
  Wei Liu <wei.liu@kernel.org>
  Wen Yang <wenyang@linux.alibaba.com>
  Will Deacon <will@kernel.org>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Xi Wang <xi.wang@gmail.com>
  xinhui pan <xinhui.pan@amd.com>
  Zenghui Yu <yuzenghui@huawei.com>

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
 test-amd64-coresched-amd64-xl                                starved 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 starved 
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
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

To xenbits.xen.org:/home/xen/git/linux-pvops.git
   6ccc74c083c0..0c418786cb3a  0c418786cb3aa175823f0172d939679df9ab9a54 -> tested/linux-5.4

