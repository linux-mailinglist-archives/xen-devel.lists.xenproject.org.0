Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B456D46E262
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 07:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242675.419697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvCoB-0003Ag-V3; Thu, 09 Dec 2021 06:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242675.419697; Thu, 09 Dec 2021 06:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvCoB-00038H-QT; Thu, 09 Dec 2021 06:21:35 +0000
Received: by outflank-mailman (input) for mailman id 242675;
 Thu, 09 Dec 2021 06:21:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvCoA-000386-2e; Thu, 09 Dec 2021 06:21:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvCo9-0002I0-KF; Thu, 09 Dec 2021 06:21:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvCo9-0000st-9r; Thu, 09 Dec 2021 06:21:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mvCo9-0005uY-7i; Thu, 09 Dec 2021 06:21:33 +0000
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
	bh=GTQ6mi4YltHrAZF2/IeHYkIWoPFSBidNLMRF8A8IwEQ=; b=ZCe/tIghvTrH5OLxe1S7iAryNv
	DgnKpkZ5LVclS6Yy41Q7rWvEvkgWfaSzRzCnsk8mY9g44azKVPPShUeVIxmgARleRB8LElczZBwRb
	JoQyGN9RTN5K0+6baGR5rsJPoVPraUDjEuM77WOAflL1spgziPfaE/7GneaESWi3K7OM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167237-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167237: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7b2831000894f3091cac633e61d9bcf3661cc44b
X-Osstest-Versions-That:
    ovmf=85a678bf76c5aac2e40255f48ea3209ff95f150a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Dec 2021 06:21:33 +0000

flight 167237 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167237/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7b2831000894f3091cac633e61d9bcf3661cc44b
baseline version:
 ovmf                 85a678bf76c5aac2e40255f48ea3209ff95f150a

Last test of basis   167231  2021-12-08 08:45:35 Z    0 days
Testing same since   167237  2021-12-09 01:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiang, Xiaolu <Xiaolu.Jiang@intel.com>
  Xiaolu Jiang <xiaolu.jiang@intel.com>

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
   85a678bf76..7b28310008  7b2831000894f3091cac633e61d9bcf3661cc44b -> xen-tested-master

