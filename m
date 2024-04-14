Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84058A4001
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 05:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705342.1102049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvqMX-0006ck-BX; Sun, 14 Apr 2024 03:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705342.1102049; Sun, 14 Apr 2024 03:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvqMX-0006b7-7c; Sun, 14 Apr 2024 03:17:01 +0000
Received: by outflank-mailman (input) for mailman id 705342;
 Sun, 14 Apr 2024 03:16:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvqMV-0006ae-Kf; Sun, 14 Apr 2024 03:16:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvqMV-0004tK-AA; Sun, 14 Apr 2024 03:16:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvqMU-0002uG-VR; Sun, 14 Apr 2024 03:16:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvqMU-00020U-V3; Sun, 14 Apr 2024 03:16:58 +0000
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
	bh=FqgUHX94LCiTlXJU5LzZP9lflM2PoIAgDwLwAQz/jAM=; b=lOYcDSLL0Xi4EV6JK0aaq/M0zY
	InAnlBb24jzuu7Bf9bH9og5VYHKpxxi1iAi3AXUVpDcSYbjSJJqm/mXK5Fjp6eDiKMuc58eEEAc4E
	Rwy4yMPle8LEnM/2vJnuxqh7LwEGU4MLDQl+xAvIOvOvAiJylhpxJIg2IvZkPIpOzV8w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185434-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185434: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-6.1:build-arm64-libvirt:<job status>:broken:regression
    linux-6.1:build-arm64-pvops:<job status>:broken:regression
    linux-6.1:build-arm64-libvirt:host-build-prep:fail:regression
    linux-6.1:build-arm64-pvops:host-build-prep:fail:regression
    linux-6.1:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=cd5d98c0556cd790f78a3ba26afc9d2f896163e4
X-Osstest-Versions-That:
    linux=bf1e3b1cb1e002ed1590c91f1a24433b59322368
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Apr 2024 03:16:58 +0000

flight 185434 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185434/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-libvirt             <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-libvirt           5 host-build-prep          fail REGR. vs. 185299
 build-arm64-pvops             5 host-build-prep          fail REGR. vs. 185299

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185299
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185299
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185299
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                cd5d98c0556cd790f78a3ba26afc9d2f896163e4
baseline version:
 linux                bf1e3b1cb1e002ed1590c91f1a24433b59322368

Last test of basis   185299  2024-04-10 14:42:59 Z    3 days
Testing same since   185434  2024-04-13 11:42:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alban Boyé <alban.boye@protonmail.com>
  Aleksandr Burakov <a.burakov@rosalinux.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Henrie <alexhenrie24@gmail.com>
  Andrew Lunn <andrew@lunn.ch>
  Ard Biesheuvel <ardb@kernel.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Aric Cyr <aric.cyr@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Baochen Qiang <quic_bqiang@quicinc.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bo Ye <bo.ye@mediatek.com>
  Boqun Feng <boqun.feng@gmail.com>
  C Cheng <C.Cheng@mediatek.com>
  Chancel Liu <chancel.liu@nxp.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Colin Ian King <colin.i.king@gmail.com>
  Dai Ngo <dai.ngo@oracle.com>
  Daniel Drake <drake@endlessos.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gergo Koteles <soyer@irl.hu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gwendal Grignou <gwendal@chromium.org>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Ian Rogers <irogers@google.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jian-Hong Pan <jhp@endlessos.org>
  Jiawei Fu (iBug) <i@ibugone.com>
  Jiawei Fu <i@ibugone.com>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  John Ogness <john.ogness@linutronix.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Justin Tee <justin.tee@broadcom.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karel Balej <balejk@matfyz.cz>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Leon Romanovsky <leon@kernel.org>
  linke li <lilinke99@qq.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Manjunath Patil <manjunath.b.patil@oracle.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Markus Elfring <elfring@users.sourceforge.net>
  Markuss Broks <markuss.broks@gmail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Maxime Ripard <mripard@kernel.org>
  Maíra Canal <mcanal@igalia.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael S. Tsirkin <mst@redhat.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Marshall <hubcap@omnibond.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  mosomate <mosomate@gmail.com>
  Mukesh Sisodiya <mukesh.sisodiya@intel.com>
  Máté Mosonyi <mosomate@gmail.com>
  Namhyung Kim <namhyung@kernel.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Machek (CIP) <pavel@denx.de>
  Petr Mladek <pmladek@suse.com>
  Petre Rodan <petre.rodan@subdimension.ro>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Ron Economos <re@w6rz.net>
  Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
  Samuel Dionne-Riel <samuel@dionne-riel.com>
  Sandipan Das <sandipan.das@amd.com>
  Sasha Levin <sashal@kernel.org>
  SeongJae Park <sj@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tasos Sahanidis <tasos@tasossah.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Ye Bin <yebin10@huawei.com>
  Zhang Yi <yi.zhang@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          broken  
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 


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

broken-job build-arm64-libvirt broken
broken-job build-arm64-pvops broken

Not pushing.

(No revision log; it would be 2250 lines long.)

