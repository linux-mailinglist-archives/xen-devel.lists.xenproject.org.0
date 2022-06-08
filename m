Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160EC543247
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 16:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343821.569351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywRD-0000CT-Jc; Wed, 08 Jun 2022 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343821.569351; Wed, 08 Jun 2022 14:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywRD-00009u-FO; Wed, 08 Jun 2022 14:13:35 +0000
Received: by outflank-mailman (input) for mailman id 343821;
 Wed, 08 Jun 2022 14:13:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nywRB-00009h-Qq; Wed, 08 Jun 2022 14:13:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nywRB-0006T4-P9; Wed, 08 Jun 2022 14:13:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nywRB-0007xy-De; Wed, 08 Jun 2022 14:13:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nywRB-0007VF-DE; Wed, 08 Jun 2022 14:13:33 +0000
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
	bh=2OFx+eP1trTGvb8yOwQShBNse4OoLKit0MdAZCllE+Q=; b=TJ555VUb3H6xUFGVrOACKPlo3G
	MAiYBqlYI/htF0drWU3TL8vMA9iGbhkpH1Wp/waf9iNVnuh7rFe5gHoRa9ZUCLvpA9FS5vOixurPh
	0gPDOUoA6qjaoX5veHPKmPSKAFZFDVKvk+TAcVjHMi3fhtGmE/GpcwW5nYj/BgsB093w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170885-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170885: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff36b2550f94dc5fac838cf298ae5a23cfddf204
X-Osstest-Versions-That:
    ovmf=a81a650da1dc40ec2b2825d1878cdf2778b4be14
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Jun 2022 14:13:33 +0000

flight 170885 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170885/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff36b2550f94dc5fac838cf298ae5a23cfddf204
baseline version:
 ovmf                 a81a650da1dc40ec2b2825d1878cdf2778b4be14

Last test of basis   170867  2022-06-07 11:10:44 Z    1 days
Testing same since   170885  2022-06-08 12:11:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   a81a650da1..ff36b2550f  ff36b2550f94dc5fac838cf298ae5a23cfddf204 -> xen-tested-master

