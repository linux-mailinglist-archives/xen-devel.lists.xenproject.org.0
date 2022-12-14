Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA464D16D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 21:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462608.720762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5YcA-0004aJ-OB; Wed, 14 Dec 2022 20:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462608.720762; Wed, 14 Dec 2022 20:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5YcA-0004X6-L0; Wed, 14 Dec 2022 20:44:30 +0000
Received: by outflank-mailman (input) for mailman id 462608;
 Wed, 14 Dec 2022 20:44:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5Yc9-0004Ww-TL; Wed, 14 Dec 2022 20:44:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5Yc9-00047L-Rk; Wed, 14 Dec 2022 20:44:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5Yc9-0004hb-E1; Wed, 14 Dec 2022 20:44:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5Yc9-0006DC-DY; Wed, 14 Dec 2022 20:44:29 +0000
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
	bh=YHC3mFUolw/7AAjNz9h4/mP+71iTTXvMDKCFLKQe3VY=; b=N8bDWwlzfWHhNYJHKULt6wj0HA
	8OmaEfVnpyu9fcD3Wses6yW46ISTpceJdI+S9p37GPsPCU/yoqEe3cT2ZPxLjxMQpmP++p/AEztjR
	yk4xG7TlI+2x81BA0YYnDaYAlWMdlMxx/llNF/knT5W/j6uLOcqYU8aokSzRaxC5hXTs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175215-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175215: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=549b042943a57b748ce80070d1174e4ff5b8ef0b
X-Osstest-Versions-That:
    xen=630dc3798e1d0d1b95f7be8b176563eb40e866e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Dec 2022 20:44:29 +0000

flight 175215 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175215/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 175173

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  549b042943a57b748ce80070d1174e4ff5b8ef0b
baseline version:
 xen                  630dc3798e1d0d1b95f7be8b176563eb40e866e5

Last test of basis   175173  2022-12-13 15:00:27 Z    1 days
Testing same since   175199  2022-12-14 12:01:52 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Viresh Kumar <viresh.kumar@linaro.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
commit 549b042943a57b748ce80070d1174e4ff5b8ef0b
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Wed Dec 14 12:04:26 2022 +0100

    drivers/char: support up to 1M BAR0 of xhci
    
    AMD's XHCI has BAR0 of 1M (compared to 64K on Intel). Map it as a whole
    (reserving more space in the fixmap). Make fixmap slot conditional on
    CONFIG_XHCI.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit dd54ea500be80f347402d75f3e4e7061e7db78d2
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed Dec 14 12:03:38 2022 +0100

    docs: add documentation for generic virtio devices
    
    This patch updates xl.cfg man page with details of generic Virtio device
    related information.
    
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

commit 953efa0b7b188458b18e4a727f3b1dfa77eacb61
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed Dec 14 12:03:25 2022 +0100

    xl: add support to parse generic virtio device
    
    This patch adds basic support for parsing generic Virtio backend.
    
    An example of domain configuration for mmio based Virtio I2C device is:
    virtio = ["type=virtio,device22,transport=mmio"]
    
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 43ba5202e2eebd350161a8db674bf928c3e6f859
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed Dec 14 12:03:09 2022 +0100

    libxl: add support for generic virtio device
    
    This patch adds basic support for configuring and assisting generic
    Virtio backends, which could run in any domain.
    
    An example of domain configuration for mmio based Virtio I2C device is:
    virtio = ["type=virtio,device22,transport=mmio"]
    
    To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
    region) and pass them to the backend and update guest device-tree to
    create a DT node for the Virtio devices.
    
    Add special support for I2C and GPIO devices, which require the
    "compatible" DT property to be set, among other device specific
    properties. Support for generic virtio devices is also added, which just
    need a MMIO node but not any special DT properties, for such devices the
    user needs to pass "virtio,device" in the "type" string.
    
    The parsing of generic virtio device configurations will be done in a
    separate commit.
    
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

commit db75092aea988b4be78c8273626f2ee40b4012b8
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Dec 14 12:02:21 2022 +0100

    tools/xenstore: enhance hashtable implementation
    
    Today it is possible to set a flag when calling hashtable_destroy() in
    order to specify whether the data associated with the hashtable entries
    should be freed or not. The keys of the entries will always be freed.
    
    Change that by replacing the flag of hashtable_destroy() by two flags
    for create_hashtable() which will specify whether the data and/or the
    key of each entry should be freed or not.
    
    This will enable users to have the key e.g. as part of the data.
    
    Add a new function hashtable_iterate() to call a user specified
    function for each entry in the hashtable.
    
    Add new primes to the primetable in order to support smaller sizes of
    the hashtable. The primes are selected according to:
    
    https://planetmath.org/goodhashtableprimes
    
    Update the URL in the source as the old one wasn't correct any longer.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit bb65cbd81caaaaf325d23f63b4c2165960563459
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Dec 14 12:02:04 2022 +0100

    tools/xenstore: preserve errno across corrupt()
    
    Let corrupt() preserve errno in order to be able to simplify error
    handling in future.
    
    This is rather easy as the errno value when entering corrupt() is
    saved already.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 6a0d1914f0b19742436367a0019602992573bd4b
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Dec 14 12:01:47 2022 +0100

    tools/xenstore: let tdb_logger() preserve errno
    
    tdb_logger() is called by TDB for logging errors. As errno is checked
    often after doing the logging, tdb_logger() should preserve errno.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 8d7acf3f7d8d2555c78421dced45bc49f79ae806
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Wed Dec 14 12:00:35 2022 +0100

    EFI: relocate the ESRT when booting via multiboot2
    
    This was missed in the initial patchset.
    
    Move efi_relocate_esrt() up to avoid adding a forward declaration.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

