Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFAD2F4571
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 08:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66349.117798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzapC-0001wL-1x; Wed, 13 Jan 2021 07:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66349.117798; Wed, 13 Jan 2021 07:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzapB-0001vt-S4; Wed, 13 Jan 2021 07:44:13 +0000
Received: by outflank-mailman (input) for mailman id 66349;
 Wed, 13 Jan 2021 07:44:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzapA-0001vl-M5; Wed, 13 Jan 2021 07:44:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzapA-0006ep-Il; Wed, 13 Jan 2021 07:44:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzapA-00009M-76; Wed, 13 Jan 2021 07:44:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kzapA-00012I-6c; Wed, 13 Jan 2021 07:44:12 +0000
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
	bh=ZPAJGVuVuyFqNAe2oFCuCcosYE96oVZdNjC0SDH6sjw=; b=alOYxRQljIgTIe+lW/mSn0xO0x
	xrSa+ZwhOCHu9JRV/zv8SO+SCZYOmWKrfCiysKmM5CwctemTJ/7u6HRkMmOICGEHMSe//i6nJdEzX
	4vIrXguW/0Z4spXdsKlfvn8K1G7uPXQ6ROjLsQk6Uzf92cgl5pDEx6fKXWS71Iv0pNaw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158387-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 158387: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a829146c3fdcf6d0b76d9c54556a223820f1f73b
X-Osstest-Versions-That:
    linux=f3a4c8d501452b8c2e04c4500c317ce4bdb1b47c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Jan 2021 07:44:12 +0000

flight 158387 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158387/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 158297
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 158297
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 158297
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 158297
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 158297
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 158297
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 158297
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 158297
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 158297
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 158297
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 158297
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 158297
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a829146c3fdcf6d0b76d9c54556a223820f1f73b
baseline version:
 linux                f3a4c8d501452b8c2e04c4500c317ce4bdb1b47c

Last test of basis   158297  2021-01-09 13:10:58 Z    3 days
Testing same since   158387  2021-01-12 19:40:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alim Akhtar <alim.akhtar@samsung.com>
  Andrew Morton <akpm@linux-foundation.org>
  Antoine Tenart <atenart@kernel.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Avri Altman <avri.altman@wdc.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bart Van Assche <bvanassche@acm.org>
  Bean Huo <beanhuo@micron.com>
  Bjørn Mork <bjorn@mork.no>
  bo liu <bo.liu@senarytech.com>
  Borislav Petkov <bp@suse.de>
  Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
  Charan Teja Reddy <charante@codeaurora.org>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Cong Wang <cong.wang@bytedance.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Palmer <daniel@0x0f.com>
  David Disseldorp <ddiss@suse.de>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Caratti <dcaratti@redhat.com>
  Dexuan Cui <decui@microsoft.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dominique Martinet <asmadeus@codewreck.org>
  Eddie Hung <eddie.hung@mediatek.com>
  Felipe Balbi <balbi@kernel.org>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grygorii Strashko <grygorii.strashko@ti.com>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Hans de Goede <hdegoede@redhat.com>
  Hauke Mehrtens <hauke@hauke-m.de>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Huang Shijie <sjhuang@iluvatar.ai>
  Igor Russkikh <irusskikh@marvell.com>
  Ilil Blum Shem-Tov <ilil.blum.shem-tov@intel.com>
  Jack Pham <jackp@codeaurora.org>
  Jakub Kicinski <kuba@kernel.org>
  Jani Nikula <jani.nikula@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Dike <jdike@akamai.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Johan Hovold <johan@kernel.org>
  John Wang <wangzhiqiang.bj@bytedance.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Lijun Pan <ljp@linux.ibm.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Colitti <lorenzo@google.com>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Manish Chopra <manishc@marvell.com>
  Manish Narani <manish.narani@xilinx.com>
  Marcel Holtmann <marcel@holtmann.org>
  Marcin Wojtas <mw@semihalf.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Massimo B. <massimo.b@gmx.net>
  Matthew Auld <matthew.auld@intel.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Christie <michael.christie@oracle.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Bonzini <pbonzini@redhat.com>
  PeiSen Hou <pshou@realtek.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Villemoes <rasmus.villemoes@prevas.dk>
  Richard Cochran <richardcochran@gmail.com>
  Roland Dreier <roland@kernel.org>
  Sasha Levin <sashal@kernel.org>
  Sean Young <sean@mess.org>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shannon Nelson <snelson@pensando.io>
  Shuah Khan <skhan@linuxfoundation.org>
  Sriharsha Allenki <sallenki@codeaurora.org>
  Stefan Chulski <stefanc@marvell.com>
  Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
  Sudarsana Kalluru <skalluru@marvell.com>
  Sumit Semwal <sumit.semwal@linaro.org>
  Sylwester Dziedziuch <sylwesterx.dziedziuch@intel.com>
  taehyun.cho <taehyun.cho@samsung.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vasily Averin <vvs@virtuozzo.com>
  Willem de Bruijn <willemb@google.com>
  Xie He <xie.he.0141@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yi Zhang <yi.zhang@redhat.com>
  Ying-Tsun Huang <ying-tsun.huang@amd.com>
  Yu Kuai <yukuai3@huawei.com>
  Yunfeng Ye <yeyunfeng@huawei.com>
  Yunjian Wang <wangyunjian@huawei.com>
  Zqiang <qiang.zhang@windriver.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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
   f3a4c8d50145..a829146c3fdc  a829146c3fdcf6d0b76d9c54556a223820f1f73b -> tested/linux-5.4

