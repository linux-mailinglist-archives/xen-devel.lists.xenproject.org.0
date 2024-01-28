Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7E83F589
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jan 2024 13:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672834.1046931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rU4h1-0007NK-3h; Sun, 28 Jan 2024 12:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672834.1046931; Sun, 28 Jan 2024 12:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rU4h1-0007Kh-0H; Sun, 28 Jan 2024 12:55:23 +0000
Received: by outflank-mailman (input) for mailman id 672834;
 Sun, 28 Jan 2024 12:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rU4gz-0007KT-E3; Sun, 28 Jan 2024 12:55:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rU4gz-0002bO-2Z; Sun, 28 Jan 2024 12:55:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rU4gy-0002Ud-LC; Sun, 28 Jan 2024 12:55:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rU4gy-0003EM-Kg; Sun, 28 Jan 2024 12:55:20 +0000
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
	bh=RLL7bLpm/8W2giEcv7+RSngVXTVKw1L0Xzd3ipYB4h4=; b=VKYIICKWH+kGqtlVqC9MG+HVEQ
	B2njG2gjP0yxfWMGIZZ754amdQOL9n5UFnbJ1ce43hBQil9GiYtFhu83LTwcIpATiiSdMTFQDWNB5
	2JEP261i8xezBO/NV5u2G/VZmca/fZY4pQjcKD/j4FBgqw8FSywO9jX9wbsiSCttuAqk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184500-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 184500: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-localmigrate:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f0602893f43a54097fcf22bd8c2f7b8e75ca643e
X-Osstest-Versions-That:
    linux=9153fc9664959aa6bb35915b2bbd8fbc4c762962
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Jan 2024 12:55:20 +0000

flight 184500 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184500/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 184381

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qcow2  17 guest-localmigrate fail in 184476 pass in 184500
 test-armhf-armhf-xl-rtds     14 guest-start                fail pass in 184476

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 184476 like 184362
 test-armhf-armhf-xl-arndale 18 guest-start/debian.repeat fail in 184476 like 184362
 test-armhf-armhf-xl-vhd      13 guest-start         fail in 184476 like 184381
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 184476 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 184476 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184381
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184381
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184381
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184381
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat    fail like 184381
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184381
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184381
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184381
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184381
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184381
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 184381
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184381
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184381
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184381
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                f0602893f43a54097fcf22bd8c2f7b8e75ca643e
baseline version:
 linux                9153fc9664959aa6bb35915b2bbd8fbc4c762962

Last test of basis   184381  2024-01-17 06:00:18 Z   11 days
Testing same since   184469  2024-01-25 22:43:10 Z    2 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Christian A. Ehrhardt" <lk@c--e.de>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexei Starovoitov <ast@kernel.org>
  Amit Cohen <amcohen@nvidia.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Lunn <andrew@lunn.ch>
  Andrii Nakryiko <andrii@kernel.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arseniy Krasnov <avkrasnov@salutedevices.com>
  Artem Chernyshev <artem.chernyshev@red-soft.ru>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benjamin Coddington <bcodding@redhat.com>
  Bhaskar Chowdhury <unixbhaskar@gmail.com>
  Bjorn Andersson <andersson@kernel.org>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brian Norris <briannorris@chromium.org>
  Cameron Williams <cang1@live.co.uk>
  Carlos Llamas <cmllamas@google.com>
  Chao Yu <chao@kernel.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Chih-Kang Chang <gary.chang@realtek.com>
  Christian A. Ehrhardt <lk@c--e.de>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Colin Ian King <colin.i.king@gmail.com>
  Colin Ian King <colin.king@canonical.com>
  Curtis Klein <curtis.klein@hpe.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Thompson <daniel.thompson@linaro.org>
  Danilo Krummrich <dakr@redhat.com>
  Dario Binacchi <dario.binacchi@amarulasolutions.com>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Lin <CTLIN0@nuvoton.com>
  David Lin <yu-hao.lin@nxp.com>
  David Rau <David.Rau.opensource@dm.renesas.com>
  David S. Miller <davem@davemloft.net>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Esther Shimanovich <eshimanovich@chromium.org>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Lehner <dev@der-flo.net>
  Florian Westphal <fw@strlen.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gonglei (Arei) <arei.gonglei@huawei.com>
  Gonglei <arei.gonglei@huawei.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guanghui Feng <guanghuifeng@linux.alibaba.com>
  Guenter Roeck <linux@roeck-us.net>
  Gui-Dong Han <2045gemini@gmail.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ian Rogers <irogers@google.com>
  Ido Schimmel <idosch@nvidia.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Inki Dae <inki.dae@samsung.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  James Clark <james.clark@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gerecke <jason.gerecke@wacom.com>
  Jay Buddhabhatti <jay.buddhabhatti@amd.com>
  Jerry Hoemann <jerry.hoemann@hpe.com>
  Jiri Kosina <jkosina@suse.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Joakim Zhang <joakim.zhang@cixtech.com>
  Joe Perches <joe@perches.com>
  John Johansen <john.johansen@canonical.com>
  Jon Hunter <jonathanh@nvidia.com>
  Judy Hsiao <judyhsiao@chromium.org>
  Julian Anastasov <ja@ssi.bg>
  Kalle Valo <kvalo@codeaurora.org>
  Kalle Valo <kvalo@kernel.org>
  Kamil Duljas <kamil.duljas@gmail.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  kernelci.org bot <bot@kernelci.org>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Kunwu Chan <chentao@kylinos.cn>
  Laurent Dufour <ldufour@linux.ibm.com>
  Leon Romanovsky <leonro@nvidia.com>
  Li Jun <jun.li@nxp.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luca Weiss <luca@z3ntu.xyz>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Maciej Strozek <mstrozek@opensource.cirrus.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maurizio Lombardi <mlombard@redhat.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxime Ripard <mripard@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mickaël Salaün <mic@digikod.net>
  Mike Isely <isely@pobox.com>
  Mike Looijmans <mike.looijmans@topic.nl>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nam Cao <namcao@linutronix.de>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Nikita Kiryushin <kiryushin@ancud.ru>
  Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nishanth Menon <nm@ti.com>
  Osama Muhammad <osmtendev@gmail.com>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Peter Chen <peter.chen@kernel.org>
  Peter Delevoryas <peter@pjd.dev>
  Peter Robinson <pbrobinson@gmail.com>
  Petr Machata <petrm@nvidia.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Ping Cheng <ping.cheng@wacom.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Rafael Beims <rafael.beims@toradex.com> # Verdin iMX8MP/SD8997 SD
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ram Muthiah <rammuthiah@google.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Gunasekaran <r-gunasekaran@ti.com>
  RD Babiera <rdbabiera@google.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Richard Weinberger <richard@nod.at>
  Rob Herring <robh@kernel.org>
  Rob Landley <rob@landley.net>
  Robert Foss <rfoss@kernel.org>
  Ronald Monthero <debug.penguin32@gmail.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sasha Levin <sashal@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shuming Fan <shumingf@realtek.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Simon Horman <horms@kernel.org>
  Sjoerd Simons <sjoerd@collabora.com>
  Song Liu <song@kernel.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Wahren <wahrenst@gmx.net>
  Stephen Boyd <sboyd@kernel.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Su Hui <suhui@nfschina.com>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Takashi Iwai <tiwai@suse.de>
  Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Tran <thinhtr@linux.vnet.ibm.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Venkata Sai Duggi <venkata.sai.duggi@ibm.com>
  Vineet Gupta <vgupta@kernel.org>
  Vineeth Vijayan <vneethv@linux.ibm.com>
  wangyangxin <wangyangxin1@huawei.com>
  Weihao Li <cn.liweihao@gmail.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiang Chen <chenxiang66@hisilicon.com>
  Xiang Yang <xiangyang3@huawei.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yihang Li <liyihang9@huawei.com>
  Zhang Yi <yi.zhang@huawei.com>
  ZhaoLong Wang <wangzhaolong1@huawei.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhipeng Lu <alexious@zju.edu.cn>
  Ziqi Zhao <astrajoan@yahoo.com>

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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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


Not pushing.

(No revision log; it would be 5292 lines long.)

