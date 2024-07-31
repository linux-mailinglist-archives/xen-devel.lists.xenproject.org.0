Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448EA94340B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768974.1179884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZC3A-000733-O5; Wed, 31 Jul 2024 16:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768974.1179884; Wed, 31 Jul 2024 16:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZC3A-00070G-Jz; Wed, 31 Jul 2024 16:19:40 +0000
Received: by outflank-mailman (input) for mailman id 768974;
 Wed, 31 Jul 2024 16:19:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZC39-000700-JH; Wed, 31 Jul 2024 16:19:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZC39-0007r5-HR; Wed, 31 Jul 2024 16:19:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZC39-0006Xv-3k; Wed, 31 Jul 2024 16:19:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZC39-0006SM-3G; Wed, 31 Jul 2024 16:19:39 +0000
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
	bh=I8MkkhkkTZ+P4kiGt78GRN/A2iHkeFJCldF5WEIAKzg=; b=QPKeK6BO96OiPLvlNg58Mui6oN
	ntk0KpHYNN0nxOTB2vAOyko6RShf0UVgv+aLo6TEVKP8N1YH8mZW1yHBfeoBEr1KU8RX90OGw9CKg
	tIjalOda9BHX96pN+juDcDL04KnsKa47SWeIwSs6GXtaPCnD3Kj8njWx0yzvH5uImdEM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187075-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187075: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=561cba38ff551383a628dc93e64ab0691cfc92bf
X-Osstest-Versions-That:
    xen=6979e17b3f8a18d2ba5dbd4f0623c4061dae0dfc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jul 2024 16:19:39 +0000

flight 187075 xen-unstable-smoke real [real]
flight 187086 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187075/
http://logs.test-lab.xenproject.org/osstest/logs/187086/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 187068

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  561cba38ff551383a628dc93e64ab0691cfc92bf
baseline version:
 xen                  6979e17b3f8a18d2ba5dbd4f0623c4061dae0dfc

Last test of basis   187068  2024-07-31 02:02:09 Z    0 days
Testing same since   187075  2024-07-31 11:02:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
commit 561cba38ff551383a628dc93e64ab0691cfc92bf
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Jul 31 12:41:22 2024 +0200

    x86/altcall: further refine clang workaround
    
    The current code in ALT_CALL_ARG() won't successfully workaround the clang
    code-generation issue if the arg parameter has a size that's not a power of 2.
    While there are no such sized parameters at the moment, improve the workaround
    to also be effective when such sizes are used.
    
    Instead of using a union with a long use an unsigned long that's first
    initialized to 0 and afterwards set to the argument value.
    
    Reported-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Suggested-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 1fc3f77113dd43b14fa7ef5936dcdba120c0b63f
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Jul 31 12:41:02 2024 +0200

    x86/dom0: fix restoring %cr3 and the mapcache override on PV build error
    
    One of the error paths in the PV dom0 builder section that runs on the guest
    page-tables wasn't restoring the Xen value of %cr3, neither removing the
    mapcache override.
    
    Fixes: 079ff2d32c3d ('libelf-loader: introduce elf_load_image')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 157c693e9a488fe125ffe7adfb807b783a7d1757
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 31 12:40:19 2024 +0200

    x86/HVM: get_pat_flags() is needed only by shadow code
    
    Therefore with SHADOW_PAGING=n this is better compiled out, to avoid
    leaving around unreachable/dead code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit ce6c6a697edf40763a8512369672a399821b17bf
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 31 12:39:35 2024 +0200

    public/x86: don't include common xen.h from arch-specific one
    
    No other arch-*.h does so, and arch-x86/xen.h really just takes the role
    of arch-x86_32.h and arch-x86_64.h (by those two forwarding there). With
    xen.h itself including the per-arch headers, doing so is also kind of
    backwards anyway, and just calling for problems. There's exactly one
    place where arch-x86/xen.h is included when really xen.h is meant (for
    wanting XEN_GUEST_HANDLE_64() to be made available, the default
    definition of which lives in the common xen.h).
    
    This then addresses a violation of Misra C:2012 Directive 4.10
    ("Precautions shall be taken in order to prevent the contents of a
    header file being included more than once").
    
    Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 96f35de69e593a9d9c348ae33ba17cf3cc5a9a79
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 31 12:36:14 2024 +0200

    x86+Arm: drop (rename) __virt_to_maddr() / __maddr_to_virt()
    
    There's no use of them anymore except in the definitions of the non-
    underscore-prefixed aliases.
    
    On Arm convert the (renamed) inline function to a macro.
    
    On x86 rename the inline functions, adjust the virt_to_maddr() #define,
    and purge the maddr_to_virt() one, thus eliminating a bogus cast which
    would have allowed the passing of a pointer type variable into
    maddr_to_virt() to go silently.
    
    No functional change intended.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit a5b8e72e9e2e59941cc76978725bb9ee04eba722
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 18 21:22:41 2024 +0100

    arch/domain: Clean up the idle domain remnants in arch_domain_create()
    
    With arch_domain_create() no longer being called with the idle domain, drop
    the last remaining logic.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit a259a658f203e3b17734c42f2ca6e75344e2de22
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 18 21:20:52 2024 +0100

    xen/domain: Simpliy domain_create() now the idle domain is complete earlier
    
    With x86 implementing arch_init_idle_domain(), there is no longer any need to
    call arch_domain_create() with the idle domain.
    
    Have the idle domain exit early with all other system domains.  Move the
    static-analysis ASSERT() earlier.  Then, remove the !is_idle_domain()
    protections around the majority of domain_create() and remove one level of
    indentation.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit fdb4d76ff3c44752d067fe598c0c021389030c63
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 18 21:12:31 2024 +0100

    x86/domain: Implement arch_init_idle_domain()
    
    The idle domain needs d->arch.ctxt_switch initialised on x86.  Implement the
    new arch_init_idle_domain() in order to do this.
    
    Intentionally remove cpu_policy's initialisation to ZERO_BLOCK_PTR.  It has
    never tripped since it's introduction, and is weird to have in isolation
    without a similar approach on other pointers.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 694ce812e7cb643236e8e677aca763c5f2aa4f4b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 18 20:54:05 2024 +0100

    xen/domain: Introduce arch_init_idle_domain()
    
    The idle domain causes a large amount of complexity in domain_create() because
    of x86's need to initialise d->arch.ctxt_switch in arch_domain_create().
    
    In order to address this, introduce an optional hook to perform extra
    initialisation of the idle domain.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

