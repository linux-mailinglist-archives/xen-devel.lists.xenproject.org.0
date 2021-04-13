Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC235E50C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110033.210018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMri-0003FS-DE; Tue, 13 Apr 2021 17:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110033.210018; Tue, 13 Apr 2021 17:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMri-0003Ez-9l; Tue, 13 Apr 2021 17:30:18 +0000
Received: by outflank-mailman (input) for mailman id 110033;
 Tue, 13 Apr 2021 17:30:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWMrg-0003Ep-QV; Tue, 13 Apr 2021 17:30:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWMrg-0000ES-N1; Tue, 13 Apr 2021 17:30:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWMrg-0005bM-FW; Tue, 13 Apr 2021 17:30:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lWMrg-00026U-Ey; Tue, 13 Apr 2021 17:30:16 +0000
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
	bh=quWqEkMmJHarie8HgrltaJPpDD/TNDgd/YUUjeUSXns=; b=jkQkcaiDHe7/V21K1TJO/0UMDe
	wtlVFw5N5Kh5ip+/xRUuf3ScHfJDU3lpetxNNZxmAc/sjxTrJZbrFaNNeCXVHqqwJCpy7L3bgGBWa
	i41V1FVIw1msJ2dpBQwjA8Q/cM19ryiwtS/l7n+9M0Vslg9vRO9vsgNRJIUg3OaXGWzE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161081: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=54211ab10fcd8532b49f4024ebdb601a8eb07e3e
X-Osstest-Versions-That:
    ovmf=2072c22a0d63c780b0cc6377f6d4ffb116ad6144
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Apr 2021 17:30:16 +0000

flight 161081 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161081/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 54211ab10fcd8532b49f4024ebdb601a8eb07e3e
baseline version:
 ovmf                 2072c22a0d63c780b0cc6377f6d4ffb116ad6144

Last test of basis   161054  2021-04-12 11:41:28 Z    1 days
Testing same since   161081  2021-04-13 05:19:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <bret.barkelew@microsoft.com>
  Bret Barkelew <bret@corthon.com>
  Kun Qin <kuqin12@gmail.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   2072c22a0d..54211ab10f  54211ab10fcd8532b49f4024ebdb601a8eb07e3e -> xen-tested-master

