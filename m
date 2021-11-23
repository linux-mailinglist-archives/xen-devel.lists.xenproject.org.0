Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EA45AFF4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 00:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229964.397590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpf1C-000247-6u; Tue, 23 Nov 2021 23:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229964.397590; Tue, 23 Nov 2021 23:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpf1C-00022C-2R; Tue, 23 Nov 2021 23:16:06 +0000
Received: by outflank-mailman (input) for mailman id 229964;
 Tue, 23 Nov 2021 23:16:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpf1B-000222-32; Tue, 23 Nov 2021 23:16:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpf1A-0006Ct-Sr; Tue, 23 Nov 2021 23:16:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpf1A-0003C0-IT; Tue, 23 Nov 2021 23:16:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mpf1A-0003RC-Hr; Tue, 23 Nov 2021 23:16:04 +0000
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
	bh=PQj0bqQ5uuvsdM4RSTOkDAsg30cL+ZvQ19XU9x2FvME=; b=2N031P70Xdsr81vlAIgonIqg15
	a0XtpVjfUGJ9ZDqJBAfJwq2/aJUmkllGAEgGxLC57pM54iZ2MI0vhRNnjwpBu7Xg9WVXlOTbnlorl
	/w6CijzJvzo1dew07Q5qaEATiK9CsYzY8qt3WnpeWc/Kf1+vVVLoIRuXV7v0nDdSzje0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166326-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 166326: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a5706b80f42e028c5153fc50734a1e86a99ff9d2
X-Osstest-Versions-That:
    xen=74a11c43fd7e074b1f77631b446dd2115eacb9e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Nov 2021 23:16:04 +0000

flight 166326 xen-unstable-smoke real [real]
flight 166330 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166326/
http://logs.test-lab.xenproject.org/osstest/logs/166330/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 166312

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a5706b80f42e028c5153fc50734a1e86a99ff9d2
baseline version:
 xen                  74a11c43fd7e074b1f77631b446dd2115eacb9e8

Last test of basis   166312  2021-11-23 13:00:27 Z    0 days
Testing same since   166326  2021-11-23 18:01:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>

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
commit a5706b80f42e028c5153fc50734a1e86a99ff9d2
Author: Ian Jackson <iwj@xenproject.org>
Date:   Tue Nov 23 16:55:32 2021 +0000

    Set version to 4.17: rerun autogen.sh
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit 8579d208ab78486717d396cb297f06526fe6b492
Author: Ian Jackson <iwj@xenproject.org>
Date:   Tue Nov 23 16:54:08 2021 +0000

    Set version to 4.17; 4.16 has branched
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit 4fe6e73a8cc8f3fa93a7c6a52a9a03b24e51ea18
Author: Ian Jackson <iwj@xenproject.org>
Date:   Tue Nov 23 16:51:47 2021 +0000

    Revert "Config.mk: pin QEMU_UPSTREAM_REVISION (prep for Xen 4.16 RC1)"
    
    This branch is unstable again now.
    
    This reverts commit c9ce6afbf2d7772f47fc572bb7fc9555724927ed.
(qemu changes not included)

