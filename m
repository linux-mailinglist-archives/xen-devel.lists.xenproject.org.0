Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBF8C9F29
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 17:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726192.1130448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94UW-0007tA-GF; Mon, 20 May 2024 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726192.1130448; Mon, 20 May 2024 14:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94UW-0007rb-DT; Mon, 20 May 2024 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 726192;
 Mon, 20 May 2024 14:59:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s94UV-0007rR-G4; Mon, 20 May 2024 14:59:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s94UV-0004OP-Ai; Mon, 20 May 2024 14:59:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s94UU-0000fd-WE; Mon, 20 May 2024 14:59:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s94UU-0005JB-Vh; Mon, 20 May 2024 14:59:54 +0000
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
	bh=bptfkd+CZuWLLdIaDHbHs65+aU5RefCGIW1Amqv0oAE=; b=pL1cIbxBj7QYdwodHlaMeXtc2X
	IZ+uhLGsGYwcJ4WgzQP2ovtGBScrXzYMvGO3AMA6geIK/oSB+vBiAtt3tRPICDVdB0TIBzwDjbnho
	CTmfLF3NBC5qQKGGhl2q0+dvFMrL6J28S6dSJzBaEAD5eLzAZKOWegFNMaVxHFTLq8vU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186044-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186044: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:debian-install:fail:allowable
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
X-Osstest-Versions-That:
    linux=25f4874662fb0d43fc1d934dd7802b740ed2ab5f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 May 2024 14:59:54 +0000

flight 186044 linux-linus real [real]
flight 186045 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186044/
http://logs.test-lab.xenproject.org/osstest/logs/186045/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 186036
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 186036

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-arndale   8 xen-boot            fail pass in 186045-retest
 test-armhf-armhf-xl-qcow2     8 xen-boot            fail pass in 186045-retest
 test-armhf-armhf-xl-raw       8 xen-boot            fail pass in 186045-retest
 test-armhf-armhf-xl-multivcpu  8 xen-boot           fail pass in 186045-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     12 debian-install           fail REGR. vs. 186036

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 186045 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 186045 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 186045 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 186045 never pass
 test-armhf-armhf-xl-qcow2   14 migrate-support-check fail in 186045 never pass
 test-armhf-armhf-xl-qcow2 15 saverestore-support-check fail in 186045 never pass
 test-armhf-armhf-xl-raw     14 migrate-support-check fail in 186045 never pass
 test-armhf-armhf-xl-raw 15 saverestore-support-check fail in 186045 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186036
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186036
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186036
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186036
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186036
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
baseline version:
 linux                25f4874662fb0d43fc1d934dd7802b740ed2ab5f

Last test of basis   186036  2024-05-18 21:13:52 Z    1 days
Failing since        186038  2024-05-19 03:51:42 Z    1 days    4 attempts
Testing same since   186044  2024-05-20 05:14:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Chen, Tim C" <tim.c.chen@intel.com>
  "Huang, Ying" <ying.huang@intel.com>
  "King, Colin" <colin.king@intel.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Aleksandr Aprelkov <aaprelkov@usergate.com>
  Alex Rusuf <yorha.op@gmail.com>
  Alex Shi (tencent) <alexs@kernel.org>
  Alex Shi <alexs@kernel.org>
  Alexander Potapenko <glider@google.com>
  Alexandre Ghiti <alexghiti@rivosinc.com
  Alexei Starovoitov <ast@kernel.org>
  Alexey Dobriyan <adobriyan@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arnd Bergmann <arnd@kernel.org>
  Axel Rasmussen <axelrasmussen@google.com>
  Baokun Li <libaokun1@huawei.com>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Baoquan He <bhe@redhat.com>
  Barry Song <v-songbaohua@oppo.com>
  Bart Van Assche <bvanassche@acm.org>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Breno Leitao <leitao@debian.org>
  Brian Foster <bfoster@redhat.com>
  Brian Geffon <bgeffon@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chang S. Bae <chang.seok.bae@intel.com>
  Cheng Yu <serein.chengyu@huawei.com>
  Chris Li <chrisl@kernel.org>
  Christian Loehle <christian.loehle@arm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Hill <daniel@gluo.nz>
  Daniel Thompson <daniel.thompson@linaro.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Hildenbrand <david@redhat.com>
  Dawei Li <daweilics@gmail.com>
  Dennis Zhou <dennis@kernel.org>
  Dev Jain <dev.jain@arm.com>
  Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Disha Goel <disgoel@linux.ibm.com>
  Donet Tom <donettom@linux.ibm.com>
  Douglas Anderson <dianders@chromium.org>
  Duoming Zhou <duoming@zju.edu.cn>
  Edward Liaw <edliaw@google.com>
  Eric Sandeen <sandeen@redhat.com>
  Florian Rommel <mail@florommel.de>
  Frank van der Linden <fvdl@google.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Hao Ge <gehao@kylinos.cn>
  Hao Xiang <hao.xiang@bytedance.com>
  Hariom Panthi <hariom1.p@samsung.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@gmx.de> [parisc]
  Heming Zhao <heming.zhao@suse.com>
  Ho-Ren (Jack) Chuang <horenchuang@bytedance.com>
  Hongbo Li <lihongbo22@huawei.com>
  Honggyu Kim <honggyu.kim@sk.com>
  Huang Shijie <shijie@os.amperecomputing.com>
  Huang Ying <ying.huang@intel.com>
  Ingo Molnar <mingo@kernel.org>
  James Houghton <jthoughton@google.com>
  Jan Kara <jack@suse.cz>
  Jan Kara <jack@suse.cz>               [jbd2]
  Jeff Layton <jlayton@kernel.org>
  Jinjiang Tu <tujinjiang@huawei.com>
  Joe Perches <joe@perches.com>
  Joel Granados <j.granados@samsung.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Hubbard <jhubbard@nvidia.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Justin Stitt <justinstitt@google.com>
  K Prateek Nayak <kprateek.nayak@amd.com>
  Kairui Song <kasong@tencent.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Klara Modin <klarasmodin@gmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org> # QC SM8550 QRD
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Lance Yang <ioworker0@gmail.com>
  Len Brown <len.brown@intel.com>
  Li kunyu <kunyu@nfschina.com>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  linke li <lilinke99@qq.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Shixin <liushixin2@huawei.com>
  Long Li <leo.lilong@huawei.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lucas Stach <l.stach@pengutronix.de>
  Luis Henriques <lhenriques@suse.de>
  Lukas Bulwahn <lbulwahn@redhat.com>
  Lukas Bulwahn <lukas.bulwahn@redhat.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthew Wilcox <willy@infradead.org>
  Max Kellermann <max.kellermann@ionos.com>
  Mel Gorman <mgorman@techsingularity.net>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michael Forney <mforney@mforney.org>
  Michal Hocko <mhocko@suse.com>
  Miguel Ojeda <ojeda@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  NeilBrown <neilb@suse.de>
  Nhat Pham <nphamcs@gmail.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
  Oscar Salvador <osalvador@suse.de>
  Palmer Dabbelt <palmer@rivosinc.com>  [RISC-V]
  Pankaj Raghav <p.raghav@samsung.com>
  Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>
  Peter Xu <peterx@redhat.com>
  Petr Vorel <pvorel@suse.cz>
  Phillip Lougher <phillip@squashfs.org.uk>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Villemoes <linux@rasmusvillemoes.dk>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Rik van Riel <riel@surriel.com>
  Ritesh Harjani (IBM) <ritesh.list@gmail.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  rulinhuang <rulin.huang@intel.com>
  Ryan Roberts <ryan.roberts@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saurav Shah <sauravshah.31@gmail.com>
  Sean Christopherson <seanjc@google.com>       [KVM]
  SeongJae Park <sj@kernel.org>
  Sergey Senozhatsky <senozhatsky@chromium.org>
  Shakeel Butt <shakeel.butt@linux.dev>
  Sidhartha Kumar <sidhartha.kumar@oracle.com>
  Song Liu <song@kernel.org>
  Stephen Smalley <stephen.smalley.work@gmail.com>
  Steve French <stfrench@microsoft.com>
  Su Yue <glass.su@suse.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Suren Baghdasaryan <surenb@google.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bertschinger <tahbertschinger@gmail.com>
  Thorsten Blum <thorsten.blum@toblux.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Usama Arif <usamaarif642@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vincent Guittot <vincent.guittot@linaro.org>
  Vishal Moola (Oracle) <vishal.moola@gmail.com>
  Vishal Verma <vishal.l.verma@intel.com>
  Vitalii Bursov <vitaly@bursov.com>
  Vladimir Benes <vbenes@redhat.com>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Wei Yang <richard.weiyang@gmail.com>
  Xining Xu <mac.xxn@outlook.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yajun Deng <yajun.deng@linux.dev>
  Yang Li <yang.lee@linux.alibaba.com>
  Ye Bin <yebin10@huawei.com>
  York Jasper Niebuhr <yjnworkstation@gmail.com>
  Yosry Ahmed <yosryahmed@google.com>
  Youling Tang <tangyouling@kylinos.cn>
  Yu Zhao <yuzhao@google.com>
  Zhang Qiao <zhangqiao22@huawei.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhang Yi <yi.zhang@huawei.com>
  ZhangPeng <zhangpeng362@huawei.com>
  Zi Yan <ziy@nvidia.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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

(No revision log; it would be 20845 lines long.)

