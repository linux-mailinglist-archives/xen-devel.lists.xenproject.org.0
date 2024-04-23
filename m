Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053F8ADE69
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 09:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710342.1109511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAl6-0002d2-IC; Tue, 23 Apr 2024 07:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710342.1109511; Tue, 23 Apr 2024 07:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAl6-0002aW-F0; Tue, 23 Apr 2024 07:40:08 +0000
Received: by outflank-mailman (input) for mailman id 710342;
 Tue, 23 Apr 2024 07:40:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzAl4-0002VI-UG; Tue, 23 Apr 2024 07:40:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzAl4-0002Az-NH; Tue, 23 Apr 2024 07:40:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzAl4-0000cl-EW; Tue, 23 Apr 2024 07:40:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzAl4-0006au-Ds; Tue, 23 Apr 2024 07:40:06 +0000
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
	bh=B+NWmNrsf/8gD82gXid/Vf1kOTRMKrogj5lKcFFSDV0=; b=fefzXhaauHQPdkjwvp5ZKUG8hu
	D8ibzJekGTGEKZk0gaSCg90G3FgPRw9yfRF6U7K8WQHnlXYeLd7ucWpjLjR0Qspg2Bmszyy8Dr/G7
	r5Nldhk9oR76bL+mphjw2AMSnIXezKutRt4pB4ajsquDVJuyqsD8egSwrp6sBZGrxyGg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185763-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185763: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-armhf:xen-build:fail:regression
    linux-linus:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4d2008430ce87061c9cefd4f83daf2d5bb323a96
X-Osstest-Versions-That:
    linux=977b1ef51866aa7170409af80740788d4f9c4841
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Apr 2024 07:40:06 +0000

flight 185763 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185763/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 185750

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185750
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185750
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185750
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185750
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185750
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4d2008430ce87061c9cefd4f83daf2d5bb323a96
baseline version:
 linux                977b1ef51866aa7170409af80740788d4f9c4841

Last test of basis   185750  2024-04-21 12:13:57 Z    1 days
Failing since        185753  2024-04-21 22:44:09 Z    1 days    3 attempts
Testing same since   185763  2024-04-22 19:14:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Stern <stern@rowland.harvard.edu>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  bolan wang <bolan.wang@fibocom.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Carlos Llamas <cmllamas@google.com>
  Christian A. Ehrhardt <lk@c--e.de>
  Chuanhong Guo <gch981213@gmail.com>
  Coia Prant <coiaprant@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniele Palmas <dnlplm@gmail.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Hansen <dave.hansen@linux.intel.com> # for x86
  Emil Kronborg <emil.kronborg@protonmail.com>
  Eric Biggers <ebiggers@google.com>
  Fabio Estevam <festevam@denx.de>
  Finn Thain <fthain@linux-m68k.org>
  Georgi Djakov <djakov@kernel.org>
  Gil Fine <gil.fine@linux.intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  H. Peter Anvin (Intel) <hpa@zytor.com>
  Hans de Goede <hdegoede@redhat.com>
  Hou Wenlong <houwenlong.hwl@antgroup.com>
  Ingo Molnar <mingo@kernel.org>
  Jerry Meng <jerry-meng@foxmail.com>
  Johan Hovold <johan@kernel.org>
  Jonathan Corbet <corbet@lwn.net>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Klara Modin <klarasmodin@gmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kyle Tso <kyletso@google.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthias Kaehlcke <mka@chromium.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Tipton <quic_mdtipton@quicinc.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Norihiko Hama <Norihiko.Hama@alpsalpine.com>
  Oliver Neukum <oneukum@suse.com>
  Paul Cercueil <paul@crapouillou.net>
  Peter Collingbourne <pcc@google.com>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Genoud <richard.genoud@bootlin.com>
  Ricky Wu <ricky_wu@realtek.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Tejun Heo <tj@kernel.org>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thorsten Leemhuis <linux@leemhuis.info>
  Todd Kjos <tkjos@google.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Lindgren <tony@atomide.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vanillan Wang <vanillanwang@163.com>
  Wentong Wu <wentong.wu@intel.com>
  Xin Li (Intel) <xin@zytor.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 
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


Not pushing.

(No revision log; it would be 2122 lines long.)

