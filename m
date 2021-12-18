Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C2D47981A
	for <lists+xen-devel@lfdr.de>; Sat, 18 Dec 2021 03:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248959.429410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myP2D-00047w-Od; Sat, 18 Dec 2021 02:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248959.429410; Sat, 18 Dec 2021 02:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myP2D-00045i-Iz; Sat, 18 Dec 2021 02:01:17 +0000
Received: by outflank-mailman (input) for mailman id 248959;
 Sat, 18 Dec 2021 02:01:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myP2C-00045Y-7a; Sat, 18 Dec 2021 02:01:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myP2C-00032c-4y; Sat, 18 Dec 2021 02:01:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myP2B-0008Jx-S4; Sat, 18 Dec 2021 02:01:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1myP2B-0007qu-RY; Sat, 18 Dec 2021 02:01:15 +0000
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
	bh=D6WykvuPqsncUv5pDAiuSzVzZo+09D20dTe7qqhtOVs=; b=3lbKCTI8lVuhqPusSqsVkeqmFd
	05o4/MMtHgE7hbtn27QMycu42cNtOL8QsQncN2uvepZDY8f3+HmpWV7a7utJWkWjDeazl8RcMDO9R
	gBYIYeADH1Y+4lS6dIFztin99n0lQlx08KZe8Z4LGLfVwsQl/XRzQZlI76DFH2jRpl28=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167461-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167461: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6441998e2e37131b0a4c310af9156d79d3351c16
X-Osstest-Versions-That:
    linux=fa36bbe6d43f3bbce1f10a187e153587c7584d83
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Dec 2021 02:01:15 +0000

flight 167461 linux-linus real [real]
flight 167469 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167461/
http://logs.test-lab.xenproject.org/osstest/logs/167469/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd       8 xen-boot            fail pass in 167469-retest
 test-amd64-amd64-xl    22 guest-start/debian.repeat fail pass in 167469-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 167469 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 167469 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167451
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167451
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167451
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167451
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167451
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167451
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167451
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167451
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                6441998e2e37131b0a4c310af9156d79d3351c16
baseline version:
 linux                fa36bbe6d43f3bbce1f10a187e153587c7584d83

Last test of basis   167451  2021-12-16 19:11:06 Z    1 days
Testing same since   167461  2021-12-17 13:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Adam Ford <aford173@gmail.com>
  Ahmed Zaki <anzaki@gmail.com>
  Alex Bee <knaerzche@gmail.com>
  Alexei Starovoitov <ast@kernel.org>
  Andrey Eremeev <Axtone4all@yandex.ru>
  Arnd Bergmann <arnd@arndb.de>
  Artem Lapkin <art@khadas.com>
  Artem Lapkin <email2tema@gmail.com>
  Baowen Zheng <baowen.zheng@corigine.com>
  Bjørn Mork <bjorn@mork.no>
  Brendan Jackman <jackmanb@google.com>
  Cyril Novikov <cnovikov@lynx.com>
  D. Wythe <alibuda@linux.alibaba.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniele Palmas <dnlplm@gmail.com>
  Danielle Ratson <danieller@nvidia.com>
  David Ahern <dsahern@kernel.org>
  David S. Miller <davem@davemloft.net>
  David Wu <david.wu@rock-chips.com>
  Davide Caratti <dcaratti@redhat.com>
  Dennis Gilmore <dgilmore@redhat.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dust Li <dust.li@linux.alibaba.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@gmail.com>
  Felix Fietkau <nbd@nbd.name>
  Filip Pokryvka <fpokryvk@redhat.com>
  Finn Behrens <fin@nyantec.com>
  Finn Behrens <me@kloenk.de>
  Finn Behrens <me@kloenk.dev>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Klink <flokli@flokli.de>
  Florian Westphal <fw@strlen.de>
  Frank Wunderlich <frank-w@public-files.de>
  Gal Pressman <gal@nvidia.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Greg Jesionowski <jesionowskigreg@gmail.com>
  Guangbin Huang <huangguangbin2@huawei.com>
  Gurucharan G <gurucharanx.g@intel.com>
  Haimin Zhang <tcs.kernel@gmail.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hector Martin <marcan@marcan.st>
  Heiko Stuebner <heiko@sntech.de>
  Ido Schimmel <idosch@nvidia.com>
  Ilan Peer <ilan.peer@intel.com>
  Ioana Ciornei <ioana.ciornei@nxp.com>
  Ivan T. Ivanov <iivanov@suse.de>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Janne Grunau <j@jannau.net>
  Jason Wang <jasowang@redhat.com>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jie Wang <wangjie125@huawei.com>
  Jie2x Zhou <jie2x.zhou@intel.com>
  Johannes Berg <johannes.berg@intel.com>
  John Keeping <john@metanate.com>
  Jon Hunter <jonathanh@nvidia.com>
  Kalle Valo <kvalo@kernel.org>
  Karen Sornek <karen.sornek@intel.com>
  Karol Kolacinski <karol.kolacinski@intel.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kurt Kanzenbach <kurt@linutronix.de>
  Letu Ren <fantasquex@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Coelho <luciano.coelho@intel.com>
  Lv Ruyi <lv.ruyi@zte.com.cn>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Maksym Yaremchuk <maksymy@nvidia.com>
  Marek Behún <kabel@kernel.org>
  Martin KaFai Lau <kafai@fb.com>
  Martin Kepplinger <martin.kepplinger@puri.sm>
  Mat Martineau <mathew.j.martineau@linux.intel.com>
  Mathew McBride <matt@traverse.com.au>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Maxim Galaganov <max@internet.ru>
  Maxime Bizon <mbizon@freebox.fr>
  Miaoqian Lin <linmq006@gmail.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Tipton <quic_mdtipton@quicinc.com>
  Mordechay Goodstein <mordechay.goodstein@intel.com>
  Nathan Chancellor <nathan@kernel.org>
  Nechama Kraus <nechamax.kraus@linux.intel.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Ong Boon Leong <boon.leong.ong@intel.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Chaignon <paul@isovalent.com>
  Paul Moore <paul@paul-moore.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Po-Hsu Lin <po-hsu.lin@canonical.com>
  Rijo Thomas <Rijo-john.Thomas@amd.com>
  Rob Herring <robh@kernel.org>
  Robert Schlabbach <robert_s@gmx.net>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sasha Neftin <sasha.neftin@intel.com>
  Shawn Guo <shawnguo@kernel.org>
  Simon Horman <simon.horman@corigine.com>
  Stefan Assmann <sassmann@kpanic.de>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Thierry Reding <treding@nvidia.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vyacheslav Bocharov <adeep@lexina.in>
  Wang Qing <wangqing@vivo.com>
  Wenliang Wang <wangwenliang.1995@bytedance.com>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Xing Song <xing.song@mediatek.com>
  Yufeng Mo <moyufeng@huawei.com>

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
 test-amd64-amd64-xl                                          fail    
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
 test-amd64-amd64-examine-bios                                pass    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
   fa36bbe6d43f..6441998e2e37  6441998e2e37131b0a4c310af9156d79d3351c16 -> tested/linux-linus

