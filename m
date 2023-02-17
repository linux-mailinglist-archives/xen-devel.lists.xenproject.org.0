Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B042569A57B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 07:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496864.767796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pStsr-0005FQ-Sq; Fri, 17 Feb 2023 06:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496864.767796; Fri, 17 Feb 2023 06:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pStsr-0005DC-PQ; Fri, 17 Feb 2023 06:06:13 +0000
Received: by outflank-mailman (input) for mailman id 496864;
 Fri, 17 Feb 2023 06:06:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pStsq-0005D2-4O; Fri, 17 Feb 2023 06:06:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pStsq-0002Mo-1Q; Fri, 17 Feb 2023 06:06:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pStsp-0002rO-L7; Fri, 17 Feb 2023 06:06:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pStsp-00034I-Ke; Fri, 17 Feb 2023 06:06:11 +0000
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
	bh=5cm4PoOnQ7dD2RU1tBLoYCVQQPgnVbMikqJibHP7JXI=; b=QIEPT9rM2CFJ0GNKRXm+Tp8/Tp
	4ScbSiZYOmvePKC2sIkDMdfbVlD4UVxlhrzGbVfZp45XQkwBRp2dA0H2+6UCNO6iHhqU8EfI7wCZW
	K6qXqgWbs35/gRZlRgxx9wMVnowipEvtAQ9uGmyKuSjX9fFls8wys7WEXzPeKqQFFRqE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177531-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 177531: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-start/freebsd.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
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
    linux=3ac88fa4605ec98e545fb3ad0154f575fda2de5f
X-Osstest-Versions-That:
    linux=033c40a89f55525139fd5b6342281b09b97d05bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Feb 2023 06:06:11 +0000

flight 177531 linux-linus real [real]
flight 177568 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/177531/
http://logs.test-lab.xenproject.org/osstest/logs/177568/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-freebsd12-amd64 21 guest-start/freebsd.repeat fail pass in 177568-retest
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail pass in 177568-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 177451
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 177451
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 177451
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 177451
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 177451
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
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
 linux                3ac88fa4605ec98e545fb3ad0154f575fda2de5f
baseline version:
 linux                033c40a89f55525139fd5b6342281b09b97d05bf

Last test of basis   177451  2023-02-16 02:59:06 Z    1 days
Testing same since   177531  2023-02-16 20:42:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy@kernel.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Chandan Kumar Rout <chandanx.rout@intel.com> (A Contingent Worker at Intel)
  Christoph Hellwig <hch@lst.de>
  Corinna Vinschen <vinschen@redhat.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Daniel Wagner <dwagner@suse.de>
  David S. Miller <davem@davemloft.net>
  Eelco Chaudron <echaudro@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Felix Riemann <felix.riemann@sma.de>
  Guillaume Nault <gnault@redhat.com>
  Guolin Yang <gyang@vmware.com>
  Gurucharan G <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Hangyu Hua <hbh25y@gmail.com>
  Hector Martin <marcan@marcan.st>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hyunwoo Kim <v4bel@theori.io>
  Ido Schimmel <idosch@nvidia.com>
  Irvin Cote <irvin.cote@insa-lyon.fr>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jamie Bainbridge <jbainbri@redhat.com>
  Janne Grunau <j@jannau.net>
  Jason Xing <kernelxing@tencent.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Johannes Zink <j.zink@pengutronix.de>
  Jon Maloy <jmaloy@redhat.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Mark Brown <broonie@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Kelley <mikelley@microsoft.com>
  Michal Wilczynski <michal.wilczynski@intel.com>
  Miko Larsson <mikoxyzzz@gmail.com>
  Miroslav Lichvar <mlichvar@redhat.com>
  Natalia Petrova <n.petrova@fintech.ru>
  Paolo Abeni <pabeni@redhat.com>
  Pedro Tammela <pctammela@mojatatu.com>
  Peng Li <lpeng@vmware.com>
  Pietro Borrello <borrello@diag.uniroma1.it>
  Raag Jadav <raag.jadav@intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Ronak Doshi <doshir@vmware.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Simon Horman <simon.horman@corigine.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tung Nguyen <tung.q.nguyen@dektech.com.au>
  Vignesh Raghavendra <vigneshr@ti.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Xin Long <lucien.xin@gmail.com>
  Yinjun Zhang <yinjun.zhang@corigine.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-freebsd12-amd64                             fail    
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
   033c40a89f55..3ac88fa4605e  3ac88fa4605ec98e545fb3ad0154f575fda2de5f -> tested/linux-linus

