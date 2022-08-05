Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBEB58A9FE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 13:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381065.615575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJvIJ-0007Pk-IL; Fri, 05 Aug 2022 11:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381065.615575; Fri, 05 Aug 2022 11:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJvIJ-0007MX-FI; Fri, 05 Aug 2022 11:15:07 +0000
Received: by outflank-mailman (input) for mailman id 381065;
 Fri, 05 Aug 2022 11:15:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJvII-0007MN-KI; Fri, 05 Aug 2022 11:15:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJvII-00069b-GD; Fri, 05 Aug 2022 11:15:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJvII-0005xd-9w; Fri, 05 Aug 2022 11:15:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJvII-00076V-9T; Fri, 05 Aug 2022 11:15:06 +0000
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
	bh=hGCW7nk6C6Y/JIK+GJIdqC2+eCBwe8/L4YMnNjz9A+4=; b=sGVfbjtNA5rGZK9QyulkWvvc3S
	/clvhv1wDyoNjjM2Ne6Q61WO3+R+StvuzFmHs+R+aTJ+0kQXklglZ+ZJb4CirKbj8aLB5gjCMy0mm
	m/EXvcBexG8qQ7c8mdAy30d3PnwgJetw++Uk1/9wr95lrFjBYlTRfW4wchnJAfMcwd9A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172160-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 172160: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=cc7410683db0a98758d03401b628ba8652c20c18
X-Osstest-Versions-That:
    xen=1f7543c039f6b9eb182f0395965b9d414ac774c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Aug 2022 11:15:06 +0000

flight 172160 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172160/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 172149
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  cc7410683db0a98758d03401b628ba8652c20c18
baseline version:
 xen                  1f7543c039f6b9eb182f0395965b9d414ac774c4

Last test of basis   172149  2022-08-04 22:03:06 Z    0 days
Testing same since   172160  2022-08-05 07:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   1f7543c039..cc7410683d  cc7410683db0a98758d03401b628ba8652c20c18 -> smoke

