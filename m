Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B772056388C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 19:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359117.588500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KK8-0008Lk-7Z; Fri, 01 Jul 2022 17:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359117.588500; Fri, 01 Jul 2022 17:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KK8-0008Ip-4L; Fri, 01 Jul 2022 17:20:56 +0000
Received: by outflank-mailman (input) for mailman id 359117;
 Fri, 01 Jul 2022 17:20:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7KK6-0008If-JY; Fri, 01 Jul 2022 17:20:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7KK6-0006vn-IW; Fri, 01 Jul 2022 17:20:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7KK5-0003Wm-WF; Fri, 01 Jul 2022 17:20:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o7KK5-0004BV-Vn; Fri, 01 Jul 2022 17:20:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=zldCPXbchw6ZYBNXFJEA/CBBBop/dUXEm5O171Xtpww=; b=P06S/GRKTMIK/RIGb7RmW+OAUW
	31vL015XMxvGed1VYUn2F3Sj6KwkkkNaiQz57tcj1EQAndxX4iIU/zWffK28ZtjaprKGXmVllDxRu
	qr2XDbKOgn0HRXNU0ST1cKL1nQKuyaKKM5AXhdmiFtmLif8sfX/0rnXiJnmJBZ4FbDYA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171444-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171444: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=70586d4e3af67dcc4fa2cd49524b7e5b71e0c7e1
X-Osstest-Versions-That:
    ovmf=f966093f5bb88e6fccac8e0b9eeca6c73aef0c35
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Jul 2022 17:20:53 +0000

flight 171444 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171444/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 70586d4e3af67dcc4fa2cd49524b7e5b71e0c7e1
baseline version:
 ovmf                 f966093f5bb88e6fccac8e0b9eeca6c73aef0c35

Last test of basis   171438  2022-07-01 07:10:43 Z    0 days
Testing same since   171444  2022-07-01 15:13:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Miki Shindo <miki.shindo@intel.com>

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
   f966093f5b..70586d4e3a  70586d4e3af67dcc4fa2cd49524b7e5b71e0c7e1 -> xen-tested-master

