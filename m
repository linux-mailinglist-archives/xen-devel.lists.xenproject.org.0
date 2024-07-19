Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB939371EB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 03:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760809.1170743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUcCk-0000a0-CW; Fri, 19 Jul 2024 01:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760809.1170743; Fri, 19 Jul 2024 01:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUcCk-0000YL-9r; Fri, 19 Jul 2024 01:14:38 +0000
Received: by outflank-mailman (input) for mailman id 760809;
 Fri, 19 Jul 2024 01:14:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUcCj-0000Y8-7w; Fri, 19 Jul 2024 01:14:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUcCj-0002C9-46; Fri, 19 Jul 2024 01:14:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUcCi-0001Y0-Qv; Fri, 19 Jul 2024 01:14:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sUcCi-00072P-QS; Fri, 19 Jul 2024 01:14:36 +0000
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
	bh=WsN1ze13IlngmC1a0UeOdtsVHEYRETYtsz4i4mfhr0I=; b=MCBm9g0i91nbiSWchtE+CRA64q
	J10pFLtqse+eef4O7ZLCVNWweqFFa/FRwW6wMB2nZ5Ufg1+7dWntzBShpr555si4W2pVJzHxUOGFA
	TnfOF64dhxN5vqLg54PRWUOOjbsc3p3J60A8qSfytHmqgf9kF+3qiOExXbi/VPaZwncQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186877-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186877: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
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
    linux=9b3f9a5b12dc96965b2fcc9d7d8342f1b63e29c4
X-Osstest-Versions-That:
    linux=cac15753b8ceb505a3c646f83a86dccbab9e33a3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Jul 2024 01:14:36 +0000

flight 186877 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186877/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186804
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186804
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186804
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186804
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186804
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186804
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
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
 linux                9b3f9a5b12dc96965b2fcc9d7d8342f1b63e29c4
baseline version:
 linux                cac15753b8ceb505a3c646f83a86dccbab9e33a3

Last test of basis   186804  2024-07-15 07:48:10 Z    3 days
Testing same since   186877  2024-07-18 11:42:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Stern <stern@rowland.harvard.edu>
  Aleksander Jan Bajkowski <olek2@wp.pl>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Chartre <alexandre.chartre@oracle.com>
  Alexei Starovoitov <ast@kernel.org>
  Allen Pais <apais@linux.microsoft.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Audra Mitchell <audra@redhat.com>
  Baokun Li <libaokun1@huawei.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brian Foster <bfoster@redhat.com>
  Brian Gerst <brgerst@gmail.com>
  Chandan Kumar Rout <chandanx.rout@intel.com> (A Contingent Worker at Intel)
  Chen Ni <nichen@iscas.ac.cn>
  Chengen Du <chengen.du@canonical.com>
  Christian Brauner <brauner@kernel.org>
  Christian Kujau <lists@nerdbynature.de>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniele Palmas <dnlplm@gmail.com>
  David S. Miller <davem@davemloft.net>
  David Vernet <void@manifault.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Smirnov <d.smirnov@inbox.lv>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Eduard Zingerman <eddyz87@gmail.com>
  Ekansh Gupta <quic_ekangupt@quicinc.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Geetha sowjanya <gakula@marvell.com>
  Geliang Tang <tanggeliang@kylinos.cn>
  Gerald Yang <gerald.yang@canonical.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  He Zhe <zhe.he@windriver.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@kernel.org>
  Hobin Woo <hobin.woo@samsung.com>
  Hou Tao <houtao1@huawei.com>
  Hugh Dickins <hughd@google.com>
  Ian Kent <ikent@redhat.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jeff Layton <jlayton@kernel.org>
  Jia Zhu <zhujia.zj@bytedance.com>
  Jian Hui Lee <jianhui.lee@canonical.com>
  Jim Mattson <jmattson@google.com>
  Jingbo Xu <jefflexu@linux.alibaba.com>
  jinxiaobo <jinxiaobo@uniontech.com>
  Johan Hovold <johan@kernel.org>
  Johannes Weiner <hannes@cmpxchg.org>
  John Stultz <jstultz@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Josh Don <joshdon@google.com>
  Joy Chakraborty <joychakr@google.com>
  Julian Sikorski <belegdol@gmail.com>
  Kees Cook <keescook@chromium.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  Kiran Kumar K <kirankumark@marvell.com>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lee Jones <lee@kernel.org>
  Lex Siegel <usiegl00@gmail.com>
  linke li <lilinke99@qq.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Mank Wang <mank.wang@netprisma.us>
  Mark Brown <broonie@kernel.org>
  Martin KaFai Lau <martin.lau@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Maxim Mikityanskiy <maxim@isovalent.com>
  Michal Kubiak <michal.kubiak@intel.com>
  Michal Mazur <mmazur2@marvell.com>
  Michał Kopeć <michal.kopec@3mdeb.com>
  Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Naveen Mamindlapalli <naveenm@marvell.com>
  Nazar Bilinskyi <nbilinskyi@gmail.com>
  Neal Cardwell <ncardwell@google.com>
  Nithin Dabilpuram <ndabilpuram@marvell.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Paolo Abeni <pabeni@redhat.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Remi Pommarel <repk@triplefau.lt>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Ron Economos <re@w6rz.net>
  Ronald Wahl <ronald.wahl@raritan.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sasha Levin <sashal@kernel.org>
  Satheesh Paul <psatheesh@marvell.com>
  SeongJae Park <sj@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Slark Xiao <slark_xiao@163.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srujana Challa <schalla@marvell.com>
  Steve French <stfrench@microsoft.com>
  Sven Schnelle <svens@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vanillan Wang <vanillanwang@163.com>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  WangYuli <wangyuli@uniontech.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Yafang Shao <laoar.shao@gmail.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yonghong Song <yhs@fb.com>
  Yoonho Shin <yoonho.shin@samsung.com>

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
   cac15753b8ce..9b3f9a5b12dc  9b3f9a5b12dc96965b2fcc9d7d8342f1b63e29c4 -> tested/linux-6.1

