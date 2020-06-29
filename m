Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C922220D07B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 19:46:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpxqp-0004Bs-2Q; Mon, 29 Jun 2020 17:45:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7I7=AK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jpxqn-0004BW-Pq
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 17:45:49 +0000
X-Inumbo-ID: 5b435a80-ba30-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b435a80-ba30-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kI+dr4nXpJzzq1M641ow/vAnN/4S/42KIdrN09v8UnU=; b=IE0VLPZmbnM93wJj+75WF56U4
 MeySuRYTCPBW8acD7IjhPqcq1Dr7Q6Wtv+Do5Y0b+yZRKf3k2cUueNYzTcV9jtaKOlzwcLKW864kw
 86SgyOFPUZiWpFpJDFAYmBaZEhUoeHSCHea1uItHmfH1Iez4o6NmxWorMprdzlKhMy3Qo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpxqh-0000io-Ks; Mon, 29 Jun 2020 17:45:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpxqh-0003b8-88; Mon, 29 Jun 2020 17:45:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jpxqh-0001po-7Y; Mon, 29 Jun 2020 17:45:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151451-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151451: all pass - PUSHED
X-Osstest-Versions-This: ovmf=0f01cec52f4794777feb067e4fa0bfcedfdc124e
X-Osstest-Versions-That: ovmf=0060e0a694f3f249c3ec081b0e61287c36f64ebb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Jun 2020 17:45:43 +0000
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

flight 151451 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151451/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0f01cec52f4794777feb067e4fa0bfcedfdc124e
baseline version:
 ovmf                 0060e0a694f3f249c3ec081b0e61287c36f64ebb

Last test of basis   151444  2020-06-29 02:39:29 Z    0 days
Testing same since   151451  2020-06-29 10:12:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhichao Gao <zhichao.gao@intel.com>

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
   0060e0a694..0f01cec52f  0f01cec52f4794777feb067e4fa0bfcedfdc124e -> xen-tested-master

