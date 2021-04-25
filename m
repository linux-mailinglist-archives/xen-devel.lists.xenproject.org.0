Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F2636A654
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 11:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117059.222966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1labNr-0000RG-Us; Sun, 25 Apr 2021 09:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117059.222966; Sun, 25 Apr 2021 09:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1labNr-0000Qm-QT; Sun, 25 Apr 2021 09:48:59 +0000
Received: by outflank-mailman (input) for mailman id 117059;
 Sun, 25 Apr 2021 09:48:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1labNq-0000Qe-D8; Sun, 25 Apr 2021 09:48:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1labNq-0006rm-40; Sun, 25 Apr 2021 09:48:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1labNp-00040r-SG; Sun, 25 Apr 2021 09:48:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1labNp-00036V-Rl; Sun, 25 Apr 2021 09:48:57 +0000
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
	bh=OoLRm7Pm04gCdGKmAOVndC18agwgnwhp2fURrmMVP34=; b=EGlWrWOxRbnAosgyEPLG6WTOky
	L44TZLzWTNeF+8TKpzQlpAAoQYlxCPxfyoR6OTOyodouMi4JSpejbrVOAwGjxD4cxapqvjUgf/63C
	x37pxh6u9EcQcT7H7KNg/3UWyo6voPrI68DBUZJAp5oPSqbHijs5MNwI7tO8isA/P5fI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161447-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161447: all pass - PUSHED
X-Osstest-Versions-This:
    xen=bea65a212c0581520203b6ad0d07615693f42f73
X-Osstest-Versions-That:
    xen=aaa3eafb3ba8b544d19ca41cda1477640b22b8fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 25 Apr 2021 09:48:57 +0000

flight 161447 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161447/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  bea65a212c0581520203b6ad0d07615693f42f73
baseline version:
 xen                  aaa3eafb3ba8b544d19ca41cda1477640b22b8fc

Last test of basis   161350  2021-04-21 09:19:38 Z    4 days
Testing same since   161447  2021-04-25 09:19:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  Dario Faggioli <dfaggioli@suse.com>
  Doug Goldstein <cardoe@cardoe.com>
  Hongyan Xia <hongyxia@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wei.liu2@citrix.com>
  Wei Liu <wl@xen.org>

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
   aaa3eafb3b..bea65a212c  bea65a212c0581520203b6ad0d07615693f42f73 -> coverity-tested/smoke

