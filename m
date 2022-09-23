Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0C5E70D4
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 02:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410537.653596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obWqA-00063C-6S; Fri, 23 Sep 2022 00:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410537.653596; Fri, 23 Sep 2022 00:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obWqA-00061E-37; Fri, 23 Sep 2022 00:46:50 +0000
Received: by outflank-mailman (input) for mailman id 410537;
 Fri, 23 Sep 2022 00:46:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obWq9-000613-4U; Fri, 23 Sep 2022 00:46:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obWq9-0005NV-0H; Fri, 23 Sep 2022 00:46:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obWq8-0000H0-A3; Fri, 23 Sep 2022 00:46:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obWq8-0007x4-9a; Fri, 23 Sep 2022 00:46:48 +0000
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
	bh=YQzxDN1flCVWRvlQJ6Lb/X5KRiVRpKFXRtCJKezOrxk=; b=aVVUstISZk0s6K+8nFQRdF92o2
	9xfZzRmjnoAWhCut1b2NKA0r184QNONdyVKygH1bsaOT6OGvWF49DGKj9fosbwBx0viioruFcpdnp
	1/D5j4uuYyzQfDTdR+HLy2TK4LnDt21a0UFACOezt9SOaPrbb85wA1PpNtJqbAhNLhTM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173279-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 173279: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c69cf88cda5faca0e411babb67ac0d8bfd8b4646
X-Osstest-Versions-That:
    linux=dc164f4fb00a0abebdfff132f8bc7291a28f5401
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 00:46:48 +0000

flight 173279 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173279/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173271
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173271
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173271
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173271
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173271
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173271
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173271
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173271
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                c69cf88cda5faca0e411babb67ac0d8bfd8b4646
baseline version:
 linux                dc164f4fb00a0abebdfff132f8bc7291a28f5401

Last test of basis   173271  2022-09-22 00:41:19 Z    1 days
Testing same since   173279  2022-09-22 18:41:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Ford <aford173@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Elder <elder@linaro.org>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Andrii Staikov <andrii.staikov@intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Benjamin Poirier <bpoirier@nvidia.com>
  Bharathi Sreenivas <bharathi.sreenivas@intel.com>
  Bhupesh Sharma <bhupesh.sharma@linaro.org>
  Brett Creeley <brett.creeley@intel.com>
  Brian Norris <briannorris@chromium.org>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Cong Wang <cong.wang@bytedance.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Daniel Dao <dqminh@cloudflare.com>
  Dave Ertman <david.m.ertman@intel.com>
  David Leadbeater <dgl@dgl.cx>
  David S. Miller <davem@davemloft.net>
  David Thompson <davthompson@nvidia.com>
  Ding Hui <dinghui@sangfor.com.cn>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Edward Cree <ecree.xilinx@gmail.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Fabio Estevam <festevam@denx.de>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Wunderlich <frank-w@public-files.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Haimin Zhang <tcs.kernel@gmail.com>
  Haimin Zhang <tcs_kernel@tencent.com>
  Haiyang Zhang <haiyangz@microsoft.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hangyu Hua <hbh25y@gmail.com>
  Heiko Stuebner <heiko@sntech.de>
  Helena Anna Dubel <helena.anna.dubel@intel.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Ido Schimmel <idosch@nvidia.com>
  Igor Ryzhov <iryzhov@nfware.com>
  Ioana Ciornei <ioana.ciornei@nxp.com>
  Jagan Teki <jagan@amarulasolutions.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jeroen de Borst <jeroendb@google.com>
  Jianglei Nie <niejianglei2021@163.com>
  Jie2x Zhou <jie2x.zhou@intel.com>
  Jonathan Toppins <jtoppins@redhat.com>
  Kalle Valo <kvalo@kernel.org>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Leo Yan <leo.yan@linaro.org>
  Liang He <windhl@126.com>
  Lieven Hey <lieven.hey@kdab.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Wei <luwei32@huawei.com>
  Lucas Stach <l.stach@pengutronix.de>
  Ludovic Cintrat <ludovic.cintrat@gatewatcher.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcel Ziswiler <marcel.ziswiler@toradex.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Marek Vasut <marex@denx.de>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Meng Li <Meng.Li@windriver.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Riesch <michael.riesch@wolfvision.net>
  Michael Walle <michael@walle.cc>
  Michal Jaron <michalx.jaron@intel.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Namhyung Kim <namhyung@kernel.org>
  Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
  Norbert Zulinski <norbertx.zulinski@intel.com>
  Oleksandr Mazur <oleksandr.mazur@plvision.eu>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Geis <pgwipeout@gmail.com>
  Petr Oros <poros@redhat.com>
  Philippe Schenker <philippe.schenker@toradex.com>
  Rakesh Sankaranarayanan <rakesh.sankaranarayanan@microchip.com>
  Roberto Ricci <rroberto2r@gmail.com>
  Sean Anderson <seanga2@gmail.com>
  Sergei Antonov <saproj@gmail.com>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Shailend Chand <shailend@google.com>
  Shawn Guo <shawnguo@kernel.org>
  Shigeru Yoshida <syoshida@redhat.com>
  Simon Wunderlich <sw@simonwunderlich.de>
  Sudeep Holla <sudeep.holla@arm.com>
  Sven Eckelmann <sven@narfation.org>
  Sylwester Dziedziuch <sylwesterx.dziedziuch@intel.com>
  syzbot <syzbot+b5d82a651b71cd8a75ab@syzkaller.appspotmail.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thorsten Scherer <t.scherer@eckelmann.de>
  Tim Harvey <tharvey@gateworks.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vadim Fedorenko <vfedorenko@novek.ru>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wen Gu <guwen@linux.alibaba.com>
  zain wang <wzz@rock-chips.com>
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
   dc164f4fb00a..c69cf88cda5f  c69cf88cda5faca0e411babb67ac0d8bfd8b4646 -> tested/linux-linus

