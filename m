Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D92FCDD1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 11:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71316.127609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Aeu-0005Pf-IC; Wed, 20 Jan 2021 10:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71316.127609; Wed, 20 Jan 2021 10:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Aeu-0005PD-E8; Wed, 20 Jan 2021 10:24:16 +0000
Received: by outflank-mailman (input) for mailman id 71316;
 Wed, 20 Jan 2021 10:24:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Aes-0005P5-UD; Wed, 20 Jan 2021 10:24:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Aes-0006TZ-OS; Wed, 20 Jan 2021 10:24:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Aes-0000Af-Ew; Wed, 20 Jan 2021 10:24:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Aes-0005Jf-ER; Wed, 20 Jan 2021 10:24:14 +0000
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
	bh=T+yC6gNwaVdlIofTOB3ZS3aV4oWFuW8vGtO6wQoWhdY=; b=Ozx4uTqxOY3OPPnTEkjGwf46gZ
	AIHniSRDNmuFB+ABa+zdDCG/UFs3UgONphQNZcccKEIDrw4mDvWb3KGo1SDClwit8Zsz6uxO5/l5k
	mA+D8Et6bfotEepHdKIQKERA+1sQrqQAxKGnoPNIQeXOGJSaQEpg3B7dntCFb60G+PU0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158538-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158538: tolerable ALL FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-coverity:coverity-amd64:coverity-upload:fail:heisenbug
X-Osstest-Versions-This:
    xen=3487f4cf8bf5cef47a4c3918c13a502afc9891f6
X-Osstest-Versions-That:
    xen=db9c4ad1b1abaef3c38027b9b2700d9250d13125
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jan 2021 10:24:14 +0000

flight 158538 xen-unstable-coverity real [real]
flight 158539 xen-unstable-coverity real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/158538/
http://logs.test-lab.xenproject.org/osstest/logs/158539/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 coverity-amd64                7 coverity-upload     fail pass in 158539-retest

version targeted for testing:
 xen                  3487f4cf8bf5cef47a4c3918c13a502afc9891f6
baseline version:
 xen                  db9c4ad1b1abaef3c38027b9b2700d9250d13125

Last test of basis   158472  2021-01-17 09:19:26 Z    3 days
Testing same since   158538  2021-01-20 09:19:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Doug Goldstein <cardoe@cardoe.com>
  From: Manuel Bouyer <bouyer@netbsd.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 coverity-amd64                                               fail    


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
   db9c4ad1b1..3487f4cf8b  3487f4cf8bf5cef47a4c3918c13a502afc9891f6 -> coverity-tested/smoke

