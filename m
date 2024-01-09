Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850378289F0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 17:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664778.1034896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEv7-0003Rm-Um; Tue, 09 Jan 2024 16:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664778.1034896; Tue, 09 Jan 2024 16:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEv7-0003PX-RI; Tue, 09 Jan 2024 16:25:41 +0000
Received: by outflank-mailman (input) for mailman id 664778;
 Tue, 09 Jan 2024 16:25:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNEv6-0003PL-Pn; Tue, 09 Jan 2024 16:25:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNEv6-0004A3-LD; Tue, 09 Jan 2024 16:25:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNEv6-0004gK-7d; Tue, 09 Jan 2024 16:25:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNEv6-0002XW-7H; Tue, 09 Jan 2024 16:25:40 +0000
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
	bh=R/AbGQGKx6oFABj6e9QOplcu0Ikyk66xWemBWVHkGH4=; b=UbuFjpziz+mL1N45epkMEXk12U
	N0CoeWGBsF6fdUaofxb2Uhis1Dyw3Qhk7hs9VLRZizxv53GXYb7QNNyF2pb9IH3Vm9DCHz4mSrzHE
	c10O4pMQ+seAe24p/ZoOTIQoQ+joAPZy3Jcomia3D9Sq5btmRbgBP+RzhpWyBCXWVin0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184290-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184290: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-shadow:host-install(5):broken:regression
    linux-linus:test-arm64-arm64-xl-xsm:debian-install:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9f8413c4a66f2fb776d3dc3c9ed20bf435eb305e
X-Osstest-Versions-That:
    linux=0dd3ee31125508cd67f7e7172247f05b7fd1753a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jan 2024 16:25:40 +0000

flight 184290 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184290/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-shadow    5 host-install(5)        broken REGR. vs. 184270
 test-arm64-arm64-xl-xsm      12 debian-install           fail REGR. vs. 184270
 test-arm64-arm64-libvirt-xsm 12 debian-install           fail REGR. vs. 184270

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184270
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184270
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184270
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184270
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184270
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184270
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184270
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184270
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                9f8413c4a66f2fb776d3dc3c9ed20bf435eb305e
baseline version:
 linux                0dd3ee31125508cd67f7e7172247f05b7fd1753a

Last test of basis   184270  2024-01-07 20:42:19 Z    1 days
Failing since        184283  2024-01-08 20:10:43 Z    0 days    2 attempts
Testing same since   184290  2024-01-09 05:47:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
  "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
  "Paul E. McKenney" <paulmck@kernel.org>
  Aaron Lu <aaron.lu@intel.com>
  Abel Wu <wuyun.abel@bytedance.com>
  Abhinav Singh <singhabhinav9051571833@gmail.com>
  Aditya Gupta <adityag@linux.ibm.com>
  Adrian Huang <ahuang12@lenovo.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Antonov <alexander.antonov@linux.intel.com>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Amir Goldstein <amir73il@gmail.com>
  Ammy Yi <ammy.yi@intel.com>
  Andrei Vagin <avagin@google.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrew Donnellan <ajd@linux.ibm.com> # ocxl
  Andrzej Hajda <andrzej.hajda@intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Ashok Raj <ashok.raj@intel.com>
  Atul Kumar Pant <atulpant.linux@gmail.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjorn Helgaas <bhelgaas@google.com>   # pci_ids.h
  Borislav Petkov (AMD) <bp@alien8.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chandan Babu R <chandanbabu@kernel.org>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Crystal Wood <oss@buserror.net>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Dario Binacchi <dario.binacchi@amarulasolutions.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Heidelberg <david@ixit.cz>
  David Sterba <dsterba@suse.com>
  Derek Barbosa <debarbos@redhat.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Edward Adam Davis <eadavis@qq.com>
  Elliot Berman <quic_eberman@quicinc.com>
  Eric Farman <farman@linux.ibm.com>  # s390
  Finn Thain <fthain@linux-m68k.org>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frederic Barrat <fbarrat@linux.ibm.com>
  Frederic Weisbecker <frederic@kernel.org>
  Fuad Tabba <tabba@google.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Geoff Levand <geoff@infradead.org>
  Greg KH <gregkh@linuxfoundation.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hao Ge <gehao@kylinos.cn>
  Haoran Liu <liuhaoran14@163.com>
  Hou Wenlong <houwenlong.hwl@antgroup.com>
  Huang Shijie <shijie@os.amperecomputing.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Imran Khan <imran.f.khan@oracle.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  James Clark <james.clark@arm.com>
  James Morse <james.morse@arm.com>
  Jan Harkes <jaharkes@cs.cmu.edu>
  Jan Kara <jack@suse.cz>
  Jann Horn <jannh@google.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jia Zhu <zhujia.zj@bytedance.com>
  Joey Gouly <joey.gouly@arm.com>
  Jordan Niethe <jniethe5@gmail.com>
  Josef Bacik <josef@toxicpanda.com>
  Josh Don <joshdon@google.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Jun'ichi Nomura <junichi.nomura@nec.com>
  Junhao He <hejunhao3@huawei.com>
  Kajol Jain <kjain@linux.ibm.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kevin Hao <haokexin@gmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Kyle Meyer <kyle.meyer@hpe.com>
  Li kunyu <kunyu@nfschina.com>
  Li zeming <zeming@nfschina.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Schauer <lukas@schauer.dev>
  Lukasz Luba <lukasz.luba@arm.com>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mateusz Guzik <mjguzik@gmail.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Mel Gorman <mgorman@suse.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Simek <michal.simek@amd.com>
  Michal Suchánek <msuchanek@suse.de>
  Miklos Szeredi <mszeredi@redhat.com>
  Muralidhara M K <muralidhara.mk@amd.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Naveen N Rao <naveen@kernel.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nikolay Borisov <nik.borisov@suse.com>
  Paul E. McKenney <paulmck@kernel.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pierre Gondois <pierre.gondois@arm.com>
  Qais Yousef <qyousef@layalina.io>
  Qiuxu Zhuo <qiuxu.zhuo@intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Raghavendra K T <raghavendra.kt@amd.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryan Roberts <ryan.roberts@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sam James <sam@gentoo.org>
  Samuel Zeter <samuelzeter@gmail.com>
  Sathvika Vasireddy <sv@linux.ibm.com>
  Segher Boessenkool <segher@kernel.crashing.org>
  Shawn Guo <shawn.guo@linaro.org>
  Shuai Xue <xueshuai@linux.alibaba.com>
  Srikar Dronamraju <srikar@linux.vnet.ibm.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Sudeep Holla <sudeep.holla@arm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Tejun Heo <tj@kernel.org>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Luck <tony.luck@intel.com>
  Tsung-Han Lin <tsunghan.tw@gmail.com>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Vegard Nossum <vegard.nossum@oracle.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Waiman Long <longman@redhat.com>
  Wang Jinchao <wangjinchao@xfusion.com>
  Wenyu Huang <huangwenyu5@huawei.com>
  Will Deacon <will@kernel.org>
  Xiaoming Wang <xiaoming.wang@intel.com>
  Xin Yin <yinxin.x@bytedance.com>
  Xu Yang <xu.yang_2@nxp.com>
  Xu Yilun <yilun.xu@intel.com>
  Yafang Shao <laoar.shao@gmail.com>
  YangXin <yx.0xffff@gmail.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Yiwei Lin <s921975628@gmail.com>
  Youquan Song <youquan.song@intel.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zenghui Yu <yuzenghui@huawei.com>
  Zhao Ke <ke.zhao@shingroup.cn>
  Zhiquan Li <zhiquan1.li@intel.com>

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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-amd64-amd64-xl-shadow                                   broken  
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

broken-job test-amd64-amd64-xl-shadow broken
broken-step test-amd64-amd64-xl-shadow host-install(5)

Not pushing.

(No revision log; it would be 12830 lines long.)

