Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1147E0F43
	for <lists+xen-devel@lfdr.de>; Sat,  4 Nov 2023 13:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627440.978425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzFIr-0000Hl-PY; Sat, 04 Nov 2023 11:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627440.978425; Sat, 04 Nov 2023 11:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzFIr-0000FB-Mt; Sat, 04 Nov 2023 11:59:01 +0000
Received: by outflank-mailman (input) for mailman id 627440;
 Sat, 04 Nov 2023 11:58:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzFIp-0000F1-Kc; Sat, 04 Nov 2023 11:58:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzFIp-0006z6-Cd; Sat, 04 Nov 2023 11:58:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzFIp-0001dC-2l; Sat, 04 Nov 2023 11:58:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qzFIp-0000hL-2H; Sat, 04 Nov 2023 11:58:59 +0000
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
	bh=cI9l1Ru5UuIADoHssl0Iui9xEVzEMLoP/yG6jgSV398=; b=FEd4NvSS/SFEYTBHZhg6DgmHuH
	MIzAa0eWMwuq18xhROgM3zulR+I+4FxdNEsD3VqhlBx4smJgfWntqja1tLd490FbjAxJTEs/WU4tM
	Xt7gYRRlAcoVl6dj63b7mNhJCM2eCgpLMHDsQD7DUCSdPf4NbQ/BefZIRTTRiMbFfxhg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183675-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183675: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=e392ea4d4d00880bf94550151b1ace4f88a4b17a
X-Osstest-Versions-That:
    linux=8f6f76a6a29f36d2f3e4510d0bde5046672f6924
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Nov 2023 11:58:59 +0000

flight 183675 linux-linus real [real]
flight 183681 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183675/
http://logs.test-lab.xenproject.org/osstest/logs/183681/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 183681-retest
 test-armhf-armhf-libvirt      8 xen-boot            fail pass in 183681-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 183681 like 183669
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 183681 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183669
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183669
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183669
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183669
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183669
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183669
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183669
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                e392ea4d4d00880bf94550151b1ace4f88a4b17a
baseline version:
 linux                8f6f76a6a29f36d2f3e4510d0bde5046672f6924

Last test of basis   183669  2023-11-03 10:39:11 Z    1 days
Testing same since   183675  2023-11-04 01:57:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Dr. David Alan Gilbert" <linux@treblig.org>
  Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
  Aditya Gupta <adityag@linux.ibm.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Amit Machhiwal <amachhiw@linux.vnet.ibm.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnaldo Carvalho de Melo <acme@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Baoquan He <bhe@redhat.com>
  Beau Belgrave <beaub@linux.microsoft.com>
  Benjamin Gray <bgray@linux.ibm.com>
  Besar Wicaksono <bwicaksono@nvidia.com>
  Changbin Du <changbin.du@huawei.com>
  Charles Han <hanchunchao@inspur.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Ian King <colin.i.king@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Disha Goel <disgoel@linux.ibm.com>
  Disha Goel<disgoel@linux.ibm.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Gaurav Batra <gbatra@linux.vnet.ibm.com>
  Gautam Menghani <gautam@linux.ibm.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Georgia Garcia <georgia.garcia@canonical.com>
  GONG, Ruiqi <gongruiqi1@huawei.com>
  GONG, Ruiqi <gongruiqi@huaweicloud.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Harald Freudenberger <freude@linux.ibm.com>
  Haren Myneni <haren@linux.ibm.com>
  Hari Bathini <hbathini@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Ian Rogers <irogers@google.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ingo Franzki <ifranzki@linux.ibm.com>
  James Clark <james.clark@arm.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jing Zhang <renyu.zj@linux.alibaba.com>
  Jiri Olsa <jolsa@kernel.org>
  John Johansen <john.johansen@canonical.com>
  John Ogness <john.ogness@linutronix.de>
  Jonathan Corbet <corbet@lwn.net>
  Jonathan Neuschäfer <j.neuschaefer@gmx.net>
  Jordan Niethe <jniethe5@gmail.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Justin Stitt <justinstitt@google.com>
  Kajol Jain <kjain@linux.ibm.com>
  Kautuk Consul <kconsul@linux.vnet.ibm.com>
  Kees Cook <keescook@chromium.org>
  Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Leo Yan <leo.yan@linaro.org>
  Li kunyu <kunyu@nfschina.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Neuling <mikey@neuling.org>
  Michael Petlan <mpetlan@redhat.com>
  Mickaël Salaün <mic@digikod.net>
  Minjie Du <duminjie@vivo.com>
  Muhammad Muzammil <m.muzzammilashraf@gmail.com>
  Namhyung Kim <namhyung@kernel.org>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Nathan Chancellor <nathan@kernel.org>
  Naveen N Rao <naveen@kernel.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Child <nnac123@linux.ibm.com>
  Peter Lafreniere <peter@n8pjl.ca>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Petr Mladek <pmladek@suse.com>
  Quanfa Fu <quanfafu@gmail.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Rob Herring <robh@kernel.org>
  Ruidong Tian <tianruidong@linux.alibaba.com>
  Sachin Sant <sachinp@linux.ibm.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
  Song Liu <song@kernel.org>
  Srikar Dronamraju <srikar@linux.vnet.ibm.com>
  Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Thomas Gleixner (Intel) <tglx@linutronix.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tobias Huschle <huschle@linux.ibm.com>
  Uros Bizjak <ubizjak@gmail.com>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Veronika Molnarova <vmolnaro@redhat.com>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Wang Yufen <wangyufen@huawei.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yang Jihong <yangjihong1@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yuan Tan <tanyuan@tinylab.org>
  Yury Norov <yury.norov@gmail.com>
  Zheng Yejian <zhengyejian1@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              starved 
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
   8f6f76a6a29f..e392ea4d4d00  e392ea4d4d00880bf94550151b1ace4f88a4b17a -> tested/linux-linus

