Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A5C8812E6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695933.1086274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwZa-0003b0-Ds; Wed, 20 Mar 2024 14:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695933.1086274; Wed, 20 Mar 2024 14:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwZa-0003ZR-AP; Wed, 20 Mar 2024 14:05:42 +0000
Received: by outflank-mailman (input) for mailman id 695933;
 Wed, 20 Mar 2024 14:05:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmwZZ-0003ZH-Jr; Wed, 20 Mar 2024 14:05:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmwZZ-000844-DA; Wed, 20 Mar 2024 14:05:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmwZZ-0003Vl-2S; Wed, 20 Mar 2024 14:05:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rmwZZ-0002WM-21; Wed, 20 Mar 2024 14:05:41 +0000
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
	bh=fpFcqWLkFXi7o781ubV2F41tjFLgnHrOYE5ZzG5QFkI=; b=xH3covpSEIpwzaImiNG3zQ+qg1
	60lXDLV7f5lcbnSjaqg6+6zEUtoj/k8Z3ENQMKxf9xtTv01xa+aVuYKQpDd4h9f1rxJWA0sofnXiL
	jjHmrDq/tqKJVurOvzYAX1GyBAHlGxfVItNeAsLYle3TRAcT5OYG6MxUVN7eweKdP8BA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185101-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185101: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=78c3925c048c752334873f56c3a3d1c9d53e0416
X-Osstest-Versions-That:
    linux=f6cef5f8c37f58a3bc95b3754c3ae98e086631ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Mar 2024 14:05:41 +0000

flight 185101 linux-linus real [real]
flight 185112 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185101/
http://logs.test-lab.xenproject.org/osstest/logs/185112/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-examine      8 reboot              fail pass in 185112-retest
 test-armhf-armhf-xl           8 xen-boot            fail pass in 185112-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 185112 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 185112 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185075
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185075
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185075
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185075
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185075
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 185075
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 185075
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185075
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                78c3925c048c752334873f56c3a3d1c9d53e0416
baseline version:
 linux                f6cef5f8c37f58a3bc95b3754c3ae98e086631ca

Last test of basis   185075  2024-03-18 07:48:04 Z    2 days
Failing since        185088  2024-03-19 01:43:30 Z    1 days    2 attempts
Testing same since   185101  2024-03-19 22:19:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Ricardo B. Marliere" <ricardo@marliere.net>
  Alexander Aring <aahringo@redhat.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alexey Kodanev <aleksei.kodanev@bell-sw.com>
  Alison Schofield <alison.schofield@intel.com>
  Amir Goldstein <amir73il@gmail.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Melnychenko <andrew@daynix.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Beau Belgrave <beaub@linux.microsoft.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Changhuang Liang <changhuang.liang@starfivetech.com>
  Chao Yu <chao@kernel.org>
  Chen Wang <unicorn_wang@outlook.com>
  Chengchang Tang <tangchengchang@huawei.com>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christian Brauner <brauner@kernel.org>
  Christian Heusel <christian@heusel.eu>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Conor Dooley <conor.dooley@microchip.com>
  Conrad Kostecki <conikost@gentoo.org>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Daeho Jeong <daehojeong@google.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Golle <daniel@makrotopia.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Teigland <teigland@redhat.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Dragos Tatulea <dtatulea@nvidia.com>
  Duy Nguyen <duy.nguyen.rh@renesas.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Erick Archer <erick.archer@gmx.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fabio Estevam <festevam@denx.de>
  Feng Song <songfeng@oppo.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frank Wunderlich <frank-w@public-files.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gerald Schaefer <gerald.schaefer@linux.ibm.com>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Halil Pasic <pasic@linux.ibm.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
  Huang Yiwei <quic_hyiwei@quicinc.com>
  HuangXiaojia <huangxiaojia2@huawei.com>
  Ian Murphy <iano200@gmail.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jan Höppner <hoeppner@linux.ibm.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
  Jichi Zhang <i@jichi.ca>
  Joel Granados <j.granados@samsung.com>
  John Garry <john.g.garry@oracle.com>
  Jonah Palmer <jonah.palmer@oracle.com>
  Juergen Gross <jgross@suse.com>
  Junxian Huang <huangjunxian6@hisilicon.com>
  Kees Cook <keescook@chromium.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Konstantin Taranov <kotaranov@microsoft.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lei Yang <leiyang@redhat.com>
  Leon Romanovsky <leon@kernel.org>
  Ley Foon Tan <leyfoon.tan@starfivetech.com>
  Li Zhijian <lizhijian@fujitsu.com>
  linke li <lilinke99@qq.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukasz Luba <lukasz.luba@arm.com>
  Luoyouming <luoyouming@huawei.com>
  Maksim Kiselev <bigunclemax@gmail.com>
  Manjunath Patil <manjunath.b.patil@oracle.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Martin Botka <martin.botka@somainline.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Mete Durlu <meted@linux.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Marshall <hubcap@omnibond.com>
  Mustafa Ismail <mustafa.ismail@intel.com>
  Niklas Cassel <cassel@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Peng Fan <peng.fan@nxp.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Randy Dunlap <rdunlap@infradead.org>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rob Herring <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Samuel Holland <samuel.holland@sifive.com>
  Saravana Kannan <saravanak@google.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Shannon Nelson <shannon.nelson@amd.com>
  Sheng Yong <shengyong@oppo.com>
  Shifeng Li <lishifeng@sangfor.com.cn>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shravan Chippa <shravan.chippa@microchip.com>
  Sibi Sankar <quic_sibis@quicinc.com>
  Sindhu Devale <sindhu.devale@intel.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve Sistare <steven.sistare@oracle.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Sunmin Jeong <s_min.jeong@samsung.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tony Lindgren <tony@atomide.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasily Khoruzhick <anarsoul@gmail.com>
  Vincent Donnefort <vdonnefort@google.com>
  Vineeth Vijayan <vneethv@linux.ibm.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vlastimil Babka <vbabka@suse.cz>
  wenglianfa <wenglianfa@huawei.com>
  Wenjie Qi <qwjhust@gmail.com>
  William Kucharski <william.kucharski@oracle.com>
  William Qiu <william.qiu@starfivetech.com>
  Wu Bo <bo.wu@vivo.com>
  Xiuhong Wang <xiuhong.wang@unisoc.com>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yi Zhang <yi.zhang@redhat.com>
  Yonatan Nachum <ynachum@amazon.com>
  Yongpeng Yang <yangyongpeng1@oppo.com>
  Yunsheng Lin <linyunsheng@huawei.com>
  Zhiguo Niu <zhiguo.niu@unisoc.com>
  Zhu Lingshan <lingshan.zhu@intel.com>
  Zhu Yanjun <zyjzyj2000@gmail.com>

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
 test-armhf-armhf-examine                                     fail    
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
   f6cef5f8c37f..78c3925c048c  78c3925c048c752334873f56c3a3d1c9d53e0416 -> tested/linux-linus

