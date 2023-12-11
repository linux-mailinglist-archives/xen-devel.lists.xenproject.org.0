Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127080CAE3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651817.1017698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgHN-0004YV-SX; Mon, 11 Dec 2023 13:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651817.1017698; Mon, 11 Dec 2023 13:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgHN-0004XG-PU; Mon, 11 Dec 2023 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 651817;
 Mon, 11 Dec 2023 13:25:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCgHM-0004Wo-Qs; Mon, 11 Dec 2023 13:25:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCgHM-0004w3-Ni; Mon, 11 Dec 2023 13:25:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCgHM-0003Eg-AS; Mon, 11 Dec 2023 13:25:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rCgHM-0005il-9r; Mon, 11 Dec 2023 13:25:00 +0000
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
	bh=lNOTkdhwstTH8r84uGSiac5cdJqeAWYxYi+MBDZ7KUo=; b=x8yHNHbvYeIBaJjt8owoc3Eza5
	82r7vgtVW07OIXptwNRjHESp3RwilygzaKr5x+V7BFBBcGnxeXo49y3oIkpoXt5XasWXN0x6y60bI
	1hTpLYh/ea7vFWbdtR+A0Fnor5fQw33Q9KrotGQ3v6MZ178rmjr4WrSrIUFqFbGSgaAM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184090: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5b5481526fc9b89e5f3843d9bb3d6c4f5ce41060
X-Osstest-Versions-That:
    ovmf=bb13a4adabcf0e5a1608583c386472773dca5726
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Dec 2023 13:25:00 +0000

flight 184090 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5b5481526fc9b89e5f3843d9bb3d6c4f5ce41060
baseline version:
 ovmf                 bb13a4adabcf0e5a1608583c386472773dca5726

Last test of basis   184087  2023-12-11 03:43:08 Z    0 days
Testing same since   184090  2023-12-11 10:42:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuwei Chen <yuwei.chen@intel.com>

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
   bb13a4adab..5b5481526f  5b5481526fc9b89e5f3843d9bb3d6c4f5ce41060 -> xen-tested-master

