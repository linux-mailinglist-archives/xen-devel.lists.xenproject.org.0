Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75372DED6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547966.855658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q912q-0005HX-0L; Tue, 13 Jun 2023 10:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547966.855658; Tue, 13 Jun 2023 10:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q912p-0005FK-TT; Tue, 13 Jun 2023 10:14:35 +0000
Received: by outflank-mailman (input) for mailman id 547966;
 Tue, 13 Jun 2023 10:14:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q912o-0005F5-IN; Tue, 13 Jun 2023 10:14:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q912o-00059l-Ft; Tue, 13 Jun 2023 10:14:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q912o-0004EY-1z; Tue, 13 Jun 2023 10:14:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q912o-0004vU-1X; Tue, 13 Jun 2023 10:14:34 +0000
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
	bh=pGooiutM/urzxvhDuWhoWa186QV0AdSA13rvzMkRyY0=; b=sut3y1Pa7cZDsEw2TpqZATq+ME
	KZGbHL5rfAJawZCiTJm5M/jqPenkQ+ume4H966exKu6cDAqZdfsuToGHuFw4NyJN92OqPwiTFkzOd
	IKcWO+P/TFQGd6NmTDc5no6GyrwlqTypIaDiyApe/BLY/R6kT0KJTPm1FsMDzFpX1fy4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181404-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181404: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=51bb8eb76c4e8c57d5484c647ecf0b5c5fa8fa94
X-Osstest-Versions-That:
    ovmf=530f5b0912c1c3837337baeec66eb7b0a90d9969
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Jun 2023 10:14:34 +0000

flight 181404 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181404/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 51bb8eb76c4e8c57d5484c647ecf0b5c5fa8fa94
baseline version:
 ovmf                 530f5b0912c1c3837337baeec66eb7b0a90d9969

Last test of basis   181400  2023-06-13 03:12:26 Z    0 days
Testing same since   181404  2023-06-13 08:11:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  MarsX Lin <marsx.lin@intel.com>
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
   530f5b0912..51bb8eb76c  51bb8eb76c4e8c57d5484c647ecf0b5c5fa8fa94 -> xen-tested-master

