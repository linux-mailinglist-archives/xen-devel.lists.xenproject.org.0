Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507C2FA502
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69810.125082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Wgk-00050g-Dm; Mon, 18 Jan 2021 15:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69810.125082; Mon, 18 Jan 2021 15:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Wgk-000505-7w; Mon, 18 Jan 2021 15:43:30 +0000
Received: by outflank-mailman (input) for mailman id 69810;
 Mon, 18 Jan 2021 15:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Wgj-0004zx-5q; Mon, 18 Jan 2021 15:43:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Wgi-0004PP-Sx; Mon, 18 Jan 2021 15:43:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Wgi-00073n-LJ; Mon, 18 Jan 2021 15:43:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Wgi-0001cF-Kn; Mon, 18 Jan 2021 15:43:28 +0000
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
	bh=rUUalXhtSzZhZNT8zhglsKR6Pcajm8kChwduLHNU+AE=; b=xcDcB49QnzMVi82q2o51trROdm
	dBzCD3ASwZFJciOEiJROa2CgYZT4Oyx47CRyzbqNWo7UhQEZ5BBhqgHYCc8vHBYt8GAGkvbT7xeMo
	6Ps5V6xThFBTh7u7LOY7lc3qH3pMV7GsufrPz8zbx4XX3v7E92DbqInRMIui/MZu0fJQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158488-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158488: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b066d57183548ae199acdf6a0022e012e324a7b2
X-Osstest-Versions-That:
    xen=db9c4ad1b1abaef3c38027b9b2700d9250d13125
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Jan 2021 15:43:28 +0000

flight 158488 xen-unstable-smoke real [real]
flight 158490 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/158488/
http://logs.test-lab.xenproject.org/osstest/logs/158490/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 158453

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b066d57183548ae199acdf6a0022e012e324a7b2
baseline version:
 xen                  db9c4ad1b1abaef3c38027b9b2700d9250d13125

Last test of basis   158453  2021-01-15 23:00:25 Z    2 days
Testing same since   158488  2021-01-18 12:02:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
commit b066d57183548ae199acdf6a0022e012e324a7b2
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jan 18 12:14:19 2021 +0100

    gnttab: consolidate pin-to-status syncing
    
    Forever since the fix for XSA-230 the 2nd of the comments ahead of
    fixup_status_for_copy_pin() has been stale - there's nothing specific to
    transitive grants there anymore.
    
    Move the function up, drop the "copy" part from its name again, add a
    "readonly" parameter, and use it also on other paths having decremented
    one (or not having got to increment any) of the pin counts.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 8cec5d065c243e54cae97aaa14b0de447883c278
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jan 18 12:13:42 2021 +0100

    gnttab: adjust pin count overflow checks
    
    It's at least odd to check counters which aren't going to be
    incremented, resulting in failure just because prior operations may have
    reached the refcount limit. And it's also not helpful to use open-coded
    literal numbers in these checks.
    
    Calculate the increment values first and derive from them the mask to
    use in the checks.
    
    Also move the pin count checks ahead of the calculation of the status
    (and for copy also sha2) pointers: They're not needed in the failure
    cases, and this way the compiler may also have an easier time keeping
    the variables at least transiently in registers for the subsequent uses.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d6627cf1b63ce57a6a7e2c1800dbc50eed742c32
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jan 18 12:12:23 2021 +0100

    x86/Dom0: support zstd compressed kernels
    
    Taken from Linux at commit 1c4dd334df3a ("lib: decompress_unzstd: Limit
    output size") for unzstd.c (renamed from decompress_unzstd.c) and
    36f9ff9e03de ("lib: Fix fall-through warnings for Clang") for zstd/,
    with bits from linux/zstd.h merged into suitable other headers.
    
    To limit the editing necessary, introduce ptrdiff_t.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 35d2960ae65f28106fdc5c2130f5f08fadca0e4c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jan 18 12:10:34 2021 +0100

    lib: introduce xxhash
    
    Taken from Linux at commit d89775fc929c ("lib/: replace HTTP links with
    HTTPS ones"), but split into separate 32-bit and 64-bit sources, since
    the immediate consumer (zstd) will need only the latter.
    
    Note that the building of this code is restricted to x86 for now because
    of the need to sort asm/unaligned.h for Arm.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 7c9f81687ad611515474b1c17afc2f79f19faef5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jan 18 12:09:13 2021 +0100

    introduce unaligned.h
    
    Rather than open-coding commonly used constructs in yet more places when
    pulling in zstd decompression support (and its xxhash prereq), pull out
    the custom bits into a commonly used header (for the hypervisor build;
    the tool stack and stubdom builds of libxenguest will still remain in
    need of similarly taking care of). For now this is limited to x86, where
    custom logic isn't needed (considering this is going to be used in init
    code only, even using alternatives patching to use MOVBE doesn't seem
    worthwhile).
    
    For Arm64 with CONFIG_ACPI=y (due to efi-dom0.c's re-use of xz/crc32.c)
    drop the not really necessary inclusion of xz's private.h.
    
    No change in generated code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

