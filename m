Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE088AF728
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 21:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710952.1110531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzLfy-0007ai-OQ; Tue, 23 Apr 2024 19:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710952.1110531; Tue, 23 Apr 2024 19:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzLfy-0007Y9-LC; Tue, 23 Apr 2024 19:19:34 +0000
Received: by outflank-mailman (input) for mailman id 710952;
 Tue, 23 Apr 2024 19:19:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLfw-0007Xz-KE; Tue, 23 Apr 2024 19:19:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLfw-0007Ml-72; Tue, 23 Apr 2024 19:19:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLfv-0005Hu-R6; Tue, 23 Apr 2024 19:19:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLfv-0006Ao-Qg; Tue, 23 Apr 2024 19:19:31 +0000
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
	bh=cJf6VzBJ0m/Hjw65AseeM+YXTnQCFj4RbiaIHLqoN0c=; b=Z07NhHhFIuZlirnbJxwCO3nM1E
	KmW5LpAKZgD1WSeU5mGDnRTCl9BKgNIKih2IWqm7sHFjZSay1hajbnBWNZnOncrO/O0enDDkwBX1w
	H2kkFTVF1v8pc/Z3GxlOIsHoSlVY4h8lspJOlwmhsFuonTt6J69uj/uiYXviR7oNwcyI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185770-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185770: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=77e25f0e30ddd11e043e6fce84bf108ce7de5b6f
X-Osstest-Versions-That:
    xen=cccb7878f386fb8691b7e28957a562a66d9b875f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Apr 2024 19:19:31 +0000

flight 185770 xen-unstable-smoke real [real]
flight 185772 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185770/
http://logs.test-lab.xenproject.org/osstest/logs/185772/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 185760

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  77e25f0e30ddd11e043e6fce84bf108ce7de5b6f
baseline version:
 xen                  cccb7878f386fb8691b7e28957a562a66d9b875f

Last test of basis   185760  2024-04-22 14:02:06 Z    1 days
Testing same since   185770  2024-04-23 13:00:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Leigh Brown <leigh@solinno.co.uk>
  Roger Pau Monné <roger.pau@citrix.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
commit 77e25f0e30ddd11e043e6fce84bf108ce7de5b6f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 23 14:13:48 2024 +0200

    x86/MTRR: correct inadvertently inverted WC check
    
    The ! clearly got lost by mistake.
    
    Fixes: e9e0eb30d4d6 ("x86/MTRR: avoid several indirect calls")
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit f82c43a384913460892d4917d2a2f8c2b9399a5e
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Apr 23 14:12:04 2024 +0200

    xen: introduce header file with section related symbols
    
    Start by declaring the beginning and end of the init section.
    
    No functional change intended.
    
    Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 70d46b51e2f80f808c91f264f501cca1ca7af2b5
Author: Leigh Brown <leigh@solinno.co.uk>
Date:   Tue Apr 23 14:11:14 2024 +0200

    docs/man: Add xenwatchdog manual page
    
    Add a manual page for xenwatchdogd.
    
    Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 9c872b5766cde6cd9ebeb724a346aaee16e87c84
Author: Leigh Brown <leigh@solinno.co.uk>
Date:   Tue Apr 23 14:10:16 2024 +0200

    tools/misc: Add xenwatchdogd.c copyright notice
    
    Add copyright notice and description of the program.
    
    Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit e906bfae48b2f71607159e7f5589cb71f961351c
Author: Leigh Brown <leigh@solinno.co.uk>
Date:   Tue Apr 23 14:10:03 2024 +0200

    tools/misc: xenwatchdogd enhancements
    
    Add usage() function, the ability to run in the foreground, and
    the ability to disarm the watchdog timer when exiting.
    
    Add enhanced parameter parsing and validation, making use of
    getopt_long().  Check the number of parameters are correct, the
    timeout is at least two seconds (to allow a minimum sleep time of
    one second), and that the sleep time is at least one and less
    than the watchdog timeout.
    
    With these changes, the daemon will no longer instantly reboot
    the domain if you enter a zero timeout (or non-numeric parameter),
    and prevent the daemon consuming 100% of a CPU due to zero sleep
    time.
    
    Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit f0fa75c9ea9f03cf2c6f5e63d07664ca4b224dd6
Author: Leigh Brown <leigh@solinno.co.uk>
Date:   Tue Apr 23 14:09:50 2024 +0200

    tools/misc: xenwatchdogd: add parse_secs()
    
    Create a new parse_secs() function to parse the timeout and sleep
    parameters. This ensures that non-numeric parameters are not
    accidentally treated as numbers.
    
    Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 43a07069863b419433dee12c9b58c1f7ce70aa97
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Tue Apr 23 14:09:18 2024 +0200

    x86/rtc: Avoid UIP flag being set for longer than expected
    
    In a test, OVMF reported an error initializing the RTC without
    indicating the precise nature of the error. The only plausible
    explanation I can find is as follows:
    
    As part of the initialization, OVMF reads register C and then reads
    register A repatedly until the UIP flag is not set. If this takes longer
    than 100 ms, OVMF fails and reports an error. This may happen with the
    following sequence of events:
    
    At guest time=0s, rtc_init() calls check_update_timer() which schedules
    update_timer for t=(1 - 244us).
    
    At t=1s, the update_timer function happens to have been called >= 244us
    late. In the timer callback, it sets the UIP flag and schedules
    update_timer2 for t=1s.
    
    Before update_timer2 runs, the guest reads register C which calls
    check_update_timer(). check_update_timer() stops the scheduled
    update_timer2 and since the guest time is now outside of the update
    cycle, it schedules update_timer for t=(2 - 244us).
    
    The UIP flag will therefore be set for a whole second from t=1 to t=2
    while the guest repeatedly reads register A waiting for the UIP flag to
    clear. Fix it by clearing the UIP flag when scheduling update_timer.
    
    I was able to reproduce this issue with a synthetic test and this
    resolves the issue.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

