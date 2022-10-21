Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D4C607B9A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427805.677228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oluNZ-0001cG-QA; Fri, 21 Oct 2022 15:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427805.677228; Fri, 21 Oct 2022 15:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oluNZ-0001ZW-Md; Fri, 21 Oct 2022 15:56:13 +0000
Received: by outflank-mailman (input) for mailman id 427805;
 Fri, 21 Oct 2022 15:56:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oluNY-0001ZM-3n; Fri, 21 Oct 2022 15:56:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oluNY-0005p8-2j; Fri, 21 Oct 2022 15:56:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oluNX-00074i-BG; Fri, 21 Oct 2022 15:56:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oluNX-0001GR-Ao; Fri, 21 Oct 2022 15:56:11 +0000
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
	bh=U8aq+vHf/xjcWPQwilDcbB6GocW3Pyyhcq/WdzVuMH0=; b=n6X9gU2OwPLjVIYOI/p8UqJc7u
	WJkSmYR+B6QmkzK3kha2jmg5mD/cfLHMiMJ1w0ajyzBM+6TQlDpv2H9sTVXX1rEDu/sVu+Y1WzsV4
	Ie4Y8KVKMnna6rIUbJq+Is+qUi7gtZ1SE8W/SrFmmVbY8jWX3970xo0h6qyR21OER3QA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174201-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 174201: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=73c62927f64ecb48f27d06176befdf76b879f340
X-Osstest-Versions-That:
    xen=f838b956779ff8a0b94636462f3c6d95c3adeb73
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Oct 2022 15:56:11 +0000

flight 174201 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174201/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  73c62927f64ecb48f27d06176befdf76b879f340
baseline version:
 xen                  f838b956779ff8a0b94636462f3c6d95c3adeb73

Last test of basis   174192  2022-10-21 10:00:58 Z    0 days
Testing same since   174201  2022-10-21 13:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stewart Hildebrand <stewart.hildebrand@amd.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
   f838b95677..73c62927f6  73c62927f64ecb48f27d06176befdf76b879f340 -> smoke

