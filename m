Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CEA5648AF
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jul 2022 18:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359665.589007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o82uT-0005nd-Ua; Sun, 03 Jul 2022 16:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359665.589007; Sun, 03 Jul 2022 16:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o82uT-0005kA-Ro; Sun, 03 Jul 2022 16:57:25 +0000
Received: by outflank-mailman (input) for mailman id 359665;
 Sun, 03 Jul 2022 16:57:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o82uS-0005k0-CQ; Sun, 03 Jul 2022 16:57:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o82uS-0000iv-8D; Sun, 03 Jul 2022 16:57:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o82uR-0007Z5-NB; Sun, 03 Jul 2022 16:57:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o82uR-0000L7-Mf; Sun, 03 Jul 2022 16:57:23 +0000
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
	bh=2F1nUJVT1BYy2diFtalXujrC4XxeaxFOWMNc4f8qr4o=; b=j9UidhrmxJCUZtSsGC85K9RD6B
	Kj9PSqNP0w3oxep4quMT2nA70iM9/GKespdUemmkOCETLKk/bskaIP9qbOY7hQtvzzFjMiqyR8dQT
	QtBUEKJQJQJLeYVT0cWbRcn4cQN5HsGYEy7jwaSNEaaV2ffysx0Qdqnhwy/UCyDwC07Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171465-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 171465: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:heisenbug
    linux-5.4:test-amd64-i386-examine:xen-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-credit1:guest-localmigrate:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=871cbc208bf0aded1946cd1e3eebec75799d31e8
X-Osstest-Versions-That:
    linux=23db944f754e99abf814a79a2273b0191d35e4ff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 Jul 2022 16:57:23 +0000

flight 171465 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171465/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64 7 xen-install fail in 171460 pass in 171465
 test-armhf-armhf-xl-credit1  14 guest-start      fail in 171460 pass in 171465
 test-amd64-i386-examine       6 xen-install                fail pass in 171460
 test-amd64-amd64-xl-credit1  18 guest-localmigrate         fail pass in 171460
 test-armhf-armhf-xl-rtds     14 guest-start                fail pass in 171460
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat  fail pass in 171460

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail blocked in 171352
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail blocked in 171352
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 171460 like 171352
 test-armhf-armhf-xl-credit2  14 guest-start         fail in 171460 like 171352
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 171460 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 171460 never pass
 test-armhf-armhf-xl-credit1  18 guest-start/debian.repeat    fail  like 171352
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171352
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 171352
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171352
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 171352
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171352
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171352
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171352
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 171352
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171352
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 171352
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171352
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                871cbc208bf0aded1946cd1e3eebec75799d31e8
baseline version:
 linux                23db944f754e99abf814a79a2273b0191d35e4ff

Last test of basis   171352  2022-06-25 11:13:17 Z    8 days
Failing since        171400  2022-06-29 07:11:34 Z    4 days    9 attempts
Testing same since   171460  2022-07-02 16:43:26 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Anatolii Gerasymenko <anatolii.gerasymenko@intel.com>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Antoine Tenart <atenart@kernel.org>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Ballon Shi <ballon.shi@quectel.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Baruch Siach <baruch@tkos.co.il>
  Carlo Lobrano <c.lobrano@gmail.com>
  Chevron Li <chevron.li@bayhubtech.com>
  Chevron Li<chevron.li@bayhubtech.com>
  Christoph Hellwig <hch@lst.de>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Curtis Taylor <cutaylor-pub@yahoo.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dmitry Rokosov <ddrokosov@sberdevices.ru>
  Edward Wu <edwardwu@realtek.com>
  Eelco Chaudron <echaudro@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Genjian Zhang <zhanggenjian@kylinos.cn>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  huhai <huhai@kylinos.cn>
  Hulk Robot <hulkrobot@huawei.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jessica Yu <jeyu@kernel.org>
  Jian Cai <caij2003@gmail.com>
  Jian Cai <jiancai@google.com>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maxwell <jmaxwell37@gmail.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Toppins <jtoppins@redhat.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Krzysztof Halasa <khalasa@piap.pl>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lucas Stach <l.stach@pengutronix.de>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Marc Dionne <marc.dionne@auristor.com>
  Mark Brown <broonie@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Pitre <nico@fluxnic.net>
  Nikos Tsironis <ntsironis@arrikto.com>
  Olivier Moysan <olivier.moysan@foss.st.com>
  Paolo Abeni <pabeni@redhat.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Rob Clark <robdclark@chromium.org>
  Ron Economos <re@w6rz.net>
  Rosemarie O'Riorden <roriorden@redhat.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sami Tolvanen <samitolvanen@google.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shawn Guo <shawnguo@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Stefan Agner <stefan@agner.ch>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Stephen Hemminger <stephen@networkplumber.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sumit Dubey2 <Sumit.Dubey2@ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tim Crawford <tcrawford@system76.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yonglin Tan <yonglin.tan@outlook.com>
  Zheyu Ma <zheyuma97@gmail.com>
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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
   23db944f754e..871cbc208bf0  871cbc208bf0aded1946cd1e3eebec75799d31e8 -> tested/linux-5.4

