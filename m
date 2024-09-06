Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67196F315
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 13:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791755.1201756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smX7u-00018n-Me; Fri, 06 Sep 2024 11:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791755.1201756; Fri, 06 Sep 2024 11:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smX7u-00016k-Iv; Fri, 06 Sep 2024 11:27:42 +0000
Received: by outflank-mailman (input) for mailman id 791755;
 Fri, 06 Sep 2024 11:27:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smX7s-00016Y-Ol; Fri, 06 Sep 2024 11:27:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smX7s-000116-AF; Fri, 06 Sep 2024 11:27:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smX7r-0006ls-Q7; Fri, 06 Sep 2024 11:27:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smX7r-0002F0-Ph; Fri, 06 Sep 2024 11:27:39 +0000
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
	bh=GaE7kzxsw87o9i6MAZahkKjKBolf+FVnYM3NhmqpN7U=; b=ANtF0dp+PZKlFxSSjByuvRvltZ
	Q8r1gHM+LM9evs+TyHWsp+7wD9/nrByHV1lApIFmqxEuLdATa399XUqQCi2pWz7/aQ41i1FX7E0fq
	Uai/1cMbcH3mg3aMk2WVSEOc4RIjzBjLzyTST86MZ0svge5LqrfKvfRL/rMOuDMGOwBY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187510-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187510: regressions - FAIL
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
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ad618736883b8970f66af799e34007475fe33a68
X-Osstest-Versions-That:
    linux=c763c43396883456ef57e5e78b64d3c259c4babc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 11:27:39 +0000

flight 187510 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187510/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 187504

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
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187504
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ad618736883b8970f66af799e34007475fe33a68
baseline version:
 linux                c763c43396883456ef57e5e78b64d3c259c4babc

Last test of basis   187504  2024-09-05 10:21:11 Z    1 days
Testing same since   187510  2024-09-05 23:42:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aleksandr Mishin <amishin@t-argos.ru>
  David Gow <davidgow@google.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luke D. Jones <luke@ljones.dev>
  Rae Moar <rmoar@google.com>
  Shuah Khan <skhan@linuxfoundation.org>

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

------------------------------------------------------------
commit ad618736883b8970f66af799e34007475fe33a68
Merge: 120434e5b305 d34af755a533
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Sep 5 09:57:50 2024 -0700

    Merge tag 'platform-drivers-x86-v6.11-6' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
    
    Pull x86 platform driver fixes from Ilpo Järvinen:
    
     - amd/pmf: ASUS GA403 quirk matching tweak
    
     - dell-smbios: Fix to the init function rollback path
    
    * tag 'platform-drivers-x86-v6.11-6' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86:
      platform/x86/amd: pmf: Make ASUS GA403 quirk generic
      platform/x86: dell-smbios: Fix error path in dell_smbios_init()

commit 120434e5b305defa1fb1e7a38421ed08f93243d5
Merge: c763c4339688 f2c6dbd22017
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Sep 5 09:43:38 2024 -0700

    Merge tag 'linux_kselftest-kunit-fixes-6.11-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull kunit fix fromShuah Khan:
     "One single fix to a use-after-free bug resulting from
      kunit_driver_create() failing to copy the driver name leaving it on
      the stack or freeing it"
    
    * tag 'linux_kselftest-kunit-fixes-6.11-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      kunit: Device wrappers should also manage driver name

commit d34af755a533271f39cc7d86e49c0e74fde63a37
Author: Luke D. Jones <luke@ljones.dev>
Date:   Sat Aug 31 12:39:05 2024 +1200

    platform/x86/amd: pmf: Make ASUS GA403 quirk generic
    
    The original quirk should match to GA403U so that the full
    range of GA403U models can benefit.
    
    Signed-off-by: Luke D. Jones <luke@ljones.dev>
    Link: https://lore.kernel.org/r/20240831003905.1060977-1-luke@ljones.dev
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

commit ffc17e1479e8e9459b7afa80e5d9d40d0dd78abb
Author: Aleksandr Mishin <amishin@t-argos.ru>
Date:   Fri Aug 30 09:54:28 2024 +0300

    platform/x86: dell-smbios: Fix error path in dell_smbios_init()
    
    In case of error in build_tokens_sysfs(), all the memory that has been
    allocated is freed at end of this function. But then free_group() is
    called which performs memory deallocation again.
    
    Also, instead of free_group() call, there should be exit_dell_smbios_smm()
    and exit_dell_smbios_wmi() calls, since there is initialization, but there
    is no release of resources in case of an error.
    
    Fix these issues by replacing free_group() call with
    exit_dell_smbios_wmi() and exit_dell_smbios_smm().
    
    Found by Linux Verification Center (linuxtesting.org) with SVACE.
    
    Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
    Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
    Link: https://lore.kernel.org/r/20240830065428.9544-1-amishin@t-argos.ru
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

commit f2c6dbd220170c2396fb019ead67fbada1e23ebd
Author: David Gow <davidgow@google.com>
Date:   Fri Aug 16 12:51:22 2024 +0800

    kunit: Device wrappers should also manage driver name
    
    kunit_driver_create() accepts a name for the driver, but does not copy
    it, so if that name is either on the stack, or otherwise freed, we end
    up with a use-after-free when the driver is cleaned up.
    
    Instead, strdup() the name, and manage it as another KUnit allocation.
    As there was no existing kunit_kstrdup(), we add one. Further, add a
    kunit_ variant of strdup_const() and kfree_const(), so we don't need to
    allocate and manage the string in the majority of cases where it's a
    constant.
    
    However, these are inline functions, and is_kernel_rodata() only works
    for built-in code. This causes problems in two cases:
    - If kunit is built as a module, __{start,end}_rodata is not defined.
    - If a kunit test using these functions is built as a module, it will
      suffer the same fate.
    
    This fixes a KASAN splat with overflow.overflow_allocation_test, when
    built as a module.
    
    Restrict the is_kernel_rodata() case to when KUnit is built as a module,
    which fixes the first case, at the cost of losing the optimisation.
    
    Also, make kunit_{kstrdup,kfree}_const non-inline, so that other modules
    using them will not accidentally depend on is_kernel_rodata(). If KUnit
    is built-in, they'll benefit from the optimisation, if KUnit is not,
    they won't, but the string will be properly duplicated.
    
    Fixes: d03c720e03bd ("kunit: Add APIs for managing devices")
    Reported-by: Nico Pache <npache@redhat.com>
    Closes: https://groups.google.com/g/kunit-dev/c/81V9b9QYON0
    Reviewed-by: Kees Cook <kees@kernel.org>
    Reviewed-by: Maxime Ripard <mripard@kernel.org>
    Reviewed-by: Rae Moar <rmoar@google.com>
    Signed-off-by: David Gow <davidgow@google.com>
    Tested-by: Rae Moar <rmoar@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

