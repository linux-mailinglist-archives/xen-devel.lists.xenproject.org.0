Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDE909FBE
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jun 2024 22:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741528.1148141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIwg4-0005Mm-ES; Sun, 16 Jun 2024 20:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741528.1148141; Sun, 16 Jun 2024 20:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIwg4-0005Ko-Ba; Sun, 16 Jun 2024 20:40:40 +0000
Received: by outflank-mailman (input) for mailman id 741528;
 Sun, 16 Jun 2024 20:40:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIwg2-0005Kd-K1; Sun, 16 Jun 2024 20:40:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIwg2-0003oM-6r; Sun, 16 Jun 2024 20:40:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIwg1-0001qP-TP; Sun, 16 Jun 2024 20:40:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sIwg1-00028s-Sz; Sun, 16 Jun 2024 20:40:37 +0000
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
	bh=xy2ntVYtBJhsY4cl86V7/6//7NVXTRRoulmvnUy71Zk=; b=XBD5MtRKtOr34M7JXP6d//l1sd
	VpuqPccvE0BqKHvMAgoQINEayv9jJ3ZCdRIgmLCV+w1lJ88XyvqX1l5/GdGQ+BsxUkd3dMBVmBp05
	r3+1AvHsIXcVghu/hi+w23p1UEa/ppfWK/IdU/Hn+O7Sf4mDjlSW8oN7oBr8dYXGVKes=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186370: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-xl-multivcpu:host-ping-check-xen:fail:heisenbug
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=eb44d83053d66372327e69145e8d2fa7400a4991
X-Osstest-Versions-That:
    linux=ae9f2a70d69e9c840ee1eda201f09662ca7e2038
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Jun 2024 20:40:37 +0000

flight 186370 linux-6.1 real [real]
flight 186373 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186370/
http://logs.test-lab.xenproject.org/osstest/logs/186373/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-multivcpu 10 host-ping-check-xen fail pass in 186373-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 186373 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 186373 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186320
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186320
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186320
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186320
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186320
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186320
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                eb44d83053d66372327e69145e8d2fa7400a4991
baseline version:
 linux                ae9f2a70d69e9c840ee1eda201f09662ca7e2038

Last test of basis   186320  2024-06-12 09:12:33 Z    4 days
Testing same since   186370  2024-06-16 12:15:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Potapenko <glider@google.com>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Andreas Larsson <andreas@gaisler.com>
  Andrew Morton <akpm@linux-foundation.org>
  Animesh Manna <animesh.manna@intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arnd Bergmann <arnd@arndb.de>
  Avri Altman <avri.altman@wdc.com>
  Baokun Li <libaokun1@huawei.com>
  Bitterblue Smith <rtl8821cerfe2@gmail.com>
  Bjorn Andersson <andersson@kernel.org>
  Bob Zhou <bob.zhou@amd.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brian Johannesmeyer <bjohannesmeyer@gmail.com>
  Cai Xinchen <caixinchen1@huawei.com>
  Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
  Chao Yu <chao@kernel.org>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christoffer Sandberg <cs@tuxedo.de>
  Coly Li <colyli@suse.de>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Gora <dan.gora@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Thompson <daniel.thompson@linaro.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Elliot Berman <quic_eberman@quicinc.com> # sm8650-qrd
  Enzo Matsumiya <ematsumiya@suse.de>
  Eric Dumazet <edumazet@google.com>
  Fan Yu <fan.yu9@zte.com.cn>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frank Li <Frank.Li@nxp.com>
  Frank van der Linden <fvdl@google.com>
  Gautham R. Shenoy <gautham.shenoy@amd.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Haorong Lu <ancientmodern4@gmail.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@kernel.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Johan Hovold <johan+linaro@kernel.org>
  John David Anglin <dave.anglin@bell.net>
  Jon Hunter <jonathanh@nvidia.com>
  Jorge Ramirez-Ortiz <jorge@foundries.io>
  Judith Mendez <jm@ti.com>
  Justin Stitt <justinstitt@google.com>
  Kai Vehmanen <kai.vehmanen@intel.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lee Jones <lee@kernel.org>
  Li Ma <li.ma@amd.com>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc Zyngier <maz@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Marius Fleischer <fleischermarius@gmail.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mat Martineau <martineau@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthew Mirvish <matthew@mm12.xyz>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Maulik Shah <quic_mkshah@quicinc.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Gilbert <floppym@gentoo.org>
  Nathan Chancellor <nathan@kernel.org>
  Nick Bowler <nbowler@draconx.ca>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Oliver Upton <oliver.upton@linux.dev>
  Omar Sandoval <osandov@fb.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Machek (CIP) <pavel@denx.de>
  Peng Zhang <zhangpeng.00@bytedance.com>
  Peter Jung <ptr1337@cachyos.org>
  Peter Schneider <pschneider1968@googlemail.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Puranjay Mohan <puranjay@kernel.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Ron Economos <re@w6rz.net>
  Ryan Roberts <ryan.roberts@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sam Ravnborg <sam@ravnborg.org>
  SeongJae Park <sj@kernel.org>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shradha Gupta <shradhagupta@linux.microsoft.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sidhartha Kumar <sidhartha.kumar@oracle.com>
  Song Liu <song@kernel.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Steve French <stfrench@microsoft.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vitaly Chikunov <vt@altlinux.org>
  Werner Sembach <wse@tuxedocomputers.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  xu xin <xu.xin16@zte.com.cn>
  Yang Xiwen <forbidden405@outlook.com>
  Yu Kuai <yukuai3@huawei.com>
  Zheyu Ma <zheyuma97@gmail.com>

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
   ae9f2a70d69e..eb44d83053d6  eb44d83053d66372327e69145e8d2fa7400a4991 -> tested/linux-6.1

