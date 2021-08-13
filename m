Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586643EB2C2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 10:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166687.304244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mESlj-0002tN-Kt; Fri, 13 Aug 2021 08:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166687.304244; Fri, 13 Aug 2021 08:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mESlj-0002qi-Go; Fri, 13 Aug 2021 08:42:23 +0000
Received: by outflank-mailman (input) for mailman id 166687;
 Fri, 13 Aug 2021 08:42:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mESli-0002qY-7O; Fri, 13 Aug 2021 08:42:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mESli-0001hZ-0z; Fri, 13 Aug 2021 08:42:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mESlh-0002Tm-Np; Fri, 13 Aug 2021 08:42:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mESlh-0004Tk-NM; Fri, 13 Aug 2021 08:42:21 +0000
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
	bh=c87VHU76NpoUB5vClSH8c9tIwzg9yLncNbIPz5giipI=; b=JYLrUoMC+LJatkEG4ce8ceuj6C
	f3UoUvl00z708A9rGL55PtbHlR4QgeOAvGN/F0Ozmkzhz9J1AHC2PrDsMgUgyfuwbRzLmaMsvZscF
	JXnu/WCxXyQJQM3fMVb+4ohKJNXaeqD8SpdQPcBI7Mh0Xf8byw1y6ao+dLDsMKY9f1Kk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164173-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164173: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6fdd1c13a734609aff68d37e606e995d673d9aeb
X-Osstest-Versions-That:
    ovmf=ac826886c98524e918753419c039d8b44198943f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Aug 2021 08:42:21 +0000

flight 164173 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164173/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6fdd1c13a734609aff68d37e606e995d673d9aeb
baseline version:
 ovmf                 ac826886c98524e918753419c039d8b44198943f

Last test of basis   164166  2021-08-12 08:41:16 Z    1 days
Testing same since   164173  2021-08-13 01:56:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  GregX Yeh <gregx.yeh@intel.com>
  Yeh, GregX <gregx.yeh@intel.com>

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
   ac826886c9..6fdd1c13a7  6fdd1c13a734609aff68d37e606e995d673d9aeb -> xen-tested-master

