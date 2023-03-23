Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A456C7181
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 21:04:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514065.796007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfR9n-0001bL-M5; Thu, 23 Mar 2023 20:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514065.796007; Thu, 23 Mar 2023 20:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfR9n-0001Zb-Ij; Thu, 23 Mar 2023 20:03:31 +0000
Received: by outflank-mailman (input) for mailman id 514065;
 Thu, 23 Mar 2023 20:03:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfR9m-0001ZR-5E; Thu, 23 Mar 2023 20:03:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfR9m-0001yN-17; Thu, 23 Mar 2023 20:03:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfR9l-00042U-Ii; Thu, 23 Mar 2023 20:03:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pfR9l-0006XR-II; Thu, 23 Mar 2023 20:03:29 +0000
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
	bh=2uW18dT+QMZLuuqDMp57XH6SGJAZEGq683MqMpO5nug=; b=1rLm/8V/hVksbaAdS3E7XOxApl
	j3YwwkXmapCVIX/fIn/hYuJYBApkgF9Imz67UeIY3fKY2HF1i49mH7QzKe1pytlYf8LO/gQnYfRo+
	MsHr9qERpqctajFWpLZyNoim1m8TJ6jiz6oHIXa4B74gFwlYxxYndmhOARmcAAOdjT0w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179870-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 179870: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-5.4:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=6849d8c4a61a93bb3abf2f65c84ec1ebfa9a9fb6
X-Osstest-Versions-That:
    linux=e4b5c766f50525d84754cfdf0e4edef1db9622c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Mar 2023 20:03:29 +0000

flight 179870 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179870/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 179769
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 179769
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 179769
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 179769
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 179769
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 179769
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 179769
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 179769
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 179769
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
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
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                6849d8c4a61a93bb3abf2f65c84ec1ebfa9a9fb6
baseline version:
 linux                e4b5c766f50525d84754cfdf0e4edef1db9622c0

Last test of basis   179769  2023-03-19 01:18:32 Z    4 days
Testing same since   179870  2023-03-22 12:45:03 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Baokun Li <libaokun1@huawei.com>
  Bart Van Assche <bvanassche@acm.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  Christian Hewitt <christianshewitt@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Daniil Tatianin <d-tatianin@yandex-team.ru>
  David S. Miller <davem@davemloft.net>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Erez Zadok <ezk@cs.stonybrook.edu>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  gaoxingwang <gaoxingwang1@huawei.com>
  Georgi Djakov <djakov@kernel.org>
  Glenn Washburn <development@efficientek.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ido Schimmel <idosch@nvidia.com>
  Ivan Vecera <ivecera@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  Jani Nikula <jani.nikula@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Sowden <jeremy@azazel.net>
  Jianguo Wu <wujianguo@chinatelecom.cn>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan+linaro@kernel.org>
  John Garry <john.g.garry@oracle.com>
  John Harrison <John.C.Harrison@Intel.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Corbet <corbet@lwn.net>
  Jouni Högander <jouni.hogander@intel.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Lee Jones <lee@kernel.org>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com> # i.MX8MP MSC SM2-MB-EP1 Board
  Ludovic Desroches <ludovic.desroches@microchip.com>
  Lukas Wunner <lukas@wunner.de>
  Manish Adkar <madkar@cs.stonybrook.edu>
  Marcus Folkesson <marcus.folkesson@gmail.com>
  Mark Rutland <mark.rutland@arm.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qu Huang <qu.huang@linux.dev>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
  Richard Weinberger <richard@nod.at>
  Sasha Levin <sashal@kernel.org>
  Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>
  Sherry Sun <sherry.sun@nxp.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Slade Watkins <srw@sladewatkins.net>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sven Schnelle <svens@linux.ibm.com>
  Szymon Heidrich <szymon.heidrich@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Tobias Schramm <t.schramm@manjaro.org>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Gorbik <gor@linux.ibm.com>
  Wenchao Hao <haowenchao2@huawei.com>
  Xiang Chen <chenxiang66@hisilicon.com>
  Yifei Liu <yifeliu@cs.stonybrook.edu>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  Zheng Wang <zyytlz.wz@163.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       pass    


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
   e4b5c766f505..6849d8c4a61a  6849d8c4a61a93bb3abf2f65c84ec1ebfa9a9fb6 -> tested/linux-5.4

