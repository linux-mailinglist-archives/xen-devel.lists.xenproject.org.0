Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B282B9343AA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 23:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760171.1169883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUBux-0005BZ-2z; Wed, 17 Jul 2024 21:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760171.1169883; Wed, 17 Jul 2024 21:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUBux-00059K-0D; Wed, 17 Jul 2024 21:10:31 +0000
Received: by outflank-mailman (input) for mailman id 760171;
 Wed, 17 Jul 2024 21:10:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUBuv-00059A-5h; Wed, 17 Jul 2024 21:10:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUBuv-0002i9-3N; Wed, 17 Jul 2024 21:10:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUBuu-0006o9-Qw; Wed, 17 Jul 2024 21:10:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sUBuu-00089g-QU; Wed, 17 Jul 2024 21:10:28 +0000
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
	bh=omlj9BJurdVMnifToLLQBTJJiMc2iAc1iWpH8dX6I4I=; b=cigpGSgfLYNGqtUz90exGn0DEk
	Nr4Oku7XbJt3YlOn8f+qZIq61nZW1WpHebDi9znSq5iAGE1Gf8vYZmcfc3e5pHJTXi3tW4i2UadFf
	3M6t3igngWOgOhH0HeTFu10FLTuCCuL+r5ZLaedD8P2MoT1mv+N/medZ/NmNpJPdRAj8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186846-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186846: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0adc868b362873eb7c749f3ac6c38f9e293af10d
X-Osstest-Versions-That:
    ovmf=11c50d6ca10a1410c2db187078fa7139e29e3042
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 21:10:28 +0000

flight 186846 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186846/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0adc868b362873eb7c749f3ac6c38f9e293af10d
baseline version:
 ovmf                 11c50d6ca10a1410c2db187078fa7139e29e3042

Last test of basis   186845  2024-07-17 18:13:04 Z    0 days
Testing same since   186846  2024-07-17 19:43:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dongyan Qian <dongyan0314@gmail.com>
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
   11c50d6ca1..0adc868b36  0adc868b362873eb7c749f3ac6c38f9e293af10d -> xen-tested-master

