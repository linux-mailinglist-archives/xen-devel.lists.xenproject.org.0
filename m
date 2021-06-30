Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053513B8079
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 11:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148171.273772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyWvm-0004zP-Am; Wed, 30 Jun 2021 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148171.273772; Wed, 30 Jun 2021 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyWvm-0004wJ-6Q; Wed, 30 Jun 2021 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 148171;
 Wed, 30 Jun 2021 09:54:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyWvl-0004vt-1N; Wed, 30 Jun 2021 09:54:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyWvk-0002T3-Od; Wed, 30 Jun 2021 09:54:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyWvk-0006A1-Dl; Wed, 30 Jun 2021 09:54:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lyWvk-0005xY-DF; Wed, 30 Jun 2021 09:54:52 +0000
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
	bh=CWETca5rl/z0qlAlEtUNVt+UXHjSJIIYjb/8+WJ35Bg=; b=bex8i+SKe8LQxa54vH4QUvqkyO
	Al0MrAs65LcTT3VgSP5+qhAC/nHd9RcyBtD29vRpIXF2fqUKLbsl/EaejFE+36MQjuzpicQjz0RJF
	EjZTO/3H7EDEZnVZ1YOZsD8HkzbG+kDQDkf8GWE4RNJsj+Mo54w7JgwHE1cCwsiW1tQw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163196-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163196: all pass - PUSHED
X-Osstest-Versions-This:
    xen=f95b7b37cfc6d4613721df9357090d14712013c0
X-Osstest-Versions-That:
    xen=bb11edcec1a953ce590da797b0d005cd60f21e83
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Jun 2021 09:54:52 +0000

flight 163196 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163196/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f95b7b37cfc6d4613721df9357090d14712013c0
baseline version:
 xen                  bb11edcec1a953ce590da797b0d005cd60f21e83

Last test of basis   163147  2021-06-27 09:18:28 Z    3 days
Testing same since   163196  2021-06-30 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>

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
   bb11edcec1..f95b7b37cf  f95b7b37cfc6d4613721df9357090d14712013c0 -> coverity-tested/smoke

