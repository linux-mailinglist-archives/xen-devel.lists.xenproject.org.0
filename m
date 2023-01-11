Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095666524B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 04:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475052.736552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFRj2-00062a-2e; Wed, 11 Jan 2023 03:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475052.736552; Wed, 11 Jan 2023 03:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFRj1-000601-Vv; Wed, 11 Jan 2023 03:24:27 +0000
Received: by outflank-mailman (input) for mailman id 475052;
 Wed, 11 Jan 2023 03:24:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFRj0-0005zr-DL; Wed, 11 Jan 2023 03:24:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFRj0-0001CT-BW; Wed, 11 Jan 2023 03:24:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFRiz-0007Mv-TO; Wed, 11 Jan 2023 03:24:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pFRiz-0001SR-Sk; Wed, 11 Jan 2023 03:24:25 +0000
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
	bh=nH8HPizo21iSp5t+H++796J1pK2fD+QJmm4NQGEJzlo=; b=thXKFGGDI2DL5cOMUZM/H1669o
	qq4koSsQ53cCLI9+1u6rrrYJUDLzi2kvgGBni2oWXnHo1wm97GlbEOL7acebANKptMIvZiqZysKlH
	EPLfC4K3KY/uruGbdAFyNTL0I8HkitMrhHfzTYwizMQMntZTyYlw92HdTJM0knTdNsTw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175715-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 175715: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=c0f454c68329301447fd258e47824f7d402f19e9
X-Osstest-Versions-That:
    xtf=d1b8b7c312d2cf0e501ed43e88e45bba2c6986b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Jan 2023 03:24:25 +0000

flight 175715 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175715/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  c0f454c68329301447fd258e47824f7d402f19e9
baseline version:
 xtf                  d1b8b7c312d2cf0e501ed43e88e45bba2c6986b5

Last test of basis   175508  2022-12-27 20:12:16 Z   14 days
Testing same since   175715  2023-01-11 01:41:46 Z    0 days    1 attempts

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
   d1b8b7c..c0f454c  c0f454c68329301447fd258e47824f7d402f19e9 -> xen-tested-master

