Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33C463F7B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 21:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235503.408529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msA5t-0004mA-Eg; Tue, 30 Nov 2021 20:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235503.408529; Tue, 30 Nov 2021 20:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msA5t-0004kH-B1; Tue, 30 Nov 2021 20:51:17 +0000
Received: by outflank-mailman (input) for mailman id 235503;
 Tue, 30 Nov 2021 20:51:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msA5r-0004k7-Rg; Tue, 30 Nov 2021 20:51:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msA5r-0004cj-Kg; Tue, 30 Nov 2021 20:51:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msA5r-0007hU-DP; Tue, 30 Nov 2021 20:51:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1msA5r-0002dO-Cw; Tue, 30 Nov 2021 20:51:15 +0000
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
	bh=VCM9UkpZNqk5AbaFwxMyOGNvkBQG/yGqkdMBP7b6uds=; b=oyhFzjLO1waOPgnEyFowwZ/76j
	OeXvL9KgtlrJ4iwp9xqmlhLIxA400oojQlE+6sG6motkiqMLSVmVCltalAtu1PaYvH3bZ+wPMSkPD
	Co5TdYd4pc9u2jl9vUgaGCFLKCejS0lczohlvTwSNk642crvpsWC/WyPn91GoMWmd2uQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166942-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 166942: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-vhd:host-ping-check-xen:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
X-Osstest-Versions-That:
    linux=1bff7d7e8c487b9b0ceab70b43b781f1d45f55eb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Nov 2021 20:51:15 +0000

flight 166942 linux-linus real [real]
flight 166962 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166942/
http://logs.test-lab.xenproject.org/osstest/logs/166962/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd      10 host-ping-check-xen fail pass in 166962-retest
 test-arm64-arm64-xl-vhd 17 guest-start/debian.repeat fail pass in 166962-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 166962 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 166962 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166922
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166922
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166922
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166922
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166922
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166922
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166922
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166922
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
baseline version:
 linux                1bff7d7e8c487b9b0ceab70b43b781f1d45f55eb

Last test of basis   166922  2021-11-26 19:30:09 Z    4 days
Testing same since   166942  2021-11-27 18:11:40 Z    3 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adamos Ttofari <attofari@amazon.de>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Alessandro B Maurici <abmaurici@gmail.com>
  Alex Elder <elder@linaro.org>
  Alexander Aring <aahringo@redhat.com>
  Amit Cohen <amcohen@nvidia.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Arnd Bergmann <arnd@arndb.de>
  Brett Creeley <brett.creeley@intel.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Chuanqi Liu <legend050709@qq.com>
  Cong Wang <cong.wang@bytedance.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Danielle Ratson <danieller@nvidia.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Caratti <dcaratti@redhat.com>
  Diana Wang <na.wang@corigine.com>
  Dylan Hung <dylan_hung@aspeedtech.com>
  Eric Dumazet <edumazet@google.com>
  Evan Green <evgreen@chromium.org>
  Florent Fourcot <florent.fourcot@wifirst.fr>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  George Kuruvinakunnel <george.kuruvinakunnel@intel.com>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guo DaXing <guodaxing@huawei.com>
  Hao Chen <chenhao288@hisilicon.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Holger Assmann <h.assmann@pengutronix.de>
  Huang Pei <huangpei@loongson.cn>
  Ido Schimmel <idosch@nvidia.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  James Prestwood <prestwoj@gmail.com>
  Jan Sokolowski <jan.sokolowski@intel.com>
  Jaroslaw Gawin <jaroslawx.gawin@intel.com>
  Jedrzej Jagielski <jedrzej.jagielski@intel.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jie Wang <wangjie125@huawei.com>
  Jing Yao <yao.jing2@zte.com.cn>
  Julian Anastasov <ja@ssi.bg>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Kiran Bhandare <kiranx.bhandare@intel.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Kumar Thangavel <kumarthangavel.hcl@gmail.com>
  Kumar Thangavel <thangavel.k@hcl.com>
  Li Zhijian <zhijianx.li@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Marek Behún <kabel@kernel.org>
  Marta Plantykow <marta.a.plantykow@intel.com>
  Martyn Welch <martyn.welch@collabora.com>
  Michael Larabel <Michael@MichaelLarabel.com>
  Michael S. Tsirkin <mst@redhat.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Neal Cardwell <ncardwell@google.com>
  Nicolas Iooss <nicolas.iooss_linux@m4x.org>
  Nikolay Aleksandrov <nikolay@nvidia.com>
  Nitesh B Venkatesh <nitesh.b.venkatesh@intel.com>
  Oleksandr Natalenko <oleksandr@natalenko.name>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Phil Sutter <phil@nwl.cc>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Richard Cochran <richardcochran@gmail.com>
  Richard Herbert <rherbert@sympatico.ca>
  Robert Marko <robert.marko@sartura.hr>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Samuel Mendoza-Jonas <sam@mendozajonas.com>
  Simon Horman <horms@verge.net.au>
  Simon Horman <simon.horman@corigine.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>
  Tobias Brunner <tobias@strongswan.org>
  Tony Lu <tonylu@linux.alibaba.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Volodymyr Mytnyk <vmytnyk@marvell.com>
  Wan Jiabing <wanjiabing@vivo.com>
  Wen Gu <guwen@linux.alibaba.com>
  Will Mortensen <willmo@gmail.com>
  yangxingwu <xingwu.yang@gmail.com>
  Yannick Vignon <yannick.vignon@nxp.com>
  Zekun Shen <bruceshenzk@gmail.com>
  zhangyue <zhangyue1@kylinos.cn>
  Zheyu Ma <zheyuma97@gmail.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>
  Łukasz Stelmach <l.stelmach@samsung.com>

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
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      fail    


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
   1bff7d7e8c48..c5c17547b778  c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5 -> tested/linux-linus

