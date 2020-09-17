Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63B26E2EB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 19:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIy3g-0007T5-Dd; Thu, 17 Sep 2020 17:51:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G9fY=C2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kIy3f-0007Sl-6b
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 17:50:59 +0000
X-Inumbo-ID: 0d7d38a6-736e-4dae-909d-4e7290de18e2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d7d38a6-736e-4dae-909d-4e7290de18e2;
 Thu, 17 Sep 2020 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=4tIvfm/cKqEZnvRmxVlSH/fJcFInVLLi4gnr9ReKcx0=; b=zvd8BHjSaaAc5gEtrOzqrYCsr/
 0AEC8L7EPyuvP6YarrtLJu6BD+yQ9b9wZM7Js5KiVPK2MY7APCPUskzt1930oCwPifwv066RMXqIY
 CREf2AklbNC8tQYxvcuT868kkeQGzCYMKLt0CimiIi2aQO2jSbihaOyJS0DSsd1IXBMA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIy3Y-0000YR-9R; Thu, 17 Sep 2020 17:50:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIy3Y-0005df-0T; Thu, 17 Sep 2020 17:50:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kIy3X-0004jm-WB; Thu, 17 Sep 2020 17:50:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154429-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154429: all pass - PUSHED
X-Osstest-Versions-This: ovmf=5648836987cab28ca988dfe5af94413cfa480a92
X-Osstest-Versions-That: ovmf=8028b2907e20b21cd7d69639a36ac82a77c81dc1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 17 Sep 2020 17:50:51 +0000
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

flight 154429 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154429/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5648836987cab28ca988dfe5af94413cfa480a92
baseline version:
 ovmf                 8028b2907e20b21cd7d69639a36ac82a77c81dc1

Last test of basis   154378  2020-09-16 07:40:49 Z    1 days
Testing same since   154429  2020-09-17 12:10:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>

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
   8028b2907e..5648836987  5648836987cab28ca988dfe5af94413cfa480a92 -> xen-tested-master

