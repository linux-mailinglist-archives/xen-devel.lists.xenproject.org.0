Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73BA48FC0C
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 10:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257873.443379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n92AV-0007Am-SV; Sun, 16 Jan 2022 09:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257873.443379; Sun, 16 Jan 2022 09:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n92AV-00078b-Oc; Sun, 16 Jan 2022 09:49:47 +0000
Received: by outflank-mailman (input) for mailman id 257873;
 Sun, 16 Jan 2022 09:49:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n92AU-00078R-GA; Sun, 16 Jan 2022 09:49:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n92AU-00045A-CJ; Sun, 16 Jan 2022 09:49:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n92AU-0005wo-1A; Sun, 16 Jan 2022 09:49:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n92AU-0002Yu-0g; Sun, 16 Jan 2022 09:49:46 +0000
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
	bh=7cMmznjIOXqIdNXZHfAf1zv1XMAyxnLOgvu3ai8vGeE=; b=qxspjjICuqGk5icBBUxKrkJNQF
	PTCBcm3fH6XMeEia6V5elwGNM2WNhjpiFeMpLcDGBeabSWRb87LpS7jFN8FNNCnF2ciqcdiDs4YfY
	bTIARnRzugQqtMO3FQQRUahm+Ofn/AgDeks3r5yg/hnTX8MdxnhoN/tPi78Do3awwhP4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167714-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167714: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f
X-Osstest-Versions-That:
    xen=22891e12a45f9bb2e1dbb5daf2ba39cbe002e4f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Jan 2022 09:49:46 +0000

flight 167714 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167714/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f
baseline version:
 xen                  22891e12a45f9bb2e1dbb5daf2ba39cbe002e4f4

Last test of basis   167673  2022-01-12 09:18:39 Z    4 days
Testing same since   167714  2022-01-16 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   22891e12a4..9ce0a5e207  9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f -> coverity-tested/smoke

