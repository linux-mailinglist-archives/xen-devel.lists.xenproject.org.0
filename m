Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B7421F75
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 09:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202044.356707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXevJ-0005Sy-8s; Tue, 05 Oct 2021 07:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202044.356707; Tue, 05 Oct 2021 07:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXevJ-0005R5-4j; Tue, 05 Oct 2021 07:31:37 +0000
Received: by outflank-mailman (input) for mailman id 202044;
 Tue, 05 Oct 2021 07:31:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXevH-0005Qv-RN; Tue, 05 Oct 2021 07:31:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXevH-00063B-LP; Tue, 05 Oct 2021 07:31:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXevH-0003dE-96; Tue, 05 Oct 2021 07:31:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mXevH-0006lt-8a; Tue, 05 Oct 2021 07:31:35 +0000
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
	bh=1tqaf1zw9e3ShtR2BGl6Bg9Ur2wxVguP22XWjR/kjOk=; b=enALwnpiesTfauz45/FQfwXe35
	kg0zHeBw+mCEb0bHtxcPdYkjWOzOxmte2IrX0tmeIYq3SaJP6pZDj85p4BetcX/JnHdXLWZ+UbEAM
	9UtsCAHgOMvaQrUtuypZsodGQ3BAuQFC4Ks3XzHmSBRAXCoAQsTvTkMEcLq3fg1CwZ10=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165349-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 165349: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=61e6f40b07d256bd62ae7b231a3eeecd49d0b15b
X-Osstest-Versions-That:
    xtf=91d215a4ed1463ab14d1f68e497117ac1255e05e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Oct 2021 07:31:35 +0000

flight 165349 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165349/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  61e6f40b07d256bd62ae7b231a3eeecd49d0b15b
baseline version:
 xtf                  91d215a4ed1463ab14d1f68e497117ac1255e05e

Last test of basis   164867  2021-09-07 00:10:12 Z   28 days
Testing same since   165349  2021-10-04 12:43:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Michal Orzel <michal.orzel@arm.com>

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
   91d215a..61e6f40  61e6f40b07d256bd62ae7b231a3eeecd49d0b15b -> xen-tested-master

