Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6887A23F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 05:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692264.1079199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkG62-0006OF-Mt; Wed, 13 Mar 2024 04:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692264.1079199; Wed, 13 Mar 2024 04:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkG62-0006Mb-IE; Wed, 13 Mar 2024 04:20:06 +0000
Received: by outflank-mailman (input) for mailman id 692264;
 Wed, 13 Mar 2024 04:20:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkG61-0006Db-9A; Wed, 13 Mar 2024 04:20:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkG61-0002UZ-4A; Wed, 13 Mar 2024 04:20:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkG60-0007WR-Px; Wed, 13 Mar 2024 04:20:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rkG60-0007Bn-PH; Wed, 13 Mar 2024 04:20:04 +0000
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
	bh=dEMPjD3WgqPxQ9Zp857Y5giueahLNPKg0sQdV8N2uXg=; b=noExbsEC42Ygb0MnCQas8OvY1p
	82E88E7oNSB2HB1ivPrTvdGF72zNVrYE8gUzFB8dPoePAdAAb4ZmOAdM28RRV3h1lIB0pj3YA6Awj
	z4TIb582IfkiIRTKqd1aPHbek8iVw+j9GJHJz3V/5ySSTBcqZT/yy0hBFFZYjtTQvRnk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185004-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185004: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=855684c7d938c2442f07eabc154e7532b4c1fbf9
X-Osstest-Versions-That:
    linux=0f1a876682f0979d6a1e5f86861dd562d1758936
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Mar 2024 04:20:04 +0000

flight 185004 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185004/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184997
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184997
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184997
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184997
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184997
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184997
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184997
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184997
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                855684c7d938c2442f07eabc154e7532b4c1fbf9
baseline version:
 linux                0f1a876682f0979d6a1e5f86861dd562d1758936

Last test of basis   184997  2024-03-11 18:40:47 Z    1 days
Testing same since   185000  2024-03-12 06:31:53 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  <muralidhara.mk@amd.com>
  <naveenkrishna.chatradhi@amd.com>
  <sathyapriya.k@amd.com>
  Alex Shi <alexs@kernel.org>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alexey Kardashevskiy <aik@amd.com>
  Alice Ryhl <aliceryhl@google.com>
  Allen Pais <allen.lkml@gmail.com>
  Allen Pais <apais@linux.microsoft.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andrea Righi <andrea.righi@canonical.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Anup Patel <apatel@ventanamicro.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Ashish Kalra <Ashish.Kalra@amd.com>
  Audra Mitchell <audra@redhat.com>
  Babu Moger <babu.moger@amd.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bibo Mao <maobibo@loongson.cn>
  Biju Das <biju.das.jz@bp.renesas.com>
  Björn Töpel <bjorn@rivosinc.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brendan Jackman <jackmanb@google.com>
  Breno Leitao <leitao@debian.org>
  Brijesh Singh <brijesh.singh@amd.com>
  Carl Worth <carl@os.amperecomputing.com> # arm64
  Changbin Du <changbin.du@huawei.com>
  Changhuang Liang <changhuang.liang@starfivetech.com>
  Charalampos Mitrodimas <charmitro@posteo.net>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Chinmay Gameti <c.gameti@samsung.com>
  Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chun-Yi Lee <jlee@suse.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Costa Shulyupin <costa.shul@redhat.com>
  Crystal Wood <crwood@redhat.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Micay <danielmicay@gmail.com>
  Dave Hansen <dave.hansen@intel.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Gow <davidgow@google.com>
  David Vernet <void@manifault.com>
  Dawei Li <dawei.li@shingroup.cn>
  Dionna Glaze <dionnaglaze@google.com>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Erick Archer <erick.archer@gmx.com>
  Feng Tang <feng.tang@intel.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gabriel Krisman Bertazi <krisman@suse.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Edwards <gedwards@ddn.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Gui-Dong Han <2045gemini@gmail.com>
  Guilherme Amadio <amadio@gentoo.org>
  Guixin Liu <kanie@linux.alibaba.com>
  Guo Ren <guoren@kernel.org>
  H. Peter Anvin (Intel) <hpa@zytor.com>
  Hannes Reinecke <hare@suse.de>
  Heiko Carstens <hca@linux.ibm.com>
  Heming Zhao <heming.zhao@suse.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Huqiang Qin <huqiang.qin@amlogic.com>
  Ingo Molnar <mingo@kernel.org>
  Jack Wang <jinpu.wang@ionos.com>
  Jakub Kicinski <kuba@kernel.org>
  James Morse <james.morse@arm.com>
  Jan Höppner <hoeppner@linux.ibm.com>
  Jarkko Sakkinen <jarkko@profian.com>
  Jens Axboe <axboe@kernel.dk>
  Jin Wang <jin1.wang@intel.com>
  Jiri Kosina <jkosina@suse.com>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Joerg Roedel <jroedel@suse.de>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John Garry <john.g.garry@oracle.com>
  John Stultz <jstultz@google.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Julia Lawall <julia.lawall@inria.fr>
  Juri Lelli <juri.lelli@redhat.com>
  K Prateek Nayak <kprateek.nayak@amd.com>
  Kai Huang <kai.huang@intel.com>
  Kanchan Joshi <joshi.k@samsung.com>
  Kees Cook <keescook@chromium.org>
  Keisuke Nishimura <keisuke.nishimura@inria.fr>
  Keith Busch <kbusch@kernel.org>
  Kevin Loughlin <kevinloughlin@google.com>
  Kim Phillips <kim.phillips@amd.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Leonardo Bras <leobras@redhat.com>
  Li kunyu <kunyu@nfschina.com>
  Li Lingfeng <lilingfeng3@huawei.com>
  Li Nan <linan122@huawei.com>
  Li zeming <zeming@nfschina.com>
  Li Zhijian <lizhijian@fujitsu.com>
  Lili Li <lili.li@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
  Maninder Singh <maninder1.s@samsung.com>
  Marc Orr <marcorr@google.com>
  Marc Zyngier <maz@kernel.org>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matt Gilbride <mattgilbride@google.com>
  Max Gurtovoy <mgurtovoy@nvidia.com>
  Max Kellermann <max.kellermann@ionos.com>
  Michael Kelley <mhklinux@outlook.com>
  Michael Roth <michael.roth@amd.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Miroslav Franc <mfranc@suse.cz>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Muralidhara M K <muralidhara.mk@amd.com>
  Nadav Amit <namit@vmware.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Nikolay Borisov <nik.borisov@suse.com>
  Nilay Shroff <nilay@linux.ibm.com>
  Obei Sideg <linux@obei.io>
  Oleg Nesterov <oleg@redhat.com>
  Onkarnath <onkarnath.1@samsung.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Luse <paul.e.luse@linux.intel.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peng Liu <liupeng17@lenovo.com>
  Peter Hilber <peter.hilber@opensynergy.com>
  Peter Newman <peternewman@google.com>
  Peter Zijlstra (Intel) <peterz@infradaed.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qais Yousef (Google) <qyousef@layalina.io>
  Qais Yousef <qyousef@layalina.io>
  Qiuxu Zhuo <qiuxu.zhuo@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Reinette Chatre <reinette.chatre@intel.com>
  Reinette Chatre <reinette.chatre@intel.com> # for resctrl dependency
  Ricardo B. Marliere <ricardo@marliere.net>
  Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
  Richard Cochran (linutronix GmbH) <richardcochran@gmail.com>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Sergey Senozhatsky <senozhatsky@chromium.org>
  Shan Kang <shan.kang@intel.com>
  Shaopeng Tan <tan.shaopeng@fujitsu.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shrikanth Hegde <sshegde@linux.ibm.com>
  Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
  Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
  Sohil Mehta <sohil.mehta@intel.com>
  Song Liu <song@kernel.org>
  Stefan Haberland <sth@linux.ibm.com>
  Stefan Roesch <shr@devkernel.io>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Tang Yizhou <yizhou.tang@shopee.com>
  Tejun Heo <tj@kernel.org>
  Thomas Bertschinger <tahbertschinger@gmail.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Battersby <tonyb@cybernetics.com>
  Tony Luck <tony.luck@intel.com>
  Tony Solomonik <tony.solomonik@gmail.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Obst <kernel@valentinobst.de>
  Virgile Andreani <armavica@ulminfo.fr>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Wang Jinchao <wangjinchao@xfusion.com>
  Wang Wendy <wendy.wang@intel.com>
  Wedson Almeida Filho <wedsonaf@gmail.com>
  Xiao Ni <xni@redhat.com>
  Xiaobing Li <xiaobing.li@samsung.com>
  Xiaochen Shen <xiaochen.shen@intel.com>
  Xin Li (Intel) <xin@zytor.com>
  Xin Li <xin3.li@intel.com>
  Xinyu Li <lixinyu20s@ict.ac.cn>
  Xiongwei Song <xiongwei.song@windriver.com>
  Xuewen Yan <xuewen.yan@unisoc.com>
  Yang Jihong <yangjihong1@huawei.com>
  Yangtao Li <frank.li@vivo.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Yu Chien Peter Lin <peterlin@andestech.com>
  Yu Kuai <yukuai3@huawei.com>
  Yury Norov <yury.norov@gmail.com>
  Yutaro Ohno <yutaro.ono.418@gmail.com>
  Zhang Rui <rui.zhang@intel.com>
  Zqiang <qiang.zhang1211@gmail.com>

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
   0f1a876682f09..855684c7d938c  855684c7d938c2442f07eabc154e7532b4c1fbf9 -> tested/linux-linus

