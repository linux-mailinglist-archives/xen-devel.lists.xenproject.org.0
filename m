Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAE92296CA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 13:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyCUo-0006XM-5C; Wed, 22 Jul 2020 11:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/Qh=BB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jyCUn-0006XH-Cc
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:01:09 +0000
X-Inumbo-ID: a55b8dae-cc0a-11ea-a191-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a55b8dae-cc0a-11ea-a191-12813bfff9fa;
 Wed, 22 Jul 2020 11:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elgyL+EOKCQprDAfX5nfVNeWCmbbdzf1HfxyqHTDUaQ=; b=2boJhiLx2mLPDX7ydCffhRJv8
 Pnh7Bv+q3ZGzC2SeDxl2l2hLLl4BfbA0Fs0X3kxNuZig1EZzfHIkbszhZMTH0beQewfHDbYEAZotD
 CGtWETBrS6ycCDGZ+L8gdBqbjLl2xMOPeHwzHt6LDlCzGq6zRFvI7jmivVEbKEPCRqIFc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyCUl-0004M2-LX; Wed, 22 Jul 2020 11:01:07 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyCUk-0006JR-W8; Wed, 22 Jul 2020 11:01:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jyCUk-0005PX-VL; Wed, 22 Jul 2020 11:01:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152088-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152088: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9132a31b9c8381197eee75eb66c809182b264110
X-Osstest-Versions-That: ovmf=02539e900854488343a1efa435d4dded1ddd66a2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Jul 2020 11:01:06 +0000
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

flight 152088 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152088/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9132a31b9c8381197eee75eb66c809182b264110
baseline version:
 ovmf                 02539e900854488343a1efa435d4dded1ddd66a2

Last test of basis   152068  2020-07-21 07:11:01 Z    1 days
Testing same since   152088  2020-07-21 23:41:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   02539e9008..9132a31b9c  9132a31b9c8381197eee75eb66c809182b264110 -> xen-tested-master

