Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99819A9D0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 12:52:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJawF-0002eJ-9X; Wed, 01 Apr 2020 10:49:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JcEj=5R=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jJawD-0002eE-EI
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 10:49:37 +0000
X-Inumbo-ID: 76b748b4-7406-11ea-ba94-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76b748b4-7406-11ea-ba94-12813bfff9fa;
 Wed, 01 Apr 2020 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o+Cy/XYWX2FKa8A3/8SP3uYfT0FXEW+BlCdVuLQF1G4=; b=EGxU32JWsLSWV3cEQTCVFoDQT
 5j9MI7Ao0KLGBlcqHyfso7yFApNMeJxIkNoe2r8MVNQazOtpJqw5kYE7iTNgf8G6z9pCLR5CNG5gd
 NmA5Xqhnx7Fmt6Jpilu9KaNfi6+BusFMOXEPpFg97CDzVGcnRGuCV34x2wIjBxwM141BU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJaw5-00007x-LR; Wed, 01 Apr 2020 10:49:29 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJaw5-00006a-4V; Wed, 01 Apr 2020 10:49:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jJaw5-0002uD-3v; Wed, 01 Apr 2020 10:49:29 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149277-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149277: all pass - PUSHED
X-Osstest-Versions-This: xen=5af4698d98d881e786c0909b6308f04696586c49
X-Osstest-Versions-That: xen=e19b4b3b55f84e0cfcc02fe5d66965969a81c965
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Apr 2020 10:49:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149277 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149277/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5af4698d98d881e786c0909b6308f04696586c49
baseline version:
 xen                  e19b4b3b55f84e0cfcc02fe5d66965969a81c965

Last test of basis   149162  2020-03-29 09:24:18 Z    3 days
Testing same since   149277  2020-04-01 09:29:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Simran Singhal <singhalsimran0@gmail.com>

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
   e19b4b3b55..5af4698d98  5af4698d98d881e786c0909b6308f04696586c49 -> coverity-tested/smoke

