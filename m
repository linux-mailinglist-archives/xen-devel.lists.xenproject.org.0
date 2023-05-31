Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58952717471
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 05:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541535.844402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Chw-0007PL-9X; Wed, 31 May 2023 03:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541535.844402; Wed, 31 May 2023 03:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Chw-0007Nj-5r; Wed, 31 May 2023 03:41:08 +0000
Received: by outflank-mailman (input) for mailman id 541535;
 Wed, 31 May 2023 03:41:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4Chu-0007NZ-Fo; Wed, 31 May 2023 03:41:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4Chu-0002jE-3y; Wed, 31 May 2023 03:41:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4Cht-0001n4-Mc; Wed, 31 May 2023 03:41:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4Cht-0004nt-GF; Wed, 31 May 2023 03:41:05 +0000
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
	bh=MOdkgapNm0mPQe3pp6eUi9wo1uR84S4fSAJJ9OrtXCc=; b=Y1ljRWAzAJ6EfHtEM+6PXPe4wK
	WaWci5PsRJl1CQtXFjxM7mriVxxRVys2k9X9MXtzvDVwD84Bh+AMZ2wv5iHCmWMDJvN7wX77g21Ch
	QLnb1jMC+SKa/hpuqqNnzg2waaXMd9xVKHvqhWVWKT6ny/oUiHKidA2dM/DTxWppweEg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181015-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 181015: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-arm64-arm64-libvirt-xsm:xen-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:xen-install:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=51d0ac4577c20b22cb659b16d73d37c05ce2fbde
X-Osstest-Versions-That:
    linux=f53660ec669f60c772fdf7d75d1c24d288547cee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 May 2023 03:41:05 +0000

flight 181015 linux-5.4 real [real]
flight 181022 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181015/
http://logs.test-lab.xenproject.org/osstest/logs/181022/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-libvirt-xsm  7 xen-install         fail pass in 181022-retest
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail pass in 181022-retest

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 181022 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 181022 never pass
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host         fail  like 180690
 test-amd64-i386-libvirt-raw   7 xen-install                  fail  like 180690
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180690
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180690
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180690
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180690
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180690
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180690
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180690
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180690
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180690
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180690
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180690
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180690
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                51d0ac4577c20b22cb659b16d73d37c05ce2fbde
baseline version:
 linux                f53660ec669f60c772fdf7d75d1c24d288547cee

Last test of basis   180690  2023-05-17 09:46:05 Z   13 days
Testing same since   181015  2023-05-30 12:14:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "t.feng" <fengtao40@huawei.com>
  Aaron Armstrong Skomra <aaron.skomra@wacom.com>
  Adam Stylinski <kungfujesus06@gmail.com>
  Ai Chao <aichao@kylinos.cn>
  Alain Volmat <avolmat@me.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexei Starovoitov <ast@kernel.org>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Badhri Jagan Sridharan <badhri@google.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bastien Nocera <hadess@hadess.net>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bin Li <bin.li@canonical.com>
  Bob Moore <robert.moore@intel.com>
  Cezary Rojewski <cezary.rojewski@intel.com>
  Chao Yu <chao@kernel.org>
  Christian Brauner <brauner@kernel.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Cong Wang <cong.wang@bytedance.com>
  Daisuke Nojiri <dnojiri@chromium.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Gabay <daniel.gabay@intel.com>
  Daniel Sneddon <daniel.sneddon@linux.intel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Bogdanov <d.bogdanov@yadro.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dong Chenchen <dongchenchen2@huawei.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eli Cohen <elic@nvidia.com>
  Eric Dumazet <edumazet@google.com>
  Felix Fietkau <nbd@nbd.name>
  Filipe Manana <fdmanana@suse.com>
  Finn Thain <fthain@linux-m68k.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Frank Wang <frank.wang@rock-chips.com>
  Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
  Geert Uytterhoeven <geert@linux-m68k.org>
  George Kennedy <george.kennedy@oracle.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory Greenman <gregory.greenman@intel.com>
  Gregory Oakes <gregory.oakes@amd.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Hao Lan <lanhao@huawei.com>
  Hao Zeng <zenghao@kylinos.cn>
  Hardik Garg <hargar@linux.microsoft.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Hector Martin <marcan@marcan.st>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hyunwoo Kim <imv4bel@gmail.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Inki Dae <inki.dae@samsung.com>
  Ioana Ciornei <ioana.ciornei@nxp.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Gerecke <jason.gerecke@wacom.com>
  Jason Gerecke <killertofu@gmail.com>
  Javier Rodriguez <josejavier.rodriguez@duagon.com>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jie Wang <wangjie125@huawei.com>
  Jijie Shao <shaojijie@huawei.com>
  Jimmy Assarsson <extja@kvaser.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <jth@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
  Josef Bacik <josef@toxicpanda.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Justin Tee <justin.tee@broadcom.com>
  Kalle Valo <kvalo@kernel.org>
  Ke Zhang <m202171830@hust.edu.cn>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kevin Groeneveld <kgroeneveld@lenbrook.com>
  Konrad Gräfe <k.graefe@gateware.de>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leon@kernel.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Luke D. Jones <luke@ljones.dev>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kepplinger <martin.kepplinger@puri.sm>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxime Bizon <mbizon@freebox.fr>
  Maxime Ripard <maxime@cerno.tech>
  Menglong Dong <dong.menglong@zte.com.cn>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Schmitz <schmitzmic@gmail.com>
  Mike Christie <michael.christie@oracle.com>
  Min Li <lm0963hack@gmail.com>
  Nathan Chancellor <nathan@kernel.org>
  Nick Child <nnac123@linux.ibm.com>
  Nikhil Mahale <nmahale@nvidia.com>
  Nikolay Borisov <nborisov@suse.com>
  Nur Hussein <hussein@unixcat.org>
  Ojaswin Mujoo <ojaswin@linux.ibm.com>
  Oleg Nesterov <oleg@redhat.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Pablo Greco <pgreco@centosproject.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Philipp Hortmann <philipp.g.hortmann@gmail.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Ping Cheng <ping.cheng@wacom.com>
  Ping Cheng <pinglinux@gmail.com>
  Po-Hsu Lin <po-hsu.lin@canonical.com>
  Pratyush Yadav <ptyadav@amazon.de>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qiang Ning <qning0106@126.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Rodríguez Barbarin, José Javier <JoseJavier.Rodriguez@duagon.com>
  Roi Dayan <roid@nvidia.com>
  Roy Novich <royno@nvidia.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Saravana Kannan <saravanak@google.com>
  Sasha Levin <sashal@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shay Drory <shayd@nvidia.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@kernel.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  t.feng <fengtao40@huawei.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tamir Duberstein <tamird@google.com>
  Tariq Toukan <tariqt@nvidia.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tobias Brunner <tobias@strongswan.org>
  Tomas Krcka <krckatom@amazon.de>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Udipto Goswami <quic_ugoswami@quicinc.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadim Pasternak <vadimp@mellanox.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vernon Lovejoy <vlovejoy@redhat.com>
  Vicki Pfau <vi@endrift.com>
  Vinod Koul <vkoul@kernel.org>
  Vitaliy Tomin <tomin@iszf.irk.ru>
  void0red <30990023+void0red@users.noreply.github.com>
  Weitao Wang <WeitaoWang-oc@zhaoxin.com>
  Will Deacon <will@kernel.org>
  William Tu <u9012063@gmail.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wyes Karny <wyes.karny@amd.com>
  Xin Long <lucien.xin@gmail.com>
  Xiubo Li <xiubli@redhat.com>
  Yonghong Song <yhs@fb.com>
  Zev Weiss <zev@bewilderbeest.net>
  Zhang Rui <rui.zhang@intel.com>
  Zheng Wang <zyytlz.wz@163.com>
  Zhu Yanjun <zyjzyj2000@gmail.com>
  Zhuang Shengen <zhuangshengen@huawei.com>

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
 test-arm64-arm64-libvirt-xsm                                 fail    
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
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
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
   f53660ec669f..51d0ac4577c2  51d0ac4577c20b22cb659b16d73d37c05ce2fbde -> tested/linux-5.4

