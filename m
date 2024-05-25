Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D78CF0E6
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 20:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730291.1135574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAvhq-0006LR-RS; Sat, 25 May 2024 18:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730291.1135574; Sat, 25 May 2024 18:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAvhq-0006J3-M8; Sat, 25 May 2024 18:01:22 +0000
Received: by outflank-mailman (input) for mailman id 730291;
 Sat, 25 May 2024 18:01:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAvhp-0006It-N0; Sat, 25 May 2024 18:01:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAvhp-0006WQ-F2; Sat, 25 May 2024 18:01:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAvhp-0007lX-3d; Sat, 25 May 2024 18:01:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sAvhp-0000kf-3C; Sat, 25 May 2024 18:01:21 +0000
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
	bh=1mUq35lxqh2LmLfKZzxggxYc0sJg2FeOiNsmWSUOIVk=; b=LNem0L07WUYkEJJjkLNMp6dCjo
	MmR2mFMcHAHPmC7fc4rSBNAkIdJrXG7FFjNTNTEY+llme/mop5Cl6l+iOw88HLWbmzlVeZU1C3WUu
	fujp+sB/EbcN7KKJ6hBKMIgz02tC9eMsosE+EIcRiWj4dcxW84SuTXwaoeqWsQcnErUg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186144-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186144: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=56fb6f92854f29dcb6c3dc3ba92eeda1b615e88c
X-Osstest-Versions-That:
    linux=6d69b6c12fce479fde7bc06f686212451688a102
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 May 2024 18:01:21 +0000

flight 186144 linux-linus real [real]
flight 186147 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186144/
http://logs.test-lab.xenproject.org/osstest/logs/186147/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-arndale   8 xen-boot                 fail REGR. vs. 186127

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-pvhv2-intel 20 guest-localmigrate/x10 fail pass in 186147-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 186127

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186127
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186127
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186127
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186127
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186127
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186127
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186127
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                56fb6f92854f29dcb6c3dc3ba92eeda1b615e88c
baseline version:
 linux                6d69b6c12fce479fde7bc06f686212451688a102

Last test of basis   186127  2024-05-23 23:10:22 Z    1 days
Failing since        186140  2024-05-24 17:10:45 Z    1 days    2 attempts
Testing same since   186144  2024-05-25 09:27:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhinav Saxena <xandfury@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Amer Al Shanawany <amer.shanawany@gmail.com>
  Anatoliy Klymenko <anatoliy.klymenko@amd.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Chi <andy.chi@canonical.com>
  Andy Chiu <andy.chiu@sifive.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antonino Maniscalco <antonino.maniscalco@collabora.com>
  Arnd Bergmann <arnd@arndb.de>
  Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
  Björn Töpel <bjorn@rivosinc.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Boris Burkov <boris@bur.io>
  Charlie Jenkins <charlie@rivosinc.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Conor Dooley <conor.dooley@microchip.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Starke <daniel.starke@siemens.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David Sterba <dsterba@suse.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Berger <opendmb@gmail.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Eric Smith <eric.smith@collabora.com>
  Erick Archer <erick.archer@outlook.com>
  Fenglin Wu <quic_fenglinw@quicinc.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Gao Xiang <xiang@kernel.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Henry Wang <xin.wang2@amd.com>
  Hongzhen Luo <hongzhen@linux.alibaba.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  j51569436@gmail.com
  Jack Yu <jack.yu@realtek.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jeff Xu <jeffxu@chromium.org>
  Jian-Hong Pan <jhp@endlessos.org>
  Joel Selvaraj <joelselvaraj.oss@gmail.com>
  Juergen Gross <jgross@suse.com>
  Karel Balej <balejk@matfyz.cz>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kirill Artemev <artewar6767@gmail.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lang Yu <Lang.Yu@amd.com>
  Li Ma <li.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Ying <victor.liu@nxp.com>
  Liviu Dudau <liviu.dudau@arm.com>
  Lu Yao <yaolu@kylinos.cn>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Manuel Barrio Linares <mbarriolinares@gmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Matthew Bystrin <dev.mbstr@gmail.com>
  Michal Orzel <michal.orzel@amd.com>
  Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
  Nam Cao <namcao@linutronix.de>
  Nathan Chancellor <nathan@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pin-yen Lin <treapking@chromium.org>
  Puranjay Mohan <puranjay@kernel.org>
  Qingfang Deng <qingfang.deng@siflower.com.cn>
  Qu Wenruo <wqu@suse.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Rob Herring (Arm) <robh@kernel.org>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Samuel Holland <samuel.holland@sifive.com>
  Shenghao Ding <shenghao-ding@ti.com>
  Stephen Boyd <swboyd@chromium.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sui Jingfeng <suijingfeng@bosc.ac.cn>
  Takashi Iwai <tiwai@suse.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Wayne Lin <Wayne.Lin@amd.com>
  Xiao Wang <xiao.w.wang@intel.com>
  Xingyou Chen <rockrush@rockwork.org>
  Xu Yang <xu.yang_2@nxp.com>
  Youling Tang <tangyouling@kylinos.cn>
  Zhang Yi <zhangyi@everest-semi.com>
  Zhao Ke <ke.zhao@shingroup.cn>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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


Not pushing.

(No revision log; it would be 3823 lines long.)

