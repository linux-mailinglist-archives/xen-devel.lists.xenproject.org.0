Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15923020F0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 05:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73862.132760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3t8E-0005DA-CB; Mon, 25 Jan 2021 04:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73862.132760; Mon, 25 Jan 2021 04:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3t8E-0005Ce-6A; Mon, 25 Jan 2021 04:05:38 +0000
Received: by outflank-mailman (input) for mailman id 73862;
 Mon, 25 Jan 2021 04:05:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3t8C-0005CW-J0; Mon, 25 Jan 2021 04:05:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3t8C-0003Ae-68; Mon, 25 Jan 2021 04:05:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3t8B-0002hH-SB; Mon, 25 Jan 2021 04:05:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l3t8B-0000l1-RN; Mon, 25 Jan 2021 04:05:35 +0000
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
	bh=gw0lSnlDac4yav9I69myAC2XYEnW84Uk9iP2YkUddt4=; b=QlamrucCF0u9ixBNHgOTdpUws9
	1EvFMAu0TbyDIRuvrXR7AgA8CHdGalvpmwQ0LzEGbmvU7KCUPIF73j/9p0NNG94O89guGX+Drw5yl
	ebXl6cn75DVVAQPJExBfWlUgCny76vhu0TUBYPAP+tU13I2J/LKM5bjEpIIMS5H+tVx0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158603-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 158603: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:xen-boot:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
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
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=09f983f0c7fc0db79a5f6c883ec3510d424c369c
X-Osstest-Versions-That:
    linux=a829146c3fdcf6d0b76d9c54556a223820f1f73b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Jan 2021 04:05:35 +0000

flight 158603 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158603/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 158387

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 158593

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 158387
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 158387
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 158387
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 158387
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 158387
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 158387
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 158387
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 158387
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 158387
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 158387
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 158387
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                09f983f0c7fc0db79a5f6c883ec3510d424c369c
baseline version:
 linux                a829146c3fdcf6d0b76d9c54556a223820f1f73b

Last test of basis   158387  2021-01-12 19:40:06 Z   12 days
Failing since        158473  2021-01-17 13:42:20 Z    7 days   12 attempts
Testing same since   158593  2021-01-23 21:09:36 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Akilesh Kailash <akailash@google.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Maguire <alan.maguire@oracle.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksander Jan Bajkowski <olek2@wp.pl>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexandru Ardelean <alexandru.ardelean@analog.com>
  Alexey Minnekhanov <alexeymin@postmarketos.org>
  Anders Roxell <anders.roxell@linaro.org>
  Andreas Kemnade <andreas@kemnade.info>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
  Andrii Nakryiko <andrii@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Aya Levin <ayal@nvidia.com>
  Ayush Sawal <ayush.sawal@chelsio.com>
  Baptiste Lepers <baptiste.lepers@gmail.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Colin Ian King <colin.king@canonical.com>
  Craig Tatlor <ctatlor97@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Dave Wysochanski <dwysocha@redhat.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Wu <david.wu@rock-chips.com>
  Dennis Li <Dennis.Li@amd.com>
  Dexuan Cui <decui@microsoft.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Eric Dumazet <edumazet@google.com>
  Fabian Vogt <fvogt@suse.com>
  Felix Fietkau <nbd@nbd.name>
  Fenghua Yu <fenghua.yu@intel.com>
  Filipe Manana <fdmanana@suse.com>
  Finn Thain <fthain@telegraphics.com.au>
  Florian Westphal <fw@strlen.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gopal Tiwari <gtiwari@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guido Günther <agx@sigxcpu.org>
  Gustavo Pimentel <gustavo.pimentel@synopsys.com>
  Hamish Martin <hamish.martin@alliedtelesis.co.nz>
  Hans de Goede <hdegoede@redhat.com>
  Hao Wang <pkuwangh@gmail.com>
  Hoang Le <hoang.h.le@dektech.com.au>
  Huazhong Tan <tanhuazhong@huawei.com>
  Ido Schimmel <idosch@nvidia.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ingo Molnar <mingo@kernel.org>
  Israel Rukshin <israelr@nvidia.com>
  J. Bruce Fields <bfields@redhat.com>
  j.nixdorf@avm.de <j.nixdorf@avm.de>
  Jakub Kicinski <kuba@kernel.org>
  Jamie Iles <jamie@jamieiles.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jean Delvare <jdelvare@suse.de>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jethro Beekman <jethro@fortanix.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby <jslaby@suse.cz>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Nixdorf <j.nixdorf@avm.de>
  John Millikin <john@john-millikin.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joonsoo Kim <iamjoonsoo.kim@lge.com>
  Jouni K. Seppänen <jks@iki.fi>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juergen Gross <jgross@suse.com>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Leon Romanovsky <leonro@nvidia.com>
  Leon Schuermann <leon@is.currently.online>
  Linhua Xu <linhua.xu@unisoc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Lozano <llozano@google.com>
  Lukas Wunner <lukas@wunner.de>
  Manish Chopra <manishc@marvell.com>
  Manoj Gupta <manojgupta@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcin Wojtas <mw@semihalf.com>
  Mark Bloch <mbloch@nvidia.com>
  Mark Brown <broonie@kernel.org>
  Mark Zhang <markzhang@nvidia.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <kafai@fb.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Mircea Cirjaliu <mcirjaliu@bitdefender.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Oded Gabbay <ogabbay@kernel.org>
  Olaf Hering <olaf@aepfle.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Parav Pandit <parav@nvidia.com>
  Paul Cercueil <paul@crapouillou.net>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Peter Robinson <pbrobinson@gmail.com>
  Petr Machata <me@pmachata.org>
  Petr Machata <petrm@nvidia.com>
  Ping Cheng <ping.cheng@wacom.com>
  Ping Cheng <pinglinux@gmail.com>
  Po-Hsu Lin <po-hsu.lin@canonical.com>
  Qinglang Miao <miaoqinglang@huawei.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Villemoes <rasmus.villemoes@prevas.dk>
  Reinette Chatre <reinette.chatre@intel.com>
  Rob Clark <robdclark@chromium.org>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Rohit Maheshwari <rohitm@chelsio.com>
  Roman Guskov <rguskov@dh-electronics.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sagi Grimberg <sagi@grimberg.me>
  Samuel Holland <samuel@sholland.org>
  Sasha Levin <sashal@kernel.org>
  Sean Tranchetti <stranche@codeaurora.org>
  Shawn Guo <shawn.guo@linaro.org>
  Shravya Kumbham <shravya.kumbham@xilinx.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stanislav Fomichev <sdf@google.com>
  Stefan Chulski <stefanc@marvell.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Su Yue <l@damenly.su>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Hebb <tommyhebb@gmail.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tom Rix <trix@redhat.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadim Pasternak <vadimp@nvidia.com>
  Valdis Kletnieks <valdis.kletnieks@vt.edu>
  Valdis Klētnieks <valdis.kletnieks@vt.edu>
  Vasily Averin <vvs@virtuozzo.com>
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>
  Vineet Gupta <vgupta@synopsys.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  yangerkun <yangerkun@huawei.com>
  Yonglong Liu <liuyonglong@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Yufeng Mo <moyufeng@huawei.com>
  zhengbin <zhengbin13@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
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


Not pushing.

(No revision log; it would be 5067 lines long.)

