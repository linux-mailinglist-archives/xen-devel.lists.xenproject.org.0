Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98865928F83
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2024 01:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754546.1163004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPsFx-0003J3-3c; Fri, 05 Jul 2024 23:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754546.1163004; Fri, 05 Jul 2024 23:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPsFx-0003HJ-0H; Fri, 05 Jul 2024 23:22:21 +0000
Received: by outflank-mailman (input) for mailman id 754546;
 Fri, 05 Jul 2024 23:22:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPsFv-0003H9-8z; Fri, 05 Jul 2024 23:22:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPsFv-0003Zh-3t; Fri, 05 Jul 2024 23:22:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPsFu-0006Gv-PK; Fri, 05 Jul 2024 23:22:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPsFu-0000vg-Op; Fri, 05 Jul 2024 23:22:18 +0000
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
	bh=HzwlnSY5GhIy3h76KUSeyNgCNXV71TE0xuPWyHW0Low=; b=d5FyO3L9IHdrBfM6iE1H44PsR0
	xiZeE29qxNAoQVcYNmb4XjJ8QV6wLJl4g+lHfg/dGqQszyz19Noel/O8oSwbrWU2wh6bB/1PNGiXC
	4OF1HO8XU5JYYc2wSBm1xtl/tBSvj5wJ0PO9f1kyBKflZJfUNaYhMYCvxpJG+dlkUMiE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186683-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186683: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-examine-uefi:examine-iommu:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=661e504db04c6b7278737ee3a9116738536b4ed4
X-Osstest-Versions-That:
    linux=795c58e4c7fc6163d8fb9f2baa86cfe898fa4b19
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jul 2024 23:22:18 +0000

flight 186683 linux-linus real [real]
flight 186708 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186683/
http://logs.test-lab.xenproject.org/osstest/logs/186708/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-qcow2     8 xen-boot            fail pass in 186708-retest
 test-amd64-amd64-examine-uefi 13 examine-iommu      fail pass in 186708-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-qcow2   14 migrate-support-check fail in 186708 never pass
 test-armhf-armhf-xl-qcow2 15 saverestore-support-check fail in 186708 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186647
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 186647
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 186647
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186659
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186659
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186659
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186659
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186659
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                661e504db04c6b7278737ee3a9116738536b4ed4
baseline version:
 linux                795c58e4c7fc6163d8fb9f2baa86cfe898fa4b19

Last test of basis   186659  2024-07-04 16:15:12 Z    1 days
Testing same since   186683  2024-07-05 04:06:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ajay Singh <ajay.kathat@microchip.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexis Lothoré <alexis.lothore@bootlin.com>
  Andrew Morton <akpm@linux-foundation.org>
  Armin Wolf <W_Armin@gmx.de>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Boris Burkov <boris@bur.io>
  Chris Mi <cmi@nvidia.com>
  Daniel Gabay <daniel.gabay@intel.com>
  Daniel Jurgens <danielj@nvidia.com>
  Dave Jiang <dave.jiang@intel.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dima Ruinskiy <dima.ruinskiy@intel.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Ed Tomlinson <edtoml@gmail.com>
  Edward Adam Davis <eadavis@qq.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Dumazet <edumazet@google.com>
  Eric Farman <farman@linux.ibm.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Westphal <fw@strlen.de>
  Furong Xu <0x1207@gmail.com>
  Ghadi Elie Rahme <ghadi.rahme@canonical.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Hector Martin <marcan@marcan.st>
  Heiko Carstens <hca@linux.ibm.com>
  Iulia Tanasescu <iulia.tanasescu@nxp.com>
  Ivan Vecera <ivecera@redhat.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Janne Grunau <j@jannau.net>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jerry Dai <jerry.dai@intel.com>
  Jianbo Liu <jianbol@nvidia.com>
  Jiawen Wu <jiawenwu@trustnetic.com>
  Jimmy Assarsson <extja@kvaser.com>
  Jinliang Zheng <alexjlzheng@tencent.com>
  Johannes Berg <johannes.berg@intel.com>
  Jozef Hopko <jozef.hopko@altana.com>
  Kalle Valo <kvalo@kernel.org>
  Karol Kolacinski <karol.kolacinski@intel.com>
  kemal <kmal@cock.li>
  Kiran K <kiran.k@intel.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Leon Romanovsky <leonro@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Michael Chan <michael.chan@broadcom.com>
  Michal Hocko <mhocko@suse.com>
  Mickaël Salaün <mic@digikod.net>
  Milena Olech <milena.olech@intel.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Neal Cardwell <ncardwell@google.com>
  Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Pavel Skripkin <paskripkin@gmail.com>
  Petr Oros <poros@redhat.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qu Wenruo <wqu@suse.com>
  Radu Rendec <rrendec@redhat.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sam Sun <samsun1006219@gmail.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Simon Horman <horms@kernel.org>
  Stefan Haberland <sth@linux.ibm.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Sven Peter <sven@svenpeter.dev>
  Tariq Toukan <tariqt@nvidia.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vijay Satija <vijay.satija@intel.com>
  Vitaly Lifshits <vitaly.lifshits@intel.com>
  Wren Turkal <wt@penguintechs.org>
  Xiaochun Lu <xiaochun.lu@bytedance.com>
  Yijie Yang <quic_yijiyang@quicinc.com>
  Yuchung Cheng <ycheng@google.com>
  Yue Sun <samsun1006219@gmail.com>
  Yunshui Jiang <jiangyunshui@kylinos.cn>
  Zijian Zhang <zijianzhang@bytedance.com>
  Zijun Hu <quic_zijuhu@quicinc.com>

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
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 fail    
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
   795c58e4c7fc6..661e504db04c6  661e504db04c6b7278737ee3a9116738536b4ed4 -> tested/linux-linus

