Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B744694E342
	for <lists+xen-devel@lfdr.de>; Sun, 11 Aug 2024 23:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775296.1185550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdFpA-0004oN-3m; Sun, 11 Aug 2024 21:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775296.1185550; Sun, 11 Aug 2024 21:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdFpA-0004ms-01; Sun, 11 Aug 2024 21:10:00 +0000
Received: by outflank-mailman (input) for mailman id 775296;
 Sun, 11 Aug 2024 21:09:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdFp8-0004mi-CS; Sun, 11 Aug 2024 21:09:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdFp8-0004qM-2R; Sun, 11 Aug 2024 21:09:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdFp7-0008I4-Ip; Sun, 11 Aug 2024 21:09:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sdFp7-00031s-II; Sun, 11 Aug 2024 21:09:57 +0000
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
	bh=5yhMGx3f/fdjoiYnBst/XQkaFQBNwcdL5hOSNCcdYhY=; b=fQbTDwDSZBMOwSxbiIqEaITxf4
	yxMI1RHdizKQwO9kGFQ7d4lCeHfdEuXfjB5CWrgN5+lr/wUyvMTyNFe2+mAzMm5Aur14ZJC72LKAF
	NHEgvXFWC3DfE79NOn+dFPzSsw9ZBRBviT6FAK2I43btniYpyQRorx4iB30GqK3A92AM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187211-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 187211: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-xl-raw:xen-boot:fail:heisenbug
    linux-6.1:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start/freebsd.repeat:fail:heisenbug
    linux-6.1:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
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
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=36790ef5e00b69ccb92817f95ba1928eea24eebb
X-Osstest-Versions-That:
    linux=48d525b0e4634c487cf46a41c1e2824e9ee258ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Aug 2024 21:09:57 +0000

flight 187211 linux-6.1 real [real]
flight 187213 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187211/
http://logs.test-lab.xenproject.org/osstest/logs/187213/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-raw       8 xen-boot            fail pass in 187213-retest
 test-amd64-amd64-qemuu-freebsd12-amd64 21 guest-start/freebsd.repeat fail pass in 187213-retest
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 187213-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-raw     14 migrate-support-check fail in 187213 never pass
 test-armhf-armhf-xl-raw 15 saverestore-support-check fail in 187213 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187139
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187139
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187139
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187139
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187139
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187139
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                36790ef5e00b69ccb92817f95ba1928eea24eebb
baseline version:
 linux                48d525b0e4634c487cf46a41c1e2824e9ee258ce

Last test of basis   187139  2024-08-04 00:11:12 Z    7 days
Testing same since   187211  2024-08-11 10:42:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Huang, Ying" <ying.huang@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Maltsev <keltar.gw@gmail.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexey Gladkov <legion@kernel.org>
  Alice Ryhl <aliceryhl@google.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Chiu <andy.chiu@sifive.com>
  Aurinko <petrvelicka@tuta.io>
  Baokun Li <libaokun1@huawei.com>
  Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  Benjamin Tissoires <bentiss@kernel.org>
  Binbin Zhou <zhoubinbin@loongson.cn>
  Bjorn Andersson <andersson@kernel.org>
  bo liu <bo.liu@senarytech.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chandan Kumar Rout <chandanx.rout@intel.com> (A Contingent Worker at Intel)
  ChromeOS CQ Test <chromeos-kernel-stable-merge@google.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Danilo Krummrich <dakr@kernel.org>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Doug Brown <doug@schmorgal.com>
  Dustin L. Howett <dustin@howett.net>
  Edmund Raile <edmund.raile@protonmail.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herve Codina <herve.codina@bootlin.com>
  Huang Ying <ying.huang@intel.com>
  Ian Forbes <ian.forbes@broadcom.com>
  Imre Deak <imre.deak@intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jani Nikula <jani.nikula@intel.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Granados <j.granados@samsung.com>
  Jon Hunter <jonathanh@nvidia.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  kernelci.org bot <bot@kernelci.org>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lee Jones <lee@kernel.org>
  Li Zhijian <lizhijian@fujitsu.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Jing <liujing@cmss.chinamobile.com>
  Lucas Stach <l.stach@pengutronix.de>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Ke <make24@iscas.ac.cn>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Maciej Żenczykowski <maze@google.com>
  Mark Bloch <mbloch@nvidia.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
  Mel Gorman <mgorman@techsingularity.net>
  Michal Kubiak <michal.kubiak@intel.com>
  Miguel Ojeda <ojeda@kernel.org>
  Moshe Shemesh <moshe@nvidia.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Patryk Duda <patrykd@google.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Xu <peterx@redhat.com>
  Sasha Levin <sashal@kernel.org>
  Shahar Shitrit <shshitrit@nvidia.com>
  Shuah Khan <skhan@linuxfoundation.org>
  songxiebing <songxiebing@kylinos.cn>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Suraj Kandpal <suraj.kandpal@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
  Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tvrtko Ursulin <tursulin@ursulin.net>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  WANG Xuerui <git@xen0n.name>
  Will Deacon <will@kernel.org>
  Will McVicker <willmcvicker@google.com>
  Yangtao Li <frank.li@vivo.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zhe Qiao <qiaozhe@iscas.ac.cn>
  Zhiguo Niu <zhiguo.niu@unisoc.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   48d525b0e463..36790ef5e00b  36790ef5e00b69ccb92817f95ba1928eea24eebb -> tested/linux-6.1

