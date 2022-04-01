Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8E4EE50C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297127.506032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na4tA-0002zp-4f; Fri, 01 Apr 2022 00:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297127.506032; Fri, 01 Apr 2022 00:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na4tA-0002xl-1J; Fri, 01 Apr 2022 00:11:40 +0000
Received: by outflank-mailman (input) for mailman id 297127;
 Fri, 01 Apr 2022 00:11:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1na4t7-0002xb-U7; Fri, 01 Apr 2022 00:11:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1na4t7-0001sr-Rp; Fri, 01 Apr 2022 00:11:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1na4t7-0004sr-HF; Fri, 01 Apr 2022 00:11:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1na4t7-0003X1-Gk; Fri, 01 Apr 2022 00:11:37 +0000
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
	bh=IXz+cfjy7YGXKrQtaBnmU0xlH/ufCWt7Hrnsq09YIds=; b=QAyiBwkX46IpEI957Yyc+xj2UO
	f117LXZ7aL51W0lxUjYpz4BDRLI/W4A3N0EuXpr8rSHNH73jM9k89vTTDZFywJSo4jdXxxJMzEEsP
	PGlkXPOChh9hdsjM2C8x/amtFaYnoOmOj94of5pZakJFh9HPi+6D2Qx63MeAXbO2jl8U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169078-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169078: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e7cfcdc6719d586eb7cdb62d40275a7d17fe6760
X-Osstest-Versions-That:
    xen=8a87b9a0fb0564f9d68f0be0a0d1a17c34117b8b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Apr 2022 00:11:37 +0000

flight 169078 xen-unstable-smoke real [real]
flight 169085 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169078/
http://logs.test-lab.xenproject.org/osstest/logs/169085/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 169064

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e7cfcdc6719d586eb7cdb62d40275a7d17fe6760
baseline version:
 xen                  8a87b9a0fb0564f9d68f0be0a0d1a17c34117b8b

Last test of basis   169064  2022-03-31 09:00:34 Z    0 days
Testing same since   169078  2022-03-31 19:01:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jason Andryuk <jandryuk@gmail.com>

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
commit e7cfcdc6719d586eb7cdb62d40275a7d17fe6760
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Mar 30 14:17:22 2022 -0400

    libxl: constify libxl__stubdomain_is_linux
    
    libxl__stubdomain_is_linux can take a const pointer, so make the change.
    
    This isn't an issue in-tree, but was found with an OpenXT patch where it
    was called with only const libxl_domain_build_info available.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit e45ad0b1b0bd6a43f59aaf4a6f86d88783c630e5
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Mar 30 14:17:41 2022 -0400

    xl: Fix global pci options
    
    commit babde47a3fed "introduce a 'passthrough' configuration option to
    xl.cfg..." moved the pci list parsing ahead of the global pci option
    parsing.  This broke the global pci configuration options since they
    need to be set first so that looping over the pci devices assigns their
    values.
    
    Move the global pci options ahead of the pci list to restore their
    function.
    
    Fixes: babde47a3fed ("introduce a 'passthrough' configuration option to xl.cfg...")
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

