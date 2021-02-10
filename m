Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E44A3167FC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 14:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83600.155962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pWA-0005I0-G3; Wed, 10 Feb 2021 13:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83600.155962; Wed, 10 Feb 2021 13:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pWA-0005Hb-CF; Wed, 10 Feb 2021 13:26:54 +0000
Received: by outflank-mailman (input) for mailman id 83600;
 Wed, 10 Feb 2021 13:26:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9pW9-0005HT-EZ; Wed, 10 Feb 2021 13:26:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9pW9-0001bV-6j; Wed, 10 Feb 2021 13:26:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9pW8-0006bJ-Ug; Wed, 10 Feb 2021 13:26:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9pW8-000516-UE; Wed, 10 Feb 2021 13:26:52 +0000
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
	bh=FI3V4Ag77LGZqxdLIzIJdkoKKlUsE9Q3TrmDM1FaFqg=; b=YHw4F8U/YVgkpdl7iuLji2Aiu2
	PzX18k2odiryNgZMdeIu9awG9vpQwumlTAuM05jXSwDsTPgePgy3gY+ky2HOPyvo30WTlfyXFEbxO
	Agpc+iKsKmkYrQ53BnkM5kM/YkaDJf9tOeAqEM33/JZO6gB1njvwH+aUVD16hbHMFafs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159206-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159206: regressions - trouble: blocked/fail
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=20077d035224c6f3b3eef8b111b8b842635f2c40
X-Osstest-Versions-That:
    xen=687121f8a0e7c1ea1c4fa3d056637e5819342f14
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 13:26:52 +0000

flight 159206 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159206/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 159191
 build-arm64-xsm               6 xen-build                fail REGR. vs. 159191
 build-armhf                   6 xen-build                fail REGR. vs. 159191

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  20077d035224c6f3b3eef8b111b8b842635f2c40
baseline version:
 xen                  687121f8a0e7c1ea1c4fa3d056637e5819342f14

Last test of basis   159191  2021-02-09 23:00:29 Z    0 days
Testing same since   159206  2021-02-10 12:01:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit 20077d035224c6f3b3eef8b111b8b842635f2c40
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Fri Feb 5 12:53:27 2021 +0100

    tools/configure: add bison as mandatory
    
    Bison is now mandatory when the pvshim build is enabled in order to
    generate the Kconfig.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>

commit c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Thu Feb 4 10:38:33 2021 +0100

    autoconf: check endian.h include path
    
    Introduce an autoconf macro to check for the include path of certain
    headers that can be different between OSes.
    
    Use such macro to find the correct path for the endian.h header, and
    modify the users of endian.h to use the output of such check.
    
    Suggested-by: Ian Jackson <iwj@xenproject.org>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

