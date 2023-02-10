Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E96769238D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 17:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493475.763404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQWUh-0002Dj-OH; Fri, 10 Feb 2023 16:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493475.763404; Fri, 10 Feb 2023 16:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQWUh-0002Ag-Kf; Fri, 10 Feb 2023 16:43:27 +0000
Received: by outflank-mailman (input) for mailman id 493475;
 Fri, 10 Feb 2023 16:43:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQWUf-0002AW-Kn; Fri, 10 Feb 2023 16:43:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQWUf-0003hw-Ha; Fri, 10 Feb 2023 16:43:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQWUf-00028g-4U; Fri, 10 Feb 2023 16:43:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQWUf-0007Wy-40; Fri, 10 Feb 2023 16:43:25 +0000
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
	bh=m+wDdZYFExVk0F9cZZfwzYdyK8Pt32uyUz5gU6pZkyc=; b=z9AFqWLvHa39+rfHxTSAzG7pXC
	LQJrCTCJPi6wax7vIqRdQz9Js9i0PmFEgJmeQ5wwYleGditsx9ww4delTh2iGnxr6P0YL83/YtwNn
	fDDah1eV0znwcTm1blmY+0hY3fEEIjzL8cm/7WstHfLoCgnfoFG05XfmerrmD3sQes0Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176771-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 176771: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-libvirt-xsm:debian-install:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=35674e787518768626d3a0ffce1c13a7eeed922d
X-Osstest-Versions-That:
    linux=0983f6bf2bfc0789b51ddf7315f644ff4da50acb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Feb 2023 16:43:25 +0000

flight 176771 linux-linus real [real]
flight 176869 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/176771/
http://logs.test-lab.xenproject.org/osstest/logs/176869/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-xsm 12 debian-install      fail pass in 176869-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check fail in 176869 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176667
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176667
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176667
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176667
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176667
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                35674e787518768626d3a0ffce1c13a7eeed922d
baseline version:
 linux                0983f6bf2bfc0789b51ddf7315f644ff4da50acb

Last test of basis   176667  2023-02-08 20:26:33 Z    1 days
Testing same since   176771  2023-02-09 18:42:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adham Faris <afaris@nvidia.com>
  Alan Stern <stern@rowland.harvard.edu>
  Allen Hubbe <allen.hubbe@amd.com>
  Amir Tzin <amirtz@nvidia.com>
  Amritha Nambiar <amritha.nambiar@intel.com>
  Anastasia Belova <abelova@astralinux.ru>
  Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  Bastien Nocera <hadess@hadess.net>
  Benedict Wong <benedictwong@google.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bharathi Sreenivas <bharathi.sreenivas@intel.com>
  Brett Creeley <brett.creeley@intel.com>
  Carlos O'Donell <carlos@redhat.com>
  Casper Andersson <casper.casan@gmail.com>
  Christian Hopps <chopps@chopps.org>
  Clément Léger <clement.leger@bootlin.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Carpenter <error27@gmail.com>
  David S. Miller <davem@davemloft.net>
  Devid Antonio Filoni <devid.filoni@egluetechnologies.com>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Dragos Tatulea <dtatulea@nvidia.com>
  Eric Dumazet <edumazet@google.com>
  Frank Wunderlich <frank-w@public-files.de>
  Gurucharan G <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Haiyang Zhang <haiyangz@microsoft.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Herton R. Krzesinski <herton@redhat.com>
  Ido Schimmel <idosch@nvidia.com>
  Jakub Andrysiak <jakub.andrysiak@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jiawen Wu <jiawenwu@trustnetic.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Pirko <jiri@nvidia.com>
  Julian Anastasov <ja@ssi.bg>
  Karen Ostrowska <karen.ostrowska@intel.com>
  Kevin Yang <yyd@google.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luka Guzenko <l.guzenko@web.de>
  Maher Sanalla <msanalla@nvidia.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Marco Rodolfi <marco.rodolfi@tuta.io>
  marco.rodolfi@tuta.io <marco.rodolfi@tuta.io>
  Marek Szlosek <marek.szlosek@intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Michael Kelley <mikelley@microsoft.com>
  Michal Simek <michal.simek@amd.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Naama Meir <naamax.meir@linux.intel.com>
  Neel Patel <neel.patel@amd.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Pietro Borrello <borrello@diag.uniroma1.it>
  Qi Zheng <zhengqi.arch@bytedance.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Richard van Schagen <richard@routerhints.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sasha Neftin <sasha.neftin@intel.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shay Drory <shayd@nvidia.com>
  Simon Horman <simon.horman@corigine.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steve French <stfrench@microsoft.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Takahiro Fujii <fujii@xaxxi.net>
  Tariq Toukan <tariqt@nvidia.com>
  Tobias Klausmann <klausman@schwarzvogel.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vlad Buslov <vladbu@nvidia.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Xin Zhao <xnzhao@google.com>
  Yevgeny Kliteynik <kliteyn@nvidia.com>
  Yu Xiao <yu.xiao@corigine.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  ZhaoLong Wang <wangzhaolong1@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 


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
   0983f6bf2bfc..35674e787518  35674e787518768626d3a0ffce1c13a7eeed922d -> tested/linux-linus

