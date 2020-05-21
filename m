Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1601DD2FB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 18:19:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbnub-0000pV-SA; Thu, 21 May 2020 16:19:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcJi=7D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbnub-0000pQ-1w
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 16:19:13 +0000
X-Inumbo-ID: ca8bf7ba-9b7e-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca8bf7ba-9b7e-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eb9/Zj/OqUDGEzqNOsht2LoIKITl2aJpdik09eEQgiE=; b=s5tcWVVA+cZ5YaZYMjbZfUALk
 jzgJYF2oiEE/X45iyeYasofTdAuhFBJeSjFWyHaOeu4krwjgEVMBZ5t9zMbWhcGg/VHvgpMsCZTG3
 A0Ye4IQTI8qnHHnekKIs9Hb0OvN+FQyKiNdKD7o56VwbHjm1bLQ9/trLg2IKEw/YaTnu0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbnuS-0006nH-QG; Thu, 21 May 2020 16:19:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbnuS-0002ME-Fr; Thu, 21 May 2020 16:19:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbnuS-0000w1-F8; Thu, 21 May 2020 16:19:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150294-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 150294: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
 linux-5.4:test-amd64-amd64-xl-rtds:guest-saverestore:fail:heisenbug
 linux-5.4:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=1cdaf895c99d319c0007d0b62818cf85fc4b087f
X-Osstest-Versions-That: linux=cbaf2369956178e68fb714a30dc86cf768dd596a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 May 2020 16:19:04 +0000
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

flight 150294 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150294/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-rtds     12 guest-start      fail in 150273 pass in 150294
 test-amd64-amd64-xl-rtds     15 guest-saverestore          fail pass in 150273

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     16 guest-localmigrate  fail in 150273 like 150172
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150172
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                1cdaf895c99d319c0007d0b62818cf85fc4b087f
baseline version:
 linux                cbaf2369956178e68fb714a30dc86cf768dd596a

Last test of basis   150172  2020-05-14 06:09:31 Z    7 days
Testing same since   150273  2020-05-20 06:46:17 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Adam Ford <aford173@gmail.com>
  Adam McCoy <adam@forsedomani.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Maguire <alan.maguire@oracle.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexei Starovoitov <ast@kernel.org>
  Amir Goldstein <amir73il@gmail.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Arnd Bergmann <arnd@arndb.de>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Ben Chuang <ben.chuang@genesyslogic.com.tw>
  Bob Peterson <rpeterso@redhat.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen-Yu Tsai <wens@csie.org>
  Chris Chiu <chiu@endlessm.com>
  Chris Down <chris@chrisdown.name>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Dave Flogeras <dflogeras2@gmail.com>
  Dave Wysochanski <dwysocha@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Eugeniu Rosca <erosca@de.adit-jv.com>
  Fabio Estevam <festevam@gmail.com>
  Felipe Balbi <balbi@kernel.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gerd Hoffmann <kraxel@redhat.com>
  Grace Kao <grace.kao@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grzegorz Kowal <custos.mentis@gmail.com>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Hugh Dickins <hughd@google.com>
  Ilie Halip <ilie.halip@gmail.com>
  Ioana Ciornei <ioana.ciornei@nxp.com>
  Iris Liu <iris@onechronos.com>
  J. Bruce Fields <bfields@redhat.com>
  Jack Morgenstein <jackm@dev.mellanox.co.il>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@mellanox.com>
  Jeremy Linton <jeremy.linton@arm.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesus Ramos <jesus-ramos@live.com>
  Jim Mattson <jmattson@google.com>
  Jiri Kosina <jkosina@suse.cz>
  Johannes Weiner <hannes@cmpxchg.org>
  John Fastabend <john.fastabend@gmail.com>
  John Stultz <john.stultz@linaro.org>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Jue Wang <juew@google.com>
  Justin Swartz <justin.swartz@risingedge.co.za>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kamal Mostafa <kamal@canonical.com>
  Kelly Littlepage <kelly@onechronos.com>
  Kevin Hilman <khilman@baylibre.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Kyungtae Kim <kt0755@gmail.com>
  Leon Romanovsky <leonro@mellanox.com>
  Li Jun <jun.li@nxp.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luben Tuikov <luben.tuikov@amd.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Luo bin <luobin9@huawei.com>
  Maciej Żenczykowski <maze@google.com>
  Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
  Maor Gottlieb <maorg@mellanox.com>
  Marc Zyngier <maz@kernel.org>
  Marek Olšák <marek.olsak@amd.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <kafai@fb.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Vokáč <michal.vokac@ysoft.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Neil Horman <nhorman@tuxdriver.com>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  Olga Kornievskaia <kolga@netapp.com>
  Olga Kornievskaia <olga.kornievskaia@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Jones <pjones@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Phil Sutter <phil@nwl.cc>
  Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raul E Rangel <rrangel@chromium.org>
  Renius Chen <renius.chen@genesyslogic.com.tw>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Samu Nuutamo <samu.nuutamo@vincit.fi>
  Samuel Zou <zou_wei@huawei.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sarthak Garg <sartgarg@codeaurora.org>
  Sasha Levin <sashal@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sergei Trofimovich <slyfox@gentoo.org>
  Shawn Guo <shawnguo@kernel.org>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Ser <contact@emersion.fr>
  Soheil Hassas Yeganeh <soheil@google.com>
  Sriharsha Allenki <sallenki@codeaurora.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Brivio <sbrivio@redhat.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Sultan Alsawaf <sultan@kerneltoast.com>
  Sung Lee <sung.lee@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tejun Heo <tj@kernel.org>
  Tiecheng Zhou <Tiecheng.Zhou@amd.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Ursula Braun <ubraun@linux.ibm.com>
  Vasily Averin <vvs@virtuozzo.com>
  Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Minet <v.minet@criteo.com>
  Vineeth Pillai <vineethrp@gmail.com>
  Vinod Koul <vkoul@kernel.org>
  Waiman Long <longman@redhat.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Willem de Bruijn <willemb@google.com>
  Wu Bo <wubo40@huawei.com>
  Xiao Yang <yangx.jy@cn.fujitsu.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Yafang Shao <laoar.shao@gmail.com>
  Yang Shi <yang.shi@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yuiko Oshino <yuiko.oshino@microchip.com>
  Zefan Li <lizefan@huawei.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>

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
   cbaf23699561..1cdaf895c99d  1cdaf895c99d319c0007d0b62818cf85fc4b087f -> tested/linux-5.4

