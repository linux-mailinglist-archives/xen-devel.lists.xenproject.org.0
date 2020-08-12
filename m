Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F8242814
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 12:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5niz-0002MA-C0; Wed, 12 Aug 2020 10:11:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OV9a=BW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k5nix-0002Lm-2h
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 10:11:11 +0000
X-Inumbo-ID: 89a82109-32ad-41d2-b005-d3b23c4ee42b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89a82109-32ad-41d2-b005-d3b23c4ee42b;
 Wed, 12 Aug 2020 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LqVsGpE1I2HTMq+8r0hfPbpziAXAWSUSo8cnOkBJkK8=; b=4AuZQXqZt4bR8DuMSztcCEIB9
 V9pFo9/BLAzui6HYlLdWssHXfB2ZXxqa12BiRGFXydfgoB8GmgwFTL0l/hgZrl+hopffg+rohyQVL
 QWFXD/v/7OuSJbemx6Lrx4YKv8Co/yJW80M1ez91zSpJsTfqZSqgaz/nUCTHyczQbKcoA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k5nim-0001xR-0E; Wed, 12 Aug 2020 10:11:00 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k5nil-00031Q-Hu; Wed, 12 Aug 2020 10:10:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k5nil-0008Ja-H1; Wed, 12 Aug 2020 10:10:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152564-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 152564: all pass - PUSHED
X-Osstest-Versions-This: xtf=17d372b763cb0b2e2e6b5a637c11f3997d2533fa
X-Osstest-Versions-That: xtf=ba5923110c2f562170b82f955d9ace70f6a4a8e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Aug 2020 10:10:59 +0000
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

flight 152564 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152564/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  17d372b763cb0b2e2e6b5a637c11f3997d2533fa
baseline version:
 xtf                  ba5923110c2f562170b82f955d9ace70f6a4a8e2

Last test of basis   152049  2020-07-20 15:10:26 Z   22 days
Testing same since   152564  2020-08-11 19:41:10 Z    0 days    1 attempts

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
   ba59231..17d372b  17d372b763cb0b2e2e6b5a637c11f3997d2533fa -> xen-tested-master

