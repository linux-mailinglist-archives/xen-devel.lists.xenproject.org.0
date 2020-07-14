Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783021F7FF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 19:17:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvOXd-0001dP-Fp; Tue, 14 Jul 2020 17:16:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy+=AZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jvOXc-0001d5-52
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 17:16:28 +0000
X-Inumbo-ID: bcee1b64-c5f5-11ea-9342-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcee1b64-c5f5-11ea-9342-12813bfff9fa;
 Tue, 14 Jul 2020 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3w6gYnKBua3p356eh4FaJ3t7dtGbQ82+hMuNktdHiFQ=; b=GY/nXZRvMb2krbaW82RdBbrG5
 H643YwLEbayLOP00VGl+PnGJ8XclG2ys/2KC/llJB2NJx5/RRl+tiQYNO8/CHoE98WHouhhPs8B4V
 MFPa/TOgbu2JN4TMKI93wNEt95wEGd2icoUaSc1zRaPxb6DfL/3RC1sfcEhk5Lb382GZw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvOXV-0002xZ-1g; Tue, 14 Jul 2020 17:16:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvOXU-0000UY-Iq; Tue, 14 Jul 2020 17:16:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jvOXU-0006Ux-ID; Tue, 14 Jul 2020 17:16:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151881-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151881: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9c6f3545aee0808b78a0ad4480b6eb9d24989dc1
X-Osstest-Versions-That: ovmf=d9a4084544134eea50f62e88d79c466ae91f0455
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Jul 2020 17:16:20 +0000
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

flight 151881 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151881/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9c6f3545aee0808b78a0ad4480b6eb9d24989dc1
baseline version:
 ovmf                 d9a4084544134eea50f62e88d79c466ae91f0455

Last test of basis   151867  2020-07-13 16:09:22 Z    1 days
Testing same since   151881  2020-07-14 03:39:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>

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
   d9a4084544..9c6f3545ae  9c6f3545aee0808b78a0ad4480b6eb9d24989dc1 -> xen-tested-master

