Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1A7F02D9
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 21:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635827.991668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4Rju-0004Gz-Se; Sat, 18 Nov 2023 20:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635827.991668; Sat, 18 Nov 2023 20:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4Rju-0004Ds-Pm; Sat, 18 Nov 2023 20:16:26 +0000
Received: by outflank-mailman (input) for mailman id 635827;
 Sat, 18 Nov 2023 20:16:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r4Rjt-0004Di-5h; Sat, 18 Nov 2023 20:16:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r4Rjt-0002fS-0M; Sat, 18 Nov 2023 20:16:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r4Rjs-0007Ij-LC; Sat, 18 Nov 2023 20:16:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r4Rjs-00008M-Kn; Sat, 18 Nov 2023 20:16:24 +0000
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
	bh=eNNyOfaLZbQIQass290CHGZ2oforpapPPg28rMxFhLk=; b=FcLzytVlFjiT2oLCcbwr+26FDG
	3O14/kI+IxiqQICcga6AxiLVWBtsrc3Uj4HyznAQGHfHX0uPE7OFGYMXbZzJ26NsYersumQsOW7s6
	sxt9xe0GU+wjBRRkh/a1tyFgMwHWPUiMYBoDp2Ot7RBIsW/8EcJZMEGpWHEI6s7u2cHc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183789-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183789: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=791c8ab095f71327899023223940dd52257a4173
X-Osstest-Versions-That:
    linux=c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Nov 2023 20:16:24 +0000

flight 183789 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183789/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 183766

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183766
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183766
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183766
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183766
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183766
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183766
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183766
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183766
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                791c8ab095f71327899023223940dd52257a4173
baseline version:
 linux                c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c

Last test of basis   183766  2023-11-15 17:14:16 Z    3 days
Failing since        183773  2023-11-16 13:12:48 Z    2 days    5 attempts
Testing same since   183787  2023-11-18 03:44:44 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Michael S. Tsirkin" <mst@redhat.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alex Pakhunov <alexey.pakhunov@spacex.com>
  Alexei Starovoitov <ast@kernel.org>
  Alistair Francis <alistair.francis@wdc.com>
  Amir Goldstein <amir73il@gmail.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Asad Kamal <asad.kamal@amd.com>
  Baruch Siach <baruch@tkos.co.il>
  Björn Töpel <bjorn@rivosinc.com>
  Breno Leitao <leitao@debian.org>
  Brenton Simpson <appsforartists@google.com>
  Chandradeep Dey <codesigning@chandradeepdey.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@infradead.org>
  ChunHao Lin <hau@realtek.com>
  Clément Léger <cleger@rivosinc.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Nowlin <dan.nowlin@intel.com>
  Daniel J Blueman <daniel@quora.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw@amazon.co.uk>
  Duncan Ma <duncan.ma@amd.com>
  Dust Li <dust.li@linux.alibaba.com>
  Eduard Zingerman <eddyz87@gmail.com>
  Erez Shitrit <erezsh@nvidia.com>
  Eric Dumazet <edumazet@google.com>
  Eugenio Pérez <eperezma@redhat.com>
  Eymen Yigit <eymenyg01@gmail.com>
  Fangzhi Zuo <jerry.zuo@amd.com>
  Gal Pressman <gal@nvidia.com>
  Gavin Li <gavinl@nvidia.com>
  Geliang Tang <geliang.tang@suse.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Helge Deller <deller@gmx.de>
  Hou Tao <houtao1@huawei.com>
  Hyeongtak Ji <hyeongtak.ji@sk.com>
  Itamar Gozlan <igozlan@nvidia.com>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Wang <jasowang@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jens Axboe <axboe@kernel.dk>
  Jian Shen <shenjian15@huawei.com>
  Jianbo Liu <jianbol@nvidia.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jijie Shao <shaojijie@huawei.com>
  Johannes Weiner <hannes@cmpxchg.org>
  Johnathan Mantey <johnathanx.mantey@intel.com>
  José Pekkarinen <jose.pekkarinen@foxhound.fi>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juergen Gross <jgross@suse.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kailang Yang <kailang@realtek.com>
  Kent Overstreet <kent.overstreet@gmail.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Le Ma <le.ma@amd.com>
  Lewis Huang <lewis.huang@amd.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linkui Xiao <xiaolinkui@kylinos.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Maher Sanalla <msanalla@nvidia.com>
  Marek Behún <kabel@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mario Limonciello <mario.limonciello@amd.com> # PHX & Navi33
  matoro <matoro_mailinglist_kernel@matoro.tk>
  Matthieu Baerts <matttbe@kernel.org>
  Matus Malych <matus@malych.org>
  MD Danish Anwar <danishanwar@ti.com>
  Michael S. Tsirkin <mst@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Muhammad Ahmed <ahmed.ahmed@amd.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nicholas Susanto <nicholas.susanto@amd.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Paul Hsieh <paul.hsieh@amd.com>
  Paul Moore <paul@paul-moore.com>
  Rahul Rameshbabu <rrameshbabu@nvidia.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Gunasekaran <r-gunasekaran@ti.com>
  Richard Cochran <richardcochran@gmail.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Gushchin <roman.gushchin@linux.dev>
  Ryan Roberts <ryan.roberts@arm.com>
  Saeed Mahameed <saeedm@nvidia.com>
  SeongJae Park <sj@kernel.org>
  Shakeel Butt <shakeelb@google.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shiwu Zhang <shiwu.zhang@amd.com>
  Simon Trimmer <simont@opensource.cirrus.com>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stanislav Fomichev <sdf@google.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stefan Roesch <shr@devkernel.io>
  Stefano Garzarella <sgarzare@redhat.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Sunitha Mekala <sunithax.d.mekala@intel.com> (A Contingent worker at Intel)
  Sven Auhagen <sven.auhagen@voleatech.de>
  Takashi Iwai <tiwai@suse.de>
  Tianci Yin <tianci.yin@amd.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Victor Lu <victorchengchi.lu@amd.com>
  Vincent Wong <vincent.wong2@spacex.com>
  Vlad Buslov <vladbu@nvidia.com>
  Willem de Bruijn <willemb@google.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yang Wang <kevinyang.wang@amd.com>
  Yi Zhang <yi.zhang@redhat.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yonglong Liu <liuyonglong@huawei.com>
  YuanShang <YuanShang.Mao@amd.com>
  Yuran Pereira <yuran.pereira@hotmail.com>
  Ziwei Xiao <ziweixiao@google.com>

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
 test-armhf-armhf-xl                                          pass    
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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


Not pushing.

(No revision log; it would be 5220 lines long.)

