Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9144426D5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 06:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219687.380602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhmTe-0002Kw-GI; Tue, 02 Nov 2021 05:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219687.380602; Tue, 02 Nov 2021 05:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhmTe-0002Hk-CY; Tue, 02 Nov 2021 05:36:54 +0000
Received: by outflank-mailman (input) for mailman id 219687;
 Tue, 02 Nov 2021 05:36:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mhmTd-0002Ha-Da; Tue, 02 Nov 2021 05:36:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mhmTd-0005SO-6H; Tue, 02 Nov 2021 05:36:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mhmTc-0001jn-Rn; Tue, 02 Nov 2021 05:36:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mhmTc-0008Lp-RD; Tue, 02 Nov 2021 05:36:52 +0000
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
	bh=pGuBwVBSgZ3F+t4ODzruAYjP5THTJQ0BFeJy8gbfst0=; b=joWjGGo9eZL0Mp4wVfKIuV47ZT
	gVk+o8P1h1m3echRsj9gKKW0VtPGAQfyjsXKxKoBlSY0pvEtxa2Pa3CnvARM5brrH782RS41vZbjG
	V89m+KI2Yv6IGkpPDEQbBVPmDI8W1nhYfbUmH4gi1pF9s1u67WlGTDnwPT5KrwfnthA0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165976-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 165976: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=e66435936756d9bce96433be183358a8994a0f0d
X-Osstest-Versions-That:
    linux=8bb7eca972ad531c9b149c0a51ab43a417385813
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Nov 2021 05:36:52 +0000

flight 165976 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165976/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 165965
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 165965
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 165965
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 165965
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 165965
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 165965
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 165965
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 165965
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                e66435936756d9bce96433be183358a8994a0f0d
baseline version:
 linux                8bb7eca972ad531c9b149c0a51ab43a417385813

Last test of basis   165965  2021-11-01 01:11:29 Z    1 days
Failing since        165974  2021-11-01 17:40:47 Z    0 days    2 attempts
Testing same since   165976  2021-11-01 23:11:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Anand Jain <anand.jain@oracle.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andrea Righi <andrea.righi@canonical.com>
  André Almeida <andrealmeid@collabora.com>
  Anton Altaparmakov <anton@tuxera.com>
  Arnd Bergmann <arnd@arndb.de>
  Barry Song <song.bao.hua@hisilicon.com>
  Bart Van Assche <bvanassche@acm.org>
  Bharata B Rao <bharata@amd.com>
  Bixuan Cui <cuibixuan@huawei.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov <bp@suse.de>
  Cai Huoqing <caihuoqing@baidu.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chang S. Bae <chang.seok.bae@intel.com>
  Changcheng Deng <deng.changcheng@zte.com.cn>
  Chao Yu <chao@kernel.org>
  Chao Yu <yuchao0@huawei.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Coly Li <colyli@suse.de>
  Damien Le Moal <damien.lemoal@wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Sterba <dsterba@suse.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Davidlohr Bueso <dbueso@suse.de>
  Dennis Zhou <dennis@kernel.org>
  Ding Senjie <dingsenjie@yulong.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Hannes Reinecke <hare@suse.de>
  Hao Wu <hao.wu@rubrik.com>
  Hao Xu <haoxu@linux.alibaba.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>  # parisc
  Huaixin Chang <changhuaixin@linux.alibaba.com>
  Ingo Molnar <mingo@kernel.org>
  Israel Rukshin <israelr@nvidia.com>
  J. Bruce Fields <bfields@redhat.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jackie Liu <liuyun01@kylinos.cn>
  Jan Höppner <hoeppner@linux.ibm.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Garry <john.garry@huawei.com>
  John Levon <john.levon@nutanix.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Josh Cartwright <joshc@ni.com>
  Josh Don <joshdon@google.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Kai Song <songkai01@inspur.com>
  Kajol Jain <kjain@linux.ibm.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kevin Hilman <khilman@baylibre.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lasse Collin <lasse.collin@tukaani.org>
  Len Baker <len.baker@gmx.com>
  Len Brown <len.brown@intel.com>
  Leo Yan <leo.yan@linaro.org>
  Li Zhang <zhanglikernel@gmail.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Lin Feng <linf@wangsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Prediger <lumip@lumip.de>
  luo penghao <luo.penghao@zte.com.cn>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Mark Rutland <mark.rutland@arm.com> [arm64]
  Mark Wunderlich <mark.wunderlich@intel.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Gurtovoy <mgurtovoy@nvidia.com>
  Mel Gorman <mgorman@suse.de>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Schmitz <schmitzmic@gmail.com>
  Michal Hocko <mhocko@suse.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Mike Snitzer <snitzer@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miroslav Benes <mbenes@suse.cz>
  Namjae Jeon <linkinjeon@kernel.org>
  Naohiro Aota <naohiro.aota@wdc.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <narmstrong@baylibre.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nikolay Borisov <nborisov@suse.com>
  Nilesh Javali <njavali@marvell.com>
  Noah Goldstein <goldstein.w.n@gmail.com>
  Oliver Upton <oupton@google.com>
  Omar Sandoval <osandov@fb.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Begunkov <asml.silence@gmail.com>
  Peng Wang <rocking@linux.alibaba.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Phillip Lougher <phillip@squashfs.org.uk>
  Phillip Potter <phil@philpotter.co.uk>
  Qi Zheng <zhengqi.arch@bytedance.com>
  Qian Cai <quic_qiancai@quicinc.com>
  Qing Wang <wangqing@vivo.com>
  Qu Wenruo <wqu@suse.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
  Rob Herring <robh@kernel.org>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk> [arm]
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saravana Kannan <saravanak@google.com>
  Saurav Kashyap <skashyap@marvell.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Serge Semin <fancer.lancer@gmail.com>
  Shanpei Chen <shanpeic@linux.alibaba.com>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Sidong Yang <realwakka@gmail.com>
  Song Liu <song@kernel.org>
  Song Liu <songliubraving@fb.com>
  Stefan Haberland <sth@linux.ibm.com>
  Stephane Eranian <eranian@google.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Su Yue <l@damenly.su>
  Sudeep Holla <sudeep.holla@arm.com>
  Sungjong Seo <sj1557.seo@samsung.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tian Tao <tiantao6@hisilicon.com>
  Tianchen Ding <dtcccc@linux.alibaba.com>
  Tim Chen <tim.c.chen@linux.intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org> # For MMC
  Valentin Schneider <valentin.schneider@arm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vasily Gorbik <gor@linux.ibm.com> # on s390
  Vincent Guittot <vincent.guittot@linaro.org>
  Vineet Gupta <vgupta@kernel.org>
  Vladimir Murzin <vladimir.murzin@arm.com> # ARMv7M
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Xiao Ni <xni@redhat.com>
  Xie Yongji <xieyongji@bytedance.com>
  Yafang Shao <laoar.shao@gmail.com>
  Yanfei Xu <yanfei.xu@windriver.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yanteng Si <siyanteng01@gmail.com>
  Yanteng Si <siyanteng@loongson.cn>
  Ye Bin <yebin10@huawei.com>
  Ye Guojin <ye.guojin@zte.com.cn>
  Yicong Yang <yangyicong@hisilicon.com>
  Yu Kuai <yukuai3@huawei.com>
  Yue Hu <huyue2@yulong.com>
  YueHaibing <yuehaibing@huawei.com>
  Zhang Qiao <zhangqiao22@huawei.com>
  Zheng Liang <zhengliang6@huawei.com>
  Zhouyi Zhou <zhouzhouyi@gmail.com>

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
   8bb7eca972ad..e66435936756  e66435936756d9bce96433be183358a8994a0f0d -> tested/linux-linus

