Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC393F140
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766546.1177043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMn3-0002Ly-9m; Mon, 29 Jul 2024 09:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766546.1177043; Mon, 29 Jul 2024 09:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMn3-0002J9-6u; Mon, 29 Jul 2024 09:35:37 +0000
Received: by outflank-mailman (input) for mailman id 766546;
 Mon, 29 Jul 2024 09:35:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYMn2-0002Iz-7y; Mon, 29 Jul 2024 09:35:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYMn1-0002Dw-Sn; Mon, 29 Jul 2024 09:35:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYMn1-0001Vk-H4; Mon, 29 Jul 2024 09:35:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYMn1-0003Yr-Gf; Mon, 29 Jul 2024 09:35:35 +0000
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
	bh=uC+RXhfus64nX2Linus6hO0KYwVot1RuW989W+p1Kp4=; b=YfdMMEpGWX29oxobFV66U3Adwx
	iDUTqbnPocsr98omd7MCJ95PRIrOnL9nWDO10m5H6mvStKKeVaDd9v8zerPUEv3WnVSGNwo77Ma2+
	Lg3r5DqiO28SBkmZeLgKM4RGz5sQNoxSr7OvEhJpLR9TCs2qwTAFrXxyZVVnweuekmsI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187040-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187040: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=43e2395c1b130540820957305451340e1fff81e4
X-Osstest-Versions-That:
    ovmf=51edd4830d822e70b96a8548d0d89383e12bc4c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Jul 2024 09:35:35 +0000

flight 187040 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187040/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 43e2395c1b130540820957305451340e1fff81e4
baseline version:
 ovmf                 51edd4830d822e70b96a8548d0d89383e12bc4c0

Last test of basis   187038  2024-07-29 04:11:44 Z    0 days
Testing same since   187040  2024-07-29 07:15:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   51edd4830d..43e2395c1b  43e2395c1b130540820957305451340e1fff81e4 -> xen-tested-master

