Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2431B5075
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 00:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRO3H-0007A5-Nj; Wed, 22 Apr 2020 22:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GuZW=6G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRO3G-00075N-5H
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 22:41:06 +0000
X-Inumbo-ID: 56749922-84ea-11ea-92ee-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56749922-84ea-11ea-92ee-12813bfff9fa;
 Wed, 22 Apr 2020 22:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BzOmB4a9A1YSjtd5Qf6HSFwRo/WZWpIJ+55T1dbwd7A=; b=L48uPhF2fCfvU+xtDIVyZcaXw
 dhFU6w8mr5f5154xbb9TKEV9iS+hL/H/aw4l0mJs9/KHlK5XJuksiw8LQX5ktK+VjJJwBv7wTw/X0
 /hoxH5vTfAmbQCu4TMzbJvW5e5/oaXtPWjcD3x6tJq6UAYhRVdicvlnBvUjEJHXYuzgUw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRO39-0002lC-DI; Wed, 22 Apr 2020 22:40:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRO39-00058W-4d; Wed, 22 Apr 2020 22:40:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRO39-0003Sr-3y; Wed, 22 Apr 2020 22:40:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149735-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149735: all pass - PUSHED
X-Osstest-Versions-This: ovmf=c6a60cf4b99069f55325675c7c7e98b510f4b224
X-Osstest-Versions-That: ovmf=b447a20bdfb2ff24ba048bb3026c902c4768a7e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Apr 2020 22:40:59 +0000
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

flight 149735 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149735/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c6a60cf4b99069f55325675c7c7e98b510f4b224
baseline version:
 ovmf                 b447a20bdfb2ff24ba048bb3026c902c4768a7e9

Last test of basis   149725  2020-04-21 20:09:37 Z    1 days
Testing same since   149735  2020-04-22 11:21:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>

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
   b447a20bdf..c6a60cf4b9  c6a60cf4b99069f55325675c7c7e98b510f4b224 -> xen-tested-master

