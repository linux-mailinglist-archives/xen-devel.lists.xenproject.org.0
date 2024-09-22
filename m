Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F81197DFCE
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 03:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801459.1211427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssBb8-0003xX-NA; Sun, 22 Sep 2024 01:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801459.1211427; Sun, 22 Sep 2024 01:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssBb8-0003vj-J6; Sun, 22 Sep 2024 01:41:14 +0000
Received: by outflank-mailman (input) for mailman id 801459;
 Sun, 22 Sep 2024 01:41:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssBb7-0003vZ-H3; Sun, 22 Sep 2024 01:41:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssBb7-0007TE-DL; Sun, 22 Sep 2024 01:41:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssBb6-0005o0-MP; Sun, 22 Sep 2024 01:41:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ssBb6-00075n-Kj; Sun, 22 Sep 2024 01:41:12 +0000
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
	bh=M7j2iLoGjSx3dqu6RBZDZ7NhVZaHu6tjT+eKSpywIIE=; b=wqghqvruORmCY5hTFKvOl1oViH
	GHQtTsycEPQVX+4FyjhCQIJHd3jT6fEWWL1O2OfKIvU3+EsOD8pmkm0vzyzKwJKI8dIs25ETXa/Pm
	wS99kSznH5n42olkuj5wKPnY2hIFjDLLNR1nxS7tYsaaYkgqhk6NpCGqbXV1Ip7rNICo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187799-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187799: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start/freebsd.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=7856a565416e0cf091f825b0e25c7a1b7abb650e
X-Osstest-Versions-That:
    linux=1868f9d0260e9afaf7c6436d14923ae12eaea465
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Sep 2024 01:41:12 +0000

flight 187799 linux-linus real [real]
flight 187804 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187799/
http://logs.test-lab.xenproject.org/osstest/logs/187804/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd11-amd64 21 guest-start/freebsd.repeat fail pass in 187804-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187790
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187790
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187790
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187790
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187790
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187790
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                7856a565416e0cf091f825b0e25c7a1b7abb650e
baseline version:
 linux                1868f9d0260e9afaf7c6436d14923ae12eaea465

Last test of basis   187790  2024-09-21 02:41:35 Z    0 days
Testing same since   187799  2024-09-21 16:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Huang, Ying" <ying.huang@intel.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Zhu <alexlzhu@fb.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alok Swaminathan <swaminathanalok@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Arnd Bergmann <arnd@arndb.de>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Baoquan He <bhe@redhat.com>
  Barry Song <baohua@kernel.org>
  Barry Song <v-songbaohua@oppo.com>
  Biju Das <biju.das.jz@bp.renesas.com>
  Breno Leitao <leitao@debian.org>
  Carlos Llamas <cmllamas@google.com>
  Carlos Maiolino <cem@kernel.org>
  Carlos Maiolino <cmaiolino@redhat.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Yu <yu.c.chen@intel.com>
  Chi Zhiling <chizhiling@kylinos.cn>
  Chris Down <chris@chrisdown.name>
  Chris Li <chrisl@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuanhua Han <hanchuanhua@oppo.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Gomez <da.gomez@samsung.com>
  Danilo Krummrich <dakr@kernel.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Finkel <davidf@vimeo.com>
  David Gow <davidgow@google.com>
  David Hildenbrand <david@redhat.com>
  David Rientjes <rientjes@google.com>
  Davidlohr Bueso <dave@stgolabs.net>
  Deshan Zhang <deshan@nfschina.com>
  Dev Jain <dev.jain@arm.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Guenter Roeck <linux@roeck-us.net>
  Hao Ge <gehao@kylinos.cn>
  Helge Deller <deller@gmx.de>  [parisc]
  Heming Zhao <heming.zhao@suse.com>
  Hongbo Li <lihongbo22@huawei.com>
  Huan Yang <link@vivo.com>
  Huang Xiaojia <huangxiaojia2@huawei.com>
  Huang Ying <ying.huang@intel.com>
  Hugh Dickins <hughd@google.com>
  I Hsin Cheng <richard120310@gmail.com>
  J. R. Okajima <hooanon05g@gmail.com>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeff Xu <jeffxu@chromium.org>
  Jianhui Zhou <912460177@qq.com>
  Jinjiang Tu <tujinjiang@huawei.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Johannes Weiner <hannes@cmpxchg.org>
  Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
  Josef Bacik <josef@toxicpanda.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Julian Sun <sunjunchao2870@gmail.com>
  Kairui Song <kasong@tencent.com>
  Kaiyang Zhao <kaiyang2@cs.cmu.edu>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kinsey Ho <kinseyho@google.com>
  Kirill A.  Shutemov <kirill.shutemov@linux.intel.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kuan-Ying Lee <kuan-ying.lee@canonical.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lasse Collin <lasse.collin@tukaani.org>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marco Elver <elver@google.com>
  Mario Casquero <mcasquer@redhat.com>
  Mark Brown <broonie@kernel.org>
  Markus Elfring <elfring@users.sourceforge.net>
  Mateusz Guzik <mjguzik@gmail.com>
  Matthew Cassell <mcassell411@gmail.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mel Gorman <mgorman@techsingularity.net>
  Miao Wang <shankerwangmiao@gmail.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michal Hocko <mhocko@suse.com>
  Michal Koutný <mkoutny@suse.com>
  Mike Rapoport (Microsoft) <rppt@kernel.org>
  Mike Yuan <me@yhndnzj.com>
  Muchun Song <muchun.song@linux.dev>
  Muchun Song <songmuchun@bytedance.com>
  Nanyong Sun <sunnanyong@huawei.com>
  Nhat Pham <nphamcs@gmail.com>
  Nicolas Pitre <npitre@baylibre.com>
  Oleg Nesterov <oleg@redhat.com>
  Pasha Tatashin <pasha.tatashin@soleen.com>
  Paul Moore <paul@paul-moore.com>      [LSM]
  Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
  Pedro Falcato <pedro.falcato@gmail.com>
  Peng Hao <flyingpeng@tencent.com>
  Peter Xu <peterx@redhat.com>
  qasdev <qasdev00@gmail.com>
  Qasim Ijaz <qasdev00@gmail.com>
  qiwu.chen <qiwu.chen@transsion.com>
  qiwu.chen <qiwuchen55@gmail.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rik van Riel <riel@surriel.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Ryan Roberts <ryan.roberts@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  SeongJae Park <sj@kernel.org>
  Sergey Senozhatsky <senozhatsky@chromium.org>
  Shakeel Butt <shakeel.butt@linux.dev>
  Shivank Garg <shivankg@amd.com>
  Shuang Zhai <zhais@google.com>
  Sidhartha Kumar <sidhartha.kumar@oracle.com>
  Sourabh Jain <sourabhjain@linux.ibm.com>
  Suren Baghdasaryan <surenb@google.com>
  Sven Schnelle <svens@linux.ibm.com>
  syzbot <syzbot+f3fff775402751ebb471@syzkaller.appspotmail.com>
  Takaya Saeki <takayas@chromium.org>
  Takero Funaki <flintglass@gmail.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tianchen Ding <dtcccc@linux.alibaba.com>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Uros Bizjak <ubizjak@gmail.com>
  Usama Arif <usamaarif642@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Valdis Kletnieks <valdis.kletnieks@vt.edu>
  Vitaly Wool <vitaly.wool@konsulko.com>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  WangYuli <wangyuli@uniontech.com>
  Wei Yang <richard.weiyang@gmail.com>
  Xiao Yang <ice_yangxiao@163.com>
  Xie Yongji <xieyongji@bytedance.com>
  Yafang Shao <laoar.shao@gmail.com>
  Yanfei Xu <yanfei.xu@intel.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Ruibin <11162571@vivo.com>
  yangge <yangge1116@126.com>
  Yin Fengwei <fengwei.yin@intel.com>
  Yosry Ahmed <yosryahmed@google.com>
  Yu Zhao <yuzhao@google.com>
  Yuanchu Xie <yuanchu@google.com>
  Yuesong Li <liyuesong@vivo.com>
  Yujie Liu <yujie.liu@intel.com>
  zhangjiao <zhangjiao2@cmss.chinamobile.com>
  ZhangPeng <zhangpeng362@huawei.com>
  Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
  Zhiguo Jiang <justinjiang@vivo.com>
  Zhongkun He <hezhongkun.hzk@bytedance.com>
  Zi Yan <ziy@nvidia.com>
  Zi Yan <ziy@nvidia.com> # for x86_64 and arm64

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   1868f9d0260e9..7856a565416e0  7856a565416e0cf091f825b0e25c7a1b7abb650e -> tested/linux-linus

