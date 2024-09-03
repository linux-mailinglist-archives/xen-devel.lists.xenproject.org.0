Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF996A22A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789366.1198970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVNf-0004To-Ls; Tue, 03 Sep 2024 15:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789366.1198970; Tue, 03 Sep 2024 15:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVNf-0004Qd-Id; Tue, 03 Sep 2024 15:23:43 +0000
Received: by outflank-mailman (input) for mailman id 789366;
 Tue, 03 Sep 2024 15:23:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slVNd-0004QT-Re; Tue, 03 Sep 2024 15:23:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slVNd-0007iE-Fm; Tue, 03 Sep 2024 15:23:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slVNc-0003JJ-Vw; Tue, 03 Sep 2024 15:23:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slVNc-0006tc-VQ; Tue, 03 Sep 2024 15:23:40 +0000
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
	bh=WkBnj+Eoo5pTkdI6hzppHs8dSlJulmfT8z69ItDPdpo=; b=xJfrzYJznJD3Mh/3DMB4R92SWF
	R0cdNbcEjBtbAeO37F7jAh2+PZsnk86jpKBTZmY8htBvN8+pKgwB1C7jMNVJ9JmzzF8coy2C/FhaO
	bKqkFBm+YMaQqBmUSk0MNscH4eOxROq/8jtBjFhMytoQcEBsDwyASaywhr4BfG3B2PNw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187474-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187474: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=87b307ff1de8f5f261eb7c9b94d370fc08e1983e
X-Osstest-Versions-That:
    xen=1e6bb29b03680a9d0e12f14c4d406a0d67317ea7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Sep 2024 15:23:40 +0000

flight 187474 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187474/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  87b307ff1de8f5f261eb7c9b94d370fc08e1983e
baseline version:
 xen                  1e6bb29b03680a9d0e12f14c4d406a0d67317ea7

Last test of basis   187458  2024-09-02 17:00:22 Z    0 days
Testing same since   187474  2024-09-03 11:02:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Javi Merino <javi.merino@cloud.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   1e6bb29b03..87b307ff1d  87b307ff1de8f5f261eb7c9b94d370fc08e1983e -> smoke

