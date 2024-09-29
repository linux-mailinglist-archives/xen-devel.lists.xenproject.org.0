Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5EB989222
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2024 02:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806820.1218046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suhog-0000NE-NF; Sun, 29 Sep 2024 00:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806820.1218046; Sun, 29 Sep 2024 00:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suhog-0000KK-Jk; Sun, 29 Sep 2024 00:29:38 +0000
Received: by outflank-mailman (input) for mailman id 806820;
 Sun, 29 Sep 2024 00:29:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suhof-0000KA-AN; Sun, 29 Sep 2024 00:29:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suhoe-0006hY-VL; Sun, 29 Sep 2024 00:29:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suhoe-0001QT-Dm; Sun, 29 Sep 2024 00:29:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1suhoe-0005Gq-BO; Sun, 29 Sep 2024 00:29:36 +0000
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
	bh=OZi93iblc7KSk3HAwdWFaTPsR0VrCik9x/f17c7RpHc=; b=Bc7IoyVbTjAdxAWbUdtm/EQ365
	GKkTx6grmJrK3rvW6ez5YrGRtj2a3YL86Dtt7f+EeoLsVP61jVjEF6L+MWBW6KK9CV24LRaKGyNJ/
	iL+/pWbSuvXoA9SNcS6sC3RNjSeLqvrvxdXdGasoNqt5NCcbQH6/UuG8a2ENtIpUlloQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187889-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187889: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=3efc57369a0ce8f76bf0804f7e673982384e4ac9
X-Osstest-Versions-That:
    linux=ad46e8f95e931e113cb98253daf6d443ac244cde
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Sep 2024 00:29:36 +0000

flight 187889 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187889/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187882
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187882
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187882
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187882
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187882
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187882
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                3efc57369a0ce8f76bf0804f7e673982384e4ac9
baseline version:
 linux                ad46e8f95e931e113cb98253daf6d443ac244cde

Last test of basis   187882  2024-09-28 00:44:22 Z    0 days
Testing same since   187889  2024-09-28 17:14:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Amber Lin <Amber.Lin@amd.com>
  Amit Shah <amit.shah@amd.com>
  Andrew Kreimer <algonell@gmail.com>
  Andrey Shumilin <shum.sdl@nppct.ru>
  Aric Cyr <aric.cyr@amd.com>
  Arun R Murthy <arun.r.murthy@intel.com>
  Asad Kamal <asad.kamal@amd.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Bob Zhou <bob.zhou@amd.com>
  Charlene Liu <Charlene.Liu@amd.com>
  Chen Yufan <chenyufan@vivo.com>
  Christian König <christian.koenig@amd.com>
  Christoph Schlameuss <schlameuss@linux.ibm.com>
  Chunhui Li <chunhui.li@mediatek.com>
  Daniel Gomez <da.gomez@samsung.com>
  Daniel Sa <Daniel.Sa@amd.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Belanger <david.belanger@amd.com>
  David Howells <dhowells@redhat.com>
  Dillon Varone <dillon.varone@amd.com>
  Enzo Matsumiya <ematsumiya@suse.de>
  Farrah Chen <farrah.chen@intel.com>
  Felix Kuehling <felix.kuehling@amd.com>
  Frank Min <Frank.Min@amd.com>
  Hariharan Mari <hari55@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Ilias Stamatis <ilstam@amazon.com>
  Ilya Dryomov <idryomov@gmail.com>
  Imre Deak <imre.deak@intel.com>
  Jack Xiao <Jack.Xiao@amd.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jason J. Herne <jjherne@linux.ibm.com>
  Jens Remus <jremus@linux.ibm.com>
  Jesse Zhang <jesse.zhang@amd.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  José Roberto de Souza <jose.souza@intel.com>
  Jouni Högander <jouni.hogander@intel.com>
  Kai Huang <kai.huang@intel.com>
  Kenneth Feng <kenneth.feng@amd.com>
  Kent Russell <kent.russell@amd.com>
  kernel test robot <oliver.sang@intel.com>
  Le Ma <le.ma@amd.com>
  Leo Ma <hanghong.ma@amd.com>
  Li Chen <chenl311@chinatelecom.cn>
  Li Zetao <lizetao1@huawei.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Luis Henriques (SUSE) <luis.henriques@linux.dev>
  Mario Limonciello <mario.limonciello@amd.com>
  Markus Elfring <elfring@users.sourceforge.net>
  Martin Tsai <martin.tsai@amd.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Auld <matthew.auld@intel.com>
  Matthew Brost <matthew.brost@intel.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Mukul Joshi <mukul.joshi@amd.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Peichen Huang <PeiChen.Huang@amd.com>
  Peter Gonda <pgonda@google.com>
  Petr Pavlu <petr.pavlu@suse.com>
  Pratik R. Sampat <pratikrajesh.sampat@amd.com>
  Qiang Liu <liuq131@chinatelecom.cn>
  Qianqiang Liu <qianqiang.liu@163.com>
  Relja Vojvodic <Relja.Vojvodic@amd.com>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Robin Chen <robin.chen@amd.com>
  Roman Li <Roman.Li@amd.com>
  Ryan Seto <ryanseto@amd.com>
  Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
  Sami Tolvanen <samitolvanen@google.com>
  Samson Tam <Samson.Tam@amd.com>
  Sean Christopherson <seanjc@google.com>
  Shen Lichuan <shenlichuan@vivo.com>
  Shuicheng Lin <shuicheng.lin@intel.com>
  Sreekant Somasekharan <sreekant.somasekharan@amd.com>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Steve French <stfrench@microsoft.com>
  Sung Joon Kim <Sungjoon.Kim@amd.com>
  Suraj Kandpal <suraj.kandpal@intel.com>
  syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
  Tao Su <tao1.su@linux.intel.com>
  Tao Zhou <tao.zhou1@amd.com>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tim Huang <tim.huang@amd.com>
  Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Donnefort <vdonnefort@google.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Xin Li <xin3.li@intel.com>
  Xion Wang <xion.wang@mediatek.com>
  Xiubo Li <xiubli@redhat.com>
  Yan Zhao <yan.y.zhao@intel.com>
  Yan Zhen <yanzhen@vivo.com>
  Yang Wang <kevinyang.wang@amd.com>
  Yihan Zhu <Yihan.Zhu@amd.com>
  Yongqiang Liu <liuyongqiang13@huawei.com>
  Yue Haibing <yuehaibing@huawei.com>
  Zhang Zekun <zhangzekun11@huawei.com>
  ZhenGuo Yin <zhenguo.yin@amd.com>
  Zhikai Zhai <zhikai.zhai@amd.com>

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
   ad46e8f95e93..3efc57369a0c  3efc57369a0ce8f76bf0804f7e673982384e4ac9 -> tested/linux-linus

