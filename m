Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140514FF965
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 16:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304197.518795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neeIZ-0000pH-5D; Wed, 13 Apr 2022 14:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304197.518795; Wed, 13 Apr 2022 14:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neeIZ-0000mh-2C; Wed, 13 Apr 2022 14:48:47 +0000
Received: by outflank-mailman (input) for mailman id 304197;
 Wed, 13 Apr 2022 14:48:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1neeIX-0000mX-CE; Wed, 13 Apr 2022 14:48:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1neeIX-0003z0-9g; Wed, 13 Apr 2022 14:48:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1neeIW-0003ca-UF; Wed, 13 Apr 2022 14:48:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1neeIW-0001uh-Tm; Wed, 13 Apr 2022 14:48:44 +0000
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
	bh=onCljo/lN+86LB1EUfNOEZe3Zwz1UapJtFTfmbMjHgk=; b=hzkuSGPClJg+dMy4R1rzMXOF3+
	aoQHKBbrIEOKv8aCNMsdVVEavUjXBajqh9lKBaBe/CHQzVkV2LuPvPmXm/PRcZm07Rrix0QMZtx5R
	2CLQKDUcOmqViWABn5suBof4oCs0Qvl5juwvX/shZmsja0EbUYlHX9n/aELlfURJRXPQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169361-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169361: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e509b5f932608e74deac96048b28a5e9b210c647
X-Osstest-Versions-That:
    xen=5b752808ff37b7c819a26fd76329ef329c42774f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Apr 2022 14:48:44 +0000

flight 169361 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169361/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 169320

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e509b5f932608e74deac96048b28a5e9b210c647
baseline version:
 xen                  5b752808ff37b7c819a26fd76329ef329c42774f

Last test of basis   169320  2022-04-12 02:00:26 Z    1 days
Testing same since   169361  2022-04-13 11:01:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Ross Lagerwall <ross.lagerwall@citrix.com> # livepatch

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
commit e509b5f932608e74deac96048b28a5e9b210c647
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 13 12:36:03 2022 +0200

    IOMMU: log appropriate SBDF
    
    To handle phantom devices, several functions are passed separate "devfn"
    arguments besides a PCI device. In such cases we want to log the phantom
    device's coordinates instead of the main one's. (Note that not all of
    the instances being changed are fallout from the referenced commit.)
    
    Fixes: 1ee1441835f4 ("print: introduce a format specifier for pci_sbdf_t")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit e687e72174b73bb1d23ff79f9ef580201243d35f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 13 12:35:17 2022 +0200

    AMD/IOMMU: replace a few PCI_BDF2()
    
    struct pci_dev has the wanted value directly available; use it. Note
    that this fixes a - imo benign - mistake in reassign_device(): The unity
    map removal ought to be based on the passed in devfn (as is the case on
    the establishing side). This is benign because the mappings would be
    removed anyway a little later, when the "main" device gets processed.
    While there also limit the scope of two variables in that function.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 7115fa562fe79c8a8733f6b821d4eea62ed56516
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Apr 13 12:33:21 2022 +0200

    build: adding out-of-tree support to the xen build
    
    This implement out-of-tree support, there's two ways to create an
    out-of-tree build tree (after that, `make` in that new directory
    works):
        make O=build
        mkdir build; cd build; make -f ../Makefile
    also works with an absolute path for both.
    
    This implementation only works if the source tree is clean, as we use
    VPATH.
    
    This patch copies most new code with handling out-of-tree build from
    Linux v5.12.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Tested-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com> # livepatch
(qemu changes not included)

