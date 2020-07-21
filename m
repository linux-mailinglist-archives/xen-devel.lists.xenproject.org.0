Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58622227563
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 04:10:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxhj2-0002jQ-2W; Tue, 21 Jul 2020 02:09:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tByU=BA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jxhj1-0002j3-3a
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 02:09:47 +0000
X-Inumbo-ID: 3c516b26-caf7-11ea-a04f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c516b26-caf7-11ea-a04f-12813bfff9fa;
 Tue, 21 Jul 2020 02:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XTEX+IFpcOHiRncNwbfPVucJWVTHRAkOqEos2JgRwpY=; b=kITfKN1BMTAxQAfkIgQRU0oK/
 cHGLBzLERI6QJzXPuIxHewZDWapzkU4hFkuzn0UhM1zCx6F2s6i3J6eEUUB/VsSJNXH4J+3oR3BP4
 eYtHWdncwMDknO4zCF/a/Ofusu2ofc61yq0ROwGxPuPEdEIxtXmAc56UgDKB/W3a0Imp8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jxhiu-0000C1-7p; Tue, 21 Jul 2020 02:09:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jxhiu-0000eU-0F; Tue, 21 Jul 2020 02:09:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jxhit-0004aS-Vp; Tue, 21 Jul 2020 02:09:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152049-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 152049: all pass - PUSHED
X-Osstest-Versions-This: xtf=ba5923110c2f562170b82f955d9ace70f6a4a8e2
X-Osstest-Versions-That: xtf=f645a19115e666ce6401ca63b7d7388571463b55
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Jul 2020 02:09:39 +0000
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

flight 152049 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152049/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  ba5923110c2f562170b82f955d9ace70f6a4a8e2
baseline version:
 xtf                  f645a19115e666ce6401ca63b7d7388571463b55

Last test of basis   151789  2020-07-10 11:12:38 Z   10 days
Testing same since   152049  2020-07-20 15:10:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
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
   f645a19..ba59231  ba5923110c2f562170b82f955d9ace70f6a4a8e2 -> xen-tested-master

