Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94957E610
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 19:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373439.605656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEws6-0004BW-JG; Fri, 22 Jul 2022 17:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373439.605656; Fri, 22 Jul 2022 17:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEws6-00048B-FN; Fri, 22 Jul 2022 17:55:30 +0000
Received: by outflank-mailman (input) for mailman id 373439;
 Fri, 22 Jul 2022 17:55:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEws4-000480-PW; Fri, 22 Jul 2022 17:55:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEws4-000284-Lj; Fri, 22 Jul 2022 17:55:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEws4-0004Rr-BN; Fri, 22 Jul 2022 17:55:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oEws4-0003Xn-Aw; Fri, 22 Jul 2022 17:55:28 +0000
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
	bh=rAYxRVfuX45BbD629dkGTYqQG+SIzY8QXi6xzASyPjY=; b=wjKTBAH9x7aHn/HwLLkSYrw/xE
	6JoIylHDQUID35nKiEWncxGBdqpp4TvJHtWoJGykUEYj/iEpehJlcci+xjNRnojHEGZazJ/mq0ZAv
	GjQEWrjmtAJ8tx/rOeLgyEU4z3ijkTAszH5phWnd76w0du5bDtNBYhDah8HePn+muzvo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171764-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 171764: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-pair:<job status>:broken:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-pair:host-install/src_host(6):broken:heisenbug
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-qcow2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=002c3bbb4713859e8f3d1e756637572a09dcca49
X-Osstest-Versions-That:
    linux=6584107915561f860b7b05dcca5c903dd62a308d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Jul 2022 17:55:28 +0000

flight 171764 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171764/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-pair           <job status>                 broken
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 171642

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-pair         6 host-install/src_host(6) broken pass in 171743
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail in 171743 pass in 171764
 test-armhf-armhf-xl-vhd      13 guest-start      fail in 171743 pass in 171764
 test-armhf-armhf-xl-credit2  14 guest-start                fail pass in 171743
 test-armhf-armhf-libvirt-qcow2 17 guest-start/debian.repeat fail pass in 171743

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail in 171743 like 171642
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 171743 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 171743 never pass
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 171642
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171642
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 171642
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 171642
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171642
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171642
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171642
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171642
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 171642
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171642
 test-armhf-armhf-xl-credit1  14 guest-start                  fail  like 171642
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171642
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 171642
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171642
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                002c3bbb4713859e8f3d1e756637572a09dcca49
baseline version:
 linux                6584107915561f860b7b05dcca5c903dd62a308d

Last test of basis   171642  2022-07-15 13:02:24 Z    7 days
Testing same since   171743  2022-07-21 19:11:46 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandre Torgue <alexandre.torgue@foss.st.com>
  Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
  Andrea Mayer <andrea.mayer@uniroma2.it>
  Andrew Morton <akpm@linux-foundation.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Baokun Li <libaokun1@huawei.com>
  Borislav Petkov <bp@suse.de>
  Chanho Park <chanho61.park@samsung.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chris Wilson <chris.p.wilson@intel.com>
  Christoph Hellwig <hch@lst.de>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Daniel Bristot de Oliveira <bristot@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Edward Cree <ecree.xilinx@gmail.com>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Gabriel Fernandez <gabriel.fernandez@foss.st.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Huaxin Lu <luhuaxin1@huawei.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jianglei Nie <niejianglei2021@163.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  José Roberto de Souza <jose.souza@intel.com>
  Juergen Gross <jgross@suse.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kris Bahnsen <kris@embeddedTS.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Linyu Yuan <quic_linyyuan@quicinc.com>
  Lucien Buchmann <lucien.buchmann@gmx.net>
  Luis Chamberlain <mcgrof@kernel.org>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark-PK Tsai <mark-pk.tsai@mediatek.com>
  Martin Habets <habetsm.xilinx@gmail.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Mel Gorman <mgorman@techsingularity.net>
  Meng Tang <tangmeng@uniontech.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Michal Hocko <mhocko@suse.com>
  Michal Suchanek <msuchanek@suse.de>
  Mimi Zohar <zohar@linux.ibm.com>
  Muchun Song <songmuchun@bytedance.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nuno Gonçalves <nunojpg@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ruozhu Li <liruozhu@huawei.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryan Wanner <Ryan.Wanner@microchip.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Shawn Guo <shawnguo@kernel.org>
  Stafford Horne <shorne@gmail.com>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Tadeusz Struk <tadeusz.struk@linaro.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wei Wang <wvw@google.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yi Yang <yiyang13@huawei.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Íñigo Huguet <ihuguet@redhat.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

broken-job test-amd64-amd64-pair broken
broken-step test-amd64-amd64-pair host-install/src_host(6)

Not pushing.

(No revision log; it would be 1917 lines long.)

