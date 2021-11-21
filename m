Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5BD4582E8
	for <lists+xen-devel@lfdr.de>; Sun, 21 Nov 2021 11:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228522.395488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mojvn-0004UW-PZ; Sun, 21 Nov 2021 10:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228522.395488; Sun, 21 Nov 2021 10:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mojvn-0004Sg-LT; Sun, 21 Nov 2021 10:18:43 +0000
Received: by outflank-mailman (input) for mailman id 228522;
 Sun, 21 Nov 2021 10:18:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mojvm-0004SW-0i; Sun, 21 Nov 2021 10:18:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mojvl-00029u-PK; Sun, 21 Nov 2021 10:18:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mojvl-00053d-GA; Sun, 21 Nov 2021 10:18:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mojvl-0003Q2-Fd; Sun, 21 Nov 2021 10:18:41 +0000
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
	bh=jHOL4otaHCKmc0RbPn9DhGlo3QEWFUqZMy0gaDf7QEI=; b=mKBRAX3wOXalk0EuxwRvQHBrrE
	T/wqODWJWJ8aowG35ta6/2WjH9iRkOMBZzBbB18lFu6cofRSd2NS4sNZnG5qOiwNvbtZdUp/yKEtq
	9hMZqhkGEcpCh0xta6DRqsU+KDgWM+vzTBGCr5rHzVQPousgGoQ1wg9NiovRLdysXPag=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166258-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166258: all pass - PUSHED
X-Osstest-Versions-This:
    xen=be12fcca8b784e456df3adedbffe657d753c5ff9
X-Osstest-Versions-That:
    xen=2d72d2784eb71d8532bfbd6462d261739c9e82e4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Nov 2021 10:18:41 +0000

flight 166258 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166258/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  be12fcca8b784e456df3adedbffe657d753c5ff9
baseline version:
 xen                  2d72d2784eb71d8532bfbd6462d261739c9e82e4

Last test of basis   166165  2021-11-17 09:18:30 Z    4 days
Testing same since   166258  2021-11-21 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   2d72d2784e..be12fcca8b  be12fcca8b784e456df3adedbffe657d753c5ff9 -> coverity-tested/smoke

