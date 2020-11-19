Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92E2B9BD5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 21:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31414.61775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfqDB-0004Xm-OK; Thu, 19 Nov 2020 20:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31414.61775; Thu, 19 Nov 2020 20:07:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfqDB-0004XL-KA; Thu, 19 Nov 2020 20:07:21 +0000
Received: by outflank-mailman (input) for mailman id 31414;
 Thu, 19 Nov 2020 20:07:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfqDA-0004XD-97; Thu, 19 Nov 2020 20:07:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfqD9-0004lC-WC; Thu, 19 Nov 2020 20:07:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfqD9-0006XM-Jd; Thu, 19 Nov 2020 20:07:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kfqD9-00029u-J5; Thu, 19 Nov 2020 20:07:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfqDA-0004XD-97; Thu, 19 Nov 2020 20:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=ho6q1VAx94XQPX7eEkBOWqjqcZYvuiV3gkvRnedrFC0=; b=uIAmktrPKUD0EXlRMJb3S8HOTw
	l+iMp2Df0O65AAkl+OGULAW/rNzxK4Vvn0+YZJyr0tRnlfoc6cMTjJiA0ea+h3hWZ4q5ac0NgIHCL
	esBmoTg0p4V+Gx2dN+sfCU2d478QROgvglz27Mg8EYzxYVIe928sE0EoE9lCCYHBn/ic=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfqD9-0004lC-WC; Thu, 19 Nov 2020 20:07:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfqD9-0006XM-Jd; Thu, 19 Nov 2020 20:07:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfqD9-00029u-J5; Thu, 19 Nov 2020 20:07:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156874-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 156874: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=315443293a2d0d7c183ca6dd4624d9e4f8a7054a
X-Osstest-Versions-That:
    linux=2544d06afd8d060f35b159809274e4b7477e63e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Nov 2020 20:07:19 +0000

flight 156874 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156874/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 156722

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156722
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156722
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156722
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156722
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156722
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156722
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156722
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156722
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156722
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156722
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156722
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                315443293a2d0d7c183ca6dd4624d9e4f8a7054a
baseline version:
 linux                2544d06afd8d060f35b159809274e4b7477e63e8

Last test of basis   156722  2020-11-12 16:54:57 Z    7 days
Testing same since   156861  2020-11-18 18:41:10 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Aaron Brown <aaron.f.brown@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Anand Jain <anand.jain@oracle.com>
  Anand K Mistry <amistry@google.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Jeffery <andrew@aj.id.au>
  Andrew Jones <drjones@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnaud de Turckheim <quarium@gmail.com>
  Baolin Wang <baolin.wang7@gmail.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Billy Tsai <billy_tsai@aspeedtech.com>
  Bob Peterson <rpeterso@redhat.com>
  Boris Protopopov <pboris@amazon.com>
  Borislav Petkov <bp@suse.de>
  Brian Bunker <brian@purestorage.com>
  Brian Foster <bfoster@redhat.com>
  Brian Norris <briannorris@chromium.org>
  Chao Leng <lengchao@huawei.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chris Brandt <chris.brandt@renesas.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Lameter <cl@linux.com>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Chunyan Zhang <zhang.lyra@gmail.com>
  Coiby Xu <coiby.xu@gmail.com>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  David Howells <dhowells@redhat.com>
  David Sterba <dsterba@suse.com>
  David Verbeiren <david.verbeiren@tessares.net>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Don Brace <don.brace@microchip.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
  Evan Quan <evan.quan@amd.com>
  Evgeny Novikov <novikov@ispras.ru>
  Felipe Balbi <balbi@kernel.org>
  Fred Gao <fred.gao@intel.com>
  Gao Xiang <hsiangkao@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  George Spelvin <lkml@sdf.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hannes Reinecke <hare@suse.de>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  Jack Wang <jinpu.wang@cloud.ionos.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan "Yenya" Kasprzak <kas@fi.muni.cz>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jing Xiangfeng <jingxiangfeng@huawei.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Jitendra Khasdev <jitendra.khasdev@oracle.com>
  Joakim Zhang <qiangqing.zhang@nxp.com>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Jon Hunter <jonathanh@nvidia.com>
  Josef Bacik <josef@toxicpanda.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kaixu Xia <kaixuxia@tencent.com>
  Kalle Valo <kvalo@codeaurora.org>
  Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Laurent Dufour <ldufour@linux.ibm.com>
  Lee Jones <lee.jones@linaro.org>
  lining <lining2020x@163.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu, Yi L <yi.l.liu@intel.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luka Oreskovic <luka.oreskovic@sartura.hr>
  Mao Wenan <wenan.mao@linux.alibaba.com>
  Maor Gottlieb <maorg@nvidia.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Martin Hundebøll <martin@geanix.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schiller <ms@dev.tdt.de>
  Martin Willi <martin@strongswan.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Masashi Honma <masashi.honma@gmail.com>
  Matteo Croce <mcroce@microsoft.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Maxim Levitsky <mlevitsk@redhat.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Petlan <mpetlan@redhat.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Ming Lei <ming.lei@redhat.com>
  Namhyung Kim <namhyung@kernel.org>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Nikolay Borisov <nborisov@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Oliver Herms <oliver.peter.herms@gmail.com>
  Oliver Neukum <oneukum@suse.com>
  Olivier Moysan <olivier.moysan@st.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Moore <paul@paul-moore.com>
  Pavel Machek <pavel@ucw.cz>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <a.p.zijlstra@chello.nl>
  Peter Zijlstra <peterz@infradead.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qian Cai <cai@redhat.com>
  Qii Wang <qii.wang@mediatek.com>
  Qiujun Huang <hqjagain@gmail.com>
  Qu Wenruo <wqu@suse.com>
  Rob Herring <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sandeep Raghuraman <sandy.8925@gmail.com>
  Santosh Shukla <sashukla@nvidia.com>
  Sasha Levin <sashal@kernel.org>
  Sean Anderson <seanga2@gmail.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Ivanichkin <sivanichkin@yandex-team.ru>
  Stefano Brivio <sbrivio@redhat.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephane Grosjean <s.grosjean@peak-system.com>
  Stephen Boyd <swboyd@chromium.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Sven Van Asbroeck <thesven73@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tapas Kundu <tkundu@vmware.com>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tomasz Figa <tfiga@chromium.org>
  Tommi Rantala <tommi.t.rantala@nokia.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Ulrich Hecht <uli+renesas@fpond.eu>
  Ursula Braun <ubraun@linux.ibm.com>
  Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
  Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vlastimil Babka <vbabka@suse.cz>
  Wade Mealing <wmealing@redhat.com>
  Wang Hai <wanghai38@huawei.com>
  Wei Liu <wei.liu@kernel.org>
  Wengang Wang <wen.gang.wang@oracle.com>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Willy Tarreau <w@1wt.eu>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Yangbo Lu <yangbo.lu@nxp.com>
  Ye Bin <yebin10@huawei.com>
  Yegor Yefremov <yegorslists@googlemail.com>
  Yi Sun <yi.y.sun@linux.intel.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yunsheng Lin <linyunsheng@huawei.com>
  Zeng Tao <prime.zeng@hisilicon.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  zhuoliang zhang <zhuoliang.zhang@mediatek.com>

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
 test-armhf-armhf-xl-rtds                                     fail    
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
   2544d06afd8d..315443293a2d  315443293a2d0d7c183ca6dd4624d9e4f8a7054a -> tested/linux-5.4

