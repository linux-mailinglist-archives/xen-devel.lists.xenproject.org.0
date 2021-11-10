Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2144BE0F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 10:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224234.387411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkkF2-0004f7-UQ; Wed, 10 Nov 2021 09:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224234.387411; Wed, 10 Nov 2021 09:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkkF2-0004bk-Qm; Wed, 10 Nov 2021 09:50:04 +0000
Received: by outflank-mailman (input) for mailman id 224234;
 Wed, 10 Nov 2021 09:50:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkkF1-0004O7-8U; Wed, 10 Nov 2021 09:50:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkkF0-0007GD-VU; Wed, 10 Nov 2021 09:50:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkkF0-0000u6-NF; Wed, 10 Nov 2021 09:50:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mkkF0-00074V-Ml; Wed, 10 Nov 2021 09:50:02 +0000
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
	bh=epC5wCRveN4bZy1e5lVffitM/ExU8QU+UEbTJ4AkAkI=; b=V3ENPHxuK+9sm2uS6AtRy9um5+
	W3aXrmrgr011g/kyj2jjbOumiwtUhhDNgD2nkTlAMSD+/tyXZA0q9z/jQerjeTZ0YsfJzvN4vt37N
	hf+dDEMxlPFgAUcAdecUa8QQsOuG8vnXllu5nw7mCcyS7phdYJ2ckT6HbrdZDnzZVXbk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166107-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166107: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9d9cd0c6f5b16652f61e7f21233ec8dfd6cf7df2
X-Osstest-Versions-That:
    xen=9bc9fff04ba077c4a9782f12578362d8947c534b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Nov 2021 09:50:02 +0000

flight 166107 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166107/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9d9cd0c6f5b16652f61e7f21233ec8dfd6cf7df2
baseline version:
 xen                  9bc9fff04ba077c4a9782f12578362d8947c534b

Last test of basis   166078  2021-11-07 09:18:29 Z    3 days
Testing same since   166107  2021-11-10 09:19:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
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
   9bc9fff04b..9d9cd0c6f5  9d9cd0c6f5b16652f61e7f21233ec8dfd6cf7df2 -> coverity-tested/smoke

