Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4B647359
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 16:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457252.715150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3J0x-0001OA-W2; Thu, 08 Dec 2022 15:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457252.715150; Thu, 08 Dec 2022 15:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3J0x-0001LT-Sz; Thu, 08 Dec 2022 15:40:47 +0000
Received: by outflank-mailman (input) for mailman id 457252;
 Thu, 08 Dec 2022 15:40:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3J0w-0001LI-SG; Thu, 08 Dec 2022 15:40:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3J0w-0004BD-P2; Thu, 08 Dec 2022 15:40:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3J0w-0000a6-FB; Thu, 08 Dec 2022 15:40:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3J0w-0005Dp-DD; Thu, 08 Dec 2022 15:40:46 +0000
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
	bh=N5/meEOBFJLw/GeCUFAS1D17RsYe8r2bJe5j2DzNxlU=; b=Q+c+v4xiF03x/Kl8t4TcDRBS2g
	5rvFxzOltP2vb7MZ9lxlYenaseO7soo/J25pQIHLRXwHi3wkbJDcDr/+sgMlS8ElxGASjAdW3Ur61
	b4HGJZPZx2j1DdiLgNQS2qwHJYHbuuRPODif7oP3tMcITwucwO1DNBxazXk6hK4CCOhA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175090: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1c75bf3c21da79b1bc1d50cfc593b57f73f2c560
X-Osstest-Versions-That:
    ovmf=d9e7f6fe49738421c02381425d289767d7055ef1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Dec 2022 15:40:46 +0000

flight 175090 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1c75bf3c21da79b1bc1d50cfc593b57f73f2c560
baseline version:
 ovmf                 d9e7f6fe49738421c02381425d289767d7055ef1

Last test of basis   175085  2022-12-08 03:10:48 Z    0 days
Testing same since   175090  2022-12-08 10:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Ray Ni <ray.ni@intel.com>
  Robert Guenzel <robert.guenzel@intel.com>
  Wu, Jiaxin <jiaxin.wu@intel.com>

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
   d9e7f6fe49..1c75bf3c21  1c75bf3c21da79b1bc1d50cfc593b57f73f2c560 -> xen-tested-master

