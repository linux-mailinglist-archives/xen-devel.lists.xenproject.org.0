Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F02656FF0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Dec 2022 22:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469409.728777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAHQC-000424-2v; Tue, 27 Dec 2022 21:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469409.728777; Tue, 27 Dec 2022 21:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAHQB-0003zH-VT; Tue, 27 Dec 2022 21:23:39 +0000
Received: by outflank-mailman (input) for mailman id 469409;
 Tue, 27 Dec 2022 21:23:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAHQA-0003z7-MV; Tue, 27 Dec 2022 21:23:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAHQA-0002xX-Iy; Tue, 27 Dec 2022 21:23:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAHQ9-00032f-MM; Tue, 27 Dec 2022 21:23:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pAHQ9-0000SA-Lv; Tue, 27 Dec 2022 21:23:37 +0000
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
	bh=zJck4t6RQFcSSvsyki8yZJGeWiduOnr8Ko/l4iBnHF0=; b=nF3uRLoWSLahL0WCfkp2Qu85Tm
	xF4B4idQeYU9CuvxB/I8AgEESDv9m9ITwLQHegATzk56rN319gdZr15hTMPPXMpnkF8Y6Hfom/wiS
	u7oQb1BTE5znZYws1iF8whkKohH/UgNyBQUAwdyyjXAVAZjs5sI0Qh2iuo/LdnRrmJv0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175508-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 175508: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=d1b8b7c312d2cf0e501ed43e88e45bba2c6986b5
X-Osstest-Versions-That:
    xtf=5e770502e81e6bde08f55db6b0f66fbc1013850d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Dec 2022 21:23:37 +0000

flight 175508 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175508/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  d1b8b7c312d2cf0e501ed43e88e45bba2c6986b5
baseline version:
 xtf                  5e770502e81e6bde08f55db6b0f66fbc1013850d

Last test of basis   173404  2022-10-03 12:13:14 Z   85 days
Testing same since   175508  2022-12-27 20:12:16 Z    0 days    1 attempts

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
   5e77050..d1b8b7c  d1b8b7c312d2cf0e501ed43e88e45bba2c6986b5 -> xen-tested-master

