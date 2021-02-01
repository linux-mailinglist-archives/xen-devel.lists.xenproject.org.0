Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6330AFD9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 19:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80096.146232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6eMz-00056K-Ss; Mon, 01 Feb 2021 18:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80096.146232; Mon, 01 Feb 2021 18:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6eMz-00055s-OR; Mon, 01 Feb 2021 18:56:17 +0000
Received: by outflank-mailman (input) for mailman id 80096;
 Mon, 01 Feb 2021 18:56:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6eMz-00055k-16; Mon, 01 Feb 2021 18:56:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6eMy-0000cT-PE; Mon, 01 Feb 2021 18:56:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6eMy-0003ad-HA; Mon, 01 Feb 2021 18:56:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l6eMy-0004m3-Gd; Mon, 01 Feb 2021 18:56:16 +0000
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
	bh=YS3AUZBlYLDRY1OKHnqbHh7XGTphZ0mVLS49H5D+zIk=; b=iIKgUfwYBM5U9ZT/qCOEjyCnTn
	U1Y8A9KRbbX4A/Lh9QS1Keprx439k3nWIt5nv+PsB4/eUmTOIF+JV2OjpK7XBsce4WU6X0WinBd+C
	TXtflDA4ohuF5bBXTnRw631cYaH0JCYuwxjqD285xSIPebFN/NnQBO5o7w5KVgon2P+U=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158892-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158892: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:<job status>:broken:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:host-install(5):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=419cd07895891c6642f29085aee07be72413f08c
X-Osstest-Versions-That:
    xen=9dc687f155a57216b83b17f9cde55dd43e06b0cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Feb 2021 18:56:16 +0000

flight 158892 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158892/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm         <job status>                 broken
 test-arm64-arm64-xl-xsm       5 host-install(5)        broken REGR. vs. 158804

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  419cd07895891c6642f29085aee07be72413f08c
baseline version:
 xen                  9dc687f155a57216b83b17f9cde55dd43e06b0cd

Last test of basis   158804  2021-01-30 04:00:24 Z    2 days
Testing same since   158892  2021-02-01 16:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Manuel Bouyer <bouyer@netbsd.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      broken  
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

broken-job test-arm64-arm64-xl-xsm broken
broken-step test-arm64-arm64-xl-xsm host-install(5)

Not pushing.

------------------------------------------------------------
commit 419cd07895891c6642f29085aee07be72413f08c
Author: Ian Jackson <iwj@xenproject.org>
Date:   Mon Feb 1 15:18:36 2021 +0000

    xenpmd.c: Remove hard tab
    
    bbed98e7cedc "xenpmd.c: use dynamic allocation" had a hard tab.
    I thought we had fixed that and I thought I had checked.
    Remove it now.
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit bbed98e7cedcd5072671c21605330075740382d3
Author: Manuel Bouyer <bouyer@netbsd.org>
Date:   Sat Jan 30 19:27:10 2021 +0100

    xenpmd.c: use dynamic allocation
    
    On NetBSD, d_name is larger than 256, so file_name[284] may not be large
    enough (and gcc emits a format-truncation error).
    Use asprintf() instead of snprintf() on a static on-stack buffer.
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    
    Plus
    
    define GNU_SOURCE for asprintf()
    
    Harmless on NetBSD.
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

