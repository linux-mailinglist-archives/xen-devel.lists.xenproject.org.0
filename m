Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC9320991
	for <lists+xen-devel@lfdr.de>; Sun, 21 Feb 2021 11:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87473.164654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDlWX-0002PL-KF; Sun, 21 Feb 2021 09:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87473.164654; Sun, 21 Feb 2021 09:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDlWX-0002Ot-Gb; Sun, 21 Feb 2021 09:59:33 +0000
Received: by outflank-mailman (input) for mailman id 87473;
 Sun, 21 Feb 2021 09:59:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDlWV-0002Ol-OZ; Sun, 21 Feb 2021 09:59:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDlWV-0002He-GD; Sun, 21 Feb 2021 09:59:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDlWV-0001ZQ-87; Sun, 21 Feb 2021 09:59:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lDlWV-0007eJ-7e; Sun, 21 Feb 2021 09:59:31 +0000
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
	bh=c2Ab0zsxEEG6oqtRNLRgbtEJ0yomv6yEF4Ltd2ghaXU=; b=BKTTd0JlxFZy96fUKyyuzo20MD
	cWih0dx6iBDOw9T3jHoZQOBIUc3tjMHvF1pWNvjTnUu1P4S96lhqd31m7p6CCkOZ+xfivTUhifXn4
	mH/Xhi5q3yxPukhgFJVilmHyPa52N+HTUoykePl9KASLRXI1KAgUOW9sbnXc4A4hOjUQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159515-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159515: all pass - PUSHED
X-Osstest-Versions-This:
    xen=87a067fd8f4d4f7c6be02c3d38145115ac542017
X-Osstest-Versions-That:
    xen=3b1cc15f1931ba56d0ee256fe9bfe65509733b27
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Feb 2021 09:59:31 +0000

flight 159515 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159515/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  87a067fd8f4d4f7c6be02c3d38145115ac542017
baseline version:
 xen                  3b1cc15f1931ba56d0ee256fe9bfe65509733b27

Last test of basis   159441  2021-02-17 09:20:56 Z    4 days
Testing same since   159515  2021-02-21 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Norbert Manthey <nmanthey@amazon.de>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

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
   3b1cc15f19..87a067fd8f  87a067fd8f4d4f7c6be02c3d38145115ac542017 -> coverity-tested/smoke

