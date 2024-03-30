Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0428929E1
	for <lists+xen-devel@lfdr.de>; Sat, 30 Mar 2024 10:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699538.1092296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqUf2-0000vr-Na; Sat, 30 Mar 2024 09:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699538.1092296; Sat, 30 Mar 2024 09:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqUf2-0000tn-IA; Sat, 30 Mar 2024 09:06:00 +0000
Received: by outflank-mailman (input) for mailman id 699538;
 Sat, 30 Mar 2024 09:05:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqUf0-0000td-Et; Sat, 30 Mar 2024 09:05:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqUf0-0004C0-9Y; Sat, 30 Mar 2024 09:05:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqUez-0001w5-Sb; Sat, 30 Mar 2024 09:05:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rqUez-0002p3-SD; Sat, 30 Mar 2024 09:05:57 +0000
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
	bh=MTliVVxKOTb/+gN4fSbd0W9tCY2TWEhiOiZTh4lnEVk=; b=WyBJJ2FOtvcJW223RqOZfK2VEo
	htouW32bHLLUDiB8wzb66j3fpb4xxsLTy4NexbMMIphIwLk0CvPltl3MtJ4rRviz0XB5znh+cjUc2
	SeOLghGR4Aa6mP+FB0MwfdIp7e/MMUDTudX59O/mB/ERP3EM66TNT98uK3a211SxjLVU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185200-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185200: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171
X-Osstest-Versions-That:
    linux=962490525cffee6270422206c9d5bdb12d472c2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 Mar 2024 09:05:57 +0000

flight 185200 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185200/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185177
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185177
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185177
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185177
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185177
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185177
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171
baseline version:
 linux                962490525cffee6270422206c9d5bdb12d472c2b

Last test of basis   185177  2024-03-27 17:12:19 Z    2 days
Testing same since   185200  2024-03-29 15:55:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alejandro Colomar <alx@kernel.org>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexei Starovoitov <ast@kernel.org>
  Anand Jain <anand.jain@oracle.com>
  Andrei Matei <andreimatei1@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Arnaldo Carvalho de Melo <acme@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Artem Savkov <asavkov@redhat.com>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Ayala Beker <ayala.beker@intel.com>
  Baoquan He <bhe@redhat.com>
  Barry Song <baohua@kernel.org>
  Barry Song <v-songbaohua@oppo.com>
  Benjamin Berg <benjamin.berg@intel.com>
  Bjørn Mork <bjorn@mork.no>
  Breno Leitao <leitao@debian.org>
  Brent Lu <brent.lu@intel.com>
  Brian Norris <briannorris@chromium.org>
  Carlos Maiolino <cem@kernel.org>
  Carlos Maiolino <cmaiolino@redhat.com>
  Chao Yu <chao@kernel.org>
  Chris Li <chrisl@kernel.org>
  Christian Marangi <ansuelsmth@gmail.com>
  Chuck Lever <chuck.lever@oracle.com>
  Claus Hansen Ries <chr@terma.com>
  Colin Ian King <colin.i.king@gmail.com>
  Cong Liu <liucong2@kylinos.cn>
  Dai Ngo <dai.ngo@oracle.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniele Salvatore Albano <d.albano@gmail.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Thompson <davthompson@nvidia.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Edward Liaw <edliaw@google.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Dumazet <edumazet@google.com>
  Eric Van Hensbergen <ericvh@kernel.org>
  Felix Fietkau <nbd@nbd.name>
  Filipe Manana <fdmanana@suse.com>
  Florian Westphal <fw@strlen.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Francesco Dolcini <francesco@dolcini.it>
  Gal Pressman <gal@nvidia.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Gergo Koteles <soyer@irl.hu>
  Hangbin Liu <liuhangbin@gmail.com>
  Hari Bathini <hbathini@linux.ibm.com>
  Hariprasad Kelam <hkelam@marvell.com>
  Helge Deller <deller@gmx.de>  [parisc]
  Herve Codina <herve.codina@bootlin.com>
  Ido Schimmel <idosch@nvidia.com>
  Igor Artemiev <Igor.A.Artemiev@mcst.ru>
  Ilan Peer <ilan.peer@intel.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jian Shen <shenjian15@huawei.com>
  Jie Wang <wangjie125@huawei.com>
  Jijie Shao <shaojijie@huawei.com>
  Jiri Olsa <jolsa@kernel.org>
  Joerg Roedel <jroedel@suse.de>
  Joey Gouly <joey.gouly@arm.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Sperbeck <jsperbeck@google.com>
  Josef Bacik <josef@toxicpanda.com>
  Justin Chen <justin.chen@broadcom.com>
  Kalle Valo <kvalo@kernel.org>
  KP Singh <kpsingh@kernel.org>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kurt Kanzenbach <kurt@linutronix.de>
  Leonard Crestez <cdleonard@gmail.com>
  Liming Sun <limings@nvidia.com>
  linke li <lilinke99@qq.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liviu Dudau <liviu@dudau.co.uk>
  Lizhi Xu <lizhi.xu@windriver.com>
  Lokesh Gidra <lokeshgidra@google.com>
  Mark Brown <broonie@kernel.org>
  Matt Bobrowski <mattbobrowski@google.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Michael Hofmann <mhofmann@redhat.com>
  Mikko Rapeli <mikko.rapeli@linaro.org>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
  Mostafa Saleh <smostafa@google.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Naama Meir <naamax.meir@linux.intel.com>
  Nathan Chancellor <nathan@kernel.org>
  Oscar Salvador <osalvador@suse.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Xu <peterx@redhat.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Prasad Pandit <pjp@fedoraproject.org>
  Przemek Kitszel <przemyslaw.kitszel@intel.com>
  Pu Lehui <pulehui@huawei.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Puranjay Mohan <puranjay12@gmail.com>
  Quentin Monnet <qmo@kernel.org>
  Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
  Ravi Gunasekaran <r-gunasekaran@ti.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Romain Naour <romain.naour@skf.com>
  Ryosuke Yasuoka <ryasuoka@redhat.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Sandeep Dhavale <dhavale@google.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shaul Triebitz <shaul.triebitz@intel.com>
  Simon Trimmer <simont@opensource.cirrus.com>
  Stanislav Fomichev <sdf@google.com>
  Steven Zou <steven.zou@intel.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  syzbot+adbc983a1588b7805de3@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tavian Barnes <tavianator@tavianator.com>
  Thorsten Winkler <twinkler@linux.ibm.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Vitaly Chikunov <vt@altlinux.org>
  Will Deacon <will@kernel.org>
  Xu Kuohai <xukuohai@huawei.com>
  Yonglong Liu <liuyonglong@huawei.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yosry Ahmed <yosryahmed@google.com>
  Yujie Liu <yujie.liu@intel.com>
  Zev Weiss <zev@bewilderbeest.net>
  Zhongkun He <hezhongkun.hzk@bytedance.com>

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
   962490525cff..317c7bc0ef03  317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171 -> tested/linux-linus

