Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E871A07DC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 09:00:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLiDk-0003eK-Ej; Tue, 07 Apr 2020 07:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VNrn=5X=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jLiDi-0003eF-RI
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 07:00:26 +0000
X-Inumbo-ID: 74817100-789d-11ea-8076-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74817100-789d-11ea-8076-12813bfff9fa;
 Tue, 07 Apr 2020 07:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSVALuns/ZDhpkbXmje5gyWX20bmfLej8JK3kt24bg8=; b=XWzKxBJ/DVL3Z+HTUPEkbfylZ
 q9jzLZen8cTSVM5H+82kKfbvL5oXldx8WVSy9GOreh/biZciRrrSNJ5qYKCYlVoYaGKwHhf6e8epm
 +tw+y1VdLiCyltrc69odmPilCh+Vk4aCoK8mdvuA7K0WZJ0i3+RsxzxSXgmisq6LU3+wk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLiDg-0003bn-F4; Tue, 07 Apr 2020 07:00:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLiDg-0007Id-24; Tue, 07 Apr 2020 07:00:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jLiDg-0001EW-0l; Tue, 07 Apr 2020 07:00:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149477-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149477: all pass - PUSHED
X-Osstest-Versions-This: ovmf=48f0e94921d83b8204f1025412e071b000394f04
X-Osstest-Versions-That: ovmf=ee026ea78b0e32a9ffbaf0040afe91de8ae2179c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Apr 2020 07:00:24 +0000
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

flight 149477 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149477/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 48f0e94921d83b8204f1025412e071b000394f04
baseline version:
 ovmf                 ee026ea78b0e32a9ffbaf0040afe91de8ae2179c

Last test of basis   149462  2020-04-06 12:09:20 Z    0 days
Testing same since   149477  2020-04-07 01:39:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>
  Sean Brogan <sean.brogan@microsoft.com>

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
   ee026ea78b..48f0e94921  48f0e94921d83b8204f1025412e071b000394f04 -> xen-tested-master

