Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092A456B29D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 08:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363215.593658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9hJM-0005AU-I1; Fri, 08 Jul 2022 06:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363215.593658; Fri, 08 Jul 2022 06:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9hJM-000578-De; Fri, 08 Jul 2022 06:17:56 +0000
Received: by outflank-mailman (input) for mailman id 363215;
 Fri, 08 Jul 2022 06:17:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9hJK-00056y-At; Fri, 08 Jul 2022 06:17:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9hJK-000493-8M; Fri, 08 Jul 2022 06:17:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9hJJ-0003vS-Mk; Fri, 08 Jul 2022 06:17:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o9hJJ-0005Ef-MG; Fri, 08 Jul 2022 06:17:53 +0000
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
	bh=RJmSdFlGNM6w2j/olKXmb3vZJUQRoTg39/L2prrMIeQ=; b=aMmCWJpo021LEBJsMuRfiDjddd
	poWtwbl9Y0c5HavRyMehhMRUHqaH/EIwaVtzyiaOTt9v3gg56zNNMCTdcb5V+FAfygZVITO1VFjwn
	YJlZQAiBBfsJ13FEQziUfS9wxPZTsvG3paXs4ESZV/iRqpQ/Y8H1/7lOwRq8+VFUxwdc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171554-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171554: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e93bc6309ba743c6bdaae4d1dc6f0fb141c47ee5
X-Osstest-Versions-That:
    ovmf=5496c763aaddc4a47639d4652abe23aa3419263a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Jul 2022 06:17:53 +0000

flight 171554 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171554/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e93bc6309ba743c6bdaae4d1dc6f0fb141c47ee5
baseline version:
 ovmf                 5496c763aaddc4a47639d4652abe23aa3419263a

Last test of basis   171546  2022-07-07 10:42:07 Z    0 days
Testing same since   171554  2022-07-08 04:10:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Isaac Oram <isaac.w.oram@intel.com>
  Oram, Isaac W <isaac.w.oram@intel.com>

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
   5496c763aa..e93bc6309b  e93bc6309ba743c6bdaae4d1dc6f0fb141c47ee5 -> xen-tested-master

