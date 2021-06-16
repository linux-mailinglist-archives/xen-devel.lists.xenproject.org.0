Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCCD3A9702
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 12:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142829.263427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltSYI-0002Dh-Cs; Wed, 16 Jun 2021 10:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142829.263427; Wed, 16 Jun 2021 10:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltSYI-0002At-7M; Wed, 16 Jun 2021 10:13:42 +0000
Received: by outflank-mailman (input) for mailman id 142829;
 Wed, 16 Jun 2021 10:13:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ltSYG-0002Aj-Po; Wed, 16 Jun 2021 10:13:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ltSYG-0007mE-I9; Wed, 16 Jun 2021 10:13:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ltSYG-0002dy-8P; Wed, 16 Jun 2021 10:13:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ltSYG-00030u-7t; Wed, 16 Jun 2021 10:13:40 +0000
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
	bh=ILxPO/3TN1qCU+H7cJciFVHUDojpmrwCPmNWJDZyFxM=; b=VI8SY1drUeHILo+m1ke4ZdxHsM
	WXjP5/TTbMJlXBt93FZORnz8Te4u/dncF3gQgetQfEqeq7W6GEQyjZwHuELb+RNKSXCw6tXw8QrVk
	JAQfC6GGM71Uwb4B9n9s+ygEv8JqkeoCzXvNL9ksLa0AQmZoj80647Oq4fEOoVW642kg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162857-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162857: all pass - PUSHED
X-Osstest-Versions-This:
    xen=4bcf6433eed3d9cbc00865ec62380a33ca832dac
X-Osstest-Versions-That:
    xen=93031fbe9f4c341a2e7950a088025ea550291433
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Jun 2021 10:13:40 +0000

flight 162857 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162857/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  4bcf6433eed3d9cbc00865ec62380a33ca832dac
baseline version:
 xen                  93031fbe9f4c341a2e7950a088025ea550291433

Last test of basis   162765  2021-06-13 09:18:26 Z    3 days
Testing same since   162857  2021-06-16 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>

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
   93031fbe9f..4bcf6433ee  4bcf6433eed3d9cbc00865ec62380a33ca832dac -> coverity-tested/smoke

