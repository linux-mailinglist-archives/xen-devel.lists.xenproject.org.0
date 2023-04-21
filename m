Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80B6EA7FD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 12:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524530.815550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppnjt-00062L-8x; Fri, 21 Apr 2023 10:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524530.815550; Fri, 21 Apr 2023 10:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppnjt-00060W-4u; Fri, 21 Apr 2023 10:11:37 +0000
Received: by outflank-mailman (input) for mailman id 524530;
 Fri, 21 Apr 2023 10:11:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppnjr-00060M-Oh; Fri, 21 Apr 2023 10:11:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppnjr-0002sl-Ey; Fri, 21 Apr 2023 10:11:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppnjr-0006KZ-0x; Fri, 21 Apr 2023 10:11:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppnjr-0006BO-0L; Fri, 21 Apr 2023 10:11:35 +0000
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
	bh=qpSk5tq0no4U99/D0a/xvHgmJFRsps0en4xbS5RFXWU=; b=Svyde9mktSX2gDnlJmToOYYe6t
	gLOcdcJEhkHy3xRbjqdFes2sw1qsDc9j6tGaG2Zup0fqhROJSYLi3QChYB7YGVob6Jho/Fl6rVBav
	PTrjYcOdAfSL/UTZ2xULoRpZdKMGtZrF5syycuVeCkmM9KPxACgoHKyJCjHAT0MlvF6o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180341-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180341: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6a66fdd29ea1695d615fcc93dccfb6dbe2f53b1d
X-Osstest-Versions-That:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Apr 2023 10:11:35 +0000

flight 180341 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180341/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-qcow2 19 guest-start/debian.repeat fail REGR. vs. 180278
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 180278

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           8 xen-boot                     fail  like 180278
 test-armhf-armhf-examine      8 reboot                       fail  like 180278
 test-armhf-armhf-xl-vhd       8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-qcow2  8 xen-boot                    fail like 180278
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 180278
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180278
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 180278
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180278
 test-armhf-armhf-libvirt-raw  8 xen-boot                     fail  like 180278
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                6a66fdd29ea1695d615fcc93dccfb6dbe2f53b1d
baseline version:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d

Last test of basis   180278  2023-04-16 19:41:46 Z    4 days
Failing since        180281  2023-04-17 06:24:36 Z    4 days    8 attempts
Testing same since   180341  2023-04-20 20:12:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Potapenko <glider@google.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexei Starovoitov <ast@kernel.org>
  Andrea Righi <andrea.righi@canonical.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Asahi Lina <lina@asahilina.net>
  Axel Lin <axel.lin@ingics.com>
  Baokun Li <libaokun1@huawei.com>
  Baoqi Zhang <zhangbaoqi@loongson.cn>
  Bhavya Kapoor <b-kapoor@ti.com>
  Bjorn Andersson <andersson@kernel.org>
  Chen Aotian <chenaotian2@163.com>
  Chong Qiao <qiaochong@loongson.cn>
  Chris Morgan <macromorgan@hotmail.com>
  Christoph Paasch <cpaasch@apple.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Dan Johansen <strit@manjaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  David Gow <davidgow@google.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Ding Hui <dinghui@sangfor.com.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dragan Simic <dragan.simic@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Enze Li <lienze@kylinos.cn>
  Fabio Estevam <festevam@denx.de>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gwangun Jung <exsociety@gmail.com>
  Heiko Stuebner <heiko@sntech.de>
  Huacai Chen <chenhuacai@loongson.cn>
  Ido Schimmel <idosch@nvidia.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jamal Hadi Salim<jhs@mojatatu.com>
  Jason Wang <jasowang@redhat.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jianqun Xu <jay.xu@rock-chips.com>
  Johan Hovold <johan+linaro@kernel.org>
  Jonathan Toppins <jtoppins@redhat.com>
  JR Gonzalez <jrg@scientiam.org>
  Jules Maselbas <jmaselbas@kalray.eu>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Li Lanzhe <u202212060@hust.edu.cn>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Marc Gonzalez <mgonzalez@freebox.fr>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin Rodriguez Reboredo <yakoyoku@gmail.com>
  Mat Martineau <martineau@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Mel Gorman <mgorman@suse.de>
  Mel Gorman <mgorman@techsingularity.net>
  Michael Chan <michael.chan@broadcom.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Naama Meir <naamax.meir@linux.intel.com>
  Naoya Horiguchi <naoya.horiguchi@nec.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Ondrej Mosnacek <omosnace@redhat.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Patrick Blass <patrickblass@mailbox.org>
  Pedro Tammela <pctammela@mojatatu.com>
  Peng Fan <peng.fan@nxp.com>
  Peng Zhang <zhangpeng.00@bytedance.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Xu <peterx@redhat.com>
  Petr Machata <petrm@nvidia.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qi Zheng <zhengqi.arch@bytedance.com>
  Qing Zhang <zhangqing@loongson.cn>
  Ricardo Pardini <ricardo@pardini.net>
  Rob Herring <robh@kernel.org>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Scott Mayhew <smayhew@redhat.com>
  Sebastian Basierski <sebastianx.basierski@intel.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Seiji Nishikawa <snishika@redhat.com>
  SeongJae Park <sj@kernel.org>
  Shakeel Butt <shakeelb@google.com>
  Shawn Guo <shawnguo@kernel.org>
  Steev Klimaszewski <steev@kali.org> #Thinkpad X13s
  Steve Chou <steve_chou@pesi.com.tw>
  Sudeep Holla <sudeep.holla@arm.com>
  syzbot+a7c1ec5b1d71ceaa5186@syzkaller.appspotmail.com
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Bamelis <thomas@bamelis.dev>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vadim Fedorenko <vadfed@meta.com>
  Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vlastimil Babka <vbabka@suse.cz>
  Will Deacon <will@kernel.org>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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


Not pushing.

(No revision log; it would be 4066 lines long.)

