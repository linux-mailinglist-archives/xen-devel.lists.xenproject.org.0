Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D88B4DC7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 22:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713770.1114676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1BCU-0007HK-Kl; Sun, 28 Apr 2024 20:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713770.1114676; Sun, 28 Apr 2024 20:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1BCU-0007GA-I1; Sun, 28 Apr 2024 20:32:42 +0000
Received: by outflank-mailman (input) for mailman id 713770;
 Sun, 28 Apr 2024 20:32:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1BCT-0007G0-9Y; Sun, 28 Apr 2024 20:32:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1BCT-0003Pa-4x; Sun, 28 Apr 2024 20:32:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1BCS-0002DM-Pm; Sun, 28 Apr 2024 20:32:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s1BCS-0000sM-PI; Sun, 28 Apr 2024 20:32:40 +0000
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
	bh=UKTBOGiA/eU7leOQjATdSsBtEq6xqFOy2AU+8BY8QX4=; b=sMwJPLS9UGUR3OWEReGPDxOynr
	A3a+HFRBBY0BUMFJNcyLX9mn0hWs3UIebH8v52xPyGX2/0Pv+VYWSvHsSXQpTtMQ76KwZGS0/fvDw
	umqAPwQOZL5BLkWwU0FUgEkMJFC/0oKEt1jKC8Fpdu7XQbbaxTW83eaQytbcE0wsHhDk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185849-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185849: regressions - FAIL
X-Osstest-Failures:
    linux-6.1:build-armhf-pvops:kernel-build:fail:regression
    linux-6.1:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-saverestore.2:fail:heisenbug
    linux-6.1:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    linux-6.1:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f2295faba5e8249ae4082791bfc1664c88fff83a
X-Osstest-Versions-That:
    linux=6741e066ec7633450d3186946035c1f80c4226b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Apr 2024 20:32:40 +0000

flight 185849 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185849/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf-pvops             6 kernel-build             fail REGR. vs. 185746

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 17 guest-saverestore.2 fail in 185835 pass in 185849
 test-amd64-amd64-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail pass in 185835

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185746
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185746
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185746
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185746
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185746
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                f2295faba5e8249ae4082791bfc1664c88fff83a
baseline version:
 linux                6741e066ec7633450d3186946035c1f80c4226b8

Last test of basis   185746  2024-04-20 18:14:28 Z    8 days
Testing same since   185832  2024-04-27 15:44:00 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ai Chao <aichao@kylinos.cn>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexey Izbyshev <izbyshev@ispras.ru>
  Alvaro Karsz <alvaro.karsz@solid-run.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Bjorn Helgaas <bhelgaas@google.com>
  bolan wang <bolan.wang@fibocom.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Brenton Simpson <appsforartists@google.com>
  Carlos Llamas <cmllamas@google.com>
  Carolina Jubran <cjubran@nvidia.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chinmoy Ghosh <chinmoyghosh2001@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuanhong Guo <gch981213@gmail.com>
  Chuck Lever <chuck.lever@oracle.com>
  Coia Prant <coiaprant@gmail.com>
  Daniel Golle <daniel@makrotopia.org>
  Daniele Palmas <dnlplm@gmail.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David S. Miller <davem@davemloft.net>
  David Yang <mmyangfl@gmail.com>
  Dillon Varone <dillon.varone@amd.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Emil Kronborg <emil.kronborg@protonmail.com>
  Eric Biggers <ebiggers@google.com>
  Finn Thain <fthain@linux-m68k.org>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Geoffrey D. Bennett <g@b4.vu>
  Gil Fine <gil.fine@linux.intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  H. Peter Anvin (Intel) <hpa@zytor.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Hardik Gajjar <hgajjar@de.adit-jv.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Hou Wenlong <houwenlong.hwl@antgroup.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jarkko Nikula <jarkko.nikula@bitmer.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jeongjun Park <aha310510@gmail.com>
  Jerry Meng <jerry-meng@foxmail.com>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kelvin Cao <kelvin.cao@microchip.com>
  kernelci.org bot <bot@kernelci.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lei Chen <lei.chen@smartx.com>
  Leon Romanovsky <leon@kernel.org>
  Like Xu <likexu@tencent.com>
  Linus Walleij <linus.walleij@linaro.org>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Marios Makassikis <mmakassikis@freebox.fr>
  Mark Brown <broonie@kernel.org>
  Mark Zhang <markzhang@nvidia.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Guralnik <michaelgur@nvidia.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Pastore <mike@oobak.org>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mike Rapoport <rppt@linux.ibm.com>
  Mikhail Kobuk <m.kobuk@ispras.ru>
  Miles Chen <miles.chen@mediatek.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Mingming Su <mingming.su@mediatek.com>
  Mintu Patel <mintupatel89@gmail.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Norihiko Hama <Norihiko.Hama@alpsalpine.com>
  Oscar Salvador <osalvador@suse.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pasha Tatashin <pasha.tatashin@soleen.com>
  Pekka Paalanen <pekka.paalanen@collabora.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Philippe Perrot <philippe@perrot-net.fr>
  Pin-yen Lin <treapking@chromium.org>
  Qiang Zhang <qiang4.zhang@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ron Economos <re@w6rz.net>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sandipan Das <sandipan.das@amd.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  SeongJae Park <sj@kernel.org>
  Shay Drory <shayd@nvidia.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tejun Heo <tj@kernel.org>
  Tim Huang <Tim.Huang@amd.com>
  Todd Kjos <tkjos@google.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vanillan Wang <vanillanwang@163.com>
  Vimal Kumar <vimal.kumar32@gmail.com>
  Vishal Badole <badolevishal1116@gmail.com>
  Vladimir Oltean <olteanv@gmail.com>
  xinhui pan <xinhui.pan@amd.com>
  xiongxin <xiongxin@kylinos.cn>
  Yanjun.Zhu <yanjun.zhu@linux.dev>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yaxiong Tian <tianyaxiong@kylinos.cn>
  Ye Li <ye.li@broadcom.com>
  Yu Zhe <yuzhe@nfschina.com>
  Yuanhe Shu <xiangzao@linux.alibaba.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 build-armhf-pvops                                            fail    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 
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

(No revision log; it would be 4764 lines long.)

