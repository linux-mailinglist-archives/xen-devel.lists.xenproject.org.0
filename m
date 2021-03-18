Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDB33FE4A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 05:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98821.187700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMkVq-0001Lk-0z; Thu, 18 Mar 2021 04:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98821.187700; Thu, 18 Mar 2021 04:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMkVp-0001LJ-QS; Thu, 18 Mar 2021 04:43:57 +0000
Received: by outflank-mailman (input) for mailman id 98821;
 Thu, 18 Mar 2021 04:43:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkVn-0001LB-OW; Thu, 18 Mar 2021 04:43:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkVn-00081b-Hm; Thu, 18 Mar 2021 04:43:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkVn-00073R-65; Thu, 18 Mar 2021 04:43:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkVn-0005jj-5Y; Thu, 18 Mar 2021 04:43:55 +0000
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
	bh=KTLYBeJON15ohtbkQ4N7foACAGcyvJKJTlH9ZrYJAqs=; b=XCkxQnIiWZGwqQ7gl05neqO3T9
	+QbBSgY3eAM0RjeR6RwK7Xop5n/mbvNE+QO9Suk+xvCUfqNHK42+ToVZVtWKlQ2keihDE2nkAHPhF
	sw6WKcpYW+qwE9w9ReZroEqM6IkU2fw1kRMt4IFZeYspg9ymoOSXgRfF1CcENWJESbv0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160116-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 160116: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=0437de26e28dd844f51fde7a749a82cb2d3694ad
X-Osstest-Versions-That:
    linux=ce615a08404c821bcb3c6f358b8f34307bfe30c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Mar 2021 04:43:55 +0000

flight 160116 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160116/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 159939
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 159939
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 159939
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 159939
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 159939
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 159939
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 159939
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 159939
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 159939
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 159939
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 159939
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                0437de26e28dd844f51fde7a749a82cb2d3694ad
baseline version:
 linux                ce615a08404c821bcb3c6f358b8f34307bfe30c9

Last test of basis   159939  2021-03-11 13:40:17 Z    6 days
Testing same since   160116  2021-03-17 16:11:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhishek Sahu <abhsahu@nvidia.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alain Volmat <alain.volmat@foss.st.com>
  Aleksandr Miloserdov <a.miloserdov@yadro.com>
  Andreas Kempe <kempe@lysator.liu.se>
  Andreas Larsson <andreas@gaisler.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Antony Antony <antony@phenome.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Artem Lapkin <art@khadas.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Balazs Nemeth <bnemeth@redhat.com>
  Benjamin Coddington <bcodding@redhat.com>
  Bernhard <bernhard.gebetsberger@gmx.at>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjoern Walk <bwalk@linux.ibm.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Björn Töpel <bjorn.topel@intel.com>
  Bjørn Mork <bjorn@mork.no>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaotian Jing <chaotian.jing@mediatek.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian Hewitt <christianshewitt@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Lameter <cl@linux.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Ian King <colin.king@canonical.com>
  Daiyue Zhang <zhangdaiyue1@huawei.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Daniele Palmas <dnlplm@gmail.com>
  Danielle Ratson <danieller@nvidia.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry V. Levin <ldv@altlinux.org>
  Dmitry Vyukov <dvyukov@google.com>
  Edwin Peer <edwin.peer@broadcom.com>
  Eric Dumazet <edumazet@google.com>
  Eric Farman <farman@linux.ibm.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Felix Fietkau <nbd@nbd.name>
  Filipe Laíns <lains@riseup.net>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Forest Crossman <cyrozap@gmail.com>
  Frank Li <Frank.Li@nxp.com>
  Frank Li <lznuaa@gmail.com>
  Ge Qiu <qiuge@huawei.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Kurz <groug@kaod.org>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guenter Roeck <linux@roeck-us.net>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hans Verkuil <hverkuil@xs4all.nl>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Hillf Danton <hdanton@sina.com>
  Huazhong Tan <tanhuazhong@huawei.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ian Abbott <abbotti@mev.co.uk>
  Ian Rogers <irogers@google.com>
  Ido Schimmel <idosch@nvidia.com>
  Ingo Molnar <mingo@kernel.org>
  Ivan Babrou <ivan@cloudflare.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jason Self <jason@bluehome.net>
  Jens Axboe <axboe@kernel.dk>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jian Shen <shenjian15@huawei.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Wiesner <jwiesner@suse.com>
  Joakim Zhang <qiangqing.zhang@nxp.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  John Ernberg <john.ernberg@actia.se>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Juergen Gross <jgross@suse.com>
  Kalle Valo <kvalo@codeaurora.org>
  Karan Singhal <karan.singhal@acuitybrands.com>
  Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
  Keith Busch <kbusch@kernel.org>
  Kevin Hilman <khilman@baylibre.com>
  Kevin(Yudong) Yang <yyd@google.com>
  Khalid Aziz <khalid.aziz@oracle.com>
  Krzysztof Wilczyński <kw@linux.com>
  Lee Gibson <leegib@gmail.com>
  Lin Feng <linf@wangsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lior Ribak <liorribak@gmail.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lorenzo Colitti <lorenzo@google.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kaiser <martin@kaiser.cx>
  Martin Schiller <ms@dev.tdt.de>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Kaehlcke <mka@chromium.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maxim Mikityanskiy <maxtram95@gmail.com>
  Maxime Ripard <mripard@kernel.org>
  Maximilian Heyne <mheyne@amazon.de>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Walle <michael@walle.cc>
  Michal Hocko <mhocko@suse.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mikael Beckius <mikael.beckius@windriver.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Minchan Kim <minchan@kernel.org>
  Namhyung Kim <namhyung@kernel.org>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Neil Roberts <nroberts@igalia.com>
  Nicholas Piggin <npiggin@gmail.com>
  Niv Sardi <xaiki@evilgiggle.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver O'Halloran <oohall@gmail.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Ong Boon Leong <boon.leong.ong@intel.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paul Cercueil <paul@crapouillou.net>
  Paul Moore <paul@paul-moore.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavel Skripkin <paskripkin@gmail.com>
  Pete Zaitcev <zaitcev@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ramesh Babu B <ramesh.babu.b@intel.com>
  Ronald Tschalär <ronald@innovation.ch>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Ross Schmidt <ross.schm.dev@gmail.com>
  Ruslan Bilovol <ruslan.bilovol@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Sean Young <sean@mess.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Segher Boessenkool <segher@kernel.crashing.org>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Shtylyov <s.shtylyov@omprussia.ru>
  Shannon Nelson <snelson@pensando.io>
  Shile Zhang <shile.zhang@linux.alibaba.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simeon Simeonoff <sim.simeonoff@gmail.com>
  Stanislaw Gruszka <stf_xl@wp.pl>
  Stefan Haberland <sth@linux.ibm.com>
  Steve French <stfrench@microsoft.com>
  Steven J. Magnani <magnani@ieee.org>
  Steven Price <steven.price@arm.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tj (Elloe Linux) <ml.linux@elloe.vision>
  Tony Brelinski <tonyx.brelinski@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Torin Cooper-Bennun <torin@maxiluxsystems.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Averin <vvs@virtuozzo.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Qing <wangqing@vivo.com>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  William Tu <u9012063@gmail.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xie He <xie.he.0141@gmail.com>
  Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
  Yi Chen <chenyi77@huawei.com>
  Yorick de Wid <ydewid@gmail.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zbynek Michl <zbynek.michl@gmail.com>

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
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-amd64-amd64-xl-rtds                                     pass    
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

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   ce615a08404c..0437de26e28d  0437de26e28dd844f51fde7a749a82cb2d3694ad -> tested/linux-5.4

