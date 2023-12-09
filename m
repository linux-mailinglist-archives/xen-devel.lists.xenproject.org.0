Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82280B1E7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 04:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650857.1016696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBnzT-0001IL-4h; Sat, 09 Dec 2023 03:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650857.1016696; Sat, 09 Dec 2023 03:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBnzT-0001Fi-1p; Sat, 09 Dec 2023 03:26:55 +0000
Received: by outflank-mailman (input) for mailman id 650857;
 Sat, 09 Dec 2023 03:26:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBnzR-0001FY-Mw; Sat, 09 Dec 2023 03:26:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBnzR-00066O-9f; Sat, 09 Dec 2023 03:26:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBnzR-0007s4-10; Sat, 09 Dec 2023 03:26:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBnzR-0007mG-0U; Sat, 09 Dec 2023 03:26:53 +0000
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
	bh=qO3nj0t5khU8b0UW++UBWnqokC+ybJb6B7Ve2GyBUeg=; b=KKUsfdvzH3lSzb/LfI3/qli9mx
	fyoYXZy/Umab9A/AsGtT8LJPHKGT2RViGcJRq964FV7vn8DV+MbKVGiGybxrj6LfWq+ddNQAW97Q6
	4D8BgBJQHPDRzMITfgVqMzVcUOcRb+gmOHn9gF/si/eCsheJAgzVn6Zsz+7Q5Pg5IKQs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184042-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184042: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=85a5141a320980e1479343a62731517e197f784e
X-Osstest-Versions-That:
    ovmf=3c40ee8c68efb787b13be1a120d2ea0ebf1fc949
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Dec 2023 03:26:53 +0000

flight 184042 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184042/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 85a5141a320980e1479343a62731517e197f784e
baseline version:
 ovmf                 3c40ee8c68efb787b13be1a120d2ea0ebf1fc949

Last test of basis   184040  2023-12-08 23:12:38 Z    0 days
Testing same since   184042  2023-12-09 01:56:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  ManickamX Srinivasan <manickamx.srinivasan@intel.com>

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
   3c40ee8c68..85a5141a32  85a5141a320980e1479343a62731517e197f784e -> xen-tested-master

