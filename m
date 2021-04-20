Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B5365B4D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113828.216893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYrV9-0004la-4D; Tue, 20 Apr 2021 14:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113828.216893; Tue, 20 Apr 2021 14:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYrV9-0004lB-12; Tue, 20 Apr 2021 14:37:19 +0000
Received: by outflank-mailman (input) for mailman id 113828;
 Tue, 20 Apr 2021 14:37:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYrV7-0004l3-Vm; Tue, 20 Apr 2021 14:37:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYrV7-0002wd-Lk; Tue, 20 Apr 2021 14:37:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYrV7-0002zB-CQ; Tue, 20 Apr 2021 14:37:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYrV7-0002t9-Br; Tue, 20 Apr 2021 14:37:17 +0000
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
	bh=H84soC+IQ65oSWsJQfEsDH4T1DkIje12VbkylCyrJ8o=; b=sqio+cd6z2SvAzBWXHobEnK4gU
	rqJXvdcLRfxJjY26yxTie7KTT+5CxPewtVyIFGEqGsezDNq3zjGyHvtQh2o8p2I1BDIPUezI4IymB
	c5td50U3THPfcBYPlj26RtJIS3IS7RYp2leSPKC909Ellrc/rDg6aluk+tbGd8JfkNuo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161321-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 161321: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-localmigrate/x10:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=730d0f6082e66eefae64f35bc62e51fc54d02d55
X-Osstest-Versions-That:
    xen=a8c532be6a44c7faa54ac777a717f4aa65e3a806
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Apr 2021 14:37:17 +0000

flight 161321 xen-unstable-smoke real [real]
flight 161328 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/161321/
http://logs.test-lab.xenproject.org/osstest/logs/161328/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 18 guest-localmigrate/x10 fail REGR. vs. 161293

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  730d0f6082e66eefae64f35bc62e51fc54d02d55
baseline version:
 xen                  a8c532be6a44c7faa54ac777a717f4aa65e3a806

Last test of basis   161293  2021-04-19 14:00:26 Z    1 days
Testing same since   161321  2021-04-20 10:02:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
commit 730d0f6082e66eefae64f35bc62e51fc54d02d55
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Apr 20 11:36:54 2021 +0200

    x86/dpci: remove the dpci EOI timer
    
    Current interrupt pass though code will setup a timer for each
    interrupt injected to the guest that requires an EOI from the guest.
    Such timer would perform two actions if the guest doesn't EOI the
    interrupt before a given period of time. The first one is deasserting
    the virtual line, the second is perform an EOI of the physical
    interrupt source if it requires such.
    
    The deasserting of the guest virtual line is wrong, since it messes
    with the interrupt status of the guest. This seems to have been done
    in order to compensate for missing deasserts when certain interrupt
    controller actions are performed. The original motivation of the
    introduction of the timer was to fix issues when a GSI was shared
    between different guests. We believe that other changes in the
    interrupt handling code (ie: proper propagation of EOI related actions
    to dpci) will have fixed such errors now.
    
    Performing an EOI of the physical interrupt source is redundant, since
    there's already a timer that takes care of this for all interrupts,
    not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
    field.
    
    Since both of the actions performed by the dpci timer are not
    required, remove it altogether.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 2d494f2198d7909a394085d079475bb099d7afe7
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Apr 20 11:36:09 2021 +0200

    x86/vpic: issue dpci EOI for cleared pins at ICW1
    
    When pins are cleared from either ISR or IRR as part of the
    initialization sequence forward the clearing of those pins to the dpci
    EOI handler, as it is equivalent to an EOI. Not doing so can bring the
    interrupt controller state out of sync with the dpci handling logic,
    that expects a notification when a pin has been EOI'ed.
    
    Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 192f7479f21ef63dad8d8acbbda93cce0971fe66
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Apr 20 11:35:29 2021 +0200

    x86/vpic: don't trigger unmask event until end of init
    
    Wait until the end of the init sequence to trigger the unmask event.
    Note that it will be unconditionally triggered, but that's harmless if
    not unmask actually happened.
    
    While there change the variable type to bool.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 1ca901c527d21c083ceb706839db2cdac102926c
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Apr 20 11:34:53 2021 +0200

    x86/vpic: force int output to low when in init mode
    
    When the PIC is on the init sequence prevent interrupt delivery. The
    state of the registers is in the process of being set during the init
    phase, so it makes sense to prevent any int line changes during that
    process.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

