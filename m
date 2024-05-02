Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE18BA2F1
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 00:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716199.1118315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2eUJ-0000Qh-0Q; Thu, 02 May 2024 22:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716199.1118315; Thu, 02 May 2024 22:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2eUI-0000Ns-SQ; Thu, 02 May 2024 22:01:10 +0000
Received: by outflank-mailman (input) for mailman id 716199;
 Thu, 02 May 2024 22:01:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2eUI-0000Ni-5h; Thu, 02 May 2024 22:01:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2eUH-0004W5-Ur; Thu, 02 May 2024 22:01:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2eUH-0003ui-F6; Thu, 02 May 2024 22:01:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s2eUH-0008Gr-Em; Thu, 02 May 2024 22:01:09 +0000
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
	bh=ad61JDsn2a0PKz3bAXdqZFLi5AZeoyRb00ArUdkmZoo=; b=ABTvQaXWIIZrlvzrdEQgSWW3yA
	7BGP1xyeQ6cvez2+H13pAX2Q3sBuL5jlMckDglLC9hkhoz2puxlcycFqQnrm79Ai3eNevCpZ/W4AX
	86Px/pKT6ISNI5H2gmFGBIPFhWZlJotP3p6tM3/rKA+mHNA8fMTtuz47GMdIp2yGvIJs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185901-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185901: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=909ba1f1b4146de529469910c1bd0b1248964536
X-Osstest-Versions-That:
    linux=dcbc050cb0d304c3427d6583384eebcaf0e3caee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 May 2024 22:01:09 +0000

flight 185901 linux-6.1 real [real]
flight 185903 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185901/
http://logs.test-lab.xenproject.org/osstest/logs/185903/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 185903-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185871
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185871
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185871
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185871
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185871
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185871
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                909ba1f1b4146de529469910c1bd0b1248964536
baseline version:
 linux                dcbc050cb0d304c3427d6583384eebcaf0e3caee

Last test of basis   185871  2024-04-29 20:44:32 Z    3 days
Testing same since   185901  2024-05-02 15:12:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Li <adamli@os.amperecomputing.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Akhil R <akhilrajeev@nvidia.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Zubkov <green@qrator.net>
  Alexey Brodkin <abrodkin@synopsys.com>
  Alexey Brodkin <Alexey.Brodkin@synopsys.com>
  Alice Ryhl <aliceryhl@google.com>
  Andreas Taschner <andreas.taschner@suse.com>
  Andrei Simion <andrei.simion@microchip.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Ryabinin <ryabinin.a.a@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Arnd Bergmann <arnd@arndb.de>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Aswin Unnikrishnan <aswinunni01@gmail.com>
  Avraham Stern <avraham.stern@intel.com>
  Baoquan He <bhe@redhat.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Baruch Siach <baruch@tkos.co.il>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Chen-Yu Tsai <wenst@chromium.org>
  Chun-Yi Lee <jlee@suse.com>
  Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Conor Dooley <conor.dooley@microchip.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Bauer <mail@david-bauer.net>
  David Kaplan <david.kaplan@amd.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dragan Simic <dsimic@manjaro.org>
  Duoming Zhou <duoming@zju.edu.cn>
  Ed Trexel <ed.trexel@hp.com>
  Eric Dumazet <edumazet@google.com>
  Erwan Velu <e.velu@criteo.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guanrui Huang <guanrui.huang@linux.alibaba.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hyunwoo Kim <v4bel@theori.io>
  Ido Schimmel <idosch@nvidia.com>
  Ikjoon Jang <ikjn@chromium.org>
  Iskander Amara <iskander.amara@theobroma-systems.com>
  Ismael Luceno <iluceno@suse.de>
  Jakub Kicinski <kuba@kernel.org>
  Jarred White <jarredwhite@linux.microsoft.com>
  Jason Reeder <jreeder@ti.com>
  Jiantao Shan <shanjiantao@loongson.cn>
  Jiri Kosina <jkosina@suse.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <Johannes.thumshirn@wdc.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Julian Anastasov <ja@ssi.bg>
  Kees Cook <keescook@chromium.org>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Konstantin Ovsepian <ovs@ovs.to>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lucas Stach <l.stach@pengutronix.de>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Mantas Pucka <mantas@8devices.com>
  Marcel Ziswiler <marcel.ziswiler@toradex.com>
  Marek Vasut <marex@denx.de>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Chan <michael.chan@broadcom.com>
  Michal Tomek <mtdev79b@gmail.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mikhail Kobuk <m.kobuk@ispras.ru>
  Mineri Bhange <minerix.bhange@intel.com> (A Contingent Worker at Intel)
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Mukul Joshi <mukul.joshi@amd.com>
  Nam Cao <namcao@linutronix.de>
  Nathan Chancellor <nathan@kernel.org>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Pascal Ernster <git@hardfalcon.net>
  Paul Geurts <paul_geurts@live.nl>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Münster <pm@a16n.net>
  Petr Machata <petrm@nvidia.com>
  Pin-yen Lin <treapking@chromium.org>
  Quentin Schulz <quentin.schulz@theobroma-systems.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rahul Rameshbabu <rrameshbabu@nvidia.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Ravi Gunasekaran <r-gunasekaran@ti.com>
  Richard Leitner <richard.leitner@skidata.com>
  Richard Zhu <hongxing.zhu@nxp.com>
  Robert Ganzynkowicz <robert.ganzynkowicz@intel.com>
  Ron Economos <re@w6rz.net>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Samuel Holland <samuel.holland@sifive.com>
  Sasha Levin <sashal@kernel.org>
  Sean Anderson <sean.anderson@linux.dev>
  Sean Christopherson <seanjc@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  SeongJae Park <sj@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Sindhu Devale <sindhu.devale@intel.com>
  Soheil Hassas Yeganeh <soheil@google.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Steve French <stfrench@microsoft.com>
  Sudheer Mogilappagari <sudheer.mogilappagari@intel.com>
  Takayuki Nagata <tnagata@redhat.com>
  Terrence Xu <terrence.xu@intel.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Talpey <tom@talpey.com>
  Tony Brelinski <tony.brelinski@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vaclav Svoboda <svoboda@neng.cz>
  Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
  Vikas Gupta <vikas.gupta@broadcom.com>
  Vineet Gupta <vgupta@kernel.org>
  Vinod Koul <vkoul@kernel.org>
  WangYuli <wangyuli@uniontech.com>
  Weiyi Lu <weiyi.lu@mediatek.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wren Turkal <wt@penguintechs.org>
  Xiubo Li <xiubli@redhat.com>
  Yaraslau Furman <yaro330@gmail.com>
  Yick Xie <yick.xie@gmail.com>
  Zhang Lixu <lixu.zhang@intel.com>
  Ильфат Гаптрахманов <i.gaptrakhmanov@rosalinux.ru>

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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   dcbc050cb0d3..909ba1f1b414  909ba1f1b4146de529469910c1bd0b1248964536 -> tested/linux-6.1

