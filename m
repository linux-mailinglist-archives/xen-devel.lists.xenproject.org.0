Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5EF400EFF
	for <lists+xen-devel@lfdr.de>; Sun,  5 Sep 2021 12:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178989.325143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMp63-0001CT-Te; Sun, 05 Sep 2021 10:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178989.325143; Sun, 05 Sep 2021 10:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMp63-0001Ab-PT; Sun, 05 Sep 2021 10:09:55 +0000
Received: by outflank-mailman (input) for mailman id 178989;
 Sun, 05 Sep 2021 10:09:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMp61-0001AN-OM; Sun, 05 Sep 2021 10:09:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMp61-0000oO-Ih; Sun, 05 Sep 2021 10:09:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMp61-000254-A1; Sun, 05 Sep 2021 10:09:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mMp61-0004yE-9W; Sun, 05 Sep 2021 10:09:53 +0000
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
	bh=3pRFNPLpQv5EN8fsk2irALFSUyUxUI1Oh/3I2qCKr0g=; b=fs12lc+vSecB5Ym2qoWkLibRdY
	I6NhxezZKgrMhDudxK+c+4plZkxW6vvQy9IIfaHPuNlpmi0Lqy225MOa6ckZJgPLNvGnw2NOvkuwm
	ZaeMJXTL5osHMtCU1hfUZL5pLpB7e/Nwo5U7xvr1H94jLdVHS50r+QLD1vh/jtcFS0Ew=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164827-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164827: all pass - PUSHED
X-Osstest-Versions-This:
    xen=2d4978ead4b98452bc45ebe47952e524b12e2b41
X-Osstest-Versions-That:
    xen=96607a8e680e7f965ca868d11f8b0636317d2618
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Sep 2021 10:09:53 +0000

flight 164827 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164827/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  2d4978ead4b98452bc45ebe47952e524b12e2b41
baseline version:
 xen                  96607a8e680e7f965ca868d11f8b0636317d2618

Last test of basis   164692  2021-09-01 09:18:30 Z    4 days
Testing same since   164827  2021-09-05 09:18:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Lindig <christian.lindig@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>

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
   96607a8e68..2d4978ead4  2d4978ead4b98452bc45ebe47952e524b12e2b41 -> coverity-tested/smoke

