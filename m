Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7628A123
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 20:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5522.14349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRJXx-0006S0-9I; Sat, 10 Oct 2020 18:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5522.14349; Sat, 10 Oct 2020 18:24:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRJXx-0006Rb-5z; Sat, 10 Oct 2020 18:24:45 +0000
Received: by outflank-mailman (input) for mailman id 5522;
 Sat, 10 Oct 2020 18:24:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRJXv-0006Qh-Iz
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 18:24:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 641a595d-0a8c-4985-ab62-7cad230eacae;
 Sat, 10 Oct 2020 18:24:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRJXo-0002NI-CS; Sat, 10 Oct 2020 18:24:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRJXo-0003kz-2y; Sat, 10 Oct 2020 18:24:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRJXo-0000nl-2W; Sat, 10 Oct 2020 18:24:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRJXv-0006Qh-Iz
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 18:24:43 +0000
X-Inumbo-ID: 641a595d-0a8c-4985-ab62-7cad230eacae
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 641a595d-0a8c-4985-ab62-7cad230eacae;
	Sat, 10 Oct 2020 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=X2fIyhllBBJYGdW11xIvMqQkZ6T5Ccem8iF20Kw1XNg=; b=rOCrPUe7BgbQ4nEi2I3Cc23aKd
	giI/vPL6Ma2jVIUXzLqTm9/8RX6X0wq5boZeXDGQWgn2PP3B6EIKVXSAI8u08h091ziOCYsBDhCYU
	ka9V6rcgJb032+IgWmvWJxMvOOEaeoxefr+5hI+uNSsusWhC/piFVZggsytPTlyKNNrg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRJXo-0002NI-CS; Sat, 10 Oct 2020 18:24:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRJXo-0003kz-2y; Sat, 10 Oct 2020 18:24:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRJXo-0000nl-2W; Sat, 10 Oct 2020 18:24:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155660-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 155660: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=79d9c62fb0e89dabcda6ba265ed89607be2dedc5
X-Osstest-Versions-That:
    xtf=a1bb00c99b92202ee818d9df6464484f89989d80
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Oct 2020 18:24:36 +0000

flight 155660 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155660/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  79d9c62fb0e89dabcda6ba265ed89607be2dedc5
baseline version:
 xtf                  a1bb00c99b92202ee818d9df6464484f89989d80

Last test of basis   154651  2020-09-23 16:09:54 Z   17 days
Testing same since   155660  2020-10-10 17:41:44 Z    0 days    1 attempts

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
   a1bb00c..79d9c62  79d9c62fb0e89dabcda6ba265ed89607be2dedc5 -> xen-tested-master

