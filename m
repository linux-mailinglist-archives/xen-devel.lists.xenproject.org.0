Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080C364B33
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 22:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113164.215618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYacE-0001O5-0F; Mon, 19 Apr 2021 20:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113164.215618; Mon, 19 Apr 2021 20:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYacD-0001Nd-Sx; Mon, 19 Apr 2021 20:35:29 +0000
Received: by outflank-mailman (input) for mailman id 113164;
 Mon, 19 Apr 2021 20:35:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYacC-0001NV-UD; Mon, 19 Apr 2021 20:35:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYacC-0001Wd-Km; Mon, 19 Apr 2021 20:35:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYacC-00055D-Dy; Mon, 19 Apr 2021 20:35:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYacC-0007gE-DN; Mon, 19 Apr 2021 20:35:28 +0000
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
	bh=PaTqCX89ywiSAV+EIwRttt/bUR0ZPoazY9R1oIoCQFg=; b=BkVa29s087QxJW6MZh02rG8vR1
	cPl6mRMoQmgJImyrdpA7VL4Cv2bd54xvFrooFs49gSBw+NJNWYJIPj1HFyfA6D++NhJHt8Mzrnrh3
	gcs6/8av9QFOGimq3XApDAgF1rYqGdq4/MI1ekTKePKul3Gflb0sASTutFBIs/MdHPoI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161294-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161294: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=b0bc49846c154b79243f39d461a4515804bcaf53
X-Osstest-Versions-That:
    xtf=2f655c0c74439805ce6dbc6fd1f2e7defdaf33e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Apr 2021 20:35:28 +0000

flight 161294 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161294/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  b0bc49846c154b79243f39d461a4515804bcaf53
baseline version:
 xtf                  2f655c0c74439805ce6dbc6fd1f2e7defdaf33e5

Last test of basis   161229  2021-04-17 10:33:36 Z    2 days
Testing same since   161294  2021-04-19 14:41:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   2f655c0..b0bc498  b0bc49846c154b79243f39d461a4515804bcaf53 -> xen-tested-master

