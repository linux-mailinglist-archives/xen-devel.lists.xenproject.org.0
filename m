Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9F2172D5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 17:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jspoW-0002GV-D7; Tue, 07 Jul 2020 15:47:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F44P=AS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jspoV-0002GQ-4G
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 15:47:19 +0000
X-Inumbo-ID: 22ad42b5-c069-11ea-8da1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22ad42b5-c069-11ea-8da1-12813bfff9fa;
 Tue, 07 Jul 2020 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zJ7n0NS19MmPMjNWvUtF9lPx7+C/LUeb4wjFeKH2jM=; b=KDoEaV3jXMudM8SnhdVnlj1F1
 3jxCuh97qm49xBo5VYLqV9FctskFDHB9gZvXv/z81cgoWiS2Arqp/ootNrGZ1RgUwNU+N/1j0NecP
 zBYBPaqiSUAXdph7AwPUImjSHjszNf83fq79JpGrVUHrPemt+Uw0brOes3WUUorU58l58=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jspoU-0006rD-48; Tue, 07 Jul 2020 15:47:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jspoT-0004AT-Sy; Tue, 07 Jul 2020 15:47:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jspoT-0007Xl-Rx; Tue, 07 Jul 2020 15:47:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151707-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 151707: all pass - PUSHED
X-Osstest-Versions-This: xtf=2dd14fbcf9d03fdc300491939aeac75d3eb9e05f
X-Osstest-Versions-That: xtf=2a8859e87761a0efc119778e094f203dc2ea487a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Jul 2020 15:47:17 +0000
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

flight 151707 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151707/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  2dd14fbcf9d03fdc300491939aeac75d3eb9e05f
baseline version:
 xtf                  2a8859e87761a0efc119778e094f203dc2ea487a

Last test of basis   150870  2020-06-05 20:09:44 Z   31 days
Testing same since   151707  2020-07-07 10:39:37 Z    0 days    1 attempts

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
   2a8859e..2dd14fb  2dd14fbcf9d03fdc300491939aeac75d3eb9e05f -> xen-tested-master

