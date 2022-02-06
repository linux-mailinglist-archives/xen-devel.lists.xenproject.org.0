Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF24AAED3
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 11:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266256.459942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGegR-00016e-Pt; Sun, 06 Feb 2022 10:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266256.459942; Sun, 06 Feb 2022 10:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGegR-00013N-MX; Sun, 06 Feb 2022 10:22:15 +0000
Received: by outflank-mailman (input) for mailman id 266256;
 Sun, 06 Feb 2022 10:22:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGegQ-00013D-3y; Sun, 06 Feb 2022 10:22:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGegQ-0004lk-2A; Sun, 06 Feb 2022 10:22:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGegP-0005sQ-MT; Sun, 06 Feb 2022 10:22:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nGegP-0001Lg-LL; Sun, 06 Feb 2022 10:22:13 +0000
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
	bh=/L5hWDAUAGI4bTqGXS3L54nn3bl+biUKhE5J8w4Olho=; b=5brysufkif9FnAObnlNTeu8CVg
	ycMRb4uOgS33wCf/1L65M9JgWozn/qxq8ll/oaZ50HECFRkk88FatljeZxcupIzlEuNnBYu4VfZQh
	D3/Pq8J41zQwIDamRxYtDXwFNt0+m2nTQznC6phh6BHSWjPBR7pYo1AUSssLmgNbWyCk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168033-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168033: all pass - PUSHED
X-Osstest-Versions-This:
    xen=820cc393434097f3b7976acdccbf1d96071d6d23
X-Osstest-Versions-That:
    xen=9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Feb 2022 10:22:13 +0000

flight 168033 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168033/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  820cc393434097f3b7976acdccbf1d96071d6d23
baseline version:
 xen                  9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e

Last test of basis   167984  2022-02-02 09:19:38 Z    4 days
Testing same since   168033  2022-02-06 09:19:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Jan Beulich <jbeulich@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Temerkhanov <s.temerkhanov@gmail.com>

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
   9ce3ef20b4..820cc39343  820cc393434097f3b7976acdccbf1d96071d6d23 -> coverity-tested/smoke

