Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1C897926
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 21:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700628.1094071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs6UG-0005l1-Od; Wed, 03 Apr 2024 19:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700628.1094071; Wed, 03 Apr 2024 19:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs6UG-0005ix-Ky; Wed, 03 Apr 2024 19:41:32 +0000
Received: by outflank-mailman (input) for mailman id 700628;
 Wed, 03 Apr 2024 19:41:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rs6UF-0005ij-HV; Wed, 03 Apr 2024 19:41:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rs6UF-00051D-El; Wed, 03 Apr 2024 19:41:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rs6UF-00007n-0p; Wed, 03 Apr 2024 19:41:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rs6UF-00087x-0L; Wed, 03 Apr 2024 19:41:31 +0000
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
	bh=QJq/I/9qksQEnMma2Ka3iaHVEpeF5myeGFEkCIUVlEg=; b=DBC2DHWvMs7hZYsyo7I/OYyRde
	nDbq0zevxJNoVY+ZFu3pZx1fjQmkklJBDGqzP9DPLqZIGeLwL5tzT/nIgRvQgMExq83J7ITiBLLtQ
	33+sJIaWtYg6u5J+DPnw2gicBuTcUrRJoX+zDbLjoCjuHEM/EMkBRk9uudpGwvxZF0HQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185227-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185227: regressions - FAIL
X-Osstest-Failures:
    linux-6.1:build-arm64:xen-build:fail:regression
    linux-6.1:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=347385861c50adc8d4801d4b899eded38a2f04cd
X-Osstest-Versions-That:
    linux=e5cd595e23c1a075359a337c0e5c3a4f2dc28dd1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Apr 2024 19:41:31 +0000

flight 185227 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185227/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 185167

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185167
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185167
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185167
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185167
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185167
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185167
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                347385861c50adc8d4801d4b899eded38a2f04cd
baseline version:
 linux                e5cd595e23c1a075359a337c0e5c3a4f2dc28dd1

Last test of basis   185167  2024-03-26 22:43:26 Z    7 days
Testing same since   185227  2024-04-03 13:42:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Andrey Jr. Melnikov" <temnota.am@gmail.com>
  "Huang, Ying" <ying.huang@intel.com>
  "Rafael J. Wysocki" <rafael@kernel.org>
  Adamos Ttofari <attofari@amazon.de>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Amit Pundir <amit.pundir@linaro.org>
  Andi Shyti <andi.shyti@kernel.org>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andreas Larsson <andreas@gaisler.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Jr. Melnikov <temnota.am@gmail.com>
  André Rösti <an.roesti@gmail.com>
  Andy Chi <andy.chi@canonical.com>
  Anton Altaparmakov <anton@tuxera.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
  Arnd Bergmann <arnd@arndb.de>
  Arseniy Krasnov <avkrasnov@salutedevices.com>
  Aurélien Jacobs <aurel@gnuage.org>
  Baokun Li <libaokun1@huawei.com>
  Bart Van Assche <bvanassche@acm.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bikash Hazarika <bhazarika@marvell.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Cameron Williams <cang1@live.co.uk>
  Casey Schaufler <casey@schaufler-ca.com>
  Chang S. Bae <chang.seok.bae@intel.com>
  Charan Teja Kalla <quic_charante@quicinc.com>
  Charlie Jenkins <charlie@rivosinc.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian Brauner <brauner@kernel.org>
  Christian Gmeiner <cgmeiner@igalia.com>
  Christian Häggström <christian.haggstrom@orexplore.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Claus Hansen Ries <chr@terma.com>
  Clayton Craft <clayton@craftyguy.net>
  Conrad Kostecki <conikost@gentoo.org>
  Cosmin Tanislav <demonsingur@gmail.com>
  Damian Muszynski <damian.muszynski@intel.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Vogelbacher <daniel@chaospixel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danil Rybakov <danilrybakov249@gmail.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Hildenbrand <david@redhat.com>
  David Laight <david.laight@aculab.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dominique Martinet <dominique.martinet@atmark-techno.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Huang <jinhuieric.huang@amd.com>
  Eugene Korenevsky <ekorenevsky@astralinux.ru>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Fietkau <nbd@nbd.name>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Gabor Juhos <j4g8y7@gmail.com>
  Geliang Tang <tanggeliang@kylinos.cn>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Greg Edwards <gedwards@ddn.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Thelen <gthelen@google.com>
  Guenter Roeck <linux@roeck-us.net>
  Gui-Dong Han <2045gemini@gmail.com>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harald Freudenberger <freude@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hidenori Kobayashi <hidenorik@chromium.org>
  Hongchen Zhang <zhanghongchen@loongson.cn>
  Huacai Chen <chenhuacai@loongson.cn>
  Huang Ying <ying.huang@intel.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Ingo Molnar <mingo@kernel.org>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jameson Thies <jthies@google.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiawei Wang <me@jwang.link>
  Jim Mattson <jmattson@google.com>
  Jinghao Jia <jinghao7@illinois.edu>
  Joakim Zhang <joakim.zhang@cixtech.com>
  Jocelyn Falempe <jfalempe@redhat.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John David Anglin <dave.anglin@bell.net>
  John Ogness <john.ogness@linutronix.de>
  John Sperbeck <jsperbeck@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Josef Bacik <josef@toxicpanda.com>
  Josua Mayer <josua@solid-run.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Kalle Valo <kvalo@kernel.org>
  Karthikeyan Ramasubramanian <kramasub@chromium.org>
  Kazuma Kondo <kazuma-kondo@nec.com>
  Kees Cook <keescook@chromium.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  Kevin Loughlin <kevinloughlin@google.com>
  Kim Phillips <kim.phillips@amd.com>
  KONDO KAZUMA(近藤　和真) <kazuma-kondo@nec.com>
  Krishna chaitanya chundru <quic_krichai@quicinc.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Kyle Tso <kyletso@google.com>
  Ladislav Michl <ladis@linux-mips.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Leo Ma <hanghong.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Pieralisi <lpieralisi@kernel.org>
  Lucas Stach <l.stach@pengutronix.de>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mano Ségransan <mano.segransan@protonmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marios Makassikis <mmakassikis@freebox.fr>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Maulik Shah <quic_mkshah@quicinc.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <mripard@kernel.org>
  Maximilian Heyne <mheyne@amazon.de>
  Mel Gorman <mgorman@techsingularity.net>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Kelley <mhklinux@outlook.com>
  Mickaël Salaün <mic@digikod.net>
  Mike Snitzer <snitzer@kernel.org>
  Mikko Rapeli <mikko.rapeli@linaro.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Natanael Copa <ncopa@alpinelinux.org>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
  Nicolas Pitre <nico@fluxnic.net>
  Nicolin Chen <nicolinc@nvidia.com>
  Nikhil V <quic_nprakash@quicinc.com>
  Niklas Cassel <cassel@kernel.org>
  Nilesh Javali <njavali@marvell.com>
  Nirmoy Das <nirmoy.das@intel.com>
  OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
  Oleksandr Tymoshenko <ovt@google.com>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 15 7590
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Collingbourne <pcc@google.com>
  Petr Mladek <pmladek@suse.com>
  Philip Yang <Philip.Yang@amd.com>
  Philipp Stanner <pstanner@redhat.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Prashanth K <quic_prashk@quicinc.com>
  Qiang Zhang <qiang4.zhang@intel.com>
  Qingliang Li <qingliang.li@mediatek.com>
  Qu Wenruo <wqu@suse.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Reinette Chatre <reinette.chatre@intel.com>
  Richard Weinberger <richard@nod.at>
  Rickard x Andersson <rickaran@axis.com>
  Ricky Wu <ricky_wu@realtek.com>
  Rob Herring <robh@kernel.org>
  Roberto Sassu <roberto.sassu@huawei.com>
  Robin Murphy <robin.murphy@arm.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roger Quadros <rogerq@kernel.org>
  Romain Naour <romain.naour@skf.com>
  Ron Economos <re@w6rz.net>
  Rui Wang <wangrui@loongson.cn>
  Ryan Roberts <ryan.roberts@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sam Ravnborg <sam@ravnborg.org>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sasha Levin <sashal@kernel.org>
  Saurav Kashyap <skashyap@marvell.com>
  Sean Anderson <sean.anderson@linux.dev>
  Sean Christopherson <seanjc@google.com>
  SeongJae Park <sj@kernel.org>
  Sherry Sun <sherry.sun@nxp.com>
  Shivnandan Kumar <quic_kshivnan@quicinc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Song Liu <song@kernel.org>
  Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srish Srinivasan <srish.srinivasan@broadcom.com>
  Srivathsa Dara <srivathsa.d.dara@oracle.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Sumit Garg <sumit.garg@linaro.org>
  Sunmin Jeong <s_min.jeong@samsung.com>
  Svyatoslav Pankratov <svyatoslav.pankratov@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Battersby <tonyb@cybernetics.com>
  Tor Vic <torvic9@mailbox.org>
  Toru Katagiri <Toru.Katagiri@tdk.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wayne Chang <waynec@nvidia.com>
  Wayne Lin <wayne.lin@amd.com>
  Wei Liu <wei.liu@kernel.org>
  Weitao Wang <WeitaoWang-oc@zhaoxin.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiao Ni <xni@redhat.com>
  Xing Li <lixing@loongson.cn>
  Xingui Yang <yangxingui@huawei.com>
  yangerkun <yangerkun@huawei.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Ye Zhang <ye.zhang@rock-chips.com>
  Yishai Hadas <yishaih@nvidia.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yu Kuai <yukuai3@huawei.com>
  yuan linyu <yuanlinyu@hihonor.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zheng Wang <zyytlz.wz@163.com>
  Zi Yan <ziy@nvidia.com>
  Zoltan HERPAI <wigyori@uid0.hu>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 


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

(No revision log; it would be 8551 lines long.)

