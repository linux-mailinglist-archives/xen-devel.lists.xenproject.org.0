Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C38519393
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 03:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320005.540502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm43i-0006qA-R2; Wed, 04 May 2022 01:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320005.540502; Wed, 04 May 2022 01:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm43i-0006nb-Me; Wed, 04 May 2022 01:44:06 +0000
Received: by outflank-mailman (input) for mailman id 320005;
 Wed, 04 May 2022 01:44:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nm43h-0006nR-1X; Wed, 04 May 2022 01:44:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nm43g-0007Sc-Pr; Wed, 04 May 2022 01:44:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nm43g-0005XJ-5y; Wed, 04 May 2022 01:44:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nm43g-0006Qm-5G; Wed, 04 May 2022 01:44:04 +0000
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
	bh=2iOQkroIC+r0AIvG6j/KQeZPi5S/C0Z6+20VTZCAewQ=; b=C8QWo2qx3lH6EKC/qt1RW2yNiu
	nmCevEWyL8icRBWyFp0O5GEg09Es1v3s8vUAB2x4rRDDcO5v70GZRSzU2qKefQ+jOGjYtKMv+z0D2
	aXQMcVMlrCvwA/fB5mFVLBw5o0ta7Fubqzizi15i7RTr9FYURiQPxVbsZxVHb1Zf4sgM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170053-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 170053: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-examine-uefi:host-install:broken:regression
    linux-linus:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
X-Osstest-Versions-That:
    linux=9050ba3a61a4b5bd84c2cde092a100404f814f31
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 May 2022 01:44:04 +0000

flight 170053 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170053/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine-uefi  5 host-install          broken REGR. vs. 170001
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 170001

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170001
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170001
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170001
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170001
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170001
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170001
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170001
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
baseline version:
 linux                9050ba3a61a4b5bd84c2cde092a100404f814f31

Last test of basis   170001  2022-05-02 19:09:59 Z    1 days
Testing same since   170053  2022-05-03 17:42:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Wujek <dev_public@wujek.eu>
  Armin Wolf <W_Armin@gmx.de>
  Denis Pauk <pauk.denis@gmail.com>
  Guenter Roeck <linux@roeck-us.net>
  Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
  Ji-Ze Hong (Peter Hong) <hpeter@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Rob Herring <robh@kernel.org>
  Zev Weiss <zev@bewilderbeest.net>
  Zheyu Ma <zheyuma97@gmail.com>

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
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                fail    
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

broken-step test-amd64-amd64-examine-uefi host-install

Not pushing.

------------------------------------------------------------
commit ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
Merge: 9050ba3a61a4 08da09f02804
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 3 09:51:52 2022 -0700

    Merge tag 'hwmon-for-v5.18-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
    
    Pull hwmon fixes from Guenter Roeck:
    
     - Work around a hardware problem in the delta-ahe50dc-fan driver
    
     - Explicitly disable PEC in PMBus core if not enabled
    
     - Fix negative temperature values in f71882fg driver
    
     - Fix warning on removal of adt7470 driver
    
     - Fix CROSSHAIR VI HERO name in asus_wmi_sensors driver
    
     - Fix build warning seen in xdpe12284 driver if
       CONFIG_SENSORS_XDPE122_REGULATOR is disabled
    
     - Fix type of 'ti,n-factor' in ti,tmp421 driver bindings
    
    * tag 'hwmon-for-v5.18-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging:
      hwmon: (pmbus) delta-ahe50dc-fan: work around hardware quirk
      hwmon: (pmbus) disable PEC if not enabled
      hwmon: (f71882fg) Fix negative temperature
      dt-bindings: hwmon: ti,tmp421: Fix type for 'ti,n-factor'
      hwmon: (adt7470) Fix warning on module removal
      hwmon: (asus_wmi_sensors) Fix CROSSHAIR VI HERO name
      hwmon: (xdpe12284) Fix build warning seen if CONFIG_SENSORS_XDPE122_REGULATOR is disabled

commit 08da09f028043fed9653331ae75bc310411f72e6
Author: Zev Weiss <zev@bewilderbeest.net>
Date:   Tue Apr 26 20:51:09 2022 -0700

    hwmon: (pmbus) delta-ahe50dc-fan: work around hardware quirk
    
    CLEAR_FAULTS commands can apparently sometimes trigger catastrophic
    power output glitches on the ahe-50dc, so block them from being sent
    at all.
    
    Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
    Cc: stable@vger.kernel.org
    Link: https://lore.kernel.org/r/20220427035109.3819-1-zev@bewilderbeest.net
    Fixes: d387d88ed045 ("hwmon: (pmbus) Add Delta AHE-50DC fan control module driver")
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

commit 75d2b2b06bd8407d03a3f126bc8b95eb356906c7
Author: Adam Wujek <dev_public@wujek.eu>
Date:   Wed Apr 20 14:51:25 2022 +0000

    hwmon: (pmbus) disable PEC if not enabled
    
    Explicitly disable PEC when the client does not support it.
    The problematic scenario is the following. A device with enabled PEC
    support is up and running and a kernel driver is loaded.
    Then the driver is unloaded (or device unbound), the HW device
    is reconfigured externally (e.g. by i2cset) to advertise itself as not
    supporting PEC. Without a new code, at the second load of the driver
    (or bind) the "flags" variable is not updated to avoid PEC usage. As a
    consequence the further communication with the device is done with
    the PEC enabled, which is wrong and may fail.
    
    The implementation first disable the I2C_CLIENT_PEC flag, then the old
    code enable it if needed.
    
    Fixes: 4e5418f787ec ("hwmon: (pmbus_core) Check adapter PEC support")
    Signed-off-by: Adam Wujek <dev_public@wujek.eu>
    Link: https://lore.kernel.org/r/20220420145059.431061-1-dev_public@wujek.eu
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

commit 4aaaaf0f279836f06d3b9d0ffeec7a1e1a04ceef
Author: Ji-Ze Hong (Peter Hong) <hpeter@gmail.com>
Date:   Mon Apr 18 17:07:06 2022 +0800

    hwmon: (f71882fg) Fix negative temperature
    
    All temperature of Fintek superio hwmonitor that using 1-byte reg will use
    2's complement.
    
    In show_temp()
            temp = data->temp[nr] * 1000;
    
    When data->temp[nr] read as 255, it indicate -1C, but this code will report
    255C to userspace. It'll be ok when change to:
            temp = ((s8)data->temp[nr]) * 1000;
    
    Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
    Link: https://lore.kernel.org/r/20220418090706.6339-1-hpeter+linux_kernel@gmail.com
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

commit 4d0d5c352303a318925ceb84a86818761aa6586b
Author: Rob Herring <robh@kernel.org>
Date:   Wed Apr 13 08:47:29 2022 -0500

    dt-bindings: hwmon: ti,tmp421: Fix type for 'ti,n-factor'
    
    'ti,n-factor' is read as a 32-bit signed value, so the type and constraints
    are wrong. The same property is also defined for ti,tmp464 and is correct.
    
    The constraints should also not be under 'items' as this property is not an
    array.
    
    Cc: Jean Delvare <jdelvare@suse.com>
    Cc: Guenter Roeck <linux@roeck-us.net>
    Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
    Cc: linux-hwmon@vger.kernel.org
    Signed-off-by: Rob Herring <robh@kernel.org>
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
    Link: https://lore.kernel.org/r/20220413134729.3112190-1-robh@kernel.org
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

commit 7b2666ce445c700b8dcee994da44ddcf050a0842
Author: Armin Wolf <W_Armin@gmx.de>
Date:   Thu Apr 7 12:13:12 2022 +0200

    hwmon: (adt7470) Fix warning on module removal
    
    When removing the adt7470 module, a warning might be printed:
    
    do not call blocking ops when !TASK_RUNNING; state=1
    set at [<ffffffffa006052b>] adt7470_update_thread+0x7b/0x130 [adt7470]
    
    This happens because adt7470_update_thread() can leave the kthread in
    TASK_INTERRUPTIBLE state when the kthread is being stopped before
    the call of set_current_state(). Since kthread_exit() might sleep in
    exit_signals(), the warning is printed.
    Fix that by using schedule_timeout_interruptible() and removing
    the call of set_current_state().
    This causes TASK_INTERRUPTIBLE to be set after kthread_should_stop()
    which might cause the kthread to exit.
    
    Reported-by: Zheyu Ma <zheyuma97@gmail.com>
    Fixes: 93cacfd41f82 (hwmon: (adt7470) Allow faster removal)
    Signed-off-by: Armin Wolf <W_Armin@gmx.de>
    Tested-by: Zheyu Ma <zheyuma97@gmail.com>
    Link: https://lore.kernel.org/r/20220407101312.13331-1-W_Armin@gmx.de
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

commit 4fd45cc8568e6086272d3036f2c29d61e9b776a1
Author: Denis Pauk <pauk.denis@gmail.com>
Date:   Sun Apr 3 22:34:54 2022 +0300

    hwmon: (asus_wmi_sensors) Fix CROSSHAIR VI HERO name
    
    CROSSHAIR VI HERO motherboard is incorrectly named as
    ROG CROSSHAIR VI HERO.
    
    Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
    Link: https://lore.kernel.org/r/20220403193455.1363-1-pauk.denis@gmail.com
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

commit d6732317a5525a95a7eb2d12b46e3e42d321c6b6
Author: Guenter Roeck <linux@roeck-us.net>
Date:   Fri Mar 25 15:24:34 2022 -0700

    hwmon: (xdpe12284) Fix build warning seen if CONFIG_SENSORS_XDPE122_REGULATOR is disabled
    
    0-day reports:
    
    drivers/hwmon/pmbus/xdpe12284.c:127:36: warning:
            unused variable 'xdpe122_reg_desc'
    
    This is seen if CONFIG_SENSORS_XDPE122_REGULATOR is not enabled.
    Mark xdpe122_reg_desc as __maybe_unused to fix the problem.
    
    Fixes: f53bfe4d6984 ("hwmon: (xdpe12284) Add regulator support")
    Reported-by: kernel test robot <lkp@intel.com>
    Cc: Marcello Sylvester Bauer <sylv@sylv.io>
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

