Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7C085954C
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 08:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682542.1061641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbbtI-0002AT-RR; Sun, 18 Feb 2024 07:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682542.1061641; Sun, 18 Feb 2024 07:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbbtI-00029Q-OH; Sun, 18 Feb 2024 07:47:12 +0000
Received: by outflank-mailman (input) for mailman id 682542;
 Sun, 18 Feb 2024 07:47:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rbbtH-00029G-P9; Sun, 18 Feb 2024 07:47:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rbbtH-00038W-GA; Sun, 18 Feb 2024 07:47:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rbbtH-0001xN-1P; Sun, 18 Feb 2024 07:47:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rbbtH-0008BR-0p; Sun, 18 Feb 2024 07:47:11 +0000
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
	bh=oANuTKyHPN3MmnkKRo7zbR50i4FGiGoBZwc0YNvjDQg=; b=UcS1WuPSEr5nR7mM1oiZU+BtR6
	nOzZFl/g2I0AE9RxmNL6FEKkei6E4c5n6PJHOfaTf6j+CPHgJ8sKCg60scRnPfDniMpbK9ZeK6x+x
	U811pfYVocQn4NJQ+fOK4cdpHrWbo6cje8erfeQESVoLzYLH1f22/RDfox2d76LS94n4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184694-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184694: trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f2667e0c32404a68496891b2d2015825de189b06
X-Osstest-Versions-That:
    linux=c1ca10ceffbb289ed02feaf005bc9ee6095b4507
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Feb 2024 07:47:11 +0000

flight 184694 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184694/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-qcow2    <job status>                 broken
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 184691

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184691
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184691
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184691
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184691
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184691
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184691
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184691
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                f2667e0c32404a68496891b2d2015825de189b06
baseline version:
 linux                c1ca10ceffbb289ed02feaf005bc9ee6095b4507

Last test of basis   184691  2024-02-17 06:55:54 Z    1 days
Testing same since   184694  2024-02-17 22:14:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
  Abel Vesa <abel.vesa@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Bjorn Helgaas <bhelgaas@google.com>
  Cosmin Tanislav <demonsingur@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  David Schiller <david.schiller@jku.at>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Dimitri Fedrau <dima.fedrau@gmail.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Emil Kronborg <emil.kronborg@protonmail.com>
  Georgi Djakov <djakov@kernel.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Ruffell <matthew.ruffell@canonical.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Tipton <quic_mdtipton@quicinc.com>
  Mohammad Rahimi <rahimi.mhmmd@gmail.com>
  Nuno Sa <nuno.sa@analog.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ronnie Sahlberg <ronniesahlberg@gmail.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sanath S <sanath.s@amd.com>
  Saravana Kannan <saravanak@google.com>
  Sasha Levin <sashal@kernel.org>
  Sean Young <sean@mess.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stefan Wahren <wahrenst@gmx.net>
  Steve French <stfrench@microsoft.com>
  Su Yue <glass.su@suse.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Xu Yang <xu.yang_2@nxp.com>
  zhili.liu <zhili.liu@ucas.com.cn>
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

(No revision log; it would be 1482 lines long.)

