Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8561ADEC6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 15:54:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRS2-0004vx-Hp; Fri, 17 Apr 2020 13:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piBF=6B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jPRS1-0004vr-2g
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 13:54:37 +0000
X-Inumbo-ID: f9176e5c-80b2-11ea-8cf0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9176e5c-80b2-11ea-8cf0-12813bfff9fa;
 Fri, 17 Apr 2020 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNaHNLPNKm2Bg04wtzDKHJW229rDt+VafWM8WVkmqPs=; b=bin8oM+6RTQD+6FEXGPr02CL0
 8p/dCsV+5RgzWQU3Rzu/ybDBlTVEJRd6w4IxvsJ9WBY3TePfIBEZTdWGhwsIYystQGgfk9SBHhIyn
 XnTjy927ljc5yNHAhZ+38WY2ligFmgIjFoVWJWccQSUaI+Jv/iz7eN6YBxumQdpBRTx7U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPRRz-0007RV-Qi; Fri, 17 Apr 2020 13:54:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPRRz-0002kA-Ik; Fri, 17 Apr 2020 13:54:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jPRRz-0003In-I2; Fri, 17 Apr 2020 13:54:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149698-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149698: all pass - PUSHED
X-Osstest-Versions-This: ovmf=c884b23ac40a1b1f56e21ebbb1f602fa2e0f05c9
X-Osstest-Versions-That: ovmf=a7947b6366a660d4d655371fe6bc96315097c06d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Apr 2020 13:54:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149698 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149698/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c884b23ac40a1b1f56e21ebbb1f602fa2e0f05c9
baseline version:
 ovmf                 a7947b6366a660d4d655371fe6bc96315097c06d

Last test of basis   149694  2020-04-16 21:41:26 Z    0 days
Testing same since   149698  2020-04-17 07:50:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>

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
   a7947b6366..c884b23ac4  c884b23ac40a1b1f56e21ebbb1f602fa2e0f05c9 -> xen-tested-master

