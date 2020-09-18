Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF35270796
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 22:54:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJNOW-0004kN-G5; Fri, 18 Sep 2020 20:54:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb7v=C3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kJNOU-0004k3-VX
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 20:54:11 +0000
X-Inumbo-ID: b893294c-7ad2-4818-a1ad-77273454c5d1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b893294c-7ad2-4818-a1ad-77273454c5d1;
 Fri, 18 Sep 2020 20:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=j8JAXPAvfpuPqlabA1ypVJrJ9uuWsOXyj0hbJxcGGf8=; b=5NnREIMrmoOIKUX7jKC7mQpni2
 M0d3qGqGNdDpLJz03N/xI8u9Ko4QXrjvw0vnmFUei2GFWJhXqGI7cm+/nLoHZtO+cr1boPXST9f7V
 A1MciLQlyGQqsnsjG1WeFXm0x2Y4nplSTaWivgiGsZXNOOWoOV1m83e+UurznjqjtNJ4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJNOM-0000FV-P9; Fri, 18 Sep 2020 20:54:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJNOM-0008Tg-Jm; Fri, 18 Sep 2020 20:54:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kJNOM-0005ry-JK; Fri, 18 Sep 2020 20:54:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154468-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154468: all pass - PUSHED
X-Osstest-Versions-This: ovmf=7faece69854cbcc593643182581b5d7f99b7dab6
X-Osstest-Versions-That: ovmf=698d3d7726232694018d437279dd4166e462deb7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Sep 2020 20:54:02 +0000
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

flight 154468 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154468/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7faece69854cbcc593643182581b5d7f99b7dab6
baseline version:
 ovmf                 698d3d7726232694018d437279dd4166e462deb7

Last test of basis   154452  2020-09-18 03:41:46 Z    0 days
Testing same since   154468  2020-09-18 12:10:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Divneil Rai Wadhawan <divneil.r.wadhawan@intel.com>

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
   698d3d7726..7faece6985  7faece69854cbcc593643182581b5d7f99b7dab6 -> xen-tested-master

