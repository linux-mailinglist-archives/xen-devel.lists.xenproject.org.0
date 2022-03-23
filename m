Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F704E561D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 17:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293946.499566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX3bK-0003dj-6N; Wed, 23 Mar 2022 16:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293946.499566; Wed, 23 Mar 2022 16:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX3bK-0003bg-37; Wed, 23 Mar 2022 16:12:46 +0000
Received: by outflank-mailman (input) for mailman id 293946;
 Wed, 23 Mar 2022 16:12:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nX3bJ-0003bW-CB; Wed, 23 Mar 2022 16:12:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nX3bJ-0000Yz-5R; Wed, 23 Mar 2022 16:12:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nX3bI-0008VY-Ol; Wed, 23 Mar 2022 16:12:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nX3bI-0006UR-OK; Wed, 23 Mar 2022 16:12:44 +0000
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
	bh=a1w8M8FxF9PRvRXRNKbMmACY08ShsGx7357iCTpGGFw=; b=wGAc0QlnAXS3T7TZlzXsp5OrAv
	TVtGpME32frWH4fPQlT450OrJTw2aucnI7Sa6l1ZiHbTn6P+zQap77TBwFCfXTz9kAwAaM4wzsGKf
	K3ij+LgqZyKdwcV8NslHRgFtsJIqPB8aAw1lALS8FMrfvjq0bl7ZQhUARAjEfl/IFMck=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168797-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168797: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-vhd:guest-start:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6b1f86f8e9c7f9de7ca1cb987b2cf25e99b1ae3a
X-Osstest-Versions-That:
    linux=b47d5a4f6b8d42f8a8fbe891b36215e4fddc53be
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Mar 2022 16:12:44 +0000

flight 168797 linux-linus real [real]
flight 168802 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/168797/
http://logs.test-lab.xenproject.org/osstest/logs/168802/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail pass in 168802-retest
 test-arm64-arm64-xl-vhd      13 guest-start         fail pass in 168802-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 168787

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10  fail blocked in 168787
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 168802 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 168802 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168787
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168787
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168787
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168787
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168787
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168787
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168787
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168787
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                6b1f86f8e9c7f9de7ca1cb987b2cf25e99b1ae3a
baseline version:
 linux                b47d5a4f6b8d42f8a8fbe891b36215e4fddc53be

Last test of basis   168787  2022-03-22 16:42:12 Z    0 days
Testing same since   168797  2022-03-23 04:23:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Huang, Ying" <ying.huang@intel.com>
  "kernelci.org bot" <bot@kernelci.org>
  "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
  Aaron Lu <aaron.lu@intel.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexey Makhalov <amakhalov@vmware.com>
  Alistair Popple <apopple@nvidia.com>
  Amir Goldstein <amir73il@gmail.com>
  Anand Jain <anand.jain@oracle.com>
  Anatoly Pugachev <matorola@gmail.com> (sparc64)
  Andrew Morton <akpm@linux-foundation.org>
  andrew.yang <andrew.yang@mediatek.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Anthony Iliopoulos <ailiop@suse.com>
  Anton Altaparmakov <anton@tuxera.com>
  Ard Biesheuvel <ardb@kernel.org>
  Bang Li <libang.linuxer@gmail.com>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Bart Van Assche <bvanassche@acm.org>
  Bharata B Rao <bharata@amd.com>
  Bill Wendling <morbo@google.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov <bp@suse.de>
  Brendan Higgins <brendanhiggins@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  CGEL ZTE <cgel.zte@gmail.com>
  Chao Yu <chao.yu@oppo.com>
  Chao Yu <chao@kernel.org>
  Charan Teja Kalla <quic_charante@quicinc.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Chris Down <chris@chrisdown.name>
  Chris von Recklinghausen <crecklin@redhat.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Daeho Jeong <daehojeong@google.com>
  Dai Ngo <dai.ngo@oracle.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Darrick J. Wong <djwong@kernel.org>
  David Anderson <dvander@google.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Howells <dhowells@redhat.com> # afs
  David Rientjes <rientjes@google.com>
  David Sterba <dsterba@suse.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Dāvis Mosāns <davispuh@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Fengnan Chang <changfengnan@vivo.com>
  Filipe Manana <fdmanana@suse.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gabriel Krisman Bertazi <krisman@collabora.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Guillaume Tucker <guillaume.tucker@collabora.com>
  Guo Zhengkui <guozhengkui@vivo.com>
  Hari Bathini <hbathini@linux.ibm.com>
  Honglei Wang <wanghonglei@didichuxing.com>
  hongnanli <hongnan.li@linux.alibaba.com>
  Huang Ying <ying.huang@intel.com>
  Huang, Ying <ying.huang@intel.com>
  Hugh Dickins <hughd@google.com>
  Ingo Molnar <mingo@kernel.org>
  Ira Weiny <ira.weiny@intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jan Kara <jack@suse.cz>
  Jean Delvare <jdelvare@suse.de>
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jens Axboe <axboe@kernel.dk>
  Jia Yang <jiayang5@huawei.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jicheng Shao <shaojicheng@hust.edu.cn>
  Jing Xia <jing.xia@unisoc.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Hubbard <jhubbard@nvidia.com>
  John Keeping <john@metanate.com>
  Josef Bacik <josef@toxicpanda.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Juhyung Park <qkrwngud825@gmail.com>
  Juri Lelli <juri.lelli@redhat.com>
  K Prateek Nayak <kprateek.nayak@amd.com>
  Kan Liang <kan.liang@linux.intel.com>
  Konstantin Vyshetsky <vkon@google.com>
  lianzhi chang <changlianzhi@uniontech.com>
  lihongnan <hongnan.lhn@alibaba-inc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lukas Czerner <lczerner@redhat.com>
  luofei <luofei@unicloud.com>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marco Elver <elver@google.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mel Gorman <mgorman@suse.de>
  Mel Gorman <mgorman@techsingularity.net>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Hocko <mhocko@suse.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Marshall <hubcap@omnibond.com> # orangefs
  Mike Rapoport <rppt@linux.ibm.com>
  Minchan Kim <minchan@kernel.org>
  Minghao Chi <chi.minghao@zte.com.cn>
  Muchun Song <songmuchun@bytedance.com>
  Nadav Amit <namit@vmware.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Naoya Horiguchi <naoya.horiguchi@nec.com>
  Nathan Chancellor <nathan@kernel.org>
  NeilBrown <neilb@suse.de>
  Nicolas Saenz Julienne <nsaenzju@redhat.com>
  Niels Dossche <dossche.niels@gmail.com>
  Niels Dossche <niels.dossche@ugent.be>
  Nikolay Borisov <nborisov@suse.com>
  Ojaswin Mujoo <ojaswin@linux.ibm.com>
  Oleg Nesterov <oleg@redhat.com>
  Omar Sandoval <osandov@fb.com>
  Ondrej Valousek <ondrej.valousek.xm@renesas.com>
  Oscar Salvador <osalvador@suse.de>
  Pankaj Raghav <p.raghav@samsung.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Pavel Machek <pavel@denx.de>
  Peng Liu <liupeng256@huawei.com>
  Peter Collingbourne <pcc@google.com>
  Peter Xu <peterx@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qais Yousef <qais.yousef@arm.com>
  Qian Cai <quic_qiancai@quicinc.com>
  Qu Wenruo <wqu@sus,ree.com>
  Qu Wenruo <wqu@suse.com>
  Rafael Aquini <raquini@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Villemoes <linux@rasmusvillemoes.dk>
  Rik van Riel <riel@surriel.com>
  Ritesh Harjani <riteshh@linux.ibm.com>
  Rob Herring <robh@kernel.org>
  Rohith Surabattula <rohiths@microsoft.com>
  Roman Gushchin <guro@fb.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>   [nilfs]
  Sahil Kang <sahil.kang@asilaycomputing.com>
  Satya Tangirala <satyat@google.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  SeongJae Park <sj@kernel.org>
  Shakeel Butt <shakeelb@google.com>
  Shyam Prasad N <sprasad@microsoft.com>
  Sidong Yang <realwakka@gmail.com>
  Souptick Joarder <jrdr.linux@gmail.com>
  Stafford Horne <shorne@gmail.com>
  Steve French <stfrench@microsoft.com>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Suren Baghdasaryan <surenb@google.com>
  Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
  Sylvain Bellone <sylvain.bellone@algolia.com>
  tangmeng <tangmeng@uniontech.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Theodore Ts'o <tytso@mit.edu>         [ext4]
  Tianchen Ding <dtcccc@linux.alibaba.com>
  Tim Murray <timmurray@google.com>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Uladzislau Rezki <uladzislau.rezki@sony.com>
  Valentin Schneider <valentin.schneider@arm.com>
  Vasily Averin <vvs@virtuozzo.com>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Wang Qing <wangqing@vivo.com>
  Wang Xiaojun <wangxiaojun11@huawei.com>
  Wei Wang <wei.w.wang@intel.com>
  Wei Yang <richard.weiyang@gmail.com>
  Will Deacon <will@kernel.org>
  William Kucharski <william.kucharski@oracle.com>
  Xavier Roche <xavier.roche@algolia.com>
  Xin Hao <xhao@linux.alibaba.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yang <yang.yang29@zte.com.cn>
  Ye Bin <yebin10@huawei.com>
  Yosry Ahmed <yosryahmed@google.com>
  Yury Norov <yury.norov@gmail.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zhaoyang Huang <zhaoyang.huang@unisoc.com>
  Zhen Ni <nizhen@uniontech.com>
  Zhiguo Niu <zhiguo.niu@unisoc.com>
  Zhouyi Zhou <zhouzhouyi@gmail.com>
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
 test-amd64-amd64-xl-pvhv2-intel                              fail    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   b47d5a4f6b8d4..6b1f86f8e9c7f  6b1f86f8e9c7f9de7ca1cb987b2cf25e99b1ae3a -> tested/linux-linus

