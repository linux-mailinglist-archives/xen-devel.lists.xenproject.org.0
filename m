Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476D62ED41B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 17:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62968.111737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxXvy-0008UV-ST; Thu, 07 Jan 2021 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62968.111737; Thu, 07 Jan 2021 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxXvy-0008U2-OA; Thu, 07 Jan 2021 16:14:46 +0000
Received: by outflank-mailman (input) for mailman id 62968;
 Thu, 07 Jan 2021 16:14:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxXvx-0008Tt-Gg; Thu, 07 Jan 2021 16:14:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxXvx-0004fQ-5p; Thu, 07 Jan 2021 16:14:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxXvw-00016o-S5; Thu, 07 Jan 2021 16:14:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxXvw-0004tW-Rb; Thu, 07 Jan 2021 16:14:44 +0000
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
	bh=h2a5u3bBwS7hQ7/CJR9YxFuif8WyT85NYoEqkRfUVLk=; b=YkKj2/EprAMdgVsCPn2YR5siNX
	HV0XiqiFcpsLvwTsfSxpZkuMuyCbege0RRSfmW7dBGDUWvi4T1leRaBp6KAkKoKyby5dYJ+1Y05Ss
	2PRbHmqAcfCQjQMjOLB3Pra7DEFcBUTczlnXgFvqdNyaBykiQeQuKPhRMYDslg3KJLNQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158246-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158246: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=248d08c5983b561549891fec54c213e1f354179c
X-Osstest-Versions-That:
    ovmf=379e5098a4836b21b893b4801baa34b570c24599
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Jan 2021 16:14:44 +0000

flight 158246 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158246/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 248d08c5983b561549891fec54c213e1f354179c
baseline version:
 ovmf                 379e5098a4836b21b893b4801baa34b570c24599

Last test of basis   158233  2021-01-07 02:39:40 Z    0 days
Testing same since   158246  2021-01-07 08:39:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   379e5098a4..248d08c598  248d08c5983b561549891fec54c213e1f354179c -> xen-tested-master

