Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8927DCCD9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 13:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625669.975168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnl7-000437-Ei; Tue, 31 Oct 2023 12:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625669.975168; Tue, 31 Oct 2023 12:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnl7-000419-Ay; Tue, 31 Oct 2023 12:22:13 +0000
Received: by outflank-mailman (input) for mailman id 625669;
 Tue, 31 Oct 2023 12:22:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxnl5-00040z-I3; Tue, 31 Oct 2023 12:22:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxnl5-00024u-DR; Tue, 31 Oct 2023 12:22:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxnl4-0006DM-S4; Tue, 31 Oct 2023 12:22:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qxnl4-0003v8-RZ; Tue, 31 Oct 2023 12:22:10 +0000
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
	bh=zKkBkdy2MyItkL/IppdrI/4w08pAi68bSIJ0GJlrtUE=; b=cnEEJmbwxpcFqYKdr+IoGlwj3H
	/jfs2gdapcgaqA7V9RTKeD4BU5Bj1GyXBdLgkJ6LjMi+SLpWJLObQFX+brMXkMiRDNtXmbyb3whj+
	iMkou+2F1t0a8umLsVrtooDEp/HWXkLteWJLan2Qv/LGqxa5GFhXElXNxPqxqH4Nyw3c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183625-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183625: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:xen-boot:fail:regression
    linux-linus:build-arm64-xsm:xen-build:fail:regression
    linux-linus:test-armhf-armhf-libvirt:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ecb8cd2a9f7af7f99a6d4fa0a5a31822f6cfe255
X-Osstest-Versions-That:
    linux=ffc253263a1375a65fa6c9f62a893e9767fbebfa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Oct 2023 12:22:10 +0000

flight 183625 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183625/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 183617
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 183617
 test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 183617
 test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 183617
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 183617
 test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 183617
 test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 183617
 build-arm64-xsm               6 xen-build                fail REGR. vs. 183617
 test-armhf-armhf-libvirt     10 host-ping-check-xen      fail REGR. vs. 183617

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183617
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183617
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183617
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183617
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183617
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183617
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183617
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ecb8cd2a9f7af7f99a6d4fa0a5a31822f6cfe255
baseline version:
 linux                ffc253263a1375a65fa6c9f62a893e9767fbebfa

Last test of basis   183617  2023-10-30 08:36:55 Z    1 days
Testing same since   183625  2023-10-31 02:27:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Darrick J. Wong" <djwong@kernel.org>
  "Kuyo Chang (張建文)" <Kuyo.Chang@mediatek.com>
  "Md. Haris Iqbal" <haris.iqbal@ionos.com>
  "Peter Zijlstra (Intel)" <peterz@infradead.org>
  "Rafael J. Wysocki" <rafael@kernel.org>
  Aaron Lu <aaron.lu@intel.com>
  Aaron Plattner <aplattner@nvidia.com>
  Adam Dunlap <acdunlap@google.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alison Schofield <alison.schofield@intel.com>
  Amir Goldstein <amir73il@gmail.com>
  Anand Jain <anand.jain@oracle.com>
  Anders Roxell <anders.roxell@linaro.org>
  Ard Biesheuvel <ardb@kernel.org>
  Atul Kumar Pant <atulpant.linux@gmail.com>
  Babu Moger <babu.moger@amd.com>
  Baolin Liu <liubaolin@kylinos.cn>
  Barry Song <song.bao.hua@hisilicon.com>
  Ben Wolsieffer <ben.wolsieffer@hefring.com>
  Bernd Schubert <bschubert@ddn.com>
  Binbin Wu <binbin.wu@linux.intel.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@alien8.de>
  Brett Holman <bholman.devel@gmail.com>
  Brett Holman <bpholman5@gmail.com>
  Brian Foster <bfoster@redhat.com>
  Brian Gerst <brgerst@gmail.com>
  Chen Hanxiao <chenhx.fnst@fujitsu.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Chris Webb <chris@arachsys.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christopher James Halse Rogers <raof@ubuntu.com>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Coly Li <colyli@suse.de>
  Cuda-Chen <clh960524@gmail.com>
  Cyril Hrubis <chrubis@suse.cz>
  Dai Ngo <dai.ngo@oracle.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Robertson <dan@dlrobertson.com>
  Daniel B. Hill <daniel@gluo.nz>
  Daniel Hill <daniel@gluo.nz>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Kaplan <david.kaplan@amd.com>
  David Reaver <me@davidreaver.com>
  David Sterba <dsterba@suse.com>
  Derick Marks <derick.w.marks@intel.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Elliot Berman <quic_eberman@quicinc.com>
  Eric Biggers <ebiggers@google.com>
  Fan Yu <fan.yu9@zte.com.cn>
  Fangrui Song <maskray@google.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Filipe Manana <fdmanana@suse.com>
  Finn Thain <fthain@linux-m68k.org>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Gautham R. Shenoy <gautham.shenoy@amd.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  GUO Zihua <guozihua@huawei.com>
  H. Peter Anvin (Intel) <hpa@zytor.com>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hans de Goede <hdegoede@redhat.com>
  Hao Jia <jiahao.os@bytedance.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hou Wenlong <houwenlong.hwl@antgroup.com>
  Hugh Dickins <hughd@google.com>
  Hunter Shaffer <huntershaffer182456@gmail.com>
  Ian Kent <raven@themaw.net>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jacob Xu <jacobhxu@google.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Janpieter Sollie <janpieter.sollie@edpnet.be>
  Jeff Layton <jlayton@kernel.org>
  Jianlin Li <ljianlin99@gmail.com>
  Jianyong Wu <jianyong.wu@arm.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jingbo Xu <jefflexu@linux.alibaba.com>
  Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John Stultz <jstultz@google.com>
  Josef Bacik <josef@toxicpanda.com>
  Josh Don <joshdon@google.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Joshua Ashton <joshua@froggi.es>
  jpsollie <janpieter.sollie@edpnet.be>
  Juergen Gross <jgross@suse.com>
  Juri Lelli <juri.lelli@redhat.com>
  Justin Husted <sigstop@gmail.com>
  Justin Stitt <justinstitt@google.com>
  K Prateek Nayak <kprateek.nayak@amd.com>
  KaiLong Wang <wangkailong@jari.cn>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Kent Overstreet <kent.overstreet@gmail.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kinglong Mee <kinglongmee@gmail.com>
  Kir Kolyshkin <kolyshkin@gmail.com>
  Klara Modin <klarasmodin@gmail.com>
  Leo Yu-Chi Liang <ycliang@andestech.com>
  Li zeming <zeming@nfschina.com>
  Liming Wu <liming.wu@jaguarmicro.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lizhi Xu <lizhi.xu@windriver.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lucy Mielke <lucymielke@icloud.com>
  Luís Henriques <lhenriques@suse.de>
  Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
  Marco Elver <elver@google.com>
  Mario Casquero <mcasquer@redhat.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Guzik <mjguzik@gmail.com>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Max Kellermann <max.kellermann@ionos.com>
  Max Kellermann <mk@cm4all.com>
  Mel Gorman <mgorman@suse.de>
  Mel Gorman <mgorman@techsingularity.net>
  Michal Hocko <mhocko@suse.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Muralidhara M K <muralidhara.mk@amd.com>
  Nathan Chancellor <nathan@kernel.org>
  NeilBrown <neilb@suse.de>
  Nick Desaulniers <ndesaulniers@google.com>
  Nikolay Borisov <nik.borisov@suse.com>
  Oleg Nesterov <oleg@redhat.com>
  Olexa Bilaniuk <obilaniu@gmail.com>
  pangzizhen001@208suo.com <pangzizhen001@208suo.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Moore <paul@paul-moore.com>
  Peter Newman <peternewman@google.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  peterz@infradead.org <peterz@infradead.org>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Qais Yousef (Google) <qyousef@layalina.io>
  Qais Yousef <qyousef@layalina.io>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raghavendra K T <raghavendra.kt@amd.com>
  Reuben Hawkins <reubenhwk@gmail.com>
  Robbie Litchfield <blam.kiwi@gmail.com>
  Ruan Jinjie <ruanjinjie@huawei.com>
  Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
  Sandipan Das <sandipan.das@amd.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
  Shuai Xue <xueshuai@linux.alibaba.com>
  Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
  Sicong Huang <huangsicong@iie.ac.cn>
  Siddh Raman Pant <code@siddh.me>
  Song Liu <song@kernel.org>
  Steve Wahl <steve.wahl@hpe.com>
  Stijn Tintel <stijn@linux-ipv6.be>
  Suma Hegde <suma.hegde@amd.com>
  Swapnil Sapkal <Swapnil.Sapkal@amd.com>
  Tan Shaopeng <tan.shaopeng@jp.fujitsu.com>
  Tejun Heo <tj@kernel.org>
  Tero Kristo <tero.kristo@linux.intel.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Tim Schlueter <schlueter.tim@linux.com>
  Tobias Geerinckx-Rice <me@tobias.gr>
  Torge Matthies <openglfreak@googlemail.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Schneider <vschneid@redhat.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Waiman Long <longman@redhat.com>
  Wang Jinchao <wangjinchao@xfusion.com>
  Wedson Almeida Filho <walmeida@microsoft.com>
  Will Deacon <will@kernel.org>
  Xin Li (Intel) <xin@zytor.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yajun Deng <yajun.deng@linux.dev>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yang <yang.yang29@zte.com.cn>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yiwei Lin <s921975628@gmail.com>
  Yu Liao <liaoyu15@huawei.com>
  Yuntao Wang <ytcoode@gmail.com>
  Yury Norov <yury.norov@gmail.com>
  Yuxuan Shui <yshuiv7@gmail.com>
  Zhu Wang <wangzhu9@huawei.com>
  Zizhen Pang <pangzizhen001@208suo.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              fail    
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-armhf-armhf-libvirt                                     fail    
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

(No revision log; it would be 50990 lines long.)

