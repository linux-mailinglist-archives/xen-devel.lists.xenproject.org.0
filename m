Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B467893CA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Aug 2023 06:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591062.923459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZktA-00087w-RW; Sat, 26 Aug 2023 04:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591062.923459; Sat, 26 Aug 2023 04:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZktA-000851-Nq; Sat, 26 Aug 2023 04:27:08 +0000
Received: by outflank-mailman (input) for mailman id 591062;
 Sat, 26 Aug 2023 04:27:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZkt9-00084r-Bi; Sat, 26 Aug 2023 04:27:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZkt9-0007Ng-0M; Sat, 26 Aug 2023 04:27:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZkt8-000112-EZ; Sat, 26 Aug 2023 04:27:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qZkt8-0000cz-Dq; Sat, 26 Aug 2023 04:27:06 +0000
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
	bh=WQXzbIzMsvDsPrCmqupRvCGpF555cdQImQ6dH6mMNNk=; b=Nq94vypooXuLvxpGfvJQutlIeI
	rnC7IMI624B3ygXsWHAXem7GD8A1Lt3EaeiLrJC0IgSfdzmxyN46oUS2/mW0uR70NxX473lxyKeBt
	+DRGU6XiaSV6YKkWVG6rZ6n7bTJQ26bd0vsWLzafqRdux1CTBUiSVx0cq/ui+QXfaEfQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182519-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182519: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4f9e7fabf8643003afefc172e62dd276686f016e
X-Osstest-Versions-That:
    linux=53663f4103ff6738e4697004d6f84864d052333d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Aug 2023 04:27:06 +0000

flight 182519 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182519/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-qcow2    <job status>                 broken
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 182424
 test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 182424
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 182424
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 182424

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182424
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182424
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182424
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182424
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4f9e7fabf8643003afefc172e62dd276686f016e
baseline version:
 linux                53663f4103ff6738e4697004d6f84864d052333d

Last test of basis   182424  2023-08-22 18:10:18 Z    3 days
Failing since        182452  2023-08-23 10:10:33 Z    2 days    5 attempts
Testing same since   182519  2023-08-25 13:29:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Haleem <abdhalee@in.ibm.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alessio Igor Bogani <alessio.bogani@elettra.eu>
  Amit Cohen <amcohen@nvidia.com>
  Andrii Staikov <andrii.staikov@intel.com>
  André Apitzsch <git@apitzsch.eu>
  Anh Tuan Phan <tuananhlfc@gmail.com>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Benjamin Coddington <bcodding@redhat.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chuck Lever <chuck.lever@oracle.com>
  Daniel Golle <daniel@makrotopia.org>
  Danielle Ratson <danieller@nvidia.com>
  David Christensen <drc@linux.vnet.ibm.com>
  David S. Miller <davem@davemloft.net>
  Doug Berger <opendmb@gmail.com>
  Edward Cree <ecree.xilinx@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Florian Westphal <fw@strlen.de>
  GONG, Ruiqi <gongruiqi1@huawei.com>
  Gregory Greenman <gregory.greenman@intel.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hariprasad Kelam <hkelam@marvell.com>
  Ido Schimmel <idosch@nvidia.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jiri Pirko <jiri@nvidia.com>
  Johannes Berg <johannes.berg@intel.com>
  Josua Mayer <josua@solid-run.com>
  Kees Cook <keescook@chromium.org>
  Leonard Göhrs <l.goehrs@pengutronix.de>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Wei <luwei32@huawei.com>
  Marek Behún <kabel@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Naama Meir <naamax.meir@linux.intel.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Peng Fan <peng.fan@nxp.com>
  Petr Machata <petrm@nvidia.com>
  Petr Oros <poros@redhat.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Remi Pommarel <repk@triplefau.lt>
  Richard Cochran <richardcochran@gmail.com>
  Rik van Riel <riel@surriel.com>
  Rob Herring <robh@kernel.org>
  Ruan Jinjie <ruanjinjie@huawei.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Sasha Neftin <sasha.neftin@intel.com>
  Serge Semin <fancer.lancer@gmail.com>
  Shih-Yi Chen <shihyic@nvidia.com>
  Simon Horman <horms@kernel.org> # build-tested
  Simon Wunderlich <sw@simonwunderlich.de>
  Srinivas Goud <srinivas.goud@amd.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sunil Goutham <sgoutham@marvell.com>
  Sven Eckelmann <sven@narfation.org>
  Sven Schnelle <svens@linux.ibm.com>
  Swapnil Devesh <me@sidevesh.com>
  Thinh Tran <thinhtr@linux.vnet.ibm.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Venkata Sai Duggi <venkata.sai.duggi@ibm.com>
  Victor Nogueira <victor@mojatatu.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wei Chen <harperchen1110@gmail.com>
  Zheng Yejian <zhengyejian1@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      fail    
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
 test-armhf-armhf-libvirt-qcow2                               broken  
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

broken-job test-armhf-armhf-libvirt-qcow2 broken
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)

Not pushing.

(No revision log; it would be 2627 lines long.)

