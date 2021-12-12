Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905747198E
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 11:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245595.423753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwLfQ-0000Sc-Tm; Sun, 12 Dec 2021 10:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245595.423753; Sun, 12 Dec 2021 10:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwLfQ-0000Pd-PG; Sun, 12 Dec 2021 10:01:16 +0000
Received: by outflank-mailman (input) for mailman id 245595;
 Sun, 12 Dec 2021 10:01:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwLfP-0000PT-52; Sun, 12 Dec 2021 10:01:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwLfO-00019k-TV; Sun, 12 Dec 2021 10:01:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwLfO-0008OS-LL; Sun, 12 Dec 2021 10:01:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mwLfO-0004Rw-Kt; Sun, 12 Dec 2021 10:01:14 +0000
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
	bh=GIWCIPB30GSO2ldgEnAtjJ0u4PW1LaS3a1jHOPMRBGY=; b=jVCWsDnoHZ8V3FKlgyXqzNBPGR
	R/KSJrv5LC8a8m5n3JCJJLJBPvQQYBIR5M5hlIJZIAucR01ra0X1s2AUSyxMuWVQl0VzoSgTradjb
	7EX44mfKmZnDeCmUeluZ7W+hVymghqFVZtzfeh2HW6vlN7DxJFuglF1T5U/pL5wlsohQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167384-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167384: all pass - PUSHED
X-Osstest-Versions-This:
    xen=df3e1a5efe700a9f59eced801cac73f9fd02a0e2
X-Osstest-Versions-That:
    xen=608531a0cc34a5bc096ccf585e16f182b5ed83e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 Dec 2021 10:01:14 +0000

flight 167384 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167384/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  df3e1a5efe700a9f59eced801cac73f9fd02a0e2
baseline version:
 xen                  608531a0cc34a5bc096ccf585e16f182b5ed83e1

Last test of basis   167232  2021-12-08 09:18:32 Z    4 days
Testing same since   167384  2021-12-12 09:20:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Paul Durrant <paul@xen.org>
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
   608531a0cc..df3e1a5efe  df3e1a5efe700a9f59eced801cac73f9fd02a0e2 -> coverity-tested/smoke

