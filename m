Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717D3DCB19
	for <lists+xen-devel@lfdr.de>; Sun,  1 Aug 2021 12:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162847.298494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mA8fM-00032J-Cd; Sun, 01 Aug 2021 10:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162847.298494; Sun, 01 Aug 2021 10:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mA8fM-00030O-8b; Sun, 01 Aug 2021 10:25:56 +0000
Received: by outflank-mailman (input) for mailman id 162847;
 Sun, 01 Aug 2021 10:25:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mA8fK-00030E-PX; Sun, 01 Aug 2021 10:25:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mA8fK-0006WB-Ic; Sun, 01 Aug 2021 10:25:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mA8fK-0003mQ-7q; Sun, 01 Aug 2021 10:25:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mA8fK-0004Kw-75; Sun, 01 Aug 2021 10:25:54 +0000
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
	bh=sXvb+uZ03KOz227cJ9DmoOFV1PMNdYxXw2UnCrgb1/s=; b=PeUKERqft5w1kw5+MDS4VmGIms
	4shScZhtJK/7cuVc49zOHWcjiO9eYU6IiFA7ebt7QZJFqQL2zPPIwqYbZeaTUSwWFsiPPUVC8iBkO
	AbqhwNQMuZQ+SAhA82kEEpDSL5Hrc3XThrsE5RFW7czDDptuRvWLsnq+yBHZmkHhyMS0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164072: all pass - PUSHED
X-Osstest-Versions-This:
    xen=e066ca5acc2ee3b5db5c005e1a548b05e753e07d
X-Osstest-Versions-That:
    xen=58ad654ebce7ccb272a3f4f3482c03aaad850d31
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 01 Aug 2021 10:25:54 +0000

flight 164072 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164072/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e066ca5acc2ee3b5db5c005e1a548b05e753e07d
baseline version:
 xen                  58ad654ebce7ccb272a3f4f3482c03aaad850d31

Last test of basis   164021  2021-07-28 09:20:54 Z    4 days
Testing same since   164072  2021-08-01 09:19:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jane Malalane <jane.malalane@citrix.com>
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
   58ad654ebc..e066ca5acc  e066ca5acc2ee3b5db5c005e1a548b05e753e07d -> coverity-tested/smoke

