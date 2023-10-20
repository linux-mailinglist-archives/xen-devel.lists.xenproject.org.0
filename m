Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD17D145C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 18:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619886.965693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsfF-0004Xe-A9; Fri, 20 Oct 2023 16:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619886.965693; Fri, 20 Oct 2023 16:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsfF-0004WS-5w; Fri, 20 Oct 2023 16:47:57 +0000
Received: by outflank-mailman (input) for mailman id 619886;
 Fri, 20 Oct 2023 16:47:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtsfE-0004WI-Ab; Fri, 20 Oct 2023 16:47:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtsfE-0008Ie-6i; Fri, 20 Oct 2023 16:47:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtsfD-0002ad-IA; Fri, 20 Oct 2023 16:47:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qtsfD-0008Sp-Hg; Fri, 20 Oct 2023 16:47:55 +0000
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
	bh=3W2cgs7TunpfcgG+CLOLLSfr70s+8sFQ4WHHxGMaLe0=; b=AGC9ElOdKLRhdTHQnAf4+nygUP
	z9xeXjg5s1XoQ1doO+sTe+fLrj2znmKoJdoT61M8dAbgnm54fHeUF61L+FZzUaYpszqNJ2sUe5bU9
	M7NceuIL4herNCk+yTyHHd2kmK60sM7Q1XwxyQg/RMaY/19p8m8iVe2J8WxAj8R8sGP4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183440-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183440: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ce55c22ec8b223a90ff3e084d842f73cfba35588
X-Osstest-Versions-That:
    linux=7cf4bea77ab60742c128c2ceb4b1b8078887b823
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Oct 2023 16:47:55 +0000

flight 183440 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183440/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183432
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183432
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183432
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183432
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183432
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183432
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183432
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183432
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                ce55c22ec8b223a90ff3e084d842f73cfba35588
baseline version:
 linux                7cf4bea77ab60742c128c2ceb4b1b8078887b823

Last test of basis   183432  2023-10-19 16:10:25 Z    1 days
Testing same since   183440  2023-10-20 04:54:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
  Aaron Conole <aconole@redhat.com>
  Albert Huang <huangjie.albert@bytedance.com>
  Amir Tzin <amirtz@nvidia.com>
  Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
  Arnd Bergmann <arnd@arndb.de>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chris Mason <clm@fb.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Paasch <cpaasch@apple.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Clash <daclash@linux.microsoft.com>
  David S. Miller <davem@davemloft.net>
  Dong Chenchen <dongchenchen2@huawei.com>
  Dragos Tatulea <dtatulea@nvidia.com>
  Dust Li <dust.li@linux.alibaba.com>
  Edward AD <twuufnxlz@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Gabriel Marcano <gabemarcano@yahoo.com>
  Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geliang Tang <geliang.tang@suse.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Huacai Chen <chenhuacai@loongson.cn>
  Icenowy Zheng <uwu@icenowy.me>
  Ido Schimmel <idosch@nvidia.com>
  Iulia Tanasescu <iulia.tanasescu@nxp.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Sokolowski <jan.sokolowski@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jianbo Liu <jianbol@nvidia.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Jiri Pirko <jiri@nvidia.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jiri Wiesner <jwiesner@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  Josua Mayer <josua@solid-run.com>
  Kees Cook <keescook@chromium.org>
  kernel test robot <oliver.sang@intel.com>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Kory Maincent <kory.maincent@bootlin.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lama Kayal <lkayal@nvidia.com>
  Lee, Chun-Yi <jlee@suse.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Ke <make_ruc2021@163.com>
  Maher Sanalla <msanalla@nvidia.com>
  Manish Chopra <manishc@marvell.com>
  Mat Martineau <martineau@kernel.org>
  Mateusz Pacuszka <mateuszx.pacuszka@intel.com>
  Mateusz Polchlopek <mateusz.polchlopek@intel.com>
  Matthieu Baerts <matttbe@kernel.org>
  Max Chou <max.chou@realtek.com>
  MD Danish Anwar <danishanwar@ti.com>
  Michal Schmidt <mschmidt@redhat.com>
  Neal Cardwell <ncardwell@google.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com> (Audit)
  Pauli Virtanen <pav@iki.fi>
  Pavel Skripkin <paskripkin@gmail.com>
  Pedro Tammela <pctammela@mojatatu.com>
  Phil Sutter <phil@nwl.cc>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Randy Dunlap <rdunlap@infradead.org>
  Saeed Mahameed <saeedm@nvidia.com>
  Shailend Chand <shailend@google.com>
  Shay Drory <shayd@nvidia.com>
  Shinas Rasheed <srasheed@marvell.com>
  Simon Horman <horms@kernel.org> # build-tested
  Sriram Yagnaraman <sriram.yagnaraman@est.tech>
  Stefan Wahren <wahrenst@gmx.net>
  Steffen Klassert <steffen.klassert@secunet.com>
  Su Hui <suhui@nfschina.com>
  Tianrui Zhao <zhaotianrui@loongson.cn>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Vlad Buslov <vladbu@nvidia.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vlastimil Babka <vbabka@suse.cz>
  Willem de Bruijn <willemb@google.com>
  Xingyuan Mo <hdthky0@gmail.com>
  Yuchung Cheng <ycheng@google.com>
  Zeng Heng <zengheng4@huawei.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  Ziqi Zhao <astrajoan@yahoo.com>
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
   7cf4bea77ab6..ce55c22ec8b2  ce55c22ec8b223a90ff3e084d842f73cfba35588 -> tested/linux-linus

