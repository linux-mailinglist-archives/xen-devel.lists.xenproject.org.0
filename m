Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6A7E7C5F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630321.983223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R54-0004PR-E7; Fri, 10 Nov 2023 12:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630321.983223; Fri, 10 Nov 2023 12:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R54-0004Nn-9c; Fri, 10 Nov 2023 12:57:50 +0000
Received: by outflank-mailman (input) for mailman id 630321;
 Fri, 10 Nov 2023 12:57:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1R53-0004NH-I8; Fri, 10 Nov 2023 12:57:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1R53-00067f-DY; Fri, 10 Nov 2023 12:57:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1R52-0008Lg-V7; Fri, 10 Nov 2023 12:57:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r1R52-0000hC-Uf; Fri, 10 Nov 2023 12:57:48 +0000
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
	bh=LL3Kxn7jlG8t/BSclaZ7puS2SPVYa3GiO+wpsmRn/2s=; b=G+xUpCGIYkMt9Nvts8z9hmWPij
	NYO19pW936aJACklYmTlFoB+N3c0taEWmhnRovAa7ExOZzIz/R3WS8Ieb0pA5IRgioPnoaQsp/nqP
	7soMGdEhn8pmbuIP4rosV4hmrlEa6xnwvqeHOUSDDucffFLuOTRQ8vl90CHUoJep3+gA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183728-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183728: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=89cdf9d556016a54ff6ddd62324aa5ec790c05cc
X-Osstest-Versions-That:
    linux=4bbdb725a36b0d235f3b832bd0c1e885f0442d9f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Nov 2023 12:57:48 +0000

flight 183728 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183728/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183723
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183723
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183723
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183723
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183723
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183723
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183723
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183723
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                89cdf9d556016a54ff6ddd62324aa5ec790c05cc
baseline version:
 linux                4bbdb725a36b0d235f3b832bd0c1e885f0442d9f

Last test of basis   183723  2023-11-09 22:13:50 Z    0 days
Testing same since   183728  2023-11-10 06:14:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Pakhunov <alexey.pakhunov@spacex.com>
  Alexander Sverdlin <alexander.sverdlin@siemens.com>
  Alexei Starovoitov <ast@kernel.org>
  Alistair Francis <alistair@alistair23.me>
  Anders Roxell <anders.roxell@linaro.org>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Andrew Lunn <andrew@lunn.ch>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com> # Intel LPSS
  Aniruddha Paul <aniruddha.paul@intel.com>
  Ben Dooks <ben.dooks@codethink.co.uk>
  Bence Csókás <bence98@sch.bme.hu>
  Bharat Bhushan <bbhushan2@marvell.com>
  Björn Töpel <bjorn@rivosinc.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chuck Lever <chuck.lever@oracle.com>
  Chuong Tran <chuong@os.amperecomputing.com>
  Chuyi Zhou <zhouchuyi@bytedance.com>
  Conor Dooley <conor.dooley@microchip.com>
  D. Wythe <alibuda@linux.alibaba.com>
  Daan De Meyer <daan.j.demeyer@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Darren Hart <darren@os.amperecomputing.com>
  Dave Ertman <david.m.ertman@intel.com>
  Dave Marchevsky <davemarchevsky@fb.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Vernet <void@manifault.com>
  Diogo Ivo <diogo.ivo@siemens.com>
  Dmitry Safonov <dima@arista.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eduard Zingerman <eddyz87@gmail.com>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@denx.de>
  Filippo Storniolo <f.storniolo95@gmail.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Furong Xu <0x1207@gmail.com>
  Geetha sowjanya <gakula@marvell.com>
  George Cherian <george.cherian@marvell.com>
  George Shuklin <george.shuklin@gmail.com>
  Gerd Bayer <gbayer@linux.ibm.com>
  Guenter Roeck <linux@roeck-us.net>
  Hangbin Liu <liuhangbin@gmail.com>
  Hao Sun <sunhao.th@gmail.com>
  Heiko Stuebner <heiko@sntech.de> # pwm-rockchip
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hou Tao <houtao1@huawei.com>
  Huqiang Qin <huqiang.qin@amlogic.com>
  Ivan Vecera <ivecera@redhat.com>
  Jacky Bai <ping.bai@nxp.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jamal Hadi Salim<jhs@mojatatu.com>
  Janne Grunau <j@jannau.net>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jernej Skrabec <jernej.skrabec@gmail.com> # sun4i
  Jian Shen <shenjian15@huawei.com>
  Jijie Shao <shaojijie@huawei.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Pirko <jiri@nvidia.com>
  Julian Anastasov <ja@ssi.bg>
  Justin Stitt <justinstitt@google.com>
  Kees Cook <keescook@chromium.org>
  Klaus Kudielka <klaus.kudielka@gmail.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Li Zetao <lizetao1@huawei.com>
  Lin, Meng-Bo <linmengbo0689@protonmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Weiss <luca@z3ntu.xyz>
  Luigi Leonardi <luigi.leonardi@outlook.com>
  Maciej Żenczykowski <zenczykowski@gmail.com>
  Manu Bretelle <chantr4@gmail.com>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Matthieu Baerts <matttbe@kernel.org>
  Matti Lehtimäki <matti.lehtimaki@gmail.com>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael Shych <michaelsh@nvidia.com>
  Michael Walle <michael@walle.cc> # pwm-sl28cpld
  Michal Schmidt <mschmidt@redhat.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Neil Armstrong <neil.armstrong@linaro.org> # pwm-meson
  NeilBrown <neilb@suse.de>
  Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> # pwm-visconti
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Patrick Thompson <ptf@google.com>
  Paul Moore <paul@paul-moore.com>
  Philipp Stanner <pstanner@redhat.com>
  Po-Hsu Lin <po-hsu.lin@canonical.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Ratheesh Kannoth <rkannoth@marvell.com>
  Ray Jui <ray.jui@broadcom.com>
  Richard Cochran <richardcochran@gmail.com>
  Rob Herring <robh@kernel.org>
  Roman Bacik <roman.bacik@broadcom.com>
  Ronald Wahl <ronald.wahl@raritan.com>
  Ruan Jinjie <ruanjinjie@huawei.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Shigeru Yoshida <syoshida@redhat.com>
  Shung-Hsi Yu <shung-hsi.yu@suse.com>
  Srinivas Neeli <srinivas.neeli@amd.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
  Tao Lyu <tao.lyu@epfl.ch>
  Thierry Reding <thierry.reding@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadim Pasternak <vadimp@nvidia.com>
  Victor Nogueira <victor@mojatatu.com>
  Vincent Wong <vincent.wong2@spacex.com>
  Vlad Buslov <vladbu@nvidia.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Werner Fischer <devlists@wefi.net>
  Willem de Bruijn <willemb@google.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa@kernel.org>
  Xing Tong Wu <xingtong.wu@siemens.com>
  Yafang Shao <laoar.shao@gmail.com>
  Yonghong Song <yonghong.song@linux.dev>
  Zev Weiss <zev@bewilderbeest.net>

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
   4bbdb725a36b..89cdf9d55601  89cdf9d556016a54ff6ddd62324aa5ec790c05cc -> tested/linux-linus

