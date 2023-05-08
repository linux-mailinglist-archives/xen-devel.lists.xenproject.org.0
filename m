Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854416FB199
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 15:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531575.827337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0zU-0008Tv-Lx; Mon, 08 May 2023 13:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531575.827337; Mon, 08 May 2023 13:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0zU-0008SA-Iu; Mon, 08 May 2023 13:33:24 +0000
Received: by outflank-mailman (input) for mailman id 531575;
 Mon, 08 May 2023 13:33:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pw0zS-0008S0-Tk; Mon, 08 May 2023 13:33:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pw0zS-0008I2-OR; Mon, 08 May 2023 13:33:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pw0zS-0002Pj-CA; Mon, 08 May 2023 13:33:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pw0zS-0001Z8-Bg; Mon, 08 May 2023 13:33:22 +0000
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
	bh=oxj5pLGURD1+vKzwlYEowwAh0303qy0RZFRiWUrOUMo=; b=u/2nXEEkXx2ph3Qk/+lMjiSGYM
	MBEVzcdlWFvFiuXNhjZlKvdVoIkwCMGo3cuMNQ3QOmLWi8dUgFohbfd8Y/Hwm6rfSl8f6Iye2tjgV
	FFruKaYK3L71KFjEP08KTSGT9VEogjjMGu5FWu7TJdUTuY4nXEqY43DaZ+t0g3mAfOhc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180575-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180575: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d89492456f79e014679cb6c29b144ea26b910918
X-Osstest-Versions-That:
    ovmf=8dbf868e02c71b407e31f9b41b5266169c702812
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 May 2023 13:33:22 +0000

flight 180575 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180575/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d89492456f79e014679cb6c29b144ea26b910918
baseline version:
 ovmf                 8dbf868e02c71b407e31f9b41b5266169c702812

Last test of basis   180573  2023-05-08 02:10:45 Z    0 days
Testing same since   180575  2023-05-08 11:43:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Liu <linus.liu@intel.com>

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
   8dbf868e02..d89492456f  d89492456f79e014679cb6c29b144ea26b910918 -> xen-tested-master

