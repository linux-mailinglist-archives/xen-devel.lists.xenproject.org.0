Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8F3A37B3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 01:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140092.258929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrTss-0003i4-Gd; Thu, 10 Jun 2021 23:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140092.258929; Thu, 10 Jun 2021 23:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrTss-0003em-Cc; Thu, 10 Jun 2021 23:14:46 +0000
Received: by outflank-mailman (input) for mailman id 140092;
 Thu, 10 Jun 2021 23:14:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrTsr-0003ec-CG; Thu, 10 Jun 2021 23:14:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrTso-00012N-M9; Thu, 10 Jun 2021 23:14:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrTso-0003ug-GO; Thu, 10 Jun 2021 23:14:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lrTso-0005CN-Fv; Thu, 10 Jun 2021 23:14:42 +0000
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
	bh=KXSI9iPgSOhbTG5lBul9C5MRTH/xH8CBbRVF6gxfV7c=; b=hi3wn9fUC+uCNCCzuKrB+/t3J9
	WXy/AVDEESvUqZrwIl8ha+EcAQzcL48zYHFzZa030TBGKHDXnoROfpOiaN3v82kk1TkXgiamg9h/s
	PYtJpbzul13ocw35RvEnB/xsmjeyHMPFFmlMnJwdKI9wR/JebUDarAz01VD367T3S9T8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162618-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162618: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2bb17a45b1814b0b6aa4646eff58e16f876281fd
X-Osstest-Versions-That:
    xen=3e09045991cde360432bc7437103f8f8a6699359
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Jun 2021 23:14:42 +0000

flight 162618 xen-unstable-smoke real [real]
flight 162621 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/162618/
http://logs.test-lab.xenproject.org/osstest/logs/162621/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 162574

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2bb17a45b1814b0b6aa4646eff58e16f876281fd
baseline version:
 xen                  3e09045991cde360432bc7437103f8f8a6699359

Last test of basis   162574  2021-06-09 14:00:34 Z    1 days
Failing since        162584  2021-06-10 00:00:27 Z    0 days    6 attempts
Testing same since   162607  2021-06-10 15:00:30 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Jan Beulich <jbeulich@suse.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
commit 2bb17a45b1814b0b6aa4646eff58e16f876281fd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jun 10 16:56:24 2021 +0200

    x86: please Clang in arch_set_info_guest()
    
    Clang 10 reports
    
    domain.c:1328:10: error: variable 'cr3_mfn' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if ( !compat )
             ^~~~~~~
    domain.c:1334:34: note: uninitialized use occurs here
        cr3_page = get_page_from_mfn(cr3_mfn, d);
                                     ^~~~~~~
    domain.c:1328:5: note: remove the 'if' if its condition is always true
        if ( !compat )
        ^~~~~~~~~~~~~~
    domain.c:1042:18: note: initialize the variable 'cr3_mfn' to silence this warning
        mfn_t cr3_mfn;
                     ^
                      = 0
    domain.c:1189:14: error: variable 'fail' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
            if ( !compat )
                 ^~~~~~~
    domain.c:1211:9: note: uninitialized use occurs here
            fail |= v->arch.pv.gdt_ents != c(gdt_ents);
            ^~~~
    domain.c:1189:9: note: remove the 'if' if its condition is always true
            if ( !compat )
            ^~~~~~~~~~~~~~
    domain.c:1187:18: note: initialize the variable 'fail' to silence this warning
            bool fail;
                     ^
                      = false
    
    despite this being a build with -O2 in effect, and despite "compat"
    being constant "false" when CONFIG_COMPAT (and hence CONFIG_PV32) is not
    defined, as it gets set at the top of the function from the result of
    is_pv_32bit_domain().
    
    Re-arrange the two "offending" if()s such that when COMPAT=n the
    respective variables will be seen as unconditionally initialized. The
    original aim was to have the !compat cases first, though.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit dfcffb128be46a3e413eaa941744536fe53c94b6
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Wed Jun 9 10:37:59 2021 -0700

    xen/arm32: SPSR_hyp/SPSR
    
    SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
    trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
    See: ARM DDI 0487D.b page G8-5993.
    
    This fixes booting Xen/arm32 on QEMU.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
    Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
(qemu changes not included)

