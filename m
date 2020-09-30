Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC327E689
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535.1760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZJ4-0007Ck-G1; Wed, 30 Sep 2020 10:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535.1760; Wed, 30 Sep 2020 10:25:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZJ4-0007CP-Cc; Wed, 30 Sep 2020 10:25:54 +0000
Received: by outflank-mailman (input) for mailman id 535;
 Wed, 30 Sep 2020 10:25:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS8s=DH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNZJ2-0007CK-Cn
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:25:52 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 080bf517-e89f-4ff9-b941-79b5b9d3e58e;
 Wed, 30 Sep 2020 10:25:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNZJ0-0006s1-UB; Wed, 30 Sep 2020 10:25:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNZJ0-0003Jv-FY; Wed, 30 Sep 2020 10:25:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNZJ0-0003zb-F2; Wed, 30 Sep 2020 10:25:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZS8s=DH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNZJ2-0007CK-Cn
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:25:52 +0000
X-Inumbo-ID: 080bf517-e89f-4ff9-b941-79b5b9d3e58e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 080bf517-e89f-4ff9-b941-79b5b9d3e58e;
	Wed, 30 Sep 2020 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=UtOKH8G/Ruoi/q4VAYmRmJXXPY3+33IGnITC51ghUN4=; b=QOs3b8AmqWWwHZVQNCEizewEVH
	suj7J0U3zqyeyUE3UORiX1V5oRzvo8bSidD/zGQg+QHRsd7Mxe77sq1LVjs2a4wp+KsLREckGywA4
	8Sq3BxxvSfhv3jlT5KIN6nKFAmQ1KJNTv363T8WiOKLqqgre7BOt/rI+dJvFp50OFw4c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNZJ0-0006s1-UB; Wed, 30 Sep 2020 10:25:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNZJ0-0003Jv-FY; Wed, 30 Sep 2020 10:25:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNZJ0-0003zb-F2; Wed, 30 Sep 2020 10:25:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155131-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 155131: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5dba8c2f23049aa68b777a9e7e9f76c12dd00012
X-Osstest-Versions-That:
    xen=2785b2a9e04abc148e1c5259f4faee708ea356f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Sep 2020 10:25:50 +0000

flight 155131 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155131/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5dba8c2f23049aa68b777a9e7e9f76c12dd00012
baseline version:
 xen                  2785b2a9e04abc148e1c5259f4faee708ea356f4

Last test of basis   154638  2020-09-23 09:18:27 Z    7 days
Failing since        154954  2020-09-27 09:18:27 Z    3 days    2 attempts
Testing same since   155131  2020-09-30 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   2785b2a9e0..5dba8c2f23  5dba8c2f23049aa68b777a9e7e9f76c12dd00012 -> coverity-tested/smoke

