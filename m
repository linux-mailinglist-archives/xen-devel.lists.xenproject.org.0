Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14D47650C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 22:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247599.426953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcIL-00011m-FS; Wed, 15 Dec 2021 21:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247599.426953; Wed, 15 Dec 2021 21:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcIL-0000zY-BH; Wed, 15 Dec 2021 21:58:41 +0000
Received: by outflank-mailman (input) for mailman id 247599;
 Wed, 15 Dec 2021 21:58:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxcIJ-0000zO-RO; Wed, 15 Dec 2021 21:58:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxcIJ-0005Bu-7a; Wed, 15 Dec 2021 21:58:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxcII-0002hZ-S2; Wed, 15 Dec 2021 21:58:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mxcII-0001nz-RY; Wed, 15 Dec 2021 21:58:38 +0000
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
	bh=ogbLgdCK8mnu6t7yV0MkGQklbteJWU/k8d0VUOys+ns=; b=UxgCIbMeyJKdQrdCjjxpWEhbwu
	SjeuU3Vyr52Oh8jTE5keGIzAllUYw39ikZip1UPGlhzPc2QNkkjnpEEex+I/i8rdhCPQ13IkS/Qws
	JRTJOt2s1ZNJakFerQ2vAcW9G+E4lvQjy6eF2scV5+LmkHyYXQmBQx7PvxSrPyv+fvok=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167422-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 167422: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-localmigrate/x10:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-localmigrate/x10:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
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
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=7f70428f0109470aa9177d1a9e5ce02de736f480
X-Osstest-Versions-That:
    linux=e3c95128def1c937754a5cdc3d297fa47968e9f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Dec 2021 21:58:38 +0000

flight 167422 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167422/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-debianhvm-amd64 18 guest-localmigrate/x10 fail in 167413 pass in 167422
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 18 guest-localmigrate/x10 fail in 167413 pass in 167422
 test-arm64-arm64-libvirt-raw 13 guest-start                fail pass in 167413

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail in 167413 like 167230
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 167413 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 167413 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167230
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167230
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 167230
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167230
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167230
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167230
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167230
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 167230
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 167230
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167230
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167230
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 167230
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                7f70428f0109470aa9177d1a9e5ce02de736f480
baseline version:
 linux                e3c95128def1c937754a5cdc3d297fa47968e9f6

Last test of basis   167230  2021-12-08 08:12:55 Z    7 days
Testing same since   167413  2021-12-14 14:15:06 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Stern <stern@rowland.harvard.edu>
  Alan Young <consult.awy@gmail.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Alok Prasad <palok@marvell.com>
  Alyssa Ross <hi@alyssa.is>
  Andrea Mayer <andrea.mayer@uniroma2.it>
  Andrew Morton <akpm@linux-foundation.org>
  Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
  Anton Altaparmakov <anton@tuxera.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ariel Elior <aelior@marvell.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bindushree P <Bindushree.p@intel.com>
  Brian Silverman <brian.silverman@bluerivertech.com>
  Chen-Yu Tsai <wens@csie.org>
  Christian König <christian.koenig@amd.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  David Ahern <dsahern@kernel.org>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Davidlohr Bueso <dbueso@suse.de>
  Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Evgeny Boger <boger@wirenboard.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  freak07 <michalechner92@googlemail.com>
  George Kuruvinakunnel <george.kuruvinakunnel@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Gurucharan G <gurucharanx.g@intel.com>
  Gwendal Grignou <gwendal@chromium.org>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Herve Codina <herve.codina@bootlin.com>
  J. Bruce Fields <bfields@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jeya R <jeyr@codeaurora.org>
  Jianglei Nie <niejianglei2021@163.com>
  Jianguo Wu <wujianguo@chinatelecom.cn>
  Jimmy Assarsson <extja@kvaser.com>
  Jiri Kosina <jkosina@suse.cz>
  Joakim Zhang <qiangqing.zhang@nxp.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Karen Sornek <karen.sornek@intel.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Lars-Peter Clausen <lars@metafoo.de>
  Lee Jones <lee.jones@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lionel Landwerlin <lionel.g.landwerlin@intel.com>
  Luca Stefani <luca.stefani.ge1@gmail.com>
  Manish Chopra <manishc@marvell.com>
  Manjong Lee <mj0123.lee@samsung.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Maxim Mikityanskiy <maximmi@nvidia.com>
  Michal Maloszewski <michal.maloszewski@intel.com>
  Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mitch Williams <mitch.a.williams@intel.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Noralf Trønnes <noralf@tronnes.org>
  Nuno Sá <nuno.sa@analog.com>
  Oleg Nesterov <oleg@redhat.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Patrik John <patrik.john@u-blox.com>
  Pavel Hofman <pavel.hofman@ivitera.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Prabhakar Kushwaha <pkushwaha@marvell.com>
  Qu Wenruo <wqu@suse.com>
  Rob Herring <robh@kernel.org>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <simon.horman@corigine.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stephen Boyd <sboyd@kernel.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Szymon Heidrich <szymon.heidrich@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Brelinski <tony.brelinski@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>
  Vladimir Murzin <vladimir.murzin@arm.com>
  Wudi Wang <wangwudi@hisilicon.com>
  xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
  Yang Yingliang <yangyingliang@huawei.com>

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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
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
   e3c95128def1..7f70428f0109  7f70428f0109470aa9177d1a9e5ce02de736f480 -> tested/linux-5.4

