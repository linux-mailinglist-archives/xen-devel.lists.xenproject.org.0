Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89230D69C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 10:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80864.148231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Ela-00085t-2p; Wed, 03 Feb 2021 09:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80864.148231; Wed, 03 Feb 2021 09:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ElZ-00085H-T1; Wed, 03 Feb 2021 09:48:05 +0000
Received: by outflank-mailman (input) for mailman id 80864;
 Wed, 03 Feb 2021 09:48:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7ElY-00084t-SK; Wed, 03 Feb 2021 09:48:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7ElY-0004yi-KP; Wed, 03 Feb 2021 09:48:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7ElY-0003PU-C0; Wed, 03 Feb 2021 09:48:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7ElY-0001Cn-8z; Wed, 03 Feb 2021 09:48:04 +0000
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
	bh=9qZBxdqYUJ0CN7wUsLZPITLu2p7jPi8amF9tOdkorUI=; b=VEg58hfxS6gWMD3nrzBmqaBvI3
	2QaMtHOpWt0xBCP/gypcHpC3Ttp6azf2Rs6Lm8C2k0x3KbHojL6s1TrUwyhUAG5XHE2k6tVTiKweR
	qJLKlTjErjoOMleF7I7RNaudQCAUVI2MoDoUMVv7CG1JQ2jXoQr+Gsn0pFOBKA0rDUGQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158979-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158979: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5e7aa904405fa2f268c3af213516bae271de3265
X-Osstest-Versions-That:
    xen=9dc687f155a57216b83b17f9cde55dd43e06b0cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Feb 2021 09:48:04 +0000

flight 158979 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158979/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5e7aa904405fa2f268c3af213516bae271de3265
baseline version:
 xen                  9dc687f155a57216b83b17f9cde55dd43e06b0cd

Last test of basis   158849  2021-01-31 09:18:27 Z    3 days
Testing same since   158979  2021-02-03 09:18:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Roger Pau Monne <roger.pau@citrix.com>
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
   9dc687f155..5e7aa90440  5e7aa904405fa2f268c3af213516bae271de3265 -> coverity-tested/smoke

