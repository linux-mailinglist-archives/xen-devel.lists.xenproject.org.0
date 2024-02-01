Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65038846353
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 23:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674740.1049883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVfMw-0005Yr-FQ; Thu, 01 Feb 2024 22:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674740.1049883; Thu, 01 Feb 2024 22:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVfMw-0005X2-CP; Thu, 01 Feb 2024 22:17:14 +0000
Received: by outflank-mailman (input) for mailman id 674740;
 Thu, 01 Feb 2024 22:17:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVfMv-0005Ws-2r; Thu, 01 Feb 2024 22:17:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVfMu-0003BW-Vl; Thu, 01 Feb 2024 22:17:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVfMu-0003ge-Mf; Thu, 01 Feb 2024 22:17:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rVfMu-0006mE-M7; Thu, 01 Feb 2024 22:17:12 +0000
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
	bh=O7GqCjqt6gMwofDuYONER2Y6n5th7tDHOWRvMLXzsNQ=; b=O7paYH4FaTNdXoKu+3+kHdWOsS
	7+OQYirz6ZtOxDgFbJVE7S8qAxEyyPjzOBjD1M0HEdudGI4T76n9D1+hArN4gKsxnCqtOkPZZP/Jg
	KRREzWNAt40xCdIVBE+75nOAxd4pixESUGi1XT21giSPuRtOrzE1u0nLwJ/l4PxNcZJ4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184556-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184556: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=d1de27cf787e9c86610b11f6fe13d90f5ca91e27
X-Osstest-Versions-That:
    xtf=5a513bb7a7f08a0ab9aa23312ab9a34240a24d2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Feb 2024 22:17:12 +0000

flight 184556 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184556/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  d1de27cf787e9c86610b11f6fe13d90f5ca91e27
baseline version:
 xtf                  5a513bb7a7f08a0ab9aa23312ab9a34240a24d2c

Last test of basis   184341  2024-01-13 14:42:52 Z   19 days
Testing same since   184556  2024-02-01 19:13:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Frediano Ziglio <frediano.ziglio@cloud.com>

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
   5a513bb..d1de27c  d1de27cf787e9c86610b11f6fe13d90f5ca91e27 -> xen-tested-master

