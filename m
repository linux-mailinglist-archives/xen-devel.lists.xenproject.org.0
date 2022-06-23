Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5F5576C2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354717.581970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JGR-0006v1-N1; Thu, 23 Jun 2022 09:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354717.581970; Thu, 23 Jun 2022 09:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JGR-0006t0-Jp; Thu, 23 Jun 2022 09:36:39 +0000
Received: by outflank-mailman (input) for mailman id 354717;
 Thu, 23 Jun 2022 09:36:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4JGP-0006sq-TH; Thu, 23 Jun 2022 09:36:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4JGP-0001WZ-Pu; Thu, 23 Jun 2022 09:36:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4JGP-0000F5-AN; Thu, 23 Jun 2022 09:36:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o4JGP-00032h-9x; Thu, 23 Jun 2022 09:36:37 +0000
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
	bh=vEZ60dCjAAfl+W8x+MjbENvCUKwO5ybpclZ4CSGtH4A=; b=goWPqFHHVy1oKdV0jPIvBeJqj/
	6sgS+i91/AFwPri5L5K8chcx6JVPskUFh2vZ51wPByJqTTSdOk77m2mNET6PNPmU68NrbEoeG1xMF
	066oaMzZdIo5olv4I5ongS6oguKzBqBOVOaez7fJbCQh3OmjaNqoqJu7/rdBGoiigsN4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171324-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171324: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4bfd668e5edb59092a8e16414b3f6632efdac4f2
X-Osstest-Versions-That:
    ovmf=f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Jun 2022 09:36:37 +0000

flight 171324 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171324/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4bfd668e5edb59092a8e16414b3f6632efdac4f2
baseline version:
 ovmf                 f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c

Last test of basis   171315  2022-06-22 20:13:24 Z    0 days
Testing same since   171324  2022-06-23 06:42:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>
  Taylor Beebe <t@taylorbeebe.com>

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
   f304308e1c..4bfd668e5e  4bfd668e5edb59092a8e16414b3f6632efdac4f2 -> xen-tested-master

