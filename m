Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF32333926
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 10:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95935.181162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvRL-0005gz-SC; Wed, 10 Mar 2021 09:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95935.181162; Wed, 10 Mar 2021 09:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvRL-0005ga-P0; Wed, 10 Mar 2021 09:47:39 +0000
Received: by outflank-mailman (input) for mailman id 95935;
 Wed, 10 Mar 2021 09:47:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJvRK-0005gS-Ie; Wed, 10 Mar 2021 09:47:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJvRK-0006rV-7F; Wed, 10 Mar 2021 09:47:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJvRJ-00048a-Up; Wed, 10 Mar 2021 09:47:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lJvRJ-0003Sg-UL; Wed, 10 Mar 2021 09:47:37 +0000
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
	bh=GgzjpSP1mypY/7EbqFfdrtLGMIlDegbRw/8njuHetGo=; b=bqi5tQXrF9Osd9zfwwuKLpxtNY
	Lx1DC+SxYXWOnHkq5vWPYrrHx8A07A3bkDSgaLFSX6657UelDNI79B9cdZ/FJziweBSmVm3dRscsx
	3BsjwE+yYzdzw7b7Qf91xAexjeT44UtjPXG58jMPmAXInx9lhdzlCY9URFkUAOgFc3fo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159907-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159907: all pass - PUSHED
X-Osstest-Versions-This:
    xen=1b47cc852fd130ed9ce274a0f1600a4a62949a2c
X-Osstest-Versions-That:
    xen=51972482f77b68ef494c8b9591b125460e7984b9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Mar 2021 09:47:37 +0000

flight 159907 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159907/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  1b47cc852fd130ed9ce274a0f1600a4a62949a2c
baseline version:
 xen                  51972482f77b68ef494c8b9591b125460e7984b9

Last test of basis   159856  2021-03-07 09:20:39 Z    3 days
Testing same since   159907  2021-03-10 09:18:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
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
   51972482f7..1b47cc852f  1b47cc852fd130ed9ce274a0f1600a4a62949a2c -> coverity-tested/smoke

