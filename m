Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127009391FC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762230.1172362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVvCv-0004wW-Pe; Mon, 22 Jul 2024 15:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762230.1172362; Mon, 22 Jul 2024 15:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVvCv-0004u5-N1; Mon, 22 Jul 2024 15:44:13 +0000
Received: by outflank-mailman (input) for mailman id 762230;
 Mon, 22 Jul 2024 15:44:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVvCu-0004tu-Je; Mon, 22 Jul 2024 15:44:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVvCu-0001M7-Al; Mon, 22 Jul 2024 15:44:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVvCt-0008Mk-Vw; Mon, 22 Jul 2024 15:44:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sVvCt-0002eh-VL; Mon, 22 Jul 2024 15:44:11 +0000
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
	bh=7GuIqObrZG37SDdYb5smOXzRHZKHWZaQq4buPShvlXg=; b=SN5N+aOUF////yDXtn3g5tRwuK
	/4HtuDkp713LO8dnd3gS/4XD+zRw4nKA352YXS5LeOqrNCcrrCc0nX+mz8fnhJIBHUKdlCyKdo3xT
	mrmggaVKlfFsmFS6xTv0wKFeAbIenZa44b453ZQ8BnsiP30EMJHlBGYMPkf89oS7JYpk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186940-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186940: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e44f33ccddc20079d9a22e1f0659c88fde0f4eb2
X-Osstest-Versions-That:
    xen=e5182b40cf4bbb89292d66b8f3047a9ee913a90a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Jul 2024 15:44:11 +0000

flight 186940 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186940/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e44f33ccddc20079d9a22e1f0659c88fde0f4eb2
baseline version:
 xen                  e5182b40cf4bbb89292d66b8f3047a9ee913a90a

Last test of basis   186913  2024-07-19 14:00:22 Z    3 days
Failing since        186935  2024-07-22 08:00:25 Z    0 days    2 attempts
Testing same since   186940  2024-07-22 12:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Matthew Barnes <matthew.barnes@cloud.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Victor Lira <victorm.lira@amd.com>

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
   e5182b40cf..e44f33ccdd  e44f33ccddc20079d9a22e1f0659c88fde0f4eb2 -> smoke

