Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D1532880
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 13:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336504.560836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntSM7-0000Ym-Sh; Tue, 24 May 2022 11:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336504.560836; Tue, 24 May 2022 11:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntSM7-0000Wt-P7; Tue, 24 May 2022 11:05:39 +0000
Received: by outflank-mailman (input) for mailman id 336504;
 Tue, 24 May 2022 11:05:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntSM6-0000Wj-GU; Tue, 24 May 2022 11:05:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntSM6-0006Uj-CA; Tue, 24 May 2022 11:05:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntSM5-00063l-Sp; Tue, 24 May 2022 11:05:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntSM5-0007ws-SP; Tue, 24 May 2022 11:05:37 +0000
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
	bh=4JhKSqPHcu0XcHJUB6jDwyAmdQ+0mN5+/GY1fKr3E9w=; b=qqPGz/DtnUpA1F2LtFksKzxrHm
	zUxTaMU51YefSzxJq1bXo65rcr/YPKFXns3Ba9NOr/CM+pGbdbttxJhE9TZ4chDFb/ppxbhkauomU
	mNcOUV7cJz2xg0i4+rnYvA5kqd0EKkvStv4JohVgmJwf3yBSRcX2Pw97syoplpksyd0o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170714-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 170714: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d6ecaa0024485effd065124fe774de2e22095f2d
X-Osstest-Versions-That:
    linux=1e57930e9f4083ad5854ab6eadffe790a8167fb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 May 2022 11:05:37 +0000

flight 170714 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170714/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170711
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170711
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170711
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170711
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170711
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170711
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170711
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170711
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                d6ecaa0024485effd065124fe774de2e22095f2d
baseline version:
 linux                1e57930e9f4083ad5854ab6eadffe790a8167fb4

Last test of basis   170711  2022-05-23 19:39:57 Z    0 days
Testing same since   170714  2022-05-24 03:27:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "yukuai (C)" <yukuai3@huawei.com>
  Almog Khaikin <almogkh@gmail.com>
  Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
  Ammar Faizi <ammarfaizi2@gnuweeb.org>
  Andi Kleen <ak@linux.intel.com>
  Andy Lutomirski <luto@kernel.org>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Anuj Gupta <anuj20.g@samsung.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Baoquan He <bhe@redhat.com>
  Bart Van Assche <bvanassche@acm.org>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@suse.de>
  Brian Gerst <brgerst@gmail.com>
  Brijesh Singh <brijesh.singh@amd.com>
  Cai Huoqing <caihuoqing@baidu.com>
  Carlos Bilbao <carlos.bilbao@amd.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaitanya Kulkarni <kch@nvidia.com>
  Changhui Zhong <czhong@redhat.com>
  Chao Yu <chao@kernel.org>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian Brauner <brauner@kernel.org>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
  Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [drbd]
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Ian King <colin.i.king@gmail.com>
  Coly Li <colyli@suse.de>
  Coly Li <colyli@suse.de> [bcache]
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Darrick J. Wong <djwong@kernel.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David S. Miller <davem@davemloft.net>
  David Sloan <david.sloan@eideticom.com>
  David Sterba <dsterba@suse.com>
  David Sterba <dsterba@suse.com> [btrfs]
  Diego Viola <diego.viola@gmail.com>
  Dmitry Osipenko <dmitry.osipenko@collabora.com> # crosvm
  Dongli Zhang <dongli.zhang@oracle.com>
  Doug Smythies <dsmythies@telus.net>
  Dylan Yudaken <dylany@fb.com>
  Enze Li <lienze@kylinos.cn>
  Eric DeVolder <eric.devolder@oracle.com>
  Eric Dumazet <edumazet@google.com>
  Fanjun Kong <bh1scw@gmail.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Weimer <fweimer@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Goldwyn Rodrigues <rgoldwyn@suse.com>
  Guenter Roeck <linux@roeck-us.net>
  Guo Ren <guoren@kernel.org>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Hao Xu <howeyxu@tencent.com>
  Haowen Bai <baihaowen@meizu.com>
  Heming Zhao <heming.zhao@suse.com>
  Ira Weiny <ira.weiny@intel.com>
  Isaku Yamahata <isaku.yamahata@intel.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jaegeuk Kim <jaegeuk@kernel.org> [f2fs]
  Jakob Koschel <jakobkoschel@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Höppner <hoeppner@linux.ibm.com> [s390]
  Jan Kara <jack@suse.cz>
  Jens Axboe <axboe@kernel.dk>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Joerg Roedel <jroedel@suse.de>
  John Garry <john.garry@huawei.com>
  John Stultz <jstultz@google.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kanchan Joshi <joshi.k@samsung.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Kurt Kanzenbach <kurt@linutronix.de>
  Kyle Smith <kyles@hpe.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lai Jiangshan <jiangshan.ljs@antgroup.com>
  Laibin Qiu <qiulaibin@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Logan Gunthorpe <logang@deltatee.com>
  Longpeng(Mike) <longpeng2@huawei.com>
  Lucas Stach <l.stach@pengutronix.de>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lv Ruyi <lv.ruyi@zte.com.cn>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Marc Zyngier <maz@kernel.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
  Mark Rutland <mark.rutland@arm.com>
  Mark Rutland <mark.rutland@arm.com> [arm64]
  Martin K. Petersen <martin.petersen@oracle.com>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Gurtovoy <mgurtovoy@nvidia.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michael Roth <michael.roth@amd.com>
  Michal Orzel <michalorzel.eng@gmail.com>
  Michal Simek <michal.simek@amd.com>
  Mike Snitzer <snitzer@kernel.org>
  Mike Travis <mike.travis@hpe.com>
  Ming Lei <ming.lei@redhat.com>
  Minghao Chi <chi.minghao@zte.com.cn>
  Muralidhara M K <muralimk@amd.com>
  Nathan Rossi <nathan.rossi@digi.com>
  Naveen Krishna Chatradhi <nchatrad@amd.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nikolai Zhubr <zhubr.2@gmail.com>
  Pali Rohár <pali@kernel.org>
  Pascal Hambourg <pascal@plouf.fr.eu.org>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Gortmaker <paul.gortmaker@windriver.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Gonda <pgonda@google.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Phillip Lougher <phillip@squashfs.org.uk>
  Phillip Potter <phil@philpotter.co.uk>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ricardo Cañuelo <ricardo.canuelo@collabora.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com> [nifs2]
  Samuel Holland <samuel@sholland.org>
  Scott Wood <oss@buserror.net>
  Sean Christopherson <sean.j.christopherson@intel.com>
  Sean Christopherson <seanjc@google.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Sherry Sun <sherry.sun@nxp.com>
  Shuai Xue <xueshuai@linux.alibaba.com>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
  Smith, Kyle Miller (Nimble Kernel) <kyles@hpe.com>
  Song Liu <song@kernel.org>
  Stefan Roesch <shr@fb.com>
  Stefan Roese <sr@denx.de>
  Stephen Boyd <swboyd@chromium.org>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sven Schnelle <svens@linux.ibm.com> # s390
  syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
  tangmeng <tangmeng@uniontech.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tom Rix <trix@redhat.com>
  Tom Yan <tom.ty89@gmail.com>
  Tony Luck <tony.luck@intel.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Vasily Averin <vvs@openvz.org>
  Wan Jiabing <wanjiabing@vivo.com>
  Wolfgang Bumiller <w.bumiller@proxmox.com>
  Xiao Yang <yangx.jy@fujitsu.com>
  Xiaomeng Tong <xiam0nd.tong@gmail.com>
  Xie Yongji <xieyongji@bytedance.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Yu Kuai <yukuai3@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Yury Norov <yury.norov@gmail.com>
  Zhihao Cheng <chengzhihao1@huawei.com>

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
   1e57930e9f40..d6ecaa002448  d6ecaa0024485effd065124fe774de2e22095f2d -> tested/linux-linus

