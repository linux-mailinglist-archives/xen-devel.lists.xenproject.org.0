Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC57F880D
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 04:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641037.999899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6jEl-0006pp-I6; Sat, 25 Nov 2023 03:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641037.999899; Sat, 25 Nov 2023 03:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6jEl-0006ns-Em; Sat, 25 Nov 2023 03:21:43 +0000
Received: by outflank-mailman (input) for mailman id 641037;
 Sat, 25 Nov 2023 03:21:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r6jEj-0006ni-St; Sat, 25 Nov 2023 03:21:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r6jEj-0004ML-GG; Sat, 25 Nov 2023 03:21:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r6jEi-0006hF-Uo; Sat, 25 Nov 2023 03:21:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r6jEi-0005oz-TR; Sat, 25 Nov 2023 03:21:40 +0000
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
	bh=ya4dnQ5UzxEJz7i0lNlxHXYiIU/SRL3PcRpF1ukIej4=; b=rAr2uB6aely0bfQoQwy2ocRscG
	KNYcgx+zwL0qKdjfEf5zQttEY0V38kEyiHWockVYIiUWJ6lY3wUxNIyv/zH5nidruRf/LCevzIrwA
	QR3BLSOGM7hN/iAF21EK3uSdmzQbC/ONuVr2BC9Vr7c+Iytsx8vjCr9HO/7XkhKiP8ps=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183853-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183853: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f1a09972a45ae63efbd1587337c4be13b1893330
X-Osstest-Versions-That:
    linux=c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Nov 2023 03:21:40 +0000

flight 183853 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183853/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 183766
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 183766
 test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 183766

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183766
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183766
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183766
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183766
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183766
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183766
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183766
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183766
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                f1a09972a45ae63efbd1587337c4be13b1893330
baseline version:
 linux                c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c

Last test of basis   183766  2023-11-15 17:14:16 Z    9 days
Failing since        183773  2023-11-16 13:12:48 Z    8 days   19 attempts
Testing same since   183853  2023-11-24 16:42:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Michael S. Tsirkin" <mst@redhat.com>
  Abel Wu <wuyun.abel@bytedance.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Elder <elder@linaro.org>
  Alex Hung <alex.hung@amd.com>
  Alex Pakhunov <alexey.pakhunov@spacex.com>
  Alexei Starovoitov <ast@kernel.org>
  Alistair Francis <alistair.francis@wdc.com>
  Amir Goldstein <amir73il@gmail.com>
  Anastasia Belova <abelova@astralinux.ru>
  Anders Roxell <anders.roxell@linaro.org>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Ani Sinha <anisinha@redhat.com>
  Anthony Iliopoulos <ailiop@suse.com>
  Aoba K <nexp_0x17@outlook.com>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Arseniy Krasnov <avkrasnov@salutedevices.com>
  Asad Kamal <asad.kamal@amd.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Baruch Siach <baruch@tkos.co.il>
  Bibo Mao <maobibo@loongson.cn>
  Björn Töpel <bjorn@rivosinc.com>
  Breno Leitao <leitao@debian.org>
  Brenton Simpson <appsforartists@google.com>
  Brett Raye <braye@fastmail.com>
  Chandan Babu R <chandanbabu@kernel.org>
  Chandradeep Dey <codesigning@chandradeepdey.com>
  Charles Mirabile <cmirabil@redhat.com>
  Charles Yi <be286@163.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen Yu <yu.c.chen@intel.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@infradead.org>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  ChunHao Lin <hau@realtek.com>
  Clément Léger <cleger@rivosinc.com>
  Colin Ian King <colin.i.king@gmail.com>
  Coly Li <colyli@suse.de>
  D. Wythe <alibuda@linux.alibaba.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Nowlin <dan.nowlin@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel J Blueman <daniel@quora.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  Dave Chinner <dchinner@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw@amazon.co.uk>
  Denis Benato <benato.denis96@gmail.com>
  Dexuan Cui <decui@microsoft.com>
  Duncan Ma <duncan.ma@amd.com>
  Dust Li <dust.li@linux.alibaba.com>
  Eduard Zingerman <eddyz87@gmail.com>
  Ekaterina Esina <eesina@astralinux.ru>
  Erez Shitrit <erezsh@nvidia.com>
  Eric Dumazet <edumazet@google.com>
  Eugenio Pérez <eperezma@redhat.com>
  Eymen Yigit <eymenyg01@gmail.com>
  Fang Xiang <fangxiang3@xiaomi.com>
  Fangzhi Zuo <jerry.zuo@amd.com>
  Ferry Meng <mengferry@linux.alibaba.com>
  Gal Pressman <gal@nvidia.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Gavin Li <gavinl@nvidia.com>
  Geliang Tang <geliang.tang@suse.com>
  Gerd Bayer <gbayer@linux.ibm.com>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Haiyang Zhang <haiyangz@microsoft.com>
  Hamish Martin <hamish.martin@alliedtelesis.co.nz>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hao Ge <gehao@kylinos.cn>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Herb Wei <weihao.bj@ieisystem.com>
  Hou Tao <houtao1@huawei.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hyeongtak Ji <hyeongtak.ji@sk.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Itamar Gozlan <igozlan@nvidia.com>
  Ivan Vecera <ivecera@redhat.com>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jan Bottorff <janb@os.amperecomputing.com>
  Jan Höppner <hoeppner@linux.ibm.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jann Horn <jannh@google.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Wang <jasowang@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jean Delvare <jdelvare@suse.de>
  Jeff Layton <jlayton@kernel.org
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jian Shen <shenjian15@huawei.com>
  Jianbo Liu <jianbol@nvidia.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiawen Wu <jiawenwu@trustnetic.com>
  Jijie Shao <shaojijie@huawei.com>
  Jingbo Xu <jefflexu@linux.alibaba.com>
  Jiri Kosina <jkosina@suse.cz>
  Jithu Joseph <jithu.joseph@intel.com>
  Johannes Weiner <hannes@cmpxchg.org>
  Johnathan Mantey <johnathanx.mantey@intel.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  José Pekkarinen <jose.pekkarinen@foxhound.fi>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juergen Gross <jgross@suse.com>
  Kai Huang <kai.huang@intel.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kailang Yang <kailang@realtek.com>
  Kees Cook <keescook@chromium.org>
  Keisuke Nishimura <keisuke.nishimura@inria.fr>
  Keith Busch <kbusch@kernel.org>
  Kent Overstreet <kent.overstreet@gmail.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kunwu Chan <chentao@kylinos.cn>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Le Ma <le.ma@amd.com>
  Leah Rumancik <leah.rumancik@gmail.com>
  Lech Perczak <lech.perczak@gmail.com>
  Len Brown <len.brown@intel.com>
  Lewis Huang <lewis.huang@amd.com>
  Li Nan <linan122@huawei.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linkui Xiao <xiaolinkui@kylinos.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Tie <liutie4@huawei.com>
  Long Li <leo.lilong@huawei.com>
  Long Li <longli@microsoft.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luca Boccassi <bluca@debian.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Luke D. Jones <luke@ljones.dev>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Maher Sanalla <msanalla@nvidia.com>
  Mahmoud Adam <mngyadam@amazon.com>
  Marek Behún <kabel@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mario Limonciello <mario.limonciello@amd.com> # PHX & Navi33
  Mark O'Donovan <shiftee@posteo.net>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  matoro <matoro_mailinglist_kernel@matoro.tk>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthieu Baerts <matttbe@kernel.org>
  Matus Malych <matus@malych.org>
  MD Danish Anwar <danishanwar@ti.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Mingzhe Zou <mingzhe.zou@easystack.cn>
  Muhammad Ahmed <ahmed.ahmed@amd.com>
  Muhammad Muzammil <m.muzzammilashraf@gmail.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Naomi Chu <naomi.chu@mediatek.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nguyen Dinh Phi <phind.uet@gmail.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nicholas Susanto <nicholas.susanto@amd.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nilesh Javali <njavali@marvell.com>
  Oliver Neukum <oneukum@suse.com>
  Omar Sandoval <osandov@fb.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Paul Hsieh <paul.hsieh@amd.com>
  Paul Moore <paul@paul-moore.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Wang <peter.wang@mediatek.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Quinn Tran <qutran@marvell.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Rahul Rameshbabu <rrameshbabu@nvidia.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Rand Deeb <rand.sec96@gmail.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Ravi Gunasekaran <r-gunasekaran@ti.com>
  Richard Cochran <richardcochran@gmail.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Robert Marko <robert.marko@sartura.hr>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryan Roberts <ryan.roberts@arm.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sam James <sam@gentoo.org>
  Samuel Holland <samuel.holland@sifive.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  SeongJae Park <sj@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Shakeel Butt <shakeelb@google.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shiwu Zhang <shiwu.zhang@amd.com>
  Shyam Prasad N <sprasad@microsoft.com>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Simon Glass <sjg@chromium.org>
  Simon Horman <horms@kernel.org>
  Simon Trimmer <simont@opensource.cirrus.com>
  Song Liu <song@kernel.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stanislav Fomichev <sdf@google.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stefan Haberland <sth@linux.ibm.com>
  Stefan Roesch <shr@devkernel.io>
  Stefano Garzarella <sgarzare@redhat.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stephen Hemminger <stephen@networkplumber.org>
  Steve French <stfrench@microsoft.com>
  Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
  Suman Ghosh <sumang@marvell.com>
  Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>
  Sunitha Mekala <sunithax.d.mekala@intel.com> (A Contingent worker at Intel)
  Suren Baghdasaryan <surenb@google.com>
  Sven Auhagen <sven.auhagen@voleatech.de>
  Takashi Iwai <tiwai@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tianci Yin <tianci.yin@amd.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Uros Bizjak <ubizjak@gmail.com>
  Victor Lu <victorchengchi.lu@amd.com>
  Vincent Wong <vincent.wong2@spacex.com>
  Vlad Buslov <vladbu@nvidia.com>
  WANG Rui <wangrui@loongson.cn>
  Wei Liu <wei.liu@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Xiao Ni <xni@redhat.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Wang <kevinyang.wang@amd.com>
  Yanteng Si <siyanteng@loongson.cn>
  Yi Zhang <yi.zhang@redhat.com>
  Yihong Cao <caoyihong4@outlook.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yonglong Liu <liuyonglong@huawei.com>
  YuanShang <YuanShang.Mao@amd.com>
  Yuran Pereira <yuran.pereira@hotmail.com>
  Zhang Rui <rui.zhang@intel.com>
  Ziwei Xiao <ziweixiao@google.com>

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
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
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
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      fail    
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

(No revision log; it would be 12062 lines long.)

