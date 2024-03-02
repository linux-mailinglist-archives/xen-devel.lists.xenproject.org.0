Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C0386EF6D
	for <lists+xen-devel@lfdr.de>; Sat,  2 Mar 2024 09:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687870.1071676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgKOy-0004OE-52; Sat, 02 Mar 2024 08:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687870.1071676; Sat, 02 Mar 2024 08:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgKOy-0004Lx-0y; Sat, 02 Mar 2024 08:07:24 +0000
Received: by outflank-mailman (input) for mailman id 687870;
 Sat, 02 Mar 2024 08:07:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgKOw-0004Ln-Uc; Sat, 02 Mar 2024 08:07:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgKOw-0006hn-QI; Sat, 02 Mar 2024 08:07:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgKOw-0000lx-HT; Sat, 02 Mar 2024 08:07:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rgKOw-0006QM-Gv; Sat, 02 Mar 2024 08:07:22 +0000
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
	bh=x5ZCwfuJAG9z0AQWF3zPqb8+UlHrpuxXPeeK4DrYTUk=; b=UnsSl+kwXQjSX76a6xKwQPe8GH
	wE7RdgYPNphewCkpcOOjS8MPlANOZajZlsp83nFpVu9EXajeC+alDf2NCKciqfWRPcbEMpr51k0LD
	Gf0pkIOHPc2AXVpdAow+BCO0eLcJBg0hxj7+9JEWOepGAC4l9Yeb8vGBB57w2hzX/m8Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184831-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 184831: regressions - FAIL
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-6.1:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    linux-6.1:test-amd64-amd64-xl-credit2:xen-boot:fail:regression
    linux-6.1:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a3eb3a74aa8c94e6c8130b55f3b031f29162868c
X-Osstest-Versions-That:
    linux=81e1dc2f70014b9523dd02ca763788e4f81e5bac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 02 Mar 2024 08:07:22 +0000

flight 184831 linux-6.1 real [real]
flight 184840 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184831/
http://logs.test-lab.xenproject.org/osstest/logs/184840/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 184734
 test-amd64-amd64-xl-qemut-debianhvm-amd64  8 xen-boot    fail REGR. vs. 184734
 test-amd64-amd64-xl-credit2   8 xen-boot                 fail REGR. vs. 184734
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 184734

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184734
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184734
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184734
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184734
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184734
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184734
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184734
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184734
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a3eb3a74aa8c94e6c8130b55f3b031f29162868c
baseline version:
 linux                81e1dc2f70014b9523dd02ca763788e4f81e5bac

Last test of basis   184734  2024-02-23 08:41:05 Z    7 days
Testing same since   184831  2024-03-01 12:45:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Christian A. Ehrhardt" <lk@c--e.de>
  Adam Goldman <adamg@pobox.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Kobel <a-kobel@a-kobel.de>
  Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Alexander Tsoy <alexander@tsoy.me>
  Alison Schofield <alison.schofield@intel.com>
  Allen Pais <apais@linux.microsoft.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Bresticker <abrestic@rivosinc.com>
  Andrew Manley <andrew.manley@sealingtech.com>
  Andrew Morton <akpm@linux-foundation.org>
  Ard Biesheuvel <ardb@kernel.org>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Avihai Horon <avihaih@nvidia.com>
  Baokun Li <libaokun1@huawei.com>
  Bart Van Assche <bvanassche@acm.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brenton Simpson <appsforartists@google.com>
  Chen-Yu Tsai <wens@csie.org>
  Chris Li <chrisl@kernel.org>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian Brauner <brauner@kernel.org>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Conrad Kostecki <conikost@gentoo.org>
  Corey Minyard <minyard@acm.org>
  Cyril Hrubis <chrubis@suse.cz>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Vacek <neelx@redhat.com>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniil Dulov <d.dulov@aladdin.ru>
  Danilo Krummrich <dakr@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
  Devyn Liu <liudingyuan@huawei.com>
  Dmitry Bogdanov <d.bogdanov@yadro.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Don Brace <don.brace@microchip.com>
  Edward Adam Davis <eadavis@qq.com>
  Edward Lo <edward.lo@ambergroup.io>
  Eric Dumazet <edumazet@google.com>
  Erik Kurzinger <ekurzinger@nvidia.com>
  Eugen Hristev <eugen.hristev@collabora.com>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Fullway Wang <fullwaywang@outlook.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geliang Tang <geliang.tang@suse.com>
  Geliang Tang <tanggeliang@kylinos.cn>
  Gianmarco Lusvardi <glusvardi@posteo.net>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guixin Liu <kanie@linux.alibaba.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hector Martin <marcan@marcan.st>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko.stuebner@cherry.de>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Hou Tao <houtao1@huawei.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Huang Pei <huangpei@loongson.cn>
  Ingo Molnar <mingo@kernel.org>
  Ism Hong <ism.hong@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Kerr <jk@codeconstruct.com.au>
  Jiri Pirko <jiri@nvidia.com>
  Joao Martins <joao.m.martins@oracle.com>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Julian Sikorski <belegdol@gmail.com>
  Justin Iurman <justin.iurman@uliege.be>
  Kairui Song <kasong@tencent.com>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Kamal Heib <kheib@redhat.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lennert Buytenhek <kernel@wantstofly.org>
  Leon Romanovsky <leon@kernel.org>
  Lino Sanfilippo <l.sanfilippo@kunbus.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Maarten van der Schrieck
  Maksim Kiselev <bigunclemax@gmail.com>
  Marc Zyngier <maz@kernel.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Martin Povišer <povik+lin@cutebit.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Mat Martineau <martineau@kernel.org>
  Mats Kronberg <kronberg@nsc.liu.se>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Mel Gorman <mgorman@suse.de>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Kazior <michal@plume.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Mustafa Ismail <mustafa.ismail@intel.com>
  Nam Cao <namcao@linutronix.de>
  Naohiro Aota <naohiro.aota@wdc.com>
  Nathan Chancellor <nathan@kernel.org> # build
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nikita Shubin <nikita.shubin@maquefel.me>
  Niklas Cassel <cassel@kernel.org>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Oliver Upton <oliver.upton@linux.dev>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Pavel Sakharov <p.sakharov@ispras.ru>
  Pawel Laszczak <pawell@cadence.com>
  Peter Chen <peter.chen@kernel.org>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Vorel <pvorel@suse.cz>
  Phoenix Chen <asbeltogf@gmail.com>
  Prike Liang <Prike.Liang@amd.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Robert Richter <rrichter@amd.com>
  Ron Economos <re@w6rz.net>
  Rémi Denis-Courmont <courmisch@gmail.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Sandeep Dhavale <dhavale@google.com>
  Sasha Levin <sashal@kernel.org>
  Selvin Xavier <selvin.xavier@broadcom.com>
  SEO HOYOUNG <hy50.seo@samsung.com>
  SeongJae Park <sj@kernel.org>
  Shakeel Butt <shakeelb@google.com>
  Shanker Donthineni <sdonthineni@nvidia.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Simon Ser <contact@emersion.fr>
  Sindhu Devale <sindhu.devale@gmail.com>
  Sindhu Devale <sindhu.devale@intel.com>
  Sohaib Nadeem <sohaib.nadeem@amd.com>
  Song Liu <song@kernel.org>
  Steve French <stfrench@microsoft.com>
  Subbaraya Sundeep <sbhatta@marvell.com>
  syzbot+fd7b34375c1c8ce29c93@syzkaller.appspotmail.com
  Szilard Fabian <szfabian@bluemarch.art>
  Szuying Chen <chensiying21@gmail.com>
  Szuying Chen <Chloe_Chen@asmedia.com.tw>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thorsten Winkler <twinkler@linux.ibm.com>
  Tobias Waldekranz <tobias@waldekranz.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Tom Parkin <tparkin@katalix.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Vidya Sagar <vidyas@nvidia.com>
  Vinod Koul <vkoul@kernel.org>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xin Long <lucien.xin@gmail.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yi Sun <yi.sun@unisoc.com>
  Yogesh Chandra Pandey <YogeshChandra.Pandey@microchip.com>
  Yosry Ahmed <yosryahmed@google.com>
  Yu Kuai <yukuai3@huawei.com>
  Yu Zhao <yuzhao@google.com>
  Yue Hu <huyue2@coolpad.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhang Yi <yi.zhang@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhipeng Lu <alexious@zju.edu.cn>

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
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
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
 test-amd64-amd64-xl-credit2                                  fail    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
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

(No revision log; it would be 5814 lines long.)

