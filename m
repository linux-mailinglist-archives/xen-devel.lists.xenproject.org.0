Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A510421B956
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 17:22:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtuqc-0002C0-Fb; Fri, 10 Jul 2020 15:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uxYN=AV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jtuqb-0002Bv-ET
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 15:21:57 +0000
X-Inumbo-ID: 16077ca0-c2c1-11ea-8fdb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16077ca0-c2c1-11ea-8fdb-12813bfff9fa;
 Fri, 10 Jul 2020 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7s5TOGEEKsK1Aibyd/2WQ9ZAJWwpf083ue44RzHRanw=; b=MgaWf/OTNcbBsE3XVf50/1Mzf
 7t4Afav0y6qyC1grG8sT15nqVUurAgRncUo01Mq94A5W4HuHQozaqQg2XCvXvMgzQzQFnidkOR9F4
 PupMzyloY/OUPlolGiokTtT6z7RJWNOFoVGyMCP+QuPsM2e/1rN00OZD5YCJfmsddOW9s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jtuqX-0006Nx-Ov; Fri, 10 Jul 2020 15:21:53 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jtuqX-0004EI-D0; Fri, 10 Jul 2020 15:21:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jtuqX-0003Z5-CO; Fri, 10 Jul 2020 15:21:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151789-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 151789: all pass - PUSHED
X-Osstest-Versions-This: xtf=f645a19115e666ce6401ca63b7d7388571463b55
X-Osstest-Versions-That: xtf=2dd14fbcf9d03fdc300491939aeac75d3eb9e05f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jul 2020 15:21:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151789 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151789/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  f645a19115e666ce6401ca63b7d7388571463b55
baseline version:
 xtf                  2dd14fbcf9d03fdc300491939aeac75d3eb9e05f

Last test of basis   151707  2020-07-07 10:39:37 Z    3 days
Testing same since   151789  2020-07-10 11:12:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>

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
   2dd14fb..f645a19  f645a19115e666ce6401ca63b7d7388571463b55 -> xen-tested-master

