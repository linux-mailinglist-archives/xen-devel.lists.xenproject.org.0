Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5E995ECB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 07:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813698.1226692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syOvS-0006Br-Ce; Wed, 09 Oct 2024 05:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813698.1226692; Wed, 09 Oct 2024 05:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syOvS-00068j-9c; Wed, 09 Oct 2024 05:07:54 +0000
Received: by outflank-mailman (input) for mailman id 813698;
 Wed, 09 Oct 2024 05:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syOvR-00068Z-MH; Wed, 09 Oct 2024 05:07:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syOvR-0008TX-Jq; Wed, 09 Oct 2024 05:07:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syOvR-0003h9-9H; Wed, 09 Oct 2024 05:07:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syOvR-0007MS-8l; Wed, 09 Oct 2024 05:07:53 +0000
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
	bh=BXOEGpyKH8UMYmgsvt0Cl9Q+bRe1B2Xu2Ad5LG+92Mg=; b=6SdGmW7QyGv9E/9cukNoN3eAI5
	DFWHj9MhjjWL6ggUqg+2LQ/glEMuoSc7vxpYKDUZQGGXLs+1GJOYsNZybVjw8ARmWFbSb7MeswoYx
	FbRhQvpdquD60DT8dR4UteaIOWchlymN/MNk01l0Zcf1OZ4SNvkJWuMX1+j2V/nk35ZU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188020-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188020: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=06da7daab1eb129a1bf3eb93ed74c102d1587071
X-Osstest-Versions-That:
    ovmf=550c38a29961ab1c9cc4f9a17cdd3346566c4bef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2024 05:07:53 +0000

flight 188020 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188020/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 06da7daab1eb129a1bf3eb93ed74c102d1587071
baseline version:
 ovmf                 550c38a29961ab1c9cc4f9a17cdd3346566c4bef

Last test of basis   188006  2024-10-08 03:05:52 Z    1 days
Testing same since   188020  2024-10-09 02:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   550c38a299..06da7daab1  06da7daab1eb129a1bf3eb93ed74c102d1587071 -> xen-tested-master

