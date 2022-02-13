Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8DB4B3AB1
	for <lists+xen-devel@lfdr.de>; Sun, 13 Feb 2022 10:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270939.465265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJBUS-0003WG-Lk; Sun, 13 Feb 2022 09:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270939.465265; Sun, 13 Feb 2022 09:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJBUS-0003T4-HR; Sun, 13 Feb 2022 09:48:20 +0000
Received: by outflank-mailman (input) for mailman id 270939;
 Sun, 13 Feb 2022 09:48:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJBUQ-0003Su-S9; Sun, 13 Feb 2022 09:48:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJBUQ-0005gW-Pk; Sun, 13 Feb 2022 09:48:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJBUQ-0004JW-E0; Sun, 13 Feb 2022 09:48:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nJBUQ-0001ef-DW; Sun, 13 Feb 2022 09:48:18 +0000
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
	bh=D6Psc2tIoWJIHdmnAlqusRCZ7+PUuZjOBNsIyoiidsA=; b=eufz3ur0vgL0RfXqh5UJnJUlG0
	Hpywka83KkbxUDJstjHELIbxto1BXlVY5h/66V4w1VDANXlhxShRGqejQEHvZDOe8oh0M4gq83xIs
	SsGafZkD94UeOOHtsvtEpyx+hi12iUvf1mu7frVJvtervkAVXPCY8OkBdcL30+tIG0mI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168100-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168100: all pass - PUSHED
X-Osstest-Versions-This:
    xen=87319afb96973213ec0a76270d93696f3b8d6743
X-Osstest-Versions-That:
    xen=52ce1c97844db213de01c5300eaaa8cf101a285f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 13 Feb 2022 09:48:18 +0000

flight 168100 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168100/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  87319afb96973213ec0a76270d93696f3b8d6743
baseline version:
 xen                  52ce1c97844db213de01c5300eaaa8cf101a285f

Last test of basis   168068  2022-02-09 09:21:03 Z    4 days
Testing same since   168100  2022-02-13 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
   52ce1c9784..87319afb96  87319afb96973213ec0a76270d93696f3b8d6743 -> coverity-tested/smoke

