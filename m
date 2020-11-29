Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E82C789D
	for <lists+xen-devel@lfdr.de>; Sun, 29 Nov 2020 11:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40335.73351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjJrt-0002N6-Sc; Sun, 29 Nov 2020 10:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40335.73351; Sun, 29 Nov 2020 10:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjJrt-0002MU-Ob; Sun, 29 Nov 2020 10:23:45 +0000
Received: by outflank-mailman (input) for mailman id 40335;
 Sun, 29 Nov 2020 10:23:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kjJrs-0002MG-K8; Sun, 29 Nov 2020 10:23:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kjJrs-0006EK-EJ; Sun, 29 Nov 2020 10:23:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kjJrs-0004bG-5f; Sun, 29 Nov 2020 10:23:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kjJrs-0003Eu-5D; Sun, 29 Nov 2020 10:23:44 +0000
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
	bh=m4NkV5vD6WMPDXobGOQPDBuGrPXkq+euzYOOczxP4d0=; b=Fpo8N28CGLgJxqUm3d60B1hm4F
	tsBhw2elI9LoCFid3C3n3MkOPso5GNOliTCQi8id2tYk7WZl7T+q4Jd/wpVSfgqxpL6mMUulMlnnG
	niZJdXW71GffrtXRqtTX4Tdt1p6Gb0vnYgAprtaWrzlDCy2aeZ1v/a99RHt5mAwED/NQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157090: all pass - PUSHED
X-Osstest-Versions-This:
    xen=f7d7d53f6464cff94ead4c15d21e79ce4d9173f5
X-Osstest-Versions-That:
    xen=9b156bcc3ffcc7949edd4460b718a241e87ae302
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Nov 2020 10:23:44 +0000

flight 157090 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f7d7d53f6464cff94ead4c15d21e79ce4d9173f5
baseline version:
 xen                  9b156bcc3ffcc7949edd4460b718a241e87ae302

Last test of basis   157003  2020-11-25 09:18:28 Z    4 days
Testing same since   157090  2020-11-29 09:18:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Paul Durrant <pdurrant@amazon.com>
  Rahul Singh <rahul.singh@arm.com>

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
   9b156bcc3f..f7d7d53f64  f7d7d53f6464cff94ead4c15d21e79ce4d9173f5 -> coverity-tested/smoke

