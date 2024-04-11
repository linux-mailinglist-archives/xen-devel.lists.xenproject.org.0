Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728958A1F0B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 21:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704164.1100370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzh7-0001jH-PQ; Thu, 11 Apr 2024 19:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704164.1100370; Thu, 11 Apr 2024 19:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzh7-0001he-MD; Thu, 11 Apr 2024 19:02:45 +0000
Received: by outflank-mailman (input) for mailman id 704164;
 Thu, 11 Apr 2024 19:02:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruzh6-0001hU-5b; Thu, 11 Apr 2024 19:02:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruzh5-0002ap-Vg; Thu, 11 Apr 2024 19:02:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruzh5-0006Q0-L7; Thu, 11 Apr 2024 19:02:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ruzh5-0003yd-FP; Thu, 11 Apr 2024 19:02:43 +0000
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
	bh=rl5qe4imxwpIeknAXXAuTfUeX3c+i22HRMDbvrGwlr0=; b=Z6uOXZEY4vNwFaC9lORS0DFjza
	5TZnoHHBlAqXq9cw/gTiRyohMfbQOtbKW0+ZKdCst2RNSgVdOLHqqdL00O6aeTWZhCaqsNR6YEplD
	cdeUUjaTAtYOrYr4BDbjv3vyiVd4Jufq9uUBZNRSx5mTq9QiP0v/qW00KgpKiEZ9I9Jw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185299-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185299: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=bf1e3b1cb1e002ed1590c91f1a24433b59322368
X-Osstest-Versions-That:
    linux=347385861c50adc8d4801d4b899eded38a2f04cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Apr 2024 19:02:43 +0000

flight 185299 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185299/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185231
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185231
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185231
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185231
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185231
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185231
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                bf1e3b1cb1e002ed1590c91f1a24433b59322368
baseline version:
 linux                347385861c50adc8d4801d4b899eded38a2f04cd

Last test of basis   185231  2024-04-03 20:10:30 Z    7 days
Testing same since   185299  2024-04-10 14:42:59 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Colomar <alx@kernel.org>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexei Starovoitov <ast@kernel.org>
  Andrei Matei <andreimatei1@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Antoine Tenart <atenart@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Ashish Kalra <ashish.kalra@amd.com>
  Atlas Yu <atlas.yu@canonical.com>
  Bastien Nocera <hadess@hadess.net>
  Bjorn Andersson <andersson@kernel.org>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov (AMD) <bp@alien8.de>
  Christian Brauner <brauner@kernel.org>
  Christian Hewitt <christianshewitt@gmail.com>
  Christian König <christian.koenig@amd.com>
  Christoffer Sandberg <cs@tuxedo.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Clayton Craft <clayton@craftyguy.net>
  Conor Dooley <conor.dooley@microchip.com>
  Damien Le Moal <dlemoal@kernel.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Sneddon <daniel.sneddon@linux.intel.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Thompson <davthompson@nvidia.com>
  Davide Caratti <dcaratti@redhat.com>
  Denis Kirjanov <dkirjanov@suse.de>
  Dennis Kirjanov <dkirjanov@suse.de>
  Dominique Martinet <asmadeus@codewreck.org>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Geliang Tang <geliang.tang@suse.com>
  Geliang Tang <tanggeliang@kylinos.cn>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gui-Dong Han <2045gemini@gmail.com>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hariprasad Kelam <hkelam@marvell.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herve Codina <herve.codina@bootlin.com>
  Holger Hoffstätte <holger@applied-asynchrony.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Hui Wang <hui.wang@canonical.com>
  I Gede Agastya Darma Laksana <gedeagas22@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Ivan Vecera <ivecera@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jamal Hadi Salim <jhs@mojatatu.com>
  James Christopher Adduono <jc@adduono.com>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jeff Layton <jlayton@kernel.org>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jian Shen <shenjian15@huawei.com>
  Jie Wang <wangjie125@huawei.com>
  Jijie Shao <shaojijie@huawei.com>
  Joe Damato <jdamato@fastly.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Ernberg <john.ernberg@actia.se>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Josef Bacik <josef@toxicpanda.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Li Nan <linan122@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liviu Dudau <liviu@dudau.co.uk>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Mahmoud Adam <mngyadam@amazon.com>
  Marco Pinna <marco.pinn95@gmail.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mat Martineau <martineau@kernel.org>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Michael Hofmann <mhofmann@redhat.com>
  Mike Snitzer <snitzer@kernel.org>
  Miklos Szeredi <mszeredi@redhat.com>
  min15.li <min15.li@samsung.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nikita Kiryushin <kiryushin@ancud.ru>
  Nikita Travkin <nikita@trvn.ru> # sc7180
  Oliver Upton <oliver.upton@linux.dev>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Pavel Sakharov <p.sakharov@ispras.ru>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Piotr Wejman <piotrwejman90@gmail.com>
  Przemek Kitszel <przemyslaw.kitszel@intel.com>
  Pu Lehui <pulehui@huawei.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
  Ritvik Budhiraja <rbudhiraja@microsoft.com>
  Rob Herring <robh@kernel.org>
  Ron Economos <re@w6rz.net>
  Ryosuke Yasuoka <ryasuoka@redhat.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Samuel Holland <samuel.holland@sifive.com>
  Sandipan Das <sandipan.das@amd.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  SeongJae Park <sj@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Sridhar Samudrala <sridhar.samudrala@intel.com>
  Stefan O'Rear <sorear@fastmail.com>
  Stephen Lee <slee08177@gmail.com>
  Steve French <stfrench@microsoft.com>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Price <steven.price@arm.com>
  Su Hui <suhui@nfschina.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Joachim <svenjoac@gmx.de>
  syzbot+d4066896495db380182e@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thorsten Winkler <twinkler@linux.ibm.com>
  Tokunori Ikegami <ikegami.t@gmail.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Wei Fang <wei.fang@nxp.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Yonglong Liu <liuyonglong@huawei.com>
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
   347385861c50..bf1e3b1cb1e0  bf1e3b1cb1e002ed1590c91f1a24433b59322368 -> tested/linux-6.1

