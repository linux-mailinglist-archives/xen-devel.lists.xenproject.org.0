Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B935F3DA7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415206.659720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofcwI-0004jF-9u; Tue, 04 Oct 2022 08:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415206.659720; Tue, 04 Oct 2022 08:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofcwI-0004gc-5r; Tue, 04 Oct 2022 08:06:06 +0000
Received: by outflank-mailman (input) for mailman id 415206;
 Tue, 04 Oct 2022 08:06:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofcwG-0004gQ-3l; Tue, 04 Oct 2022 08:06:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofcwF-0005Vo-VS; Tue, 04 Oct 2022 08:06:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofcwF-0000Sp-HG; Tue, 04 Oct 2022 08:06:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ofcwF-0007ze-Gr; Tue, 04 Oct 2022 08:06:03 +0000
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
	bh=yn2f63O0goeyZLSR5MS0cRkuJyfnPSEZkjRIfbTVqVE=; b=EQ/Ob/ZCDJmwpprNHQErCV1Nmo
	HUG8MI32xeQCsSJOcaQdKhwT6Aq+/xWnB82mBaXAKaeKtOv7XVtGpVzbHAf3OzhsmAy+HvAa/nghS
	7BgF7GbdKlqve/yKnC3znWAmGJs0f8zY3aQuoeGSVYOEQ5WjHK2QShhXp2aa5Iy2rpZI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173411-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 173411: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=26b84401da8458c5cbd6818d5732f7bbb84124a2
X-Osstest-Versions-That:
    linux=f3dfe925f9548a4337883926db542ccf4ca55fe1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Oct 2022 08:06:03 +0000

flight 173411 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173411/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173405
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173405
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173405
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173405
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173405
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173405
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173405
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173405
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                26b84401da8458c5cbd6818d5732f7bbb84124a2
baseline version:
 linux                f3dfe925f9548a4337883926db542ccf4ca55fe1

Last test of basis   173405  2022-10-03 17:40:10 Z    0 days
Testing same since   173411  2022-10-04 01:09:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Adam Bratschi-Kaye <ark.email@gmail.com>
  Adam Skladowski <a39.skl@gmail.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Gaynor <alex.gaynor@gmail.com>
  Alexei Starovoitov <ast@kernel.org>
  Andreas Larsson <andreas@gaisler.com>
  Android Treehugger Robot
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Antonio Terceiro <antonio.terceiro@linaro.org>
  Arnd Bergmann <arnd@arndb.de> # arm defconfigs
  Arvid Norlander <lkml@vorpal.se>
  Bart Van Assche <bvanassche@acm.org>
  Bill Wendling <morbo@google.com>
  Björn Roy Baron <bjorn3_gh@protonmail.com>
  Boqun Feng <boqun.feng@gmail.com>
  Boris-Chengbiao Zhou <bobo1239@web.de>
  Casey Schaufler <casey@schaufler-ca.com>
  catalin@antebit.com
  Chanwoo Choi <cw00.choi@samsung.com>
  Chao Qin <chao.qin@intel.com>
  Christian Brauner (Microsoft) <brauner@kernel.org>
  Christian Göttsche <cgzones@googlemail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Latypov <dlatypov@google.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Lezcano <daniel.lezcano@linexp.org>
  Daniel Scally <djrscally@gmail.com>
  Daniel Xu <dxu@dxuuu.xyz>
  Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
  David Gow <davidgow@google.com>
  Dmitry Monakhov <dmtrmonakhov@yandex-team.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Smythies <dsmythies@telus.net>
  Douglas Su <d0u9.su@outlook.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Finn Behrens <me@kloenk.de>
  Florian Fainelli <f.fainelli@gmail.com>
  Fox Chen <foxhlchen@gmail.com>
  Frederick Lawler <fred@cloudflare.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Gary Guo <gary@garyguo.net>
  Geoffrey Thomas <geofft@ldpreload.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
  Hanjun Guo <guohanjun@huawei.com>
  Hans de Goede <hdegoede@redhat.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Huang Rui <ray.huang@amd.com>
  Huisong Li <lihuisong@huawei.com>
  Isabella Basso <isabbasso@riseup.net>
  Jakub Kicinski <kuba@kernel.org>
  Jason Wang <wangborong@cdjrlc.com>
  Jean Delvare <jdelvare@suse.de>
  Jeremy Linton <jeremy.linton@arm.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jianmin Lv <lvjianmin@loongson.cn>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jilin Yuan <yuanjilin@cdjrlc.com>
  Joe Perches <joe@perches.com>
  John Baublitz <john.m.baublitz@gmail.com>
  John Garry <john.garry@huawei.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Julian Merkle <me@jvmerkle.de>
  Keerthy <j-keerthy@ti.com>
  Kees Cook <keescook@chromium.org>
  Kellen Renshaw <kellen.renshaw@canonical.com>
  KP Singh <kpsingh@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Shixin <liushixin2@huawei.com>
  Lontke Michael <michael.lontke@elektrobit.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Lukasz Luba <lukasz.luba@arm.com>
  Léo Lanteri Thauvin <leseulartichaut@gmail.com>
  Maciej Falkowski <m.falkowski@samsung.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Marko Cekrlic <marko.cekrlic.26@gmail.com>
  Martin Rodriguez Reboredo <yakoyoku@gmail.com>
  Matthew Anderson <ruinairas1992@gmail.com>
  Matthew Bakhtiari <dev@mtbk.me>
  Matthew Wilcox <willy@infradead.org>
  Matthias Kaehlcke <mka@chromium.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Walle <michael@walle.cc>
  Miguel Cano <macanroj@gmail.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Milan Landaverde <milan@mdaverde.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Morgan Bartlett <mjmouse9999@gmail.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Niklas Mohrin <dev@niklasmohrin.de>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nándor István Krácser <bonifaido@gmail.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Orlando Chamberlain <redecorating@protonmail.com>
  Paul Moore <paul@paul-moore.com>
  Perry Yuan <Perry.Yuan@amd.com>
  Peter Xu <peterx@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Philipp Zabel <philipp.zabel@gmail.com>
  Philipp Zabel <philipp.zabel@gmail.com> # GA402RJ
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael Mendonca <rafaelmendsr@gmail.com>
  Rasmus Villemoes <linux@rasmusvillemoes.dk>
  Rich Felker <dalias@libc.org>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sami Tolvanen <samitolvanen@google.com>
  Samuel Jiang <chyishian.jiang@gmail.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Shang XiaoJing <shangxiaojing@huawei.com>
  Shi junming <junming@nfschina.com>
  short-circuit <davidedp91@gmail.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stephen Boyd <sboyd@kernel.org>
  Su Jinzhou <jinzhou.su@amd.com>
  Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>
  Sumera Priyadarsini <sylphrenadin@gmail.com>
  Sumit Gupta <sumitg@nvidia.com>
  Sunand <sunandchakradhar@gmail.com>
  Sven Van Asbroeck <thesven73@gmail.com>
  Tamim Khan <tamim@fusetak.com>
  Thierry Reding <treding@nvidia.com>
  Tiago Lam <tiagolam@gmail.com>
  Tony Luck <tony.luck@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadim Pasternak <vadimp@nvidia.com>
  Vijayenthiran Subramaniam <vijayenthiran.subramaniam@arm.com>
  Viktor Garske <viktor@v-gar.de>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wang Wendy <wendy.wang@intel.com>
  Wedson Almeida Filho <wedsonaf@google.com>
  Wei Liu <wei.liu@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Wu XiangCheng <bobwxc@email.cn>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Xu Panda <xu.panda@zte.com.cn>
  Xuewen Yan <xuewen.yan@unisoc.com>
  Yang Yingliang <yangyingliang@huawei.com>
  ye xingchen <ye.xingchen@zte.com.cn>
  Yu Liao <liaoyu15@huawei.com>
  Yuki Okushi <jtitor@2k36.org>
  Zhang Jianhua <chris.zjh@huawei.com>
  Zhang Rui <rui.zhang@intel.com>
  zhaoxiao <zhaoxiao@uniontech.com>

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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   f3dfe925f954..26b84401da84  26b84401da8458c5cbd6818d5732f7bbb84124a2 -> tested/linux-linus

