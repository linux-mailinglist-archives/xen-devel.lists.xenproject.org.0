Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E957717B
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 23:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368878.600288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCotq-0002iu-9i; Sat, 16 Jul 2022 21:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368878.600288; Sat, 16 Jul 2022 21:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCotq-0002g6-5l; Sat, 16 Jul 2022 21:00:30 +0000
Received: by outflank-mailman (input) for mailman id 368878;
 Sat, 16 Jul 2022 21:00:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCoto-0002fv-CC; Sat, 16 Jul 2022 21:00:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCoto-0005iK-7P; Sat, 16 Jul 2022 21:00:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCotn-0002pU-KY; Sat, 16 Jul 2022 21:00:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oCotn-00036R-K7; Sat, 16 Jul 2022 21:00:27 +0000
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
	bh=VspY6Pl6jHJbDuNyFGTS8w63NPYOwtfWMWsFyR6SrDc=; b=r45mEC1Yn6vxHuFSX59+1xyI0L
	qK8Th0olAFUdUdzebEFURcI1ZAYMZgMeZB+elGCJPpy9ZE8lh/V58qKBxun6fPIdOJaFBnKdb0DIG
	lTDWGNuB/1BTCtG5779shzaCje49hM6njoE0tUZpgiigefhEjHWboAZoly2h7C2f1orQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171652-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 171652: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-i386-pvops:kernel-build:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-start/freebsd.repeat:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9b59ec8d50a1f28747ceff9a4f39af5deba9540e
X-Osstest-Versions-That:
    linux=5a29232d870d9e63fe5ff30b081be6ea7cc2465d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 16 Jul 2022 21:00:27 +0000

flight 171652 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171652/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-pvops              6 kernel-build             fail REGR. vs. 171587

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-freebsd12-amd64 21 guest-start/freebsd.repeat fail blocked in 171587
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 171587
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171587
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171587
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171587
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171587
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171587
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171587
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 171587
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                9b59ec8d50a1f28747ceff9a4f39af5deba9540e
baseline version:
 linux                5a29232d870d9e63fe5ff30b081be6ea7cc2465d

Last test of basis   171587  2022-07-12 00:10:46 Z    4 days
Failing since        171601  2022-07-12 16:11:30 Z    4 days    6 attempts
Testing same since   171652  2022-07-16 09:39:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Alexandre Chartre <alexandre.chartre@oracle.com>
  Alexandre Ghiti <alexandre.ghiti@canonical.com>
  Alexei Starovoitov <ast@kernel.org>
  Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andrea Mayer <andrea.mayer@uniroma2.it>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrzej Hajda <andrzej.hajda@intel.com>
  Ansgar Lößer <ansgar.loesser@kom.tu-darmstadt.de>
  Ansgar Lößer <ansgar.loesser@tu-darmstadt.de>
  Anup Patel <anup@brainfault.org>
  Anup Patel <apatel@ventanamicro.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Baowen Zheng <baowen.zheng@corigine.com>
  Bin Meng <bmeng.cn@gmail.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov <bp@suse.de>
  Brent Lu <brent.lu@intel.com>
  Brian Norris <briannorris@chromium.org>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
  Chris Wilson <chris.p.wilson@intel.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Brauner (Microsoft) <brauner@kernel.org>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Chuck Lever <chuck.lever@oracle.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Coiby Xu <coxu@redhat.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Cédric Le Goater <clg@kaod.org>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Mack <daniel@zonque.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
  Dave Airlie <airlied@redhat.com>
  Dave Chinner <dchinner@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Howells <dhowells@redhat.com>
  David Owens <daowens01@gmail.com>
  David Owens <dowens@precisionplanting.com>
  David S. Miller <davem@davemloft.net>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Douglas Anderson <dianders@chromium.org>
  Edward Cree <ecree.xilinx@gmail.com>
  Eli Cohen <elic@nvidia.com>
  Enzo Matsumiya <ematsumiya@suse.de>
  Eric Dumazet <edumazet@google.com>
  Evan Quan <evan.quan@amd.com>
  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
  Fangzhi Zuo <Jerry.Zuo@amd.com>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Mankel <frank.mankel@gmail.com>
  Gal Pressman <gal@nvidia.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Han Xu <han.xu@nxp.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hayes Wang <hayeswang@realtek.com>
  Hector Martin <marcan@marcan.st>
  Heiko Stuebner <heiko@sntech.de>
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
  Huaxin Lu <luhuaxin1@huawei.com>
  Ian Woloschin <iwolosch@akamai.com>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Wang <jasowang@redhat.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jeremy Szu <jeremy.szu@canonical.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiang Jian <jiangjian@cdjrlc.com>
  Jianglei Nie <niejianglei2021@163.com>
  Joanne Koong <joannelkoong@gmail.com>
  Johan Almbladh <johan.almbladh@anyfinetworks.com>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Josh Poimboeuf <jpoimboe@redhat.com>
  José Roberto de Souza <jose.souza@intel.com>
  Juergen Gross <jgross@suse.com>
  Julian Sikorski <belegdol+github@gmail.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karolina Drobnik <karolina.drobnik@intel.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kim Phillips <kim.phillips@amd.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Kris Bahnsen <kris@embeddedTS.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Li kunyu <kunyu@nfschina.com>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Ying <victor.liu@nxp.com>
  Liu, Changcheng <jerrliu@nvidia.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luca Weiss <luca@z3ntu.xyz>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Vasut <marex@denx.de>
  Mario Kleiner <mario.kleiner.de@gmail.com>
  Mark Bloch <mbloch@nvidia.com>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin Habets <habetsm.xilinx@gmail.com>
  Martin Povišer <povik+lin@cutebit.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mat Martineau <mathew.j.martineau@linux.intel.com>
  Matthew Auld <matthew.auld@intel.com>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Max Krummenacher <max.krummenacher@toradex.com>
  Maxim Mikityanskiy <maximmi@nvidia.com>
  Maxime Ripard <maxime@cerno.tech>
  Mel Gorman <mgorman@techsingularity.net>
  Melissa Wen <mwen@igalia.com>
  Meng Tang <tangmeng@uniontech.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <michael@ellerman.id.au>
  Michael Walle <michael@walle.cc>
  Michal Hocko <mhocko@suse.com>
  Michal Suchanek <msuchanek@suse.de>
  Michel Dänzer <mdaenzer@redhat.com>
  Mika Kuoppala <mika.kuoppala@linux.intel.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Misaka19465 <misaka19465@olddoctor.net>
  Muchun Song <songmuchun@bytedance.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <narmstrong@baylibre.com>
  Nick Bowler <nbowler@draconx.ca>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nirmoy Das <nirmoy.das@intel.con>
  Oder Chiou <oder_chiou@realtek.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Blakey <paulb@nvidia.com>
  Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
  Paul Moore <paul@paul-moore.com>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Pavel Skripkin <paskripkin@gmail.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Philipp Zabel <p.zabel@pengutronix.de>
  Ping-Ke Shih <pkshih@realtek.com>
  Prike Liang <Prike.Liang@amd.com>
  Pär Eriksson <parherman@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roi Dayan <roid@nvidia.com>
  Ron Economos <re@w6rz.net>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryan Wanner <Ryan.Wanner@microchip.com>
  Ryder Lee <ryder.lee@mediatek.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Samuel Holland <samuel@sholland.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sean Anderson <sean.anderson@seco.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shawn Guo <shawnguo@kernel.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Simon Horman <simon.horman@corigine.com>
  Solomon Chiu <solomon.chiu@amd.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  sunliming <sunliming@kylinos.cn>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tejun Heo <tj@kernel.org>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Voegtle <tv@lio96.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tianyu Yuan <tianyu.yuan@corigine.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Toke Høiland-Jørgensen <toke@kernel.org>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vaishnav Achath <vaishnav.a@ti.com>
  Vikas Gupta <vikas.gupta@broadcom.com>
  Vinayak Yadawad <vinayak.yadawad@broadcom.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Wang Kefeng <wangkefeng.wang@huawei.com>
  Will Deacon <will@kernel.org>
  William Zhang <william.zhang@broadcom.com>
  xinhui pan <xinhui.pan@amd.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Xiubo Li <xiubli@redhat.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yassine Oudjana <y.oudjana@protonmail.com>
  Yefim Barashkin <mr.b34r@kolabnow.com>
  Yevhen Orlov <yevhen.orlov@plvision.eu>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Íñigo Huguet <ihuguet@redhat.com>

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
 build-i386-pvops                                             fail    
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
 test-amd64-amd64-freebsd12-amd64                             fail    
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

(No revision log; it would be 7756 lines long.)

