Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFD915BF5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 03:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747145.1154473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLvSR-00070i-En; Tue, 25 Jun 2024 01:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747145.1154473; Tue, 25 Jun 2024 01:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLvSR-0006y9-Be; Tue, 25 Jun 2024 01:58:55 +0000
Received: by outflank-mailman (input) for mailman id 747145;
 Tue, 25 Jun 2024 01:58:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLvSQ-0006xx-3H; Tue, 25 Jun 2024 01:58:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLvSP-0006xW-DV; Tue, 25 Jun 2024 01:58:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLvSO-0003p3-Qc; Tue, 25 Jun 2024 01:58:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sLvSO-0008Rr-Py; Tue, 25 Jun 2024 01:58:52 +0000
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
	bh=zfh5Jb4Pw5/72HrvsyxjNWHGWK37qDt59q8ZUWD9PjE=; b=2x2hAaYy7UYbrVlnWpFMdVFbl8
	9NETNm2J+6oXn6l5dDU1EoYk+954WT4ZHXpNL60WtZ7gyDKUZFJySO63DizjacfADGPhYfp5+rQC1
	iHe5wf5nxLf+r7G9ROOCRXF+8TDXB6fGVnTnqxsK0EDh9E/HIabA9tSUx1iPMuCnof0Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186469-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186469: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=626737a5791b59df5c4d1365c4dcfc9b0d70affe
X-Osstest-Versions-That:
    linux=7c16f0a4ed1ce7b0dd1c01fc012e5bde89fe7748
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jun 2024 01:58:52 +0000

flight 186469 linux-linus real [real]
flight 186472 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186469/
http://logs.test-lab.xenproject.org/osstest/logs/186472/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 186462

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl           8 xen-boot            fail pass in 186472-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 186472 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 186472 never pass
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186462
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186462
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186462
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186462
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186462
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 186462
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186462
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186462
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                626737a5791b59df5c4d1365c4dcfc9b0d70affe
baseline version:
 linux                7c16f0a4ed1ce7b0dd1c01fc012e5bde89fe7748

Last test of basis   186462  2024-06-23 16:10:07 Z    1 days
Failing since        186464  2024-06-24 01:42:08 Z    1 days    3 attempts
Testing same since   186469  2024-06-24 17:41:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Hagar Hemdan <hagarhem@amazon.com>
  Huang-Huang Bao <i@eh5.me>
  Johan Hovold <johan+linaro@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Stefan Wahren <wahrenst@gmx.net>
  Thomas Richard <thomas.richard@bootlin.com>

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
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
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


Not pushing.

------------------------------------------------------------
commit 626737a5791b59df5c4d1365c4dcfc9b0d70affe
Merge: f2661062f16b 4ea4d4808e34
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jun 24 10:28:41 2024 -0400

    Merge tag 'pinctrl-v6.10-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
    
    Pull pin control fixes from Linus Walleij:
    
     - Use flag saving spinlocks in the Renesas rzg2l driver. This fixes up
       PREEMPT_RT problems.
    
     - Remove broken Qualcomm PM8008 that clearly was never working. A new
       version will arrive in the next merge window.
    
     - Add a quirk for LP8764 regmap that was missed and made the TI J7200
       board unusable.
    
     - Fix persistance on the BCM2835 GPIO outputs kernel parameter so this
       remains consisten across a booted kernel.
    
     - Fix a potential deadlock in create_pinctrl()
    
     - Fix some erroneous bitfields and pinmux reset in the Rockchip RK3328
       driver.
    
    * tag 'pinctrl-v6.10-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl:
      pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
      pinctrl: rockchip: use dedicated pinctrl type for RK3328
      pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
      pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
      pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
      pinctrl: bcm2835: Fix permissions of persist_gpio_outputs
      pinctrl: tps6594: add missing support for LP8764 PMIC
      dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
      pinctrl: qcom: spmi-gpio: drop broken pm8008 support
      pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}

commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jun 23 17:08:54 2024 -0400

    Linux 6.10-rc5

commit 4ea4d4808e342ddf89ba24b93ffa2057005aaced
Author: Huang-Huang Bao <i@eh5.me>
Date:   Thu Jun 6 20:57:55 2024 +0800

    pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
    
    rockchip_pmx_set reset all pinmuxs in group to 0 in the case of error,
    add missing bank data retrieval in that code to avoid setting mux on
    unexpected pins.
    
    Fixes: 14797189b35e ("pinctrl: rockchip: add return value to rockchip_set_mux")
    Reviewed-by: Heiko Stuebner <heiko@sntech.de>
    Signed-off-by: Huang-Huang Bao <i@eh5.me>
    Link: https://lore.kernel.org/r/20240606125755.53778-5-i@eh5.me
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit 01b4b1d1cec48ef4c26616c2fc4600b2c9fec05a
Author: Huang-Huang Bao <i@eh5.me>
Date:   Thu Jun 6 20:57:54 2024 +0800

    pinctrl: rockchip: use dedicated pinctrl type for RK3328
    
    rk3328_pin_ctrl uses type of RK3288 which has a hack in
    rockchip_pinctrl_suspend and rockchip_pinctrl_resume to restore GPIO6-C6
    at assume, the hack is not applicable to RK3328 as GPIO6 is not even
    exist in it. So use a dedicated pinctrl type to skip this hack.
    
    Fixes: 3818e4a7678e ("pinctrl: rockchip: Add rk3328 pinctrl support")
    Reviewed-by: Heiko Stuebner <heiko@sntech.de>
    Signed-off-by: Huang-Huang Bao <i@eh5.me>
    Link: https://lore.kernel.org/r/20240606125755.53778-4-i@eh5.me
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit 5ef6914e0bf578357b4c906ffe6b26e7eedb8ccf
Author: Huang-Huang Bao <i@eh5.me>
Date:   Thu Jun 6 20:57:53 2024 +0800

    pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
    
    The pinmux bits for GPIO3-B1 to GPIO3-B6 pins are not explicitly
    specified in RK3328 TRM, however we can get hint from pad name and its
    correspinding IOMUX setting for pins in interface descriptions. The
    correspinding IOMIX settings for these pins can be found in the same
    row next to occurrences of following pad names in RK3328 TRM.
    
    GPIO3-B1:  IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6
    GPIO3-B2: IO_TSPd6m0_CIFdata6m0_GPIO3B2vccio6
    GPIO3-B3: IO_TSPd7m0_CIFdata7m0_GPIO3B3vccio6
    GPIO3-B4: IO_CARDclkm0_GPIO3B4vccio6
    GPIO3-B5: IO_CARDrstm0_GPIO3B5vccio6
    GPIO3-B6: IO_CARDdetm0_GPIO3B6vccio6
    
    Add pinmux data to rk3328_mux_recalced_data as mux register offset for
    these pins does not follow rockchip convention.
    
    Signed-off-by: Huang-Huang Bao <i@eh5.me>
    Reviewed-by: Heiko Stuebner <heiko@sntech.de>
    Fixes: 3818e4a7678e ("pinctrl: rockchip: Add rk3328 pinctrl support")
    Link: https://lore.kernel.org/r/20240606125755.53778-3-i@eh5.me
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit e8448a6c817c2aa6c6af785b1d45678bd5977e8d
Author: Huang-Huang Bao <i@eh5.me>
Date:   Thu Jun 6 20:57:52 2024 +0800

    pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
    
    The pinmux bits for GPIO2-B0 to GPIO2-B6 actually have 2 bits width,
    correct the bank flag for GPIO2-B. The pinmux bits for GPIO2-B7 is
    recalculated so it remain unchanged.
    
    The pinmux bits for those pins are not explicitly specified in RK3328
    TRM, however we can get hint from pad name and its correspinding IOMUX
    setting for pins in interface descriptions. The correspinding IOMIX
    settings for GPIO2-B0 to GPIO2-B6 can be found in the same row next to
    occurrences of following pad names in RK3328 TRM.
    
    GPIO2-B0: IO_SPIclkm0_GPIO2B0vccio5
    GPIO2-B1: IO_SPItxdm0_GPIO2B1vccio5
    GPIO2-B2: IO_SPIrxdm0_GPIO2B2vccio5
    GPIO2-B3: IO_SPIcsn0m0_GPIO2B3vccio5
    GPIO2-B4: IO_SPIcsn1m0_FLASHvol_sel_GPIO2B4vccio5
    GPIO2-B5: IO_ I2C2sda_TSADCshut_GPIO2B5vccio5
    GPIO2-B6: IO_ I2C2scl_GPIO2B6vccio5
    
    This fix has been tested on NanoPi R2S for fixing confliting pinmux bits
    between GPIO2-B7 with GPIO2-B5.
    
    Signed-off-by: Huang-Huang Bao <i@eh5.me>
    Reviewed-by: Heiko Stuebner <heiko@sntech.de>
    Fixes: 3818e4a7678e ("pinctrl: rockchip: Add rk3328 pinctrl support")
    Link: https://lore.kernel.org/r/20240606125755.53778-2-i@eh5.me
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit adec57ff8e66aee632f3dd1f93787c13d112b7a1
Author: Hagar Hemdan <hagarhem@amazon.com>
Date:   Tue Jun 4 08:58:38 2024 +0000

    pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
    
    In create_pinctrl(), pinctrl_maps_mutex is acquired before calling
    add_setting(). If add_setting() returns -EPROBE_DEFER, create_pinctrl()
    calls pinctrl_free(). However, pinctrl_free() attempts to acquire
    pinctrl_maps_mutex, which is already held by create_pinctrl(), leading to
    a potential deadlock.
    
    This patch resolves the issue by releasing pinctrl_maps_mutex before
    calling pinctrl_free(), preventing the deadlock.
    
    This bug was discovered and resolved using Coverity Static Analysis
    Security Testing (SAST) by Synopsys, Inc.
    
    Fixes: 42fed7ba44e4 ("pinctrl: move subsystem mutex to pinctrl_dev struct")
    Suggested-by: Maximilian Heyne <mheyne@amazon.de>
    Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
    Link: https://lore.kernel.org/r/20240604085838.3344-1-hagarhem@amazon.com
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit 61fef29ad120d3077aeb0ef598d76822acb8c4cb
Author: Stefan Wahren <wahrenst@gmx.net>
Date:   Mon Jun 3 20:19:37 2024 +0200

    pinctrl: bcm2835: Fix permissions of persist_gpio_outputs
    
    The commit 8ff05989b44e ("pinctrl: bcm2835: Make pin freeing behavior
    configurable") unintentionally made the module parameter
    persist_gpio_outputs changeable at runtime. So drop the write permission
    in order to make the freeing behavior predictable for user applications.
    
    Fixes: 8ff05989b44e ("pinctrl: bcm2835: Make pin freeing behavior configurable")
    Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
    Closes: https://lore.kernel.org/linux-gpio/Zjk-C0nLmlynqLAE@surfacebook.localdomain/
    Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
    Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
    Link: https://lore.kernel.org/r/20240603181938.76047-2-wahrenst@gmx.net
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit 03ecbe4bb61886cc7fff5b0efc3784e86ac16214
Author: Thomas Richard <thomas.richard@bootlin.com>
Date:   Mon Jun 3 10:21:10 2024 +0200

    pinctrl: tps6594: add missing support for LP8764 PMIC
    
    Add missing support for LP8764 PMIC in the probe().
    
    Issue detected with v6.10-rc1 (and reproduced with 6.10-rc2) using a TI
    J7200 EVM board.
    
    tps6594-pinctrl tps6594-pinctrl.8.auto: error -EINVAL:
      Couldn't register gpio_regmap driver
    tps6594-pinctrl tps6594-pinctrl.8.auto: probe with driver tps6594-pinctrl
      failed with error -22
    
    Fixes: 208829715917 (pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO)
    Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
    Link: https://lore.kernel.org/r/20240603082110.2104977-1-thomas.richard@bootlin.com
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit 550dec8593cd0b32ffc90bb88edb190c04efbb48
Author: Johan Hovold <johan+linaro@kernel.org>
Date:   Wed May 29 18:29:53 2024 +0200

    dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
    
    The binding for PM8008 is being reworked so that internal details like
    interrupts and register offsets are no longer described. This
    specifically also involves dropping the gpio child node and its
    compatible string which is no longer needed.
    
    Note that there are currently no users of the upstream binding and
    driver.
    
    Reviewed-by: Stephen Boyd <swboyd@chromium.org>
    Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
    Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
    Link: https://lore.kernel.org/r/20240529162958.18081-10-johan+linaro@kernel.org
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit 8da86499d4cd125a9561f9cd1de7fba99b0aecbf
Author: Johan Hovold <johan+linaro@kernel.org>
Date:   Wed May 29 18:29:52 2024 +0200

    pinctrl: qcom: spmi-gpio: drop broken pm8008 support
    
    The SPMI GPIO driver assumes that the parent device is an SPMI device
    and accesses random data when backcasting the parent struct device
    pointer for non-SPMI devices.
    
    Fortunately this does not seem to cause any issues currently when the
    parent device is an I2C client like the PM8008, but this could change if
    the structures are reorganised (e.g. using structure randomisation).
    
    Notably the interrupt implementation is also broken for non-SPMI devices.
    
    Also note that the two GPIO pins on PM8008 are used for interrupts and
    reset so their practical use should be limited.
    
    Drop the broken GPIO support for PM8008 for now.
    
    Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
    Cc: stable@vger.kernel.org      # 5.13
    Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
    Reviewed-by: Stephen Boyd <swboyd@chromium.org>
    Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
    Link: https://lore.kernel.org/r/20240529162958.18081-9-johan+linaro@kernel.org
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit dff5c3de21e753d1e46517aa2df0ebd23c06ede5
Merge: 1613e604df0c a39741d38c04
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Mon Jun 3 23:56:51 2024 +0200

    Merge tag 'renesas-pinctrl-fixes-for-v6.10-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into fixes
    
    pinctrl: renesas: Fixes for v6.10
    
      - Fix PREEMPT_RT build failure on RZ/G2L.
    
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

commit a39741d38c048a48ae0d65226d9548005a088f5f
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Date:   Wed May 22 08:54:21 2024 +0300

    pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}
    
    On PREEMPT_RT kernels the spinlock_t maps to an rtmutex. Using
    raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() on
    &pctrl->lock.rlock breaks the PREEMPT_RT builds. To fix this use
    spin_lock_irqsave()/spin_unlock_irqrestore() on &pctrl->lock.
    
    Fixes: 02cd2d3be1c3 ("pinctrl: renesas: rzg2l: Configure the interrupt type on resume")
    Reported-by: Diederik de Haas <didi.debian@cknow.org>
    Closes: https://lore.kernel.org/all/131999629.KQPSlr0Zke@bagend
    Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Link: https://lore.kernel.org/r/20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

