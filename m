Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F220BDBA
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2020 04:26:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jp0Wb-0003b0-5y; Sat, 27 Jun 2020 02:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tqxh=AI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jp0WZ-0003av-32
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 02:24:59 +0000
X-Inumbo-ID: 63ef8be6-b81d-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63ef8be6-b81d-11ea-bb8b-bc764e2007e4;
 Sat, 27 Jun 2020 02:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=epTIo5pNTw82MFn2SofLbZHhNdh9MMugZZnKfYnDxw0=; b=CfPUslm87R3fmOfuYIt4Vxijc
 NkVx+vlGj/ltbNMbJSskBQwtrsjtDkcq5N3GmfL5nERtdwHuqE8X4Zuf4boF2nci+5Ya58PHmC4NT
 zAQUvXr/cDcp71I/HsvdeNONmAfChk7HLbeEZgEAbkvijYYy64lRjbFVtdz3LnIGkbiCk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jp0WV-00051O-Ha; Sat, 27 Jun 2020 02:24:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jp0WV-0001wX-9R; Sat, 27 Jun 2020 02:24:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jp0WV-00022O-8i; Sat, 27 Jun 2020 02:24:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151372-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 151372: regressions - FAIL
X-Osstest-Failures: linux-linus:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
 linux-linus:test-arm64-arm64-libvirt-xsm:guest-start.2:fail:regression
 linux-linus:test-armhf-armhf-xl-rtds:guest-start.2:fail:allowable
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=4a21185cda0fbb860580eeeb4f1a70a9cda332a4
X-Osstest-Versions-That: linux=1b5044021070efa3259f3e9548dc35d1eb6aa844
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Jun 2020 02:24:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151372 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151372/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64  7 xen-boot              fail REGR. vs. 151214
 test-arm64-arm64-libvirt-xsm 17 guest-start.2            fail REGR. vs. 151214

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     17 guest-start.2            fail REGR. vs. 151214

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151214
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151214
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151214
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151214
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151214
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151214
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151214
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151214
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                4a21185cda0fbb860580eeeb4f1a70a9cda332a4
baseline version:
 linux                1b5044021070efa3259f3e9548dc35d1eb6aa844

Last test of basis   151214  2020-06-18 02:27:46 Z    8 days
Failing since        151236  2020-06-19 19:10:35 Z    7 days    7 attempts
Testing same since   151372  2020-06-26 06:07:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Ma <mapengyu@gmail.com>
  Aaron Plattner <aplattner@nvidia.com>
  Aditya Pakki <pakki001@umn.edu>
  Aiden Leong <aiden.leong@aibsd.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Alexander Lobakin <alobakin@marvell.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexander Stein <alexander.stein@mailbox.org>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Budankov <alexey.budankov@linux.intel.com>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Lunn <andrew@lunn.ch>
  Andrii Nakryiko <andriin@fb.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Antoine Tenart <antoine.tenart@bootlin.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ariel Elior <ariel.elior@marvell.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arvind Sankar <nivedita@alum.mit.edu>
  Atish Patra <atish.patra@wdc.com>
  Axel Lin <axel.lin@ingics.com>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Barry Song <song.bao.hua@hisilicon.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Björn Töpel <bjorn.topel@intel.com>
  Brent Lu <brent.lu@intel.com>
  Briana Oursler <briana.oursler@gmail.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chihhao Chen <chihhao.chen@mediatek.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian Zigotzky <chzigotzky@xenosoft.de>
  Christoffer Nielsen <cn@obviux.dk>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Christopher Swenson <swenson@swenson.io>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Ciara Loftus <ciara.loftus@intel.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Mack <daniel@zonque.org>
  Daniel Schaefer <git@danielschaefer.me>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dany Madden <drt@linux.ibm.com>
  Dave Airlie <airlied@redhat.com>
  Dave Martin <Dave.Martin@arm.com>
  David Christensen <drc@linux.vnet.ibm.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Wilder <dwilder@us.ibm.com>
  Davide Caratti <dcaratti@redhat.com>
  Dejin Zheng <zhengdejin5@gmail.com>
  Denis Efremov <efremov@linux.com>
  Denis Kirjanov <denis.kirjanov@suse.com>
  Denis Kirjanov <kda@linux-powerpc.org>
  Dennis Dalessandro <dennis.dalessandro@intel.com>
  derek.fang <derek.fang@realtek.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry V. Levin <ldv@altlinux.org>
  Doug Berger <opendmb@gmail.com>
  Drew Fustini <drew@beagleboard.org>
  Edward Cree <ecree@solarflare.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fan Guo <guofan5@huawei.com>
  Felix Fietkau <nbd@nbd.name>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Filipe Manana <fdmanana@suse.com>
  Flavio Suligoi <f.suligoi@asem.it>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Frank Werner-Krippendorf <mail@hb9fxq.ch>
  Gal Pressman <galpress@amazon.com>
  Gao Xiang <hsiangkao@redhat.com>
  Gaurav Singh <gaurav1086@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geliang Tang <geliangtang@gmail.com>
  Guenter Roeck <linux@roeck-us.net>
  guodeqing <geffrey.guo@huawei.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Haibo Chen <haibo.chen@nxp.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Heinrich Schuchardt <xypron.glpk@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hongbo Yao <yaohongbo@huawei.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Huacai Chen <chenhc@lemote.com>
  Huy Nguyen <huyn@mellanox.com>
  Ian Rogers <irogers@google.com>
  Ido Schimmel <idosch@mellanox.com>
  Igor Mammedov <imammedo@redhat.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ilya Ponetayev <i.ponetaev@ndmsystems.com>
  Imre Deak <imre.deak@intel.com>
  Ira Weiny <ira.weiny@intel.com>
  Jack Wang <jinpu.wang@cloud.ionos.com>
  Jack Yu <jack.yu@realtek.com>
  Jakub Kicinski <kicinski@fb.com>
  Jan Kara <jack@suse.cz>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jason Yan <yanaijie@huawei.com>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Thoms Toerring <jt@toerring.de>
  Jeremy Kerr <jk@ozlabs.org>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Jisheng Zhang <Jisheng.Zhang@synaptics.com>
  John Fastabend <john.fastabend@gmail.com>
  John Garry <john.garry@huawei.com>
  John Stultz <john.stultz@linaro.org>
  Jonathan Toppins <jtoppins@redhat.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kaike Wan <kaike.wan@intel.com>
  Kaitao Cheng <pilgrimtao@gmail.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  kernel test robot <lkp@intel.com>
  Keyur Patel <iamkeyur96@gmail.com>
  Khaled Almahallawy <khaled.almahallawy@intel.com>
  Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Laurence Tratt <laurie@tratt.net>
  Lee Jones <lee.jones@linaro.org>
  Leon Romanovsky <leonro@mellanox.com>
  Lingling Xu <ling_ling.xu@unisoc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Loic Poulain <loic.poulain@linaro.org>
  Lorenz Brun <lorenz@brun.one>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Maor Gottlieb <maorg@mellanox.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcelo Tosatti <mtosatti@redhat.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Mark Zhang <markz@mellanox.com>
  Martin <martin.varghese@nokia.com>
  Martin Fuzzey <martin.fuzzey@flowbird.group>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Masanari Iida <standby24x7@gmail.com>
  Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Mauricio Faria de Oliveira <mfo@canonical.com>
  Max Gurtovoy <maxg@mellanox.com>
  Maximilian Werner <maximilian.werner96@gmail.com>
  Mel Gorman <mgorman@techsingularity.net>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Kalderon <michal.kalderon@marvell.com>
  Michal Kubecek <mkubecek@suse.cz>
  Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Milian Wolff <milian.wolff@kdab.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nathan Huckleberry <nhuck@google.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Neal Cardwell <ncardwell@google.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  Nirmoy Das <nirmoy.das@amd.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrice Chotard <patrice.chotard@st.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qian Cai <cai@lca.pw>
  Qing Zhang <zhangqing@loongson.cn>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Qiushi Wu <wu000273@umn.edu>
  Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rao Shoaib <rao.shoaib@oracle.com>
  Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
  Rob Gill <rrobgill@protonmail.com>
  Robert Foss <robert.foss@linaro.org>
  Robin Gong <yibin.gong@nxp.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Roman Gushchin <guro@fb.com>
  Roopa Prabhu <roopa@cumulusnetworks.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sabrina Dubroca <sd@queasysnail.net>
  Sami Tolvanen <samitolvanen@google.com>
  Sandeep Raghuraman <sandy.8925@gmail.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sascha Ortmann <sascha.ortmann@stud.uni-hannover.de>
  Sean Christopherson <sean.j.christopherson@intel.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Shannon Nelson <snelson@pensando.io>
  Shay Drory <shayd@mellanox.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Thombre <sthombre@codeaurora.org>
  Sivaprakash Murugesan <sivaprak@codeaurora.org>
  Soheil Hassas Yeganeh <soheil@google.com>
  Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Fomichev <sdf@google.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephan Mueller <smueller@chronox.de>
  Stephan Müller <smueller@chronox.de>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Stephen Smalley <stephen.smalley.work@gmail.com>
  Steve Lee <steves.lee@maximintegrated.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@mellanox.com>
  Thomas Falcon <tlfalcon@linux.ibm.com>
  Thomas Martitz <t.martitz@avm.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tobias Klauser <tklauser@distanz.ch>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tom Rix <trix@redhat.com>
  Tom Seewald <tseewald@gmail.com>
  Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
  Uma Shankar <uma.shankar@intel.com>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
  Vandita Kulkarni <vandita.kulkarni@intel.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vasundhara Volam <vasundhara-v.volam@broadcom.com>
  Vidya Sagar <vidyas@nvidia.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Vishal Verma <vishal.l.verma@intel.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Waiman Long <longman@redhat.com>
  Wei Yang <richard.weiyang@linux.alibaba.com>
  Weihang Li <liweihang@huawei.com>
  Weiping Zhang <zhangweiping@didiglobal.com>
  wenxu <wenxu@ucloud.cn>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
  Xiaoyao Li <xiaoyao.li@intel.com>
  Yang Yingliang <yangyingliang@huawei.com>
  YangHui <yanghui.def@gmail.com>
  Yangyang Li <liyangyang20@huawei.com>
  Yash Shah <yash.shah@sifive.com>
  Ye Bin <yebin10@huawei.com>
  Yick W. Tse <y_w_tse@yahoo.com.hk>
  Zheng Bin <zhengbin13@huawei.com>
  Zhenzhong Duan <zhenzhong.duan@gmail.com>
  Zhiqiang Liu <liuzhiqiang26@huawei.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              fail    
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


Not pushing.

(No revision log; it would be 14066 lines long.)

