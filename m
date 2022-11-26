Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B21639309
	for <lists+xen-devel@lfdr.de>; Sat, 26 Nov 2022 02:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448330.705160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyjll-000576-Rs; Sat, 26 Nov 2022 01:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448330.705160; Sat, 26 Nov 2022 01:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyjll-00053x-Nk; Sat, 26 Nov 2022 01:14:13 +0000
Received: by outflank-mailman (input) for mailman id 448330;
 Sat, 26 Nov 2022 01:14:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oyjlj-00053n-MZ; Sat, 26 Nov 2022 01:14:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oyjlj-0000e9-In; Sat, 26 Nov 2022 01:14:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oyjlj-00029M-5F; Sat, 26 Nov 2022 01:14:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oyjli-0004fA-Uy; Sat, 26 Nov 2022 01:14:11 +0000
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
	bh=OtJnM1o2/PKI/3v9Heul9FhPZRe0lfmek0iARSjLGqA=; b=x8ImpcIDMRIebargE44rOSZkaa
	EDZHAnsiDVGMTkVR2T3E5tHXrQDSmG3iVcQbbuu7RjZeh+YlurGyAbOqYEjmJ4tHAYAeSRhIrA8ol
	DFb/pgwEWFcHmawI0D3q+g8K3NnRg3ey71Mw5y7C+OM4sJgq8eVyGVpZLiQ8ypK3awNs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174962-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 174962: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4d2a309b5c28a2edc0900542d22fec3a5a22243b
X-Osstest-Versions-That:
    linux=771a8acbb84145b943bd608ba376e104ebfa9664
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Nov 2022 01:14:11 +0000

flight 174962 linux-5.4 real [real]
flight 174965 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/174962/
http://logs.test-lab.xenproject.org/osstest/logs/174965/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail pass in 174965-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1  14 guest-start                  fail  like 174746
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 174758
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 174758
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174765
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 174765
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174765
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 174765
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174765
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 174765
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 174765
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 174765
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 174765
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174765
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174765
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                4d2a309b5c28a2edc0900542d22fec3a5a22243b
baseline version:
 linux                771a8acbb84145b943bd608ba376e104ebfa9664

Last test of basis   174765  2022-11-14 06:31:36 Z   11 days
Testing same since   174962  2022-11-25 17:13:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Ford <aford173@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Barba <alex.barba@broadcom.com>
  Alexander Potapenko <glider@google.com>
  Alexander Schmidt <alexschm@de.ibm.com>
  Aman Kumar <aman.kumar@intel.com>
  Anastasia Belova <abelova@astralinux.ru>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew G. Morgan <morgan@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Price <anprice@redhat.com>
  Andy Gospodarek <gospo@broadcom.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Athira Jajeev <atrajeev@linux.vnet.ibm.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Baisong Zhong <zhongbaisong@huawei.com>
  Benjamin Block <bblock@linux.ibm.com>
  Benjamin Coddington <bcodding@redhat.com>
  Benoît Monin <benoit.monin@gmx.fr>
  Borislav Petkov <bp@suse.de>
  Brian Foster <bfoster@redhat.com>
  Brian Norris <briannorris@chromium.org>
  Chandan Babu R <chandan.babu@oracle.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Jun <chenjun102@huawei.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  chenxiaosong (A) <chenxiaosong2@huawei.com>
  Chevron Li <chevron.li@bayhubtech.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuang Wang <nashuiliang@gmail.com>
  Colin Ian King <colin.i.king@gmail.com>
  Cong Wang <cong.wang@bytedance.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Carpenter <error27@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniil Tatianin <d-tatianin@yandex-team.ru>
  Darrick J. Wong <darrick.wong@oracle.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David E. Box <david.e.box@linux.intel.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Tronchin <davide.tronchin.94@gmail.com>
  Disha Goel <disgoel@linux.vnet.ibm.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Doug Brown <doug@schmorgal.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Edwin Török <edwin@etorok.net>
  Eric Dumazet <edumazet@google.com>
  Eric Sandeen <sandeen@redhat.com>
  Filipe Manana <fdmanana@suse.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guo Ren <guoren@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Hawkins Jiawei <yin31149@gmail.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jan Kara <jack@suse.cz>
  Jens Axboe <axboe@kernel.dk>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jiri Benc <jbenc@redhat.com>
  Jiri Kosina <jkosina@suse.cz>
  Jisheng Zhang <jszhang@kernel.org>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jorge Lopez <jorge.lopez2@hp.com>
  Juergen Gross <jgross@suse.com>
  Jussi Laako <jussi@sonarnerd.net>
  Kees Cook <keescook@chromium.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Li Huafei <lihuafei1@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schiller <ms@dev.tdt.de>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Auld <matthew.auld@intel.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Mauro Lima <mauro.lima@eclypsium.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Chan <michael.chan@broadcom.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Mitja Spes <mitja@lxnav.com>
  Mushahid Hussain <mushi.shar@gmail.com>
  Nam Cao <namcaov@gmail.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Huckleberry <nhuck@google.com>
  Nicolas Dumazet <ndumazet@google.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Paul Moore <paul@paul-moore.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Reinhard Speyerer <rspmn@arcor.de>
  Ricardo Cañuelo <ricardo.canuelo@collabora.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roy Novich <royno@nvidia.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sasha Levin <sashal@kernel.org>
  Schspa Shi <schspa@gmail.com>
  Sean Anderson <sean.anderson@seco.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shawn Guo <shawn.guo@linaro.org>
  Shawn Guo <shawnguo@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Siarhei Volkau <lis8215@gmail.com>
  Srikanth Thokala <srikanth.thokala@intel.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  syzbot <syzbot+8b41a1365f1106fd0f33@syzkaller.appspotmail.com>
  syzbot+5f8dcabe4a3b2c51c607@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tony Lindgren <tony@atomide.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vinod Koul <vkoul@kernel.org>
  Wang ShaoBo <bobo.shaobowang@huawei.com>
  Wang Wensheng <wangwensheng4@huawei.com>
  Wang Yufen <wangyufen@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wolfram Sang <wsa@kernel.org>
  xiafukun <xiafukun@huawei.com>
  Xian Wang <dev@xianwang.io>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xin Long <lucien.xin@gmail.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yann Gautier <yann.gautier@foss.st.com>
  Ye Bin <yebin10@huawei.com>
  Yuan Can <yuancan@huawei.com>
  Zeng Heng <zengheng4@huawei.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  ZhangPeng <zhangpeng362@huawei.com>
  Zhengchao Shao <shaozhengchao@huawei.com>

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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
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
   771a8acbb841..4d2a309b5c28  4d2a309b5c28a2edc0900542d22fec3a5a22243b -> tested/linux-5.4

