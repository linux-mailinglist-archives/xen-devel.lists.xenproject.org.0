Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E186152E47D
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 07:45:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333463.557294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrvQh-0002P5-Bb; Fri, 20 May 2022 05:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333463.557294; Fri, 20 May 2022 05:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrvQh-0002Mv-7r; Fri, 20 May 2022 05:44:03 +0000
Received: by outflank-mailman (input) for mailman id 333463;
 Fri, 20 May 2022 05:44:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nrvQf-0002Ml-AR; Fri, 20 May 2022 05:44:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nrvQf-0006jS-7o; Fri, 20 May 2022 05:44:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nrvQe-0001yy-T1; Fri, 20 May 2022 05:44:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nrvQe-0002qR-SO; Fri, 20 May 2022 05:44:00 +0000
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
	bh=UAj10+FJ3N9Cp5sx2oRsgLUztYz310vI31MqJWnRZQE=; b=AtXvr21OMngW8oJa2GuCWv+Gjz
	9WDMHopzDzn8u7WQ0w+eKbHAEqvk1g1YYAdZ9+cL9PHyloSqZRBZr7le0Elafb8HMQsYBtzWumvc4
	79A6bdCyEmvW5ItuNuNnQ8xFttqkM/3IYn4fNRHxpvaKMnepqc5JnhT9Uy8d0HicJAZk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170581-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 170581: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=b015dcd62b86d298829990f8261d5d154b8d7af5
X-Osstest-Versions-That:
    linux=f993aed406eaf968ba3867a76bb46c95336a33d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 May 2022 05:44:00 +0000

flight 170581 linux-linus real [real]
flight 170591 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/170581/
http://logs.test-lab.xenproject.org/osstest/logs/170591/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-arndale   8 xen-boot            fail pass in 170591-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 170591 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 170591 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170566
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170566
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170566
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170566
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170566
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170566
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170566
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170566
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                b015dcd62b86d298829990f8261d5d154b8d7af5
baseline version:
 linux                f993aed406eaf968ba3867a76bb46c95336a33d0

Last test of basis   170566  2022-05-19 07:54:03 Z    0 days
Testing same since   170581  2022-05-19 21:41:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Elder <elder@linaro.org>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Lunn <andrew@lunn.ch>
  Ard Biesheuvel <ardb@kernel.org>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Aya Levin <ayal@nvidia.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Dave Cain <dcain@redhat.com>
  David S. Miller <davem@davemloft.net>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Dumazet <edumazet@google.com>
  Eyal Birger <eyal.birger@gmail.com>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Gal Pressman <gal@nvidia.com>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Hangbin Liu <liuhangbin@gmail.com>
  Harini Katakam <harini.katakam@xilinx.com>
  Helge Deller <deller@gmx.de>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Ido Schimmel <idosch@nvidia.com>
  IotaHydrae <writeforever@foxmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Joachim Wiberg <troglobit@gmail.com>
  Joel Stanley <joel@jms.id.au>
  John David Anglin <dave.anglin@bell.net>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Kevin Mitchell <kevmitch@arista.com>
  Leonard Crestez <cdleonard@gmail.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Maor Dickman <maord@nvidia.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mat Martineau <mathew.j.martineau@linux.intel.com>
  Mattijs Korpershoek <mkorpershoek@baylibre.com>
  Maxim Mikityanskiy <maximmi@nvidia.com>
  Michal Simek <michal.simek@xilinx.com>
  Michal Wilczynski <michal.wilczynski@intel.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oz Shlomo <ozsh@nvidia.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Blakey <paulb@nvidia.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
  Ritaro Takenaka <ritarot634@gmail.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Shay Drory <shayd@nvidia.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Sven Auhagen <sven.auhagen@voleatech.de>
  Thomas Bartschies <thomas.bartschies@cvk.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vadim Fedorenko <vfedorenko@novek.ru>
  Xin Long <lucien.xin@gmail.com>
  Yevgeny Kliteynik <kliteyn@nvidia.com>
  Zixuan Fu <r33s3n6@gmail.com>

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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-arm64-arm64-xl-seattle                                  pass    
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
   f993aed406ea..b015dcd62b86  b015dcd62b86d298829990f8261d5d154b8d7af5 -> tested/linux-linus

