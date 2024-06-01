Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88C8D6D7D
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 04:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733957.1140239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDEVF-0001As-PY; Sat, 01 Jun 2024 02:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733957.1140239; Sat, 01 Jun 2024 02:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDEVF-00017w-MO; Sat, 01 Jun 2024 02:29:53 +0000
Received: by outflank-mailman (input) for mailman id 733957;
 Sat, 01 Jun 2024 02:29:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDEVD-00017m-TW; Sat, 01 Jun 2024 02:29:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDEVD-00010f-Pm; Sat, 01 Jun 2024 02:29:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDEVD-0002lE-EW; Sat, 01 Jun 2024 02:29:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sDEVD-00032p-EA; Sat, 01 Jun 2024 02:29:51 +0000
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
	bh=iiy4iSgzprx0grxPlFMw5DRIOjXv0GmgzwIWFQr49Y8=; b=R8hMiOjFOSa/2zqjj1gSQqhM4h
	tLu/Jc19DY44kqkDV3nMski1AAi0Gybm/dM/v+BFjvcxniLK+smrp2fno4TPZoIFOIjmnADa3xxsH
	ADKll4BuBBiL0sCINl5/v/b2ALDNixZui8SXK2U4+6k6a3MFsBpmUgmZZf99DYJIBaEk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186212-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186212: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d8ec19857b095b39d114ae299713bd8ea6c1e66a
X-Osstest-Versions-That:
    linux=4a4be1ad3a6efea16c56615f31117590fd881358
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Jun 2024 02:29:51 +0000

flight 186212 linux-linus real [real]
flight 186215 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186212/
http://logs.test-lab.xenproject.org/osstest/logs/186215/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 186215-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 186215 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 186215 never pass
 test-armhf-armhf-xl           8 xen-boot                     fail  like 186196
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 186196
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 186196
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 186196
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186202
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186202
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186202
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186202
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186202
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                d8ec19857b095b39d114ae299713bd8ea6c1e66a
baseline version:
 linux                4a4be1ad3a6efea16c56615f31117590fd881358

Last test of basis   186202  2024-05-30 22:43:12 Z    1 days
Testing same since   186212  2024-05-31 19:10:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Lobakin <aleksander.lobakin@intel.com>
  Alexander Maltsev <keltar.gw@gmail.com>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexei Starovoitov <ast@kernel.org>
  Andrii Nakryiko <andrii@kernel.org>
  Arun Ramadoss <arun.ramadoss@microchip.com>
  Carolina Jubran <cjubran@nvidia.com>
  Christian Brauner <brauner@kernel.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Dave Ertman <david.m.ertman@intel.com>
  David S. Miller <davem@davemloft.net>
  Edward Adam Davis <eadavis@qq.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Eric Dumazet <edumazet@google.com>
  Eric Garver <eric@garver.life>
  Florian Westphal <fw@strlen.de>
  Friedrich Vock <friedrich.vock@gmx.de>
  Gal Pressman <gal@nvidia.com>
  Geliang Tang <tanggeliang@kylinos.cn>
  Hariprasad Kelam <hkelam@marvell.com>
  Hengqi Chen <hengqi.chen@gmail.com>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Hui Wang <hui.wang@canonical.com>
  Ido Schimmel <idosch@nvidia.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jerry Ray <jerry.ray@microchip.com>
  Jiri Olsa <jolsa@kernel.org>
  John Fastabend <john.fastabend@gmail.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Karim Ben Houcine <karim.benhoucine@landisgyr.com>
  Kory Maincent <kory.maincent@bootlin.com>
  Krishneil Singh <krishneil.k.singh@intel.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maher Sanalla <msanalla@nvidia.com>
  Mathieu Othacehe <othacehe@gnu.org>
  Matt Jan <zoo868e@gmail.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  MD Danish Anwar <danishanwar@ti.com>
  Minda Chen <minda.chen@starfivetech.com>
  Naama Meir <naamax.meir@linux.intel.com>
  Neal Cardwell <ncardwell@google.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com>
  Rahul Rameshbabu <rrameshbabu@nvidia.com>
  Rob Herring (Arm) <robh@kernel.org>
  Robert Thomas <rob.thomas@ibm.com>
  Roded Zats <rzats@paloaltonetworks.com>
  Shahab Vahedi <shahab@synopsys.com>
  Shay Agroskin <shayagr@amazon.com>
  Stanislav Fomichev <sdf@google.com>
  Stéphane Graber <stgraber@stgraber.org>
  syzbot+ec941d6e24f633a59172@syzkaller.appspotmail.com
  Tariq Toukan <tariqt@nvidia.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Thinh Tran <thinhtr@linux.ibm.com>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tristram Ha <tristram.ha@microchip.com>
  Vitaly Lifshits <vitaly.lifshits@intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Willem de Bruijn <willemb@google.com>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xu Kuohai <xukuohai@huaweicloud.com>
  Yue Haibing <yuehaibing@huawei.com>
  Zhang Rui <rui.zhang@intel.com>

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
 test-armhf-armhf-xl                                          fail    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   4a4be1ad3a6e..d8ec19857b09  d8ec19857b095b39d114ae299713bd8ea6c1e66a -> tested/linux-linus

