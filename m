Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763F806837
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648945.1013066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmJb-00047Q-FW; Wed, 06 Dec 2023 07:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648945.1013066; Wed, 06 Dec 2023 07:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmJb-00044k-CG; Wed, 06 Dec 2023 07:27:27 +0000
Received: by outflank-mailman (input) for mailman id 648945;
 Wed, 06 Dec 2023 07:27:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rAmJZ-00044a-O3; Wed, 06 Dec 2023 07:27:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rAmJZ-0001q2-EX; Wed, 06 Dec 2023 07:27:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rAmJY-0003bU-Vb; Wed, 06 Dec 2023 07:27:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rAmJY-0005uq-VA; Wed, 06 Dec 2023 07:27:24 +0000
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
	bh=GBDO4hV8bk5Ec8jgZYYA/Syx2NRDLxUQ7M/PQUPbOk0=; b=DHZiT7Q2/EyZOEivbV27V4rm6O
	pbcL3+M7e9/7gI/zStPSVv0jJvdMoKiMRwRHkMGhL2gmsk47fVzSpguhVwPGDN/jQuToq9efVsm4r
	bFT8FGsYTmFIA4e6K27R6UVxizj9ncW9tPcF30dRJm5WTQt7WIY6eHxOz/+eXQBAWjsE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184004-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184004: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7e18c9a788e543ab71cdc0485989cf5d00cdccc2
X-Osstest-Versions-That:
    ovmf=ef3fde64aa78598a4c21556629936fb228390e8c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Dec 2023 07:27:24 +0000

flight 184004 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184004/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7e18c9a788e543ab71cdc0485989cf5d00cdccc2
baseline version:
 ovmf                 ef3fde64aa78598a4c21556629936fb228390e8c

Last test of basis   183999  2023-12-05 20:44:36 Z    0 days
Testing same since   184004  2023-12-06 05:41:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   ef3fde64aa..7e18c9a788  7e18c9a788e543ab71cdc0485989cf5d00cdccc2 -> xen-tested-master

