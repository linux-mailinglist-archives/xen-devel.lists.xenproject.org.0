Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E787C059
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693331.1081274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkn6D-0003lr-9T; Thu, 14 Mar 2024 15:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693331.1081274; Thu, 14 Mar 2024 15:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkn6D-0003k4-6P; Thu, 14 Mar 2024 15:34:29 +0000
Received: by outflank-mailman (input) for mailman id 693331;
 Thu, 14 Mar 2024 15:34:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkn6B-0003js-Py; Thu, 14 Mar 2024 15:34:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkn6B-0002to-L5; Thu, 14 Mar 2024 15:34:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkn6B-0000OY-AJ; Thu, 14 Mar 2024 15:34:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rkn6B-00075v-9t; Thu, 14 Mar 2024 15:34:27 +0000
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
	bh=e+uL2BeGgTn8TQeUTG4L6L6xC6PJQve2HBYVZKghIlw=; b=k9bCXVKv6lhFvTIAhWBXwlh0h0
	YjCURaQRpyj3AlxyIipXbrFxEaFfO6kaGbFZTJCWbll9slpieQtWB6vjmQfRIcw1mLdFCRXQE8GPY
	LfN+ui3XCzojRipRVEdQpA8zKmDbrykvDRYMFg54Z1/SLeaujkwH/tZzDvUKZ7g1laEI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185033-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185033: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=af7fed3fdf82981ebbb09628b278df957569333d
X-Osstest-Versions-That:
    xen=4dc9a8b0606770dc9c6be20ff5a74a9af5fcba70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Mar 2024 15:34:27 +0000

flight 185033 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185033/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  af7fed3fdf82981ebbb09628b278df957569333d
baseline version:
 xen                  4dc9a8b0606770dc9c6be20ff5a74a9af5fcba70

Last test of basis   185025  2024-03-14 01:00:28 Z    0 days
Testing same since   185033  2024-03-14 13:02:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Paul Durrant <pdurrant@amazon.com>
  Simone Ballarin <simone.ballarin@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Vaishali Thakkar <vaishali.thakkar@vates.tech>

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
   4dc9a8b060..af7fed3fdf  af7fed3fdf82981ebbb09628b278df957569333d -> smoke

