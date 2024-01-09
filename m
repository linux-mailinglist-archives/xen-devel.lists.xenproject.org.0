Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759338286F4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 14:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664582.1034667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNC0E-0007wP-C3; Tue, 09 Jan 2024 13:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664582.1034667; Tue, 09 Jan 2024 13:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNC0E-0007uh-8v; Tue, 09 Jan 2024 13:18:46 +0000
Received: by outflank-mailman (input) for mailman id 664582;
 Tue, 09 Jan 2024 13:18:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNC0C-0007uU-Ha; Tue, 09 Jan 2024 13:18:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNC0C-0008IO-EQ; Tue, 09 Jan 2024 13:18:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNC0C-0002vF-2h; Tue, 09 Jan 2024 13:18:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNC0C-00063P-2L; Tue, 09 Jan 2024 13:18:44 +0000
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
	bh=rKWYhaLLSV625TLPV0J4plVhXrqI2xxRsYEdPpxD4ko=; b=uyPHNA289Zp/o7gXALpdHGUyXr
	siI6sLFu9Pnr/gIWRB9jPliGJhAmB2tNNcTKLxGYugVqDcS4ArTkd0U/dgsgztzH2qtOl/JbbOOnG
	GyH3VdhMQ8ZfIiCahv6tF/xhNmXTL6EBEAJyiXg7YQFbRKvwwVwQwjFQT4evieJj9SQ8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184294-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184294: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=837f771d9612215d5e6c9a1a41bf3b3ab0d0b381
X-Osstest-Versions-That:
    xtf=2eed9f51c67a9e5d29ffd4ffeee50710489aad23
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jan 2024 13:18:44 +0000

flight 184294 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184294/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  837f771d9612215d5e6c9a1a41bf3b3ab0d0b381
baseline version:
 xtf                  2eed9f51c67a9e5d29ffd4ffeee50710489aad23

Last test of basis   184279  2024-01-08 15:13:02 Z    0 days
Testing same since   184294  2024-01-09 12:14:55 Z    0 days    1 attempts

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
   2eed9f5..837f771  837f771d9612215d5e6c9a1a41bf3b3ab0d0b381 -> xen-tested-master

