Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491AE345014
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 20:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100462.191406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOQPN-0006nl-Cj; Mon, 22 Mar 2021 19:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100462.191406; Mon, 22 Mar 2021 19:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOQPN-0006nJ-7c; Mon, 22 Mar 2021 19:40:13 +0000
Received: by outflank-mailman (input) for mailman id 100462;
 Mon, 22 Mar 2021 19:40:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lOQPK-0006nB-Rv; Mon, 22 Mar 2021 19:40:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lOQPK-0002X3-Gc; Mon, 22 Mar 2021 19:40:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lOQPK-000510-9P; Mon, 22 Mar 2021 19:40:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lOQPK-00010M-8u; Mon, 22 Mar 2021 19:40:10 +0000
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
	bh=iqKCWUgW/2rxZswSkvRXt5DDXDeB9Uln888Wi5gXd1A=; b=seXTT77ONMbIBPE7vqaVJf/ybW
	4yYXd1yHaftJUROqt4wi2Ye2dL2kMokjqA7UCPtezCgURsdBpxaLWXHRm2xuXTWrz0VsD/e5dReoj
	0nr9T0quIYfseeunZDvJlC/avmypZhLMPP6lMWEKWcHTEjyWS0CsQcKaw6xDoZCIvR9k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160249: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3d0df0f076e120c6faf3c1892fffa21b4f31ed84
X-Osstest-Versions-That:
    ovmf=ca318882714080fb81fe9eb89a7b7934efc5bfae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Mar 2021 19:40:10 +0000

flight 160249 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160249/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3d0df0f076e120c6faf3c1892fffa21b4f31ed84
baseline version:
 ovmf                 ca318882714080fb81fe9eb89a7b7934efc5bfae

Last test of basis   160145  2021-03-19 18:44:15 Z    3 days
Testing same since   160249  2021-03-22 01:39:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  VincentX Ke <vincentx.ke@intel.com>

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
   ca31888271..3d0df0f076  3d0df0f076e120c6faf3c1892fffa21b4f31ed84 -> xen-tested-master

