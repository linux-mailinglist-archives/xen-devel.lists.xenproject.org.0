Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293E1AEAA0
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 09:56:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPiJt-0006dN-Qp; Sat, 18 Apr 2020 07:55:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msmW=6C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jPiJr-0006dI-WD
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 07:55:20 +0000
X-Inumbo-ID: edd41cec-8149-11ea-8e1d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edd41cec-8149-11ea-8e1d-12813bfff9fa;
 Sat, 18 Apr 2020 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ljU8mZ2CmV+qBMdtfBGnamAmoWcTov2AKMT9tweyP+Q=; b=1QLBUfYs101hdaW+yPE/p8QNR
 +o0g6cRu5eNfqzUfGdI4klIyqmH3QCS5aMmevSF/88MSbeSZkudk5Ce5+jDges+UFIewyaEsxzMFb
 50ndc5atPM1f3AXv0pgEPDjs2UJ5QX43bqS0J+lq5Emp4J111I2zzA2w7uYrwKSxlZPNw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPiJi-0003IR-RX; Sat, 18 Apr 2020 07:55:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPiJi-0000PD-J0; Sat, 18 Apr 2020 07:55:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jPiJi-0004qz-I3; Sat, 18 Apr 2020 07:55:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149703-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 149703: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-linus:test-amd64-amd64-examine:memdisk-try-append:fail:heisenbug
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:heisenbug
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:allowable
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=7a56db0299f9d43b4fe076838150c5cc293df131
X-Osstest-Versions-That: linux=9786cab674574239b04df638f825ee0e7d76a48c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Apr 2020 07:55:10 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149703 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149703/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-examine    4 memdisk-try-append fail in 149697 pass in 149703
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail pass in 149697

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     16 guest-localmigrate       fail REGR. vs. 149693

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail in 149697 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 149693
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149693
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 149693
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 149693
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149693
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149693
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 149693
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149693
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                7a56db0299f9d43b4fe076838150c5cc293df131
baseline version:
 linux                9786cab674574239b04df638f825ee0e7d76a48c

Last test of basis   149693  2020-04-16 19:59:31 Z    1 days
Testing same since   149697  2020-04-17 07:30:41 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexei Starovoitov <ast@kernel.org>
  Amol Grover <frextrite@gmail.com>
  Andrew Lunn <andrew@lunn.ch>
  Andrey Ignatov <rdna@fb.com>
  Andrii Nakryiko <andriin@fb.com>
  Arnd Bergmann <arnd@arndb.de>
  Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
  Björn Töpel <bjorn.topel@gmail.com>
  Björn Töpel <bjorn.topel@intel.com>
  Cambda Zhu <cambda@linux.alibaba.com>
  Chen-Yu Tsai <wens@csie.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Clemens Gruber <clemens.gruber@pqgruber.com>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel T. Lee <danieltimlee@gmail.com>
  David Ahern <dsahern@gmail.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  DENG Qingfang <dqfext@gmail.com>
  Dmytro Linkin <dmitrolin@mellanox.com>
  Eli Cohen <eli@mellanox.com>
  Enric Balletbo i Serra <enric.balletbo@collabora.com>
  Eran Ben Elisha <eranbe@mellanox.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Frank Wunderlich <frank-w@public-files.de>
  Fugang Duan <fugang.duan@nxp.com>
  Gilberto Bertin <me@jibi.io>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Yan <yanaijie@huawei.com>
  Jeremy Cline <jcline@redhat.com>
  Joe Stringer <joe@wand.net.nz>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Ka-Cheong Poon <ka-cheong.poon@oracle.com>
  Kalle Valo <kvalo@codeaurora.org>
  Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
  KP Singh <kpsingh@google.com>
  Li RongQing <lirongqing@baidu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lothar Rubusch <l.rubusch@gmail.com>
  Luke Nelson <luke.r.nels@gmail.com>
  Luke Nelson <lukenels@cs.washington.edu>
  Maciej Żenczykowski <maze@google.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Martin Fuzzey <martin.fuzzey@flowbird.group>
  Martin KaFai Lau <kafai@fb.com>
  Matteo Croce <mcroce@redhat.com>
  Michael Weiß <michael.weiss@aisec.fraunhofer.de>
  Moshe Shemesh <moshe@mellanox.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Parav Pandit <parav@mellanox.com>
  Paul Blakey <paulb@mellanox.com>
  Qiujun Huang <hqjagain@gmail.com>
  Rafał Miłecki <rafal@milecki.pl>
  Randy Dunlap <rdunlap@infradead.org>
  René van Dorst <opensource@vdorst.com>
  Rob Herring <robh@kernel.org>
  Roi Dayan <roid@mellanox.com>
  Roman Mashak <mrv@mojatatu.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@mellanox.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sean Wang <sean.wang@mediatek.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shannon Nelson <snelson@pensando.io>
  Slava Bacherikov <slava@bacher09.org>
  Song Liu <songliubraving@fb.com>
  Stefano Brivio <sbrivio@redhat.com>
  Sumit Garg <sumit.garg@linaro.org>
  Taehee Yoo <ap420073@gmail.com>
  Tamizh chelvam <tamizhr@codeaurora.org>
  Taras Chornyi <taras.chornyi@plvision.eu>
  Tim Stallard <code@timstallard.me.uk>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
  Tuong Lien <tuong.t.lien@dektech.com.au>
  Vadym Kochan <vadym.kochan@plvision.eu>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Wenhu <wenhu.wang@vivo.com>
  Xi Wang <xi.wang@gmail.com>
  YueHaibing <yuehaibing@huawei.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
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

To xenbits.xen.org:/home/xen/git/linux-pvops.git
   9786cab67457..7a56db0299f9  7a56db0299f9d43b4fe076838150c5cc293df131 -> tested/linux-linus

