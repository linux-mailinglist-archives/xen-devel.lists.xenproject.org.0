Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBE37383B
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 11:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122952.231948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leEIO-0003yF-Sw; Wed, 05 May 2021 09:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122952.231948; Wed, 05 May 2021 09:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leEIO-0003w1-Nn; Wed, 05 May 2021 09:58:20 +0000
Received: by outflank-mailman (input) for mailman id 122952;
 Wed, 05 May 2021 09:58:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0003vr-V1; Wed, 05 May 2021 09:58:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0006xE-RD; Wed, 05 May 2021 09:58:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0000Lr-FS; Wed, 05 May 2021 09:58:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0007NK-Ey; Wed, 05 May 2021 09:58:18 +0000
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
	bh=g2pX0JlFalaJ7bXsW3Pd5ggfSXizL2EamAxcDXZuPcE=; b=JIFD+mWnLCDWFACgVDmbiWJRNe
	wB9U8B/Q4ZaIEY0cWlk0M4KeBfty+89XQ47mM/4eygKSVe6FLvarl+m6R3aC18cwtq6dsFGxS3onM
	X852Jmpl9cwNcsPV6yE9pR2zKPk98Ic6i6EuAC5YkYIdxeO7BD+VfhfMufjOWThKj2cg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161786: all pass - PUSHED
X-Osstest-Versions-This:
    xen=8cccd6438e86112ab383e41b433b5a7e73be9621
X-Osstest-Versions-That:
    xen=1f8ee4cb430e5a9da37096574c41632cf69a0bc7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 May 2021 09:58:18 +0000

flight 161786 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161786/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  8cccd6438e86112ab383e41b433b5a7e73be9621
baseline version:
 xen                  1f8ee4cb430e5a9da37096574c41632cf69a0bc7

Last test of basis   161601  2021-05-02 09:18:26 Z    3 days
Testing same since   161786  2021-05-05 09:18:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>

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
   1f8ee4cb43..8cccd6438e  8cccd6438e86112ab383e41b433b5a7e73be9621 -> coverity-tested/smoke

