Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94373FAA88
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 11:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174599.318374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKHTj-00012T-Jj; Sun, 29 Aug 2021 09:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174599.318374; Sun, 29 Aug 2021 09:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKHTj-00010I-Dm; Sun, 29 Aug 2021 09:51:51 +0000
Received: by outflank-mailman (input) for mailman id 174599;
 Sun, 29 Aug 2021 09:51:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKHTi-000108-0i; Sun, 29 Aug 2021 09:51:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKHTh-0002Xd-Rm; Sun, 29 Aug 2021 09:51:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKHTh-0000EB-JZ; Sun, 29 Aug 2021 09:51:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKHTh-0001TB-J6; Sun, 29 Aug 2021 09:51:49 +0000
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
	bh=MELq+2KImTyvp4Piw6w0k55vc2e5S8x8siPtQZARKho=; b=wMfLB3oBOSpWIgLXNVFoCYzY4P
	BiYqGsQG9kBGdI0rbkkX5MbmymkySknnQTUYwQnkwI6UHzAnrPKLr5xZnvfuC8pmDOThCBS+hl7EH
	C+fZBsORKG0D9yoaPrYZPbkJvxBTFZ0L9EFJRegeldC/0bNWI98yeznwBjs9e2bZzrdo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164595-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164595: all pass - PUSHED
X-Osstest-Versions-This:
    xen=8064488062641ae505b2a7369611c38057a7788b
X-Osstest-Versions-That:
    xen=a931e8e64af07bd333a31f3b71a3f8f3e7910857
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Aug 2021 09:51:49 +0000

flight 164595 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164595/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  8064488062641ae505b2a7369611c38057a7788b
baseline version:
 xen                  a931e8e64af07bd333a31f3b71a3f8f3e7910857

Last test of basis   164478  2021-08-25 09:18:31 Z    4 days
Testing same since   164595  2021-08-29 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   a931e8e64a..8064488062  8064488062641ae505b2a7369611c38057a7788b -> coverity-tested/smoke

