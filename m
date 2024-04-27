Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8778B4655
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 14:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713306.1114375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0gyV-0001NP-JF; Sat, 27 Apr 2024 12:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713306.1114375; Sat, 27 Apr 2024 12:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0gyV-0001L0-GW; Sat, 27 Apr 2024 12:16:15 +0000
Received: by outflank-mailman (input) for mailman id 713306;
 Sat, 27 Apr 2024 12:16:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0gyT-0001Kq-Jl; Sat, 27 Apr 2024 12:16:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0gyT-0000v3-Fq; Sat, 27 Apr 2024 12:16:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0gyT-00009H-2W; Sat, 27 Apr 2024 12:16:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s0gyT-0007xy-22; Sat, 27 Apr 2024 12:16:13 +0000
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
	bh=32QqkR2CjlU8erSYMUlY/JHN+uhbV1/YkztEjrqmPss=; b=coaZerhDQBdKQBN0f2Q6BZ2mqp
	hASlOx/EYWmjEZpwO9G1ArkAs+1845ffypXnR8V5pkRuNrmuyECBW5CWbPX7y44svlR8FNgWt3Inq
	1/2x/LgFcGvL5gGaVrGI5tc1NrpBN5RiUBwXBA5vR3fEplUCc+0D0YLP6CHPJ3zO4Kik=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185828-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185828: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5eb4573ea63d0c83bf58fb7c243fc2c2b6966c02
X-Osstest-Versions-That:
    linux=c942a0cd3603e34dd2d7237e064d9318cb7f9654
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Apr 2024 12:16:13 +0000

flight 185828 linux-linus real [real]
flight 185831 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185828/
http://logs.test-lab.xenproject.org/osstest/logs/185831/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl           8 xen-boot            fail pass in 185831-retest
 test-armhf-armhf-xl-credit1   8 xen-boot            fail pass in 185831-retest
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 185831-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 185802

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 185831 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 185831 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 185831 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 185831 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 185831 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 185831 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185802
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185802
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185802
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185802
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185802
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185802
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                5eb4573ea63d0c83bf58fb7c243fc2c2b6966c02
baseline version:
 linux                c942a0cd3603e34dd2d7237e064d9318cb7f9654

Last test of basis   185802  2024-04-26 01:58:59 Z    1 days
Failing since        185824  2024-04-26 18:40:13 Z    0 days    2 attempts
Testing same since   185828  2024-04-27 03:43:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexey Brodkin <abrodkin@synopsys.com>
  Alexey Brodkin <Alexey.Brodkin@synopsys.com>
  Andrei Simion <andrei.simion@microchip.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Ryabinin <ryabinin.a.a@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Yan <andyshrk@163.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Arnd Bergmann <arnd@arndb.de>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Baoquan He <bhe@redhat.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bibo Mao <maobibo@loongson.cn>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Christian Brauner <brauner@kernel.org>
  Christian Gmeiner <cgmeiner@igalia.com>
  Christian Heusel <christian@heusel.eu>
  Christian König <christian.koenig@amd.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Conor Dooley <conor.dooley@microchip.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Golle <daniel@makrotopia.org>
  Dave Airlie <airlied@redhat.com>
  Dave Jiang <dave.jiang@intel.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  Derek Foreman <derek.foreman@collabora.com>
  Dragan Simic <dsimic@manjaro.org>
  Drew Fustini <drew@pdp7.com>
  Edward Liaw <edliaw@google.com>
  Enrico Bartky <enrico.bartky@gmail.com>
  Felix Kuehling <felix.kuehling@amd.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gang BA <Gang.Ba@amd.com>
  Günther Noack <gnoack@google.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Stuebner <heiko@sntech.de>
  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Ikjoon Jang <ikjn@chromium.org>
  Iskander Amara <iskander.amara@theobroma-systems.com>
  Jack Xiao <Jack.Xiao@amd.com>
  Jiantao Shan <shanjiantao@loongson.cn>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Weiner <hannes@cmpxchg.org>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Joshua Ashton <joshua@froggi.es>
  Kent Overstreet <kent.overstreet@linux.dev>
  Konrad Dybcio <konrad.dybcio@linaro.org> # X13s
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lang Yu <Lang.Yu@amd.com>
  Leonard Göhrs <l.goehrs@pengutronix.de>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Weiss <luca.weiss@fairphone.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Lucas Stach <l.stach@pengutronix.de>
  Ma Jun <Jun.Ma2@amd.com>
  Maksim Kiselev <bigunclemax@gmail.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mantas Pucka <mantas@8devices.com>
  Marek Vasut <marex@denx.de>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthew Sakai <msakai@redhat.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maximilian Luz <luzmaximilian@gmail.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Heimpold <michael.heimpold@chargebyte.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Muhammed Efe Cetin <efectn@protonmail.com>
  Mukul Joshi <mukul.joshi@amd.com>
  Nam Cao <namcao@linutronix.de>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
  Peter Xu <peterx@redhat.com>
  Peyton Lee <peytolee@amd.com>
  Pin-yen Lin <treapking@chromium.org>
  Prathamesh Shete <pshete@nvidia.com>
  Prike Liang <Prike.Liang@amd.com>
  Quentin Schulz <quentin.schulz@theobroma-systems.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rajendra Nayak <quic_rjendra@quicinc.com>
  Rob Herring <robh@kernel.org>
  Sergei Antonov <saproj@gmail.com>
  Shawn Guo <shawnguo@kernel.org>
  Stefan Wahren <wahrenst@gmx.net>
  Thierry Reding <treding@nvidia.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Scherer <t.scherer@eckelmann.de>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vineet Gupta <vgupta@kernel.org>
  Vishal Moola (Oracle) <vishal.moola@gmail.com>
  Vlastimil Babka <vbabka@suse.cz>
  Weiyi Lu <weiyi.lu@mediatek.com>
  William Zhang <william.zhang@broadcom.com>
  Xi Ruoyao <xry111@xry111.site>
  Xiubo Li <xiubli@redhat.com>
  Yosry Ahmed <yosryahmed@google.com>
  Yu Kuai <yukuai3@huawei.com>
  Yunxiang Li <Yunxiang.Li@amd.com>

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
 test-armhf-armhf-xl-arndale                                  pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   c942a0cd3603..5eb4573ea63d  5eb4573ea63d0c83bf58fb7c243fc2c2b6966c02 -> tested/linux-linus

