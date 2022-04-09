Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B44FA988
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 18:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302212.515799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndE01-0006IY-Ov; Sat, 09 Apr 2022 16:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302212.515799; Sat, 09 Apr 2022 16:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndE01-0006GQ-LQ; Sat, 09 Apr 2022 16:31:45 +0000
Received: by outflank-mailman (input) for mailman id 302212;
 Sat, 09 Apr 2022 16:31:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ndE00-0006GG-2q; Sat, 09 Apr 2022 16:31:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ndDzz-0001Ak-MU; Sat, 09 Apr 2022 16:31:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ndDzz-00006x-4D; Sat, 09 Apr 2022 16:31:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ndDzz-0005p1-2U; Sat, 09 Apr 2022 16:31:43 +0000
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
	bh=kpFD7bRGT2Fvg5nRy+hCNvyuo/LQNTKURWcuGZafRtk=; b=IkJzyU2Y6vbbh2ZE7db0c6u9I1
	cSynP9JeH2jwHDPP5Cp8N+jiUxje/llDOdaBO3xTV6cw/pyKxjMzjO3a1FUqpHqwazgQgg+FztqFb
	2DYtwpxXnSXmxB8UqYCgLgRH42CfWU7cy6bumpTiRvJKXf0FaKqli2/v/jCkwaqfbI4Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 169249: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=1a3b1bba7c7a5eb8a11513cf88427cb9d77bc60a
X-Osstest-Versions-That:
    linux=3123109284176b1532874591f7c81f3837bbdc17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Apr 2022 16:31:43 +0000

flight 169249 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169249/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10   fail REGR. vs. 169174

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169174
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 169174
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 169174
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 169174
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 169174
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 169174
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 169174
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 169174
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                1a3b1bba7c7a5eb8a11513cf88427cb9d77bc60a
baseline version:
 linux                3123109284176b1532874591f7c81f3837bbdc17

Last test of basis   169174  2022-04-05 08:27:06 Z    4 days
Failing since        169188  2022-04-05 21:41:40 Z    3 days    5 attempts
Testing same since   169249  2022-04-08 18:10:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Conole <aconole@redhat.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Liu <HaoPing.Liu@amd.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Lobakin <alexandr.lobakin@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Alice Michael <alice.michael@intel.com>
  Alok Prasad <palok@marvell.com>
  Anatolii Gerasymenko <anatolii.gerasymenko@intel.com>
  Andrea Parri (Microsoft) <parri.andrea@gmail.com>
  Andrew Lunn <andrew@lunn.ch>
  Andy Chiu <andy.chiu@sifive.com>
  Andy Gospodarek <gospo@broadcom.com>
  Ariel Elior <aelior@marvell.com>
  Arthur Fabre <afabre@cloudflare.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Axel Lin <axel.lin@ingics.com>
  Benjamin Marty <info@benjaminmarty.ch>
  Bjorn Helgaas <bhelgaas@google.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov <bp@suse.de>
  Boyuan Zhang <boyuan.zhang@amd.com>
  Catalin Marinas <catalin.marinas@arm.com>
  CHANDAN VURDIGERE NATARAJ <chandan.vurdigerenataraj@amd.com>
  Chanho Park <chanho61.park@samsung.com>
  Charlene Liu <Charlene.Liu@amd.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen-Yu Tsai <wens@csie.org>
  ChenXiaoSong <chenxiaosong2@huawei.com>
  Chiawen Huang <chiawen.huang@amd.com>
  Chris Park <Chris.Park@amd.com>
  Christian König <christian.koenig@amd.com>
  Christian König <ckoenig.leichtzumerken@gmail.com>
  Christian Lamparter <chunkeey@gmail.com>
  Christian Loehle <cloehle@hyperstone.com>
  Christian Löhle <CLoehle@hyperstone.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Mack <daniel@zonque.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Airlie <airlied@redhat.com>
  David Ahern <dsahern@kernel.org>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Delyan Kratunov <delyank@fb.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Dimitris Michailidis <d.michailidis@fungible.com>
  Dimitris Michailidis <dmichail@fungible.com>
  Divya Shikre <DivyaUday.Shikre@amd.com>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Drew Fustini <dfustini@baylibre.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eli Cohen <elic@nvidia.com>
  Emily Deng <Emily.Deng@amd.com>
  Eric Bernstein <eric.bernstein@amd.com>
  Eric Dumazet <edumazet@google.com>
  Ethan Lien <ethanlien@synology.com>
  Eyal Birger <eyal.birger@gmail.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Gabe Teeger <gabe.teeger@amd.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guchun Chen <guchun.chen@amd.com>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Haowen Bai <baihaowen@meizu.com>
  Harry Wentland <harry.wentland@amd.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Huang Rui <ray.huang@amd.com>
  Ilias Apalodimas <ilias.apalodimas@linaro.org>
  Ilya Maximets <i.maximets@ovn.org>
  Ivan Vecera <ivecera@redhat.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamie Bainbridge <jamie.bainbridge@gmail.com>
  Jan Varho <jan.varho@gmail.com>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Ekstrand <jason@jlekstrand.net>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeremy Sowden <jeremy@azazel.net>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jimmy Kizito <Jimmy.Kizito@amd.com>
  Jiri Olsa <jolsa@kernel.org>
  Joerg Roedel <jroedel@suse.de>
  Joey Gouly <joey.gouly@arm.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Jonathan Bakker <xc-racer2@live.ca>
  Josef Bacik <josef@toxicpanda.com>
  José Expósito <jose.exposito89@gmail.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kaiwen Hu <kevinhu@synology.com>
  Kalle Valo <kvalo@kernel.org>
  Kamal Dasu <kdasu.kdev@gmail.com>
  Karol Herbst <kherbst@redhat.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Lang Yu <Lang.Yu@amd.com>
  Lee Jones <lee.jones@linaro.org>
  Leo (Hanghong) Ma <hanghong.ma@amd.com>
  Leo Ruan <tingquan.ruan@cn.bosch.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Ying <victor.liu@nxp.com>
  Luiz Angelo Daros de Luca <luizluca@gmail.com>
  Ma Jun <Jun.Ma2@amd.com>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Manish Chopra <manishc@marvell.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcin Kozlowski <marcinguy@gmail.com>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Jonas <mark.jonas@de.bosch.com>
  Martin Habets <habetsm.xilinx@gmail.com>
  Martin KaFai Lau <kafai@fb.com>
  Martin Leung <Martin.Leung@amd.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matt Johnston <matt@codeconstruct.com.au>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Maxim Mikityanskiy <maximmi@nvidia.com>
  Maxime Ripard <maxime@cerno.tech>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Kelley <mikelley@microsoft.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Michael Wu <michael@allwinnertech.com>
  Muchun Song <songmuchun@bytedance.com>
  Neelima Krishnan <neelima.krishnan@intel.com>
  NeilBrown <neilb@suse.de>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Noralf Trønnes <noralf@tronnes.org>
  Oliver Logush <oliver.logush@amd.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Phil Auld <pauld@redhat.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Prabhakar Kushwaha <pkushwaha@marvell.com>
  Prike Liang <Prike.Liang@amd.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  QintaoShen <unSimple1993@163.com>
  Qu Wenruo <wqu@suse.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ray Jui <ray.jui@broadcom.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Roman Li <Roman.Li@amd.com>
  Ruili Ji <ruiliji2@amd.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Shirish S <shirish.s@amd.com>
  Shwetha Nagaraju <shwetha.nagaraju@intel.com>
  Stanley.Yang <Stanley.Yang@amd.com>
  Steve Capper <steve.capper@arm.com>
  Steve French <stfrench@microsoft.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Taehee Yoo <ap420073@gmail.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tianci Yin <tianci.yin@amd.com>
  tiancyin <tianci.yin@amd.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Tom Rix <trix@redhat.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tushar Patel <tushar.patel@amd.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Averin <vasily.averin@linux.dev>
  Vasily Averin <vvs@openvz.org>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiaomeng Tong <xiam0nd.tong@gmail.com>
  Yann Gautier <yann.gautier@foss.st.com>
  Yifan Zhang <yifan1.zhang@amd.com>
  Yonghong Song <yhs@fb.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhiyuan Dai <daizhiyuan@phytium.com.cn>
  Ziyang Xuan <william.xuanziyang@huawei.com>
  Zorro Lang <zlang@redhat.com>

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
 test-amd64-amd64-xl-rtds                                     fail    
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
   312310928417..1a3b1bba7c7a  1a3b1bba7c7a5eb8a11513cf88427cb9d77bc60a -> tested/linux-linus

