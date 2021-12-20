Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9547A7CB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 11:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249546.429964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzG0u-0005uG-VO; Mon, 20 Dec 2021 10:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249546.429964; Mon, 20 Dec 2021 10:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzG0u-0005sD-RI; Mon, 20 Dec 2021 10:35:28 +0000
Received: by outflank-mailman (input) for mailman id 249546;
 Mon, 20 Dec 2021 10:35:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzG0t-0005s3-BH; Mon, 20 Dec 2021 10:35:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzG0t-0002Pk-9Q; Mon, 20 Dec 2021 10:35:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzG0s-0006I7-TM; Mon, 20 Dec 2021 10:35:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mzG0s-0001Oa-Sr; Mon, 20 Dec 2021 10:35:26 +0000
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
	bh=kIjYD02txWq2NB3a/j0dEfURBSq619q3LKPp8K+rIvM=; b=hCeeiCEtLlfx8cGEAMXHNsmVbv
	6neFqEcCBSJefwzVQkywYdYv06RFcD95EviE3QDB5F2Db0eYqP1buV0JdA+ypMAa8JoDgrKz4cL6R
	MtMbw4AK1NT40bid7ZxAa8T6tQe4PTnAxwL/fa4JR3aBt4PSxIDo+8zQyDx6NnrzXhFg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167487-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167487: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=de9e5b7dc721d4ca319c0455cf83577347e0abef
X-Osstest-Versions-That:
    ovmf=ee1f8262b83dd88b30091e6e81221ff299796099
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Dec 2021 10:35:26 +0000

flight 167487 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167487/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 de9e5b7dc721d4ca319c0455cf83577347e0abef
baseline version:
 ovmf                 ee1f8262b83dd88b30091e6e81221ff299796099

Last test of basis   167465  2021-12-17 17:41:43 Z    2 days
Testing same since   167487  2021-12-20 04:11:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>
  S, Ashraf Ali <ashraf.ali.s@intel.com>

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
   ee1f8262b8..de9e5b7dc7  de9e5b7dc721d4ca319c0455cf83577347e0abef -> xen-tested-master

