Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C5407CCA
	for <lists+xen-devel@lfdr.de>; Sun, 12 Sep 2021 12:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185206.333923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPMOD-000896-B4; Sun, 12 Sep 2021 10:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185206.333923; Sun, 12 Sep 2021 10:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPMOD-00086a-6V; Sun, 12 Sep 2021 10:07:09 +0000
Received: by outflank-mailman (input) for mailman id 185206;
 Sun, 12 Sep 2021 10:07:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPMOB-00085d-NS; Sun, 12 Sep 2021 10:07:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPMOB-0003oU-K5; Sun, 12 Sep 2021 10:07:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPMOB-0006DC-Cw; Sun, 12 Sep 2021 10:07:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mPMOB-00032H-CO; Sun, 12 Sep 2021 10:07:07 +0000
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
	bh=SUrnfNPVfBwK4fF6sHXE4Q+bdeizReDoCgxcM3wCkEY=; b=Sv7y2doiosMvGM0/avgWNWc7+4
	jJpM9/TNEzp8wonebdI7CYOtPfY7Un5TBplyOiZzzVXt+fudzlzYh4ji26+5hKeaPtrOQAqQEbpbD
	V/GF2jc9m2vojKtP/+gPHp1kH5NJ+otsikNO8FC9jdT/s/f0K9sXTSEz6el8UGDdndN0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164955-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164955: all pass - PUSHED
X-Osstest-Versions-This:
    xen=6d45368a0a89e01a3a01d156af61fea565db96cc
X-Osstest-Versions-That:
    xen=e70a9a043a5ce6d4025420f729bc473f711bf5d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 Sep 2021 10:07:07 +0000

flight 164955 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164955/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  6d45368a0a89e01a3a01d156af61fea565db96cc
baseline version:
 xen                  e70a9a043a5ce6d4025420f729bc473f711bf5d1

Last test of basis   164882  2021-09-08 09:18:32 Z    4 days
Testing same since   164955  2021-09-12 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>

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
   e70a9a043a..6d45368a0a  6d45368a0a89e01a3a01d156af61fea565db96cc -> coverity-tested/smoke

