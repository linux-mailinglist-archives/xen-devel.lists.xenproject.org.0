Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA51D8280
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 19:57:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jak0k-0001BS-VU; Mon, 18 May 2020 17:57:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d2DE=7A=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jak0j-0001BN-On
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 17:57:09 +0000
X-Inumbo-ID: faddfd3c-9930-11ea-a886-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faddfd3c-9930-11ea-a886-12813bfff9fa;
 Mon, 18 May 2020 17:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVhzAuOOAejmlAEdSCLDnGimczaBMxQFwqYtATTSYKs=; b=dKDQt3zXblE/EV6o7OZQccKgA
 mM5qoJjJp91mauG1+zapde6SI3WNXfPXq624yNIMeAzObngkDbSWSaR8lkeJ5Dpqmi0peE9l+JxwM
 +h6Q7c77jgCN11DCaDck2NDdZX89+eOoh+IuX5BvF/KuYEZvQHPBfHlZ4slZycdWEI9a0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jak0c-0006mu-Vf; Mon, 18 May 2020 17:57:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jak0c-0007Gq-Lu; Mon, 18 May 2020 17:57:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jak0c-0000oH-LD; Mon, 18 May 2020 17:57:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150232-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150232: all pass - PUSHED
X-Osstest-Versions-This: ovmf=7b6327ff03bb4436261ffad246ba3a14de10391f
X-Osstest-Versions-That: ovmf=9099dcbd61c8d22b5eedda783d143c222d2705a3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 May 2020 17:57:02 +0000
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

flight 150232 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150232/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7b6327ff03bb4436261ffad246ba3a14de10391f
baseline version:
 ovmf                 9099dcbd61c8d22b5eedda783d143c222d2705a3

Last test of basis   150196  2020-05-15 13:16:10 Z    3 days
Testing same since   150232  2020-05-18 16:09:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>

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
   9099dcbd61..7b6327ff03  7b6327ff03bb4436261ffad246ba3a14de10391f -> xen-tested-master

