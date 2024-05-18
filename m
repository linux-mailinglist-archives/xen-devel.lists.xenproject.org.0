Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2BC8C9158
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 15:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724807.1129974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8JqO-00009v-W0; Sat, 18 May 2024 13:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724807.1129974; Sat, 18 May 2024 13:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8JqO-00007R-T7; Sat, 18 May 2024 13:11:24 +0000
Received: by outflank-mailman (input) for mailman id 724807;
 Sat, 18 May 2024 13:11:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s8JqN-00007H-I8; Sat, 18 May 2024 13:11:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s8JqN-0008OU-F3; Sat, 18 May 2024 13:11:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s8JqN-0001op-46; Sat, 18 May 2024 13:11:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s8JqN-0006Zd-3Z; Sat, 18 May 2024 13:11:23 +0000
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
	bh=Rc4Z650koDoYgpfRtthPj6ehV0FLskYUkf9R67qwZGE=; b=NkEuDsnB/CMCvGwt+xYPpF9MFP
	BEXxKr4uN4vkJzW7gKh+O8AdNmGD1tiZDixEVp+0ZXIy5ksU6HtJyu1Gd+EC5Vt3yYDioXvMz9VAA
	G280jiGQ54rijS+3oj+YBWj/RteUszQY+OrlTS6R5g2r6Cy5G+cRkrmPZnYJvTnscueU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186032-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186032: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4b377b4868ef17b040065bd468668c707d2477a5
X-Osstest-Versions-That:
    linux=ea5f6ad9ad9645733b72ab53a98e719b460d36a6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 May 2024 13:11:23 +0000

flight 186032 linux-linus real [real]
flight 186034 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186032/
http://logs.test-lab.xenproject.org/osstest/logs/186034/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-vhd  8 xen-boot                 fail REGR. vs. 186030

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 186023
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail like 186023
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 186023
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186030
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186030
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186030
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186030
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186030
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186030
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186030
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4b377b4868ef17b040065bd468668c707d2477a5
baseline version:
 linux                ea5f6ad9ad9645733b72ab53a98e719b460d36a6

Last test of basis   186030  2024-05-17 11:41:19 Z    1 days
Testing same since   186032  2024-05-18 02:43:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexei Starovoitov <ast@kernel.org>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
  Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
  Anup Patel <apatel@ventanamicro.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arun Ramadoss <arun.ramadoss@microchip.com>
  Baoquan He <bhe@redhat.com>
  Beau Belgrave <beaub@linux.microsoft.com>
  Benjamin Gray <bgray@linux.ibm.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chris Lew <quic_clew@quicinc.com>
  Chris Morgan <macromorgan@hotmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel Jurgens <danielj@nvidia.com>
  Dave Thaler <dthaler1968@gmail.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dharma Balasubiramani <dharma.b@microchip.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Eric Dumazet <edumazet@google.com>
  Fan Yu <fan.yu9@zte.com.cn>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frank Li <Frank.Li@nxp.com>
  Ganesh Goudar <ganeshgr@linux.ibm.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geoff Levand <geoff@infradead.org>
  Ghanshyam Agrawal <ghanshyam1898@gmail.com>
  Greg Kurz <groug@kaod.org>
  Guo Ren <guoren@kernel.org>
  GUO Zihua <guozihua@huawei.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hao Ge <gehao@kylinos.cn>
  Hari Bathini <hbathini@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@kernel.org>
  Herve Codina <herve.codina@bootlin.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Wang <jasowang@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jiawen Wu <jiawenwu@trustnetic.com>
  Jiri Olsa <jolsa@kernel.org>
  Joel Granados <j.granados@samsung.com>
  Joel Savitz <jsavitz@redhat.com>
  Joel Stanley <joel@jms.id.au>
  John David Anglin <dave.anglin@bell.net>
  John Fastabend <john.fastabend@gmail.com>
  John Kacur <jkacur@redhat.com>
  Jonathan Haslam <jonathan.haslam@gmail.com>
  Kees Cook <keescook@chromium.org>
  Krzysztof Kozlowski <k.kozlowski@samsung.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kui-Feng Lee <thinker.li@gmail.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kunwu Chan <chentao@kylinos.cn>
  Li Yang <leoyang.li@nxp.com>
  Lidong Zhong <lidong.zhong@suse.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Madhavan Srinivasan <maddy@linux.ibm.com>
  Mahesh Salgaonkar <mahesh@linux.ibm.com>
  Mark Brown <broonie@kernel.org>
  Martin KaFai Lau <martin.lau@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Schmidt <mschmidt@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Naveen N Rao <naveen@kernel.org>
  Nicholas Miehlbradt <nicholas@linux.ibm.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oreoluwa Babatunde <quic_obabatun@quicinc.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Mackerras <paulus@ozlabs.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Puranjay Mohan <puranjay@kernel.org>
  Rafał Miłecki <rafal@milecki.pl>
  Ran Wang <ran.wang_1@nxp.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Villemoes <linux@rasmusvillemoes.dk>
  Ravi Gunasekaran <r-gunasekaran@ti.com>
  Ritesh Harjani (IBM) <ritesh.list@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Rob Herring <robh@kernel.org>
  Roger Quadros <rogerq@kernel.org>
  Ronald Wahl <ronald.wahl@raritan.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sachin Sant <sachinp@linux.ibm.com>
  Sagar Cheluvegowda <quic_scheluve@quicinc.com>
  Saravana Kannan <saravanak@google.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shirisha Ganta <shirisha@linux.ibm.com>
  Shresth Prasad <shresthprasad7@gmail.com>
  Shrikanth Hegde <sshegde@linux.ibm.com>
  Sourabh Jain <sourabhjain@linux.ibm.com>
  Stephen Brennan <stephen.s.brennan@oracle.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  sundar <prosunofficial@gmail.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tom Parkin <tparkin@katalix.com>
  Tony Battersby <tonyb@cybernetics.com>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Valentin Schneider <vschneid@redhat.com>
  Valentina Fernandez <valentina.fernandezalanis@microchip.com>
  Vincent Donnefort <vdonnefort@google.com>
  Vinod Koul <vkoul@kernel.org>
  Wadim Mueller <wafgo01@gmail.com>
  Xiaowei Bao <xiaowei.bao@nxp.com>
  xu xin <xu.xin16@zte.com.cn>
  Yang Li <yang.lee@linux.alibaba.com>
  Ye Bin <yebin10@huawei.com>
  Yuntao Wang <ytcoode@gmail.com>
  Yuran Pereira <yuran.pereira@hotmail.com>
  Zhao Chenhui <chenhui.zhao@freescale.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Zi Shen Lim <zlim.lnx@gmail.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-arndale                                  fail    
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
 test-amd64-amd64-examine-uefi                                pass    
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


Not pushing.

(No revision log; it would be 6589 lines long.)

