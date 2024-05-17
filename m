Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C478C85BB
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 13:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724081.1129256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vrp-0005sO-AH; Fri, 17 May 2024 11:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724081.1129256; Fri, 17 May 2024 11:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vrp-0005qr-6A; Fri, 17 May 2024 11:35:17 +0000
Received: by outflank-mailman (input) for mailman id 724081;
 Fri, 17 May 2024 11:35:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7vrn-0005qh-V2; Fri, 17 May 2024 11:35:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7vrn-0004iW-Ms; Fri, 17 May 2024 11:35:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7vrn-00047Y-D3; Fri, 17 May 2024 11:35:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s7vrn-00050M-CT; Fri, 17 May 2024 11:35:15 +0000
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
	bh=TeFfm2Yp1Pfnb5fGbk8LJ7Y9kiynfBlgHweG/h6ivtg=; b=E/frm2hDwWmPvFJLHxUxrYTmH6
	uBoBm7hA3iqrw8x+FRYY1jRd0+XgIyxxVfXqlqKTnYzNi3IEHkzu3ZXUKmz4TJQkehRzJ/bFsJ+yN
	H/5TOoJHzcNapipzYVVBvgVnM4GyKbdRlK207phMTmuY60Slt2RtMUaYSXiNP05djNbs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186023-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186023: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit2:host-ping-check-xen:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ea5f6ad9ad9645733b72ab53a98e719b460d36a6
X-Osstest-Versions-That:
    linux=3c999d1ae3c75991902a1a7dad0cb62c2a3008b4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 May 2024 11:35:15 +0000

flight 186023 linux-linus real [real]
flight 186029 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186023/
http://logs.test-lab.xenproject.org/osstest/logs/186029/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit2 10 host-ping-check-xen fail in 186029 REGR. vs. 186018

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 186029-retest
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 186029-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 186010
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 186010
 test-armhf-armhf-xl           8 xen-boot                     fail  like 186010
 test-armhf-armhf-xl-raw       8 xen-boot                     fail  like 186010
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186018
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186018
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186018
 test-armhf-armhf-xl-credit1   8 xen-boot                     fail  like 186018
 test-armhf-armhf-examine      8 reboot                       fail  like 186018
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186018
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186018
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186018
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ea5f6ad9ad9645733b72ab53a98e719b460d36a6
baseline version:
 linux                3c999d1ae3c75991902a1a7dad0cb62c2a3008b4

Last test of basis   186018  2024-05-16 15:33:02 Z    0 days
Testing same since   186023  2024-05-17 01:13:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aapo Vienamo <aapo.vienamo@linux.intel.com>
  AceLan Kao <acelan.kao@canonical.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ai Chao <aichao@kylinos.cn>
  Aleksandr Burakov <a.burakov@rosalinux.ru>
  Alex Volkov <alex@bootes.sytes.net>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Andreas Helbech Kleist <andreaskleist@gmail.com>
  Andrzej Pietrasiewicz <andrzej.p@collabora.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Angelo Dureghello <adureghello@baylibre.com>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
  Arvid Norlander <lkml@vorpal.se>
  Avri Altman <avri.altman@wdc.com>
  Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  Bastien Curutchet <bastien.curutchet@bootlin.com>
  Ben Fradella <bfradell@netapp.com>
  Benjamin Gaignard <benjamin.gaignard@collabora.com>
  Bingbu Cao <bingbu.cao@intel.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Changhuang Liang <changhuang.liang@starfivetech.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dave Airlie <airlied@redhat.com>
  Dave Stevenson <dave.stevenson@raspberrypi.com>
  David E. Box <david.e.box@linux.intel.com>
  Denis Arefev <arefev@swemel.ru>
  Devarsh Thakkar <devarsht@ti.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Erick Archer <erick.archer@outlook.com>
  Eugen Hristev <eugen.hristev@collabora.com>
  Fabio Estevam <festevam@denx.de>
  Fei Shao <fshao@chromium.org>
  Felix Qin <xiaokeqinhealth@126.com>
  Fullway Wang <fullwaywang@outlook.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gergo Koteles <soyer@irl.hu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  hanchunchao <hanchunchao@inspur.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hien Huynh <hien.huynh.px@renesas.com>
  Hongju Wang <hongju.wang@intel.com>
  Ihor Matushchak <ihor.matushchak@foobox.net>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  István Váradi <ivaradi@varadiistvan.hu>
  Ivor Wanders <ivor@iwanders.net>
  Jackson Lee <jackson.lee@chipsnmedia.com>
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Jai Luthra <j-luthra@ti.com>
  Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jisheng Zhang <jszhang@kernel.org>
  Jithu Joseph <jithu.joseph@intel.com>
  Johnson Wang <johnson.wang@mediatek.com>
  Jonathan Bergh <bergh.jonathan@gmail.com>
  Jonathan Woithe <jwoithe@just42.net>
  Judith Mendez <jm@ti.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Julien Massot <julien.massot@collabora.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@kernel.org>
  Kate Hsuan <hpa@redhat.com>
  Kieran Bingham <kieran.bingham@ideasonboard.com>
  Klara Modin <klarasmodin@gmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Li Zhijian <lizhijian@fujitsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luke D. Jones <luke@ljones.dev>
  Mark Pearson <mpearson-lenovo@squebb.ca>
  Martin Tůma <martin.tuma@digiteqautomotive.com>
  Matthias Schwarzott <zzam@gentoo.org>
  Matthijs Kooijman <matthijs@stdin.nl>
  Maulik Shah <quic_mkshah@quicinc.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxim Korotkov <korotkov.maxim.s@gmail.com>
  Maximilian Luz <luzmaximilian@gmail.com>
  Michael Bunk <micha@freedict.org>
  Michael Walle <mwalle@kernel.org>
  Miguel Ojeda <ojeda@kernel.org>
  Mikhail Rudenko <mike.rudenko@gmail.com>
  Minghao Chi <chi.minghao@zte.com.cn>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mirela Rabulea <mirela.rabulea@nxp.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nathan Chancellor <nathan@kernel.org>
  Naushir Patuck <naush@raspberrypi.com>
  Nikita Travkin <nikita@trvn.ru>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nitin Joshi <njoshi1@lenovo.com>
  Oliver Neukum <oneukum@suse.com>
  Paweł Anikiel <panikiel@google.com>
  Prasad Pandit <pjp@fedoraproject.org>
  Pratyush Yadav <p.yadav@ti.com>
  Pratyush Yadav <pratyush@kernel.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rajeshwar R Shinde <coolrrsh@gmail.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ricardo B. Marliere <ricardo@marliere.net>
  Ricardo Ribalda <ribalda@chromium.org>
  Roman Bogoyev <roman@computercheck.com.au>
  Rouven Czerwinski <r.czerwinski@pengutronix.de>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sean Young <sean@mess.org>
  Sebastian Fricke <sebastian.fricke@collabora.com>
  Sergey Khimich <serghox@gmail.com>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Simon Glass <sjg@chromium.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Stefan Herdler <herdler@nurfuerspam.de>
  Stefan Klug <stefan.klug@ideasonboard.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Szilard Fabian <szfabian@bluemarch.art>
  Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Ulf Hansson <ulf.hansson@linaro.org>
  Umang Jain <umang.jain@ideasonboard.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vishnu Sankar <vishnuocv@gmail.com>
  Víctor Gonzalo <victor.gonzalo@anddroptable.net>
  Wadim Mueller <wafgo01@gmail.com>
  Weifeng Liu <weifeng.liu.z@gmail.com>
  Xi Pardee <xi.pardee@intel.com>
  yunshui <jiangyunshui@kylinos.cn>
  Zheyu Ma <zheyuma97@gmail.com>
  Zhipeng Lu <alexious@zju.edu.cn>

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
 test-armhf-armhf-xl                                          fail    
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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-xl-raw                                      fail    
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


Not pushing.

(No revision log; it would be 9993 lines long.)

