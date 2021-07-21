Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDF3D0B96
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 11:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159247.292935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68tC-0007zA-HM; Wed, 21 Jul 2021 09:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159247.292935; Wed, 21 Jul 2021 09:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68tC-0007ws-DG; Wed, 21 Jul 2021 09:51:42 +0000
Received: by outflank-mailman (input) for mailman id 159247;
 Wed, 21 Jul 2021 09:51:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m68tA-0007wi-Jm; Wed, 21 Jul 2021 09:51:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m68tA-00082j-Co; Wed, 21 Jul 2021 09:51:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m68tA-0002or-4g; Wed, 21 Jul 2021 09:51:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m68tA-0007bw-4B; Wed, 21 Jul 2021 09:51:40 +0000
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
	bh=55q9KzJudBNzQsqNKzOvrwX/wao2ZDyrNyFcAWP9/XE=; b=bF/ach9ZBiFXuIEFCsgjdOOImm
	lxnQEVZcHHbpmnIDTvGFL0W4rdF6HQvwqv58GNwH2Vus6p7CmbmIeLXS6MNX0Sr34R60TFRUhZryb
	rVOMBx8qCq45gMMZhEeNp9iiP1X7y9AP3I+HL7t9gDbvu6n7TroxB+wuybclE6apyh9c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163870-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163870: all pass - PUSHED
X-Osstest-Versions-This:
    xen=57e761b60dc92e210caf3429b8956d908ba04ae9
X-Osstest-Versions-That:
    xen=3a98c1a4cec1a302beaddf944ded240b61173f87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Jul 2021 09:51:40 +0000

flight 163870 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163870/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  57e761b60dc92e210caf3429b8956d908ba04ae9
baseline version:
 xen                  3a98c1a4cec1a302beaddf944ded240b61173f87

Last test of basis   163679  2021-07-14 09:18:29 Z    7 days
Testing same since   163870  2021-07-21 09:19:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@arm.com>
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
   3a98c1a4ce..57e761b60d  57e761b60dc92e210caf3429b8956d908ba04ae9 -> coverity-tested/smoke

