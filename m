Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6390846767
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 06:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674785.1049953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVli5-0001JU-FN; Fri, 02 Feb 2024 05:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674785.1049953; Fri, 02 Feb 2024 05:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVli5-0001I9-BH; Fri, 02 Feb 2024 05:03:29 +0000
Received: by outflank-mailman (input) for mailman id 674785;
 Fri, 02 Feb 2024 05:03:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVli4-0001Hx-03; Fri, 02 Feb 2024 05:03:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVli3-00082K-U2; Fri, 02 Feb 2024 05:03:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVli3-0007Vl-Jx; Fri, 02 Feb 2024 05:03:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rVli3-0000KJ-JZ; Fri, 02 Feb 2024 05:03:27 +0000
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
	bh=HLKjIG71iBLJBIPvNPKHr/VY/3JrgM2iFFXw0DG0wh0=; b=RMkKFTwbbooxiT9sj8J+zsXRbF
	Moj0Hn3lJb3mdUBdnJG2JRYjL9iHjq5siNaZt+R0oTdixntTiNCJCjQcv5FehTpRaQBidcDlvCsia
	MAOXleEWwavgr8HSBBNchhy0+B/I3utP7b5BpXP1Jq7d0SYqN59QUqkGNDOEbS3w3Jj4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184561-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184561: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=927ea1364d047d54cb67e0f231644f295c032944
X-Osstest-Versions-That:
    ovmf=3656352675bf66c06b65bf85632996d3471073ae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Feb 2024 05:03:27 +0000

flight 184561 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184561/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 927ea1364d047d54cb67e0f231644f295c032944
baseline version:
 ovmf                 3656352675bf66c06b65bf85632996d3471073ae

Last test of basis   184558  2024-02-01 22:41:22 Z    0 days
Testing same since   184561  2024-02-02 02:55:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dongyan Qian <qiandongyan@loongson.cn>

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
   3656352675..927ea1364d  927ea1364d047d54cb67e0f231644f295c032944 -> xen-tested-master

