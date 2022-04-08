Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E94F9BD8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 19:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301724.514973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsZ3-0005hl-7v; Fri, 08 Apr 2022 17:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301724.514973; Fri, 08 Apr 2022 17:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsZ3-0005ek-37; Fri, 08 Apr 2022 17:38:29 +0000
Received: by outflank-mailman (input) for mailman id 301724;
 Fri, 08 Apr 2022 17:38:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ncsZ1-0005ea-FB; Fri, 08 Apr 2022 17:38:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ncsZ1-0007oy-6x; Fri, 08 Apr 2022 17:38:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ncsZ0-0000OR-UA; Fri, 08 Apr 2022 17:38:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ncsZ0-00036s-TQ; Fri, 08 Apr 2022 17:38:26 +0000
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
	bh=YwXA5SoCXHdQXpz3CHw3opEgmn2Qc9BU2KyLKp68E+o=; b=cK2srsEh15A+Ae1+uDoSgFYo2b
	gblofD5KacY7fD+35PVN+/lURRebfoCP/mR6n5p4+aogRSWhDU2OLoqBwWew7ZirOgaFahzmxyH1s
	yQQEUJKGuCH404FU6n+wiOxXmW5HMQXK7/enmicUh3BiX5ptAzkXTPGpmGOpAyAnmjV4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169228-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 169228: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
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
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
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
    linux=1831fed559732b132aef0ea8261ac77e73f7eadf
X-Osstest-Versions-That:
    linux=3123109284176b1532874591f7c81f3837bbdc17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Apr 2022 17:38:26 +0000

flight 169228 linux-linus real [real]
flight 169246 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169228/
http://logs.test-lab.xenproject.org/osstest/logs/169246/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 169174

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
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
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
 linux                1831fed559732b132aef0ea8261ac77e73f7eadf
baseline version:
 linux                3123109284176b1532874591f7c81f3837bbdc17

Last test of basis   169174  2022-04-05 08:27:06 Z    3 days
Failing since        169188  2022-04-05 21:41:40 Z    2 days    4 attempts
Testing same since   169228  2022-04-08 07:16:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Conole <aconole@redhat.com>
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
  Benjamin Marty <info@benjaminmarty.ch>
  Bjorn Helgaas <bhelgaas@google.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov <bp@suse.de>
  Boyuan Zhang <boyuan.zhang@amd.com>
  CHANDAN VURDIGERE NATARAJ <chandan.vurdigerenataraj@amd.com>
  Charlene Liu <Charlene.Liu@amd.com>
  Chen-Yu Tsai <wens@csie.org>
  Chiawen Huang <chiawen.huang@amd.com>
  Chris Park <Chris.Park@amd.com>
  Christian König <christian.koenig@amd.com>
  Christian König <ckoenig.leichtzumerken@gmail.com>
  Christian Lamparter <chunkeey@gmail.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Mack <daniel@zonque.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Airlie <airlied@redhat.com>
  David Ahern <dsahern@kernel.org>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Delyan Kratunov <delyank@fb.com>
  Dimitris Michailidis <d.michailidis@fungible.com>
  Dimitris Michailidis <dmichail@fungible.com>
  Divya Shikre <DivyaUday.Shikre@amd.com>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eli Cohen <elic@nvidia.com>
  Emily Deng <Emily.Deng@amd.com>
  Eric Bernstein <eric.bernstein@amd.com>
  Eric Dumazet <edumazet@google.com>
  Ethan Lien <ethanlien@synology.com>
  Eyal Birger <eyal.birger@gmail.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Westphal <fw@strlen.de>
  Gabe Teeger <gabe.teeger@amd.com>
  Guchun Chen <guchun.chen@amd.com>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
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
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Josef Bacik <josef@toxicpanda.com>
  José Expósito <jose.exposito89@gmail.com>
  Kaiwen Hu <kevinhu@synology.com>
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
  Mark Jonas <mark.jonas@de.bosch.com>
  Martin Habets <habetsm.xilinx@gmail.com>
  Martin KaFai Lau <kafai@fb.com>
  Martin Leung <Martin.Leung@amd.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matt Johnston <matt@codeconstruct.com.au>
  Maxim Mikityanskiy <maximmi@nvidia.com>
  Maxime Ripard <maxime@cerno.tech>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Kelley <mikelley@microsoft.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Neelima Krishnan <neelima.krishnan@intel.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Noralf Trønnes <noralf@tronnes.org>
  Oliver Logush <oliver.logush@amd.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
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
  Steve French <stfrench@microsoft.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Taehee Yoo <ap420073@gmail.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tianci Yin <tianci.yin@amd.com>
  tiancyin <tianci.yin@amd.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Tom Rix <trix@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tushar Patel <tushar.patel@amd.com>
  Vasily Averin <vasily.averin@linux.dev>
  Vasily Averin <vvs@openvz.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wei Liu <wei.liu@kernel.org>
  Xiaomeng Tong <xiam0nd.tong@gmail.com>
  Yifan Zhang <yifan1.zhang@amd.com>
  Yonghong Song <yhs@fb.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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


Not pushing.

(No revision log; it would be 4812 lines long.)

