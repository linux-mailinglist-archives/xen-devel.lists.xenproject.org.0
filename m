Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8C970AA7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 01:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792928.1202588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snRX0-0004TB-8P; Sun, 08 Sep 2024 23:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792928.1202588; Sun, 08 Sep 2024 23:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snRX0-0004Py-4d; Sun, 08 Sep 2024 23:41:22 +0000
Received: by outflank-mailman (input) for mailman id 792928;
 Sun, 08 Sep 2024 23:41:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snRWy-0004Po-AR; Sun, 08 Sep 2024 23:41:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snRWx-0003mK-Qz; Sun, 08 Sep 2024 23:41:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snRWx-0003rX-Ee; Sun, 08 Sep 2024 23:41:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snRWx-0003S4-EH; Sun, 08 Sep 2024 23:41:19 +0000
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
	bh=M2Un1UTz/oPemGxs2IIAwZX6RYD2PGbJkRt6XRxwbY4=; b=DbLt1KJ40eIEH3yi4lpzWoeWEt
	0IXhTyAjJ6Lpp++1Wq4MhqeeWHgGeBwnauZlaU7z2trTuUjMp/ruTNqHel6ZHjvJJxWCsjGiFuKbR
	IJOBVVJGpUmnXXS5mJ8ACG9s/c6W5orqnmS4JEoZh8CqEN/+UNAOqbcfdo5Tse3tEfEA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187566-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 187566: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1
X-Osstest-Versions-That:
    linux=69950617349402d1c952a54a5edc9a323a7c36b4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Sep 2024 23:41:19 +0000

flight 187566 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187566/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187493
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187493
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187493
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187493
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187493
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187493
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1
baseline version:
 linux                69950617349402d1c952a54a5edc9a323a7c36b4

Last test of basis   187493  2024-09-04 11:45:08 Z    4 days
Testing same since   187566  2024-09-08 06:13:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alvin Lee <alvin.lee2@amd.com>
  Amir Goldstein <amir73il@gmail.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Asad Kamal <asad.kamal@amd.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Casey Schaufler <casey@schaufler-ca.com>
  Chao Yu <chao@kernel.org>
  Chris Lew <quic_clew@quicinc.com>
  Christoph Hellwig <hch@lst.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  David S. Miller <davem@davemloft.net>
  Dragos Tatulea <dtatulea@nvidia.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Biggers <ebiggers@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frederic Weisbecker <frederic@kernel.org>
  Geliang Tang <tanggeliang@kylinos.cn>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Haoran Liu <liuhaoran14@163.com>
  Hersen Wu <hersenxs.wu@amd.com>
  Hongren Zheng <i@zenithal.me>
  Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jagadeesh Kona <quic_jkona@quicinc.com>
  Jakub Kicinski <kuba@kernel.org>
  Jameson Thies <jthies@google.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <jasowang@redhat.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Zhang <Jesse.Zhang@amd.com>
  Johannes Berg <johannes.berg@intel.com>
  John Johansen <john.johansen@canonical.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Julien Stephan <jstephan@baylibre.com>
  Kalle Valo <quic_kvalo@quicinc.com>
  Ken Sloat <ksloat@designlinxhs.com>
  Konstantin Andreev <andreev@swemel.ru>
  Krzysztof Stępniak <kfs.szk@gmail.com>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Leesoo Ahn <lsahn@ooseel.net>
  Leon Romanovsky <leon@kernel.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Michael Chen <michael.chen@amd.com>
  Michael Margolin <mrgolin@amazon.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Simek <michal.simek@amd.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Mostafa Saleh <smostafa@google.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Olivier Dautricourt <olivierdautricourt@gmail.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pauli Virtanen <pav@iki.fi>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Wang <peter.wang@mediatek.com>
  Philip Mueller <philm@manjaro.org>
  Ping-Ke Shih <pkshih@realtek.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Richard Maina <quic_rmaina@quicinc.com>
  Rik van Riel <riel@surriel.com>
  Robert Foss <rfoss@kernel.org>
  Ron Economos <re@w6rz.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Sasha Levin <sashal@kernel.org>
  Shahar S Matityahu <shahar.s.matityahu@intel.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shivani Agarwal <shivani.agarwal@broadcom.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Holesch <simon@holesch.de>
  Stephen Brennan <stephen.s.brennan@oracle.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Zhou <tao.zhou1@amd.com>
  Tariq Toukan <tariqt@nvidia.com>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Tim Huang <Tim.Huang@amd.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wayne Lin <wayne.lin@amd.com>
  winstang <winstang@amd.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Zaeem Mohamed <zaeem.mohamed@amd.com>
  zhanchengbin <zhanchengbin1@huawei.com>
  ZHANG Yuntian <yt@radxa.com>
  Zhigang Luo <Zhigang.Luo@amd.com>
  Zong-Zhe Yang <kevin_yang@realtek.com>

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
   699506173494..5ca5b389fddf  5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1 -> tested/linux-6.1

