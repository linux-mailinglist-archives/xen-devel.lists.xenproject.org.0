Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60F388B09
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 11:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129971.243720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljIp3-0004NW-1H; Wed, 19 May 2021 09:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129971.243720; Wed, 19 May 2021 09:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljIp2-0004Kk-S4; Wed, 19 May 2021 09:49:00 +0000
Received: by outflank-mailman (input) for mailman id 129971;
 Wed, 19 May 2021 09:48:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljIp1-0004Ka-2O; Wed, 19 May 2021 09:48:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljIp0-0006un-Sv; Wed, 19 May 2021 09:48:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljIp0-0004lO-NA; Wed, 19 May 2021 09:48:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ljIp0-00026z-Mf; Wed, 19 May 2021 09:48:58 +0000
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
	bh=G/Dui+a8LmOYX2GEiujI2/rAQ7kT9wYso3JtWUHFKJo=; b=yKDxoniwzz0W1FHDCVJeVJwm2V
	0i+shQtaJSJg8CeHYP5frya15mS9JxycLhDtQywJ9iwupoxQStSlrc5Yg4vwR+mYjCpy0sSP1hv+e
	KUu9QNMKsBYScjBLLtLTam9eAeixaUJ+ARff7fXWTs3oQPxjjQfMQ72NZXbPt6iLqX5g=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162086-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162086: all pass - PUSHED
X-Osstest-Versions-This:
    xen=caa9c4471d1d74b2d236467aaf7e63a806ac11a4
X-Osstest-Versions-That:
    xen=cb199cc7de987cfda4659fccf51059f210f6ad34
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 May 2021 09:48:58 +0000

flight 162086 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162086/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  caa9c4471d1d74b2d236467aaf7e63a806ac11a4
baseline version:
 xen                  cb199cc7de987cfda4659fccf51059f210f6ad34

Last test of basis   161968  2021-05-16 09:19:30 Z    3 days
Testing same since   162086  2021-05-19 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Connor Davis <connojdavis@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   cb199cc7de..caa9c4471d  caa9c4471d1d74b2d236467aaf7e63a806ac11a4 -> coverity-tested/smoke

