Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2119772CE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 22:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797803.1207860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soqYw-0000ZZ-TT; Thu, 12 Sep 2024 20:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797803.1207860; Thu, 12 Sep 2024 20:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soqYw-0000WZ-QA; Thu, 12 Sep 2024 20:37:10 +0000
Received: by outflank-mailman (input) for mailman id 797803;
 Thu, 12 Sep 2024 20:37:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soqYv-0000WP-9J; Thu, 12 Sep 2024 20:37:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soqYv-000565-6X; Thu, 12 Sep 2024 20:37:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soqYu-0002wF-S8; Thu, 12 Sep 2024 20:37:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soqYu-0000QF-Rj; Thu, 12 Sep 2024 20:37:08 +0000
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
	bh=hg2DlC07fLFy9knL79ZIQ/qbtjl9B3zcdOPAeSwSUPs=; b=Aq8ZQsFrTeApRPMBeOynyI9KhK
	WBbCqYiChla6ayZHS8y81RpHqdQCdFyfmfcCKCr8qXZDOeV7Ew5a3i1d9v9aOfltJ7KpZ4ASM3J63
	eDSzX1nz/XtRMckvp3yzgpufYzVSYr88mfqLox3Lkna1h36pc8aCgsBbK3ZpWQZS6UII=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187678-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187678: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ec185ec23938d2b932198a7eca2e06e3dc2601f5
X-Osstest-Versions-That:
    xen=221f2748e8dabe8361b8cdfcffbeab9102c4c899
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2024 20:37:08 +0000

flight 187678 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187678/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ec185ec23938d2b932198a7eca2e06e3dc2601f5
baseline version:
 xen                  221f2748e8dabe8361b8cdfcffbeab9102c4c899

Last test of basis   187675  2024-09-12 13:04:06 Z    0 days
Testing same since   187678  2024-09-12 17:02:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   221f2748e8..ec185ec239  ec185ec23938d2b932198a7eca2e06e3dc2601f5 -> smoke

