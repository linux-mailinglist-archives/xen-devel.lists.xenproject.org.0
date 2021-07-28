Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFF3D8B5D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161406.296350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gPV-00014O-BI; Wed, 28 Jul 2021 10:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161406.296350; Wed, 28 Jul 2021 10:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gPV-000111-7t; Wed, 28 Jul 2021 10:03:33 +0000
Received: by outflank-mailman (input) for mailman id 161406;
 Wed, 28 Jul 2021 10:03:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m8gPT-00010l-CM; Wed, 28 Jul 2021 10:03:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m8gPT-0007jq-6E; Wed, 28 Jul 2021 10:03:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m8gPS-0004xg-RA; Wed, 28 Jul 2021 10:03:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m8gPS-0003zm-Qa; Wed, 28 Jul 2021 10:03:30 +0000
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
	bh=ziXkNmPgOEvWQ7bwFRLPlNqLG0Q7iyq1oscOII5UZoA=; b=wT93ub89uncwXziNHv6lkV9Sxk
	fJ9GmyfwlAQlkiAxg2Bb0pFWjHO/XTrYfHixEGTQxmDIuXMepd0AO3vVFAXHghuse/UUFSVefQt3c
	LnvWOpX/Ne2KZ31JVXStg1HeBWDG09zvVMtWfHFGK003VrttvUhEDsjo5p/9e5MQ/824=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164021-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164021: all pass - PUSHED
X-Osstest-Versions-This:
    xen=58ad654ebce7ccb272a3f4f3482c03aaad850d31
X-Osstest-Versions-That:
    xen=57e761b60dc92e210caf3429b8956d908ba04ae9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jul 2021 10:03:30 +0000

flight 164021 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164021/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  58ad654ebce7ccb272a3f4f3482c03aaad850d31
baseline version:
 xen                  57e761b60dc92e210caf3429b8956d908ba04ae9

Last test of basis   163870  2021-07-21 09:19:34 Z    7 days
Testing same since   164021  2021-07-28 09:20:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Robinson <alan.robinson@fujitsu.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Scott Davis <scott.davis@starlab.io>
  Scott Davis <scottwd@gmail.com>

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
   57e761b60d..58ad654ebc  58ad654ebce7ccb272a3f4f3482c03aaad850d31 -> coverity-tested/smoke

