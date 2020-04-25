Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D761B872F
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 16:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSMAk-00022l-2I; Sat, 25 Apr 2020 14:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVj9=6J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jSMAj-00022g-6Y
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 14:52:49 +0000
X-Inumbo-ID: 6a14bdb0-8704-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a14bdb0-8704-11ea-b58d-bc764e2007e4;
 Sat, 25 Apr 2020 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f5dwPdjWsKQQ71upVjGjwcs9LTEbSnFbePVEo83gpV4=; b=XXwERVfiM9qdC1dHyM/BTF2W4
 GHCpR53Llo3vCnZ2dm04Uqe40jBQXeUNDD8uB13gnX58i3HkldMhgIHVrKXXXXhta6MmLu6jAARea
 TRZKnw/zNE/00XXdodALLN7FzIc1BOQpQa5EQ99Sw74qB6zheGWdFN3IYU2LW8frZqvBk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSMAb-0007vx-Hs; Sat, 25 Apr 2020 14:52:41 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSMAb-0007IK-7C; Sat, 25 Apr 2020 14:52:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jSMAb-0003oC-6W; Sat, 25 Apr 2020 14:52:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149807-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 149807: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=ab51cac00ef2859f20a73d33a53f3a8987b65e11
X-Osstest-Versions-That: linux=b4f633221f0aeac102e463a4be46a643b2e3b819
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Apr 2020 14:52:41 +0000
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

flight 149807 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149807/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     16 guest-localmigrate           fail  like 149772
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 149772
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149772
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149772
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 149772
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 149772
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149772
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 149772
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149772
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                ab51cac00ef2859f20a73d33a53f3a8987b65e11
baseline version:
 linux                b4f633221f0aeac102e463a4be46a643b2e3b819

Last test of basis   149772  2020-04-24 03:58:26 Z    1 days
Failing since        149786  2020-04-24 19:09:32 Z    0 days    2 attempts
Testing same since   149807  2020-04-25 05:44:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akshu Agrawal <akshu.agrawal@amd.com>
  Alessandro Rubini <rubini@gnudd.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Alexander Aring <alex.aring@gmail.com>
  Alexander Tsoy <alexander@tsoy.me>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Skobkin <skobkin-ru@ya.ru>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andrey Ignatov <rdna@fb.com>
  Andrii Nakryiko <andriin@fb.com>
  Andrzej Hajda <a.hajda@samsung.com>
  Andy Yan <andy.yan@rock-chips.com>
  Avinash Patil <avinashp@quantenna.com>
  Baruch Siach <baruch@tkos.co.il>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bo YU <tsu.yubo@gmail.com>
  Brendan Higgins <brendanhiggins@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chris Rorvick <chris@rorvick.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Damien Le Moal <damien.lemoal@wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Airlie <airlied@redhat.com>
  David Ahern <dsahern@gmail.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dejin Zheng <zhengdejin5@gmail.com>
  Diego Elio Pettenò <flameeyes@flameeyes.com>
  Doug Berger <opendmb@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@gmail.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Gregor Pintar <grpintar@gmail.com>
  Gyeongtaek Lee <gt82.lee@samsung.com>
  Hans de Goede <hdegoede@redhat.com>
  Hillf Danton <hdanton@sina.com>
  Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>
  Ilan Peer <ilan.peer@intel.com>
  Ioana Ciornei <ioana.ciornei@nxp.com>
  Jakub Wilk <jwilk@jwilk.net>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Yan <yanaijie@huawei.com>
  Jens Axboe <axboe@kernel.dk>
  Jere Leppänen <jere.leppanen@nokia.com>
  Jeremie Francois (on alpha) <jeremie.francois@gmail.com>
  Jernej Skrabec <jernej.skrabec@siol.net>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jessica Yu <jeyu@kernel.org>
  Jianpeng Ma <jianpeng.ma@intel.com>
  Jiri Slaby <jslaby@suse.cz>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  John Haxby <john.haxby@oracle.com>
  John Oldman <john.oldman@polehill.co.uk>
  Jonathan Corbet <corbet@lwn.net>
  José Roberto de Souza <jose.souza@intel.com>
  Julien Beraud <julien.beraud@orolia.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Kalle Valo <kvalo@codeaurora.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Coelho <luciano.coelho@intel.com>
  Luke Nelson <luke.r.nels@gmail.com>
  Luke Nelson <lukenels@cs.washington.edu>
  Lyude Paul <lyude@redhat.com>
  Ma, Jianpeng <jianpeng.ma@intel.com>
  Maciej Żenczykowski <maze@google.com>
  Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
  Manoj Malviya <manojmalviya@chelsio.com>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Markus Elfring <elfring@users.sourceforge.net>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <kafai@fb.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matt Roper <matthew.d.roper@intel.com>
  Matthias Blankertz <matthias.blankertz@cetitec.com>
  Maxim Mikityanskiy <maximmi@mellanox.com>
  Maxime Ripard <maxime@cerno.tech>
  Mengbing Wang <Mengbing.Wang@amd.com>
  Mikita Lipski <mikita.lipski@amd.com>
  Mordechay Goodstein <mordechay.goodstein@intel.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nikolay Borisov <nborisov@suse.com>
  Nils ANDRÉ-CHANG <nils@nilsand.re>
  Oliver Barta <oliver.barta@aptiv.com>
  Olivier Moysan <olivier.moysan@st.com>
  Ong Boon Leong <boon.leong.ong@intel.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Blakey <paulb@mellanox.com>
  Paul Moore <paul@paul-moore.com>
  Philipp Puschmann <p.puschmann@pironex.de>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Pravin B Shelar <pshelar@ovn.org>
  Prike Liang <Prike.Liang@amd.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Rohit Maheshwari <rohitm@chelsio.com>
  Roi Dayan <roid@mellanox.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Ryder Lee <ryder.lee@mediatek.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Saeed Mahameed <saeedm@mellanox.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sam Ravnborg <sam@ravnborg.org>
  Sandeep Raghuraman <sandy.8925@gmail.com>
  Sebastian Fricke <sebastian.fricke.linux@gmail.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Soheil Hassas Yeganeh <soheil@google.com>
  Song Liu <songliubraving@fb.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Fomichev <sdf@google.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Hemminger <stephen@networkplumber.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sumit Garg <sumit.garg@linaro.org>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Tejun Heo <tj@kernel.org>
  Todd Brandt <todd.e.brandt@linux.intel.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tomi Valkeinen <tomi.valkeinen@ti.com>
  Tonghao Zhang <xiangxia.m.yue@gmail.com>
  Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
  Vasily Khoruzhick <anarsoul@gmail.com>
  Vishal Kulkarni <vishal@chelsio.com>
  Vishal Kulkarni <vishal@chelsio.com>"
  Vitor Massaru Iha <vitor@massaru.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Voon Weifeng <weifeng.voon@intel.com>
  Waiman Long <longman@redhat.com>
  Wang YanQing <udknight@gmail.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Will Deacon <will@kernel.org>
  Wu Bo <wubo40@huawei.com>
  Xi Wang <xi.wang@gmail.com>
  Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiumei Mu <xmu@redhat.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  YueHaibing <yuehaibing@huawei.com>
  Yuiko Oshino <yuiko.oshino@microchip.com>
  Zhang Shengju <zhangshengju@cmss.chinamobile.com>
  Zhiqiang Liu <liuzhiqiang26@huawei.com>
  Zhu Yanjun <yanjunz@mellanox.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-armhf-armhf-xl-rtds                                     pass    
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
   b4f633221f0a..ab51cac00ef2  ab51cac00ef2859f20a73d33a53f3a8987b65e11 -> tested/linux-linus

