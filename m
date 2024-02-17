Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA7858E99
	for <lists+xen-devel@lfdr.de>; Sat, 17 Feb 2024 11:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682421.1061557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbHd1-0000AC-LD; Sat, 17 Feb 2024 10:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682421.1061557; Sat, 17 Feb 2024 10:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbHd1-00007T-I8; Sat, 17 Feb 2024 10:09:03 +0000
Received: by outflank-mailman (input) for mailman id 682421;
 Sat, 17 Feb 2024 10:09:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rbHd0-00007H-6H; Sat, 17 Feb 2024 10:09:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rbHcz-0002Va-Qn; Sat, 17 Feb 2024 10:09:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rbHcz-0001w5-C6; Sat, 17 Feb 2024 10:09:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rbHcz-0003Ft-B6; Sat, 17 Feb 2024 10:09:01 +0000
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
	bh=8pYsFY7HJ4/AvYVSFmmFnF1/QPEpviaxLY85P/1cJHQ=; b=Oz6VHPgN26UWSP4GaIZfmiXcJf
	5QVPVycKS8uBeO8a/okCXD7+EBxWf3GOn7vIU7aF9C7foo2nvrEqUowelpthhiElF887Uw37quseb
	Xgb7RU8FVRmD9lUx+XdVCDqaL4a7vRCZSfV6RmRCPkcQERCl7Ex5RDtvD2sbtTQ669uM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184687-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 184687: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8b4118fabd6eb75fed19483b04dab3a036886489
X-Osstest-Versions-That:
    linux=f1bb70486c9c11d7e2d55240d4557f9fc575fbac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Feb 2024 10:09:01 +0000

flight 184687 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184687/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 184595

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184595
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184595
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184595
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184595
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184595
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184595
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184595
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184595
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8b4118fabd6eb75fed19483b04dab3a036886489
baseline version:
 linux                f1bb70486c9c11d7e2d55240d4557f9fc575fbac

Last test of basis   184595  2024-02-05 20:44:35 Z   11 days
Testing same since   184687  2024-02-16 18:13:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Ajay Kaher <ajay.kaher@broadcom.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Hansen <alexander.hansen@9elements.com>
  Alexander Tsoy <alexander@tsoy.me>
  Allen Pais <apais@linux.microsoft.com>
  Antoine Tenart <atenart@kernel.org>
  Baokun Li <libaokun1@huawei.com>
  Chao Yu <chao@kernel.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Dan Carpenter <dan.carpenter@linaro.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Teigland <teigland@redhat.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Frank Li <Frank.Li@nxp.com>
  Frederic Weisbecker <frederic@kernel.org>
  Furong Xu <0x1207@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guanhua Gao <guanhua.gao@nxp.com>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Ivan Vecera <ivecera@redhat.com>
  JackBB Wu <wojackbb@gmail.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jai Luthra <j-luthra@ti.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Pirko <jiri@nvidia.com>
  Jiri Wiesner <jwiesner@suse.de>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Julian Sikorski <belegdol+github@gmail.com>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Leonard Dallmayr <leonard.dallmayr@mailbox.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Loic Prylli <lprylli@netflix.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Prashanth K <quic_prashk@quicinc.com>
  Prathu Baronia <prathubaronia2011@gmail.com>
  Puliang Lu <puliang.lu@fibocom.com>
  Ron Economos <re@w6rz.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Sasha Levin <sashal@kernel.org>
  Sean Young <sean@mess.org>
  SeongJae Park <sj@kernel.org>
  Sheng Yong <shengyong@oppo.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Simon Horman <horms@kernel.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Steve French <stfrench@microsoft.com>
  Sven Joachim <svenjoac@gmx.de>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tony Lindgren <tony@atomide.com>
  Vinod Koul <vkoul@kernel.org>
  Werner Sembach <wse@tuxedocomputers.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Zhipeng Lu <alexious@zju.edu.cn>

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
 test-armhf-armhf-xl-rtds                                     fail    
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
   f1bb70486c9c..8b4118fabd6e  8b4118fabd6eb75fed19483b04dab3a036886489 -> tested/linux-6.1

