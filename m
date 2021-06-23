Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D33B179C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 12:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146190.268946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvzg9-0007R4-4v; Wed, 23 Jun 2021 10:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146190.268946; Wed, 23 Jun 2021 10:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvzg9-0007O7-12; Wed, 23 Jun 2021 10:00:17 +0000
Received: by outflank-mailman (input) for mailman id 146190;
 Wed, 23 Jun 2021 10:00:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvzg6-0007Nx-QZ; Wed, 23 Jun 2021 10:00:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvzg6-0002Bi-DS; Wed, 23 Jun 2021 10:00:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvzg6-0003za-4s; Wed, 23 Jun 2021 10:00:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lvzg6-0004Sn-4J; Wed, 23 Jun 2021 10:00:14 +0000
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
	bh=5XalakZtcYt9g2Y/OPdFVno0jxQK6W4OsvSe/i+LdMM=; b=n6LnZfUYR6RKf1/+oBpXp41BFJ
	ShWZOrKHZ7dxxg2E9CcYTWMTEgSaabp7pTDCT4uMDsiVVgcTbQwpeGwnN7pY/qj8OSbwGd6c14Lw6
	0CW2KnXKKwI8ZwB4UUsgG6XniJEvPfHxUpe1hH84GifOobJiMvrPg83+PFATKNkTsOAI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162992-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162992: all pass - PUSHED
X-Osstest-Versions-This:
    xen=c7691f5e340f3b579d40c77548f63133cdf5aac7
X-Osstest-Versions-That:
    xen=4bcf6433eed3d9cbc00865ec62380a33ca832dac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Jun 2021 10:00:14 +0000

flight 162992 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162992/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  c7691f5e340f3b579d40c77548f63133cdf5aac7
baseline version:
 xen                  4bcf6433eed3d9cbc00865ec62380a33ca832dac

Last test of basis   162857  2021-06-16 09:18:30 Z    7 days
Failing since        162908  2021-06-20 09:18:24 Z    3 days    2 attempts
Testing same since   162992  2021-06-23 09:20:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
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
   4bcf6433ee..c7691f5e34  c7691f5e340f3b579d40c77548f63133cdf5aac7 -> coverity-tested/smoke

