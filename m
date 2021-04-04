Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E63537A8
	for <lists+xen-devel@lfdr.de>; Sun,  4 Apr 2021 11:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105148.201391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSzLw-0007Up-Ol; Sun, 04 Apr 2021 09:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105148.201391; Sun, 04 Apr 2021 09:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSzLw-0007UQ-KK; Sun, 04 Apr 2021 09:47:32 +0000
Received: by outflank-mailman (input) for mailman id 105148;
 Sun, 04 Apr 2021 09:47:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lSzLv-0007UI-7k; Sun, 04 Apr 2021 09:47:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lSzLu-0007Ed-VD; Sun, 04 Apr 2021 09:47:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lSzLu-0006VO-LY; Sun, 04 Apr 2021 09:47:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lSzLu-0003QY-L3; Sun, 04 Apr 2021 09:47:30 +0000
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
	bh=GUHguF6xzWVNRVhlyZffUcog/ErQ8tJ2oMuP0u9Ev8o=; b=k26gNmjBLX7KKLP6PIvb7kKdwx
	xqdGQPx6CxhLDgFk9sE7A2kcaOIjIhzUzdyMwlZnv3Y2Vj0BuUv5h0w39NlAATXmm7lqLYJlAntOW
	eAAdkaoykwxfjhuf42/oo0WqbrkrMpUT8lc/PzNi0oZXSfc4vHNpWsCYYnHWdLqKGd4k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160721: all pass - PUSHED
X-Osstest-Versions-This:
    xen=0435784cc75dcfef3b5f59c29deb1dbb84265ddb
X-Osstest-Versions-That:
    xen=90629587e16e2efdb61da77f25c25fba3c4a5fd7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Apr 2021 09:47:30 +0000

flight 160721 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160721/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  0435784cc75dcfef3b5f59c29deb1dbb84265ddb
baseline version:
 xen                  90629587e16e2efdb61da77f25c25fba3c4a5fd7

Last test of basis   160582  2021-03-31 09:18:34 Z    4 days
Testing same since   160721  2021-04-04 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
  Norbert Manthey <nmanthey@amazon.de>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

jobs:
 coverity-amd64                                               pass    


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
   90629587e1..0435784cc7  0435784cc75dcfef3b5f59c29deb1dbb84265ddb -> coverity-tested/smoke

