Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DC1CEC8F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 07:52:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYNpC-00073P-89; Tue, 12 May 2020 05:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIy0=62=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYNpA-00073K-4C
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 05:51:28 +0000
X-Inumbo-ID: 9bcd4e72-9414-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bcd4e72-9414-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 05:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYCUO7/mXcAMTdwRLzYOIWd/3shTYLAEhY9saEQET10=; b=59mml8WK9yZsEPArjKKXedq/M
 qMJsLJWLjUD9H/CHm9ThkOahsuwTKJRN1PCNJkBDzsySeCRt5Yf1QzB5EhBwlt1Pw5HHpTIsXH+iw
 USQuhqBnLCb8KtVVFdD/TTtJ2+AaHZApZD9uPdMmCA0tcH79rNoqYncMhbuTq2vZEeVlU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYNp4-0005R0-1N; Tue, 12 May 2020 05:51:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYNp3-0003af-MY; Tue, 12 May 2020 05:51:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYNp3-0004G9-Lz; Tue, 12 May 2020 05:51:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150141-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150141: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9378310dd877b99be1da398f39e82e0501aca372
X-Osstest-Versions-That: ovmf=c8543b8d830d22882dab4ece47f0413f9c6eb431
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 May 2020 05:51:21 +0000
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

flight 150141 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150141/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9378310dd877b99be1da398f39e82e0501aca372
baseline version:
 ovmf                 c8543b8d830d22882dab4ece47f0413f9c6eb431

Last test of basis   150093  2020-05-08 21:10:51 Z    3 days
Testing same since   150141  2020-05-11 19:39:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <bret.barkelew@microsoft.com>
  Lendacky, Thomas <thomas.lendacky@amd.com>
  Tom Lendacky <thomas.lendacky@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   c8543b8d83..9378310dd8  9378310dd877b99be1da398f39e82e0501aca372 -> xen-tested-master

