Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F53B52BC
	for <lists+xen-devel@lfdr.de>; Sun, 27 Jun 2021 11:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147661.272403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxROh-0006Vn-Hw; Sun, 27 Jun 2021 09:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147661.272403; Sun, 27 Jun 2021 09:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxROh-0006TY-Dp; Sun, 27 Jun 2021 09:48:15 +0000
Received: by outflank-mailman (input) for mailman id 147661;
 Sun, 27 Jun 2021 09:48:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxROg-0006TO-36; Sun, 27 Jun 2021 09:48:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxROf-0003xv-Ub; Sun, 27 Jun 2021 09:48:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lxROf-0002w6-Nh; Sun, 27 Jun 2021 09:48:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lxROf-0003XD-NC; Sun, 27 Jun 2021 09:48:13 +0000
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
	bh=VZceQgZuEA8DPNnUCHmG6ixq76Zldh+TVZ+k4xiwTGE=; b=JUdrzpZm9YNTuHSpTO3f0l1TcT
	c5CI1KkOsWGQCxRpenF1eKHqPOUxKhiwY98pKMwqGv23EHlXAjPmP1r72O7iD0wcl4v4FDJ2bkXlE
	VbaWiCU63mnqoMJv7HzWDaEIFoNcyk+ap555XpJLgPN0oAekOrU86tNKgXeGJSAyBcHI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163147-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163147: all pass - PUSHED
X-Osstest-Versions-This:
    xen=bb11edcec1a953ce590da797b0d005cd60f21e83
X-Osstest-Versions-That:
    xen=c7691f5e340f3b579d40c77548f63133cdf5aac7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Jun 2021 09:48:13 +0000

flight 163147 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163147/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  bb11edcec1a953ce590da797b0d005cd60f21e83
baseline version:
 xen                  c7691f5e340f3b579d40c77548f63133cdf5aac7

Last test of basis   162992  2021-06-23 09:20:40 Z    4 days
Testing same since   163147  2021-06-27 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   c7691f5e34..bb11edcec1  bb11edcec1a953ce590da797b0d005cd60f21e83 -> coverity-tested/smoke

