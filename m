Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3836C9282
	for <lists+xen-devel@lfdr.de>; Sun, 26 Mar 2023 07:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.514815.797311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgIga-0006NA-M9; Sun, 26 Mar 2023 05:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514815.797311; Sun, 26 Mar 2023 05:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgIga-0006KY-F5; Sun, 26 Mar 2023 05:12:56 +0000
Received: by outflank-mailman (input) for mailman id 514815;
 Sun, 26 Mar 2023 05:12:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgIgZ-0006KO-26; Sun, 26 Mar 2023 05:12:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgIgY-0008FO-Uf; Sun, 26 Mar 2023 05:12:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgIgY-0008F0-Nx; Sun, 26 Mar 2023 05:12:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgIgY-0004b6-NV; Sun, 26 Mar 2023 05:12:54 +0000
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
	bh=T3EObiUmDX8BCoVlovyJZAmwzxu6d1M0r1COfNjg1UI=; b=Bcpp7ZFpNuKTFFpVLSvkzw3sfO
	psTt3kjAmb7s9tn7gkF5sYpPBfKl+HQ+of3eIYTE5eY1x++x722n/boridpJoJd8iMGojsPVFWPeB
	GdsASet8PiQw0HJM/mTQE2ylh8D3b+/xKA2cE2uyq0/2MIbW8D7gqR2DOs4WVT5JSxSc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179983-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179983: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=07fa6d1841abcfc58b226027d711ebb47559f442
X-Osstest-Versions-That:
    ovmf=f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Mar 2023 05:12:54 +0000

flight 179983 ovmf real [real]
flight 179985 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/179983/
http://logs.test-lab.xenproject.org/osstest/logs/179985/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 179985-retest

version targeted for testing:
 ovmf                 07fa6d1841abcfc58b226027d711ebb47559f442
baseline version:
 ovmf                 f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388

Last test of basis   179950  2023-03-25 00:10:39 Z    1 days
Testing same since   179983  2023-03-26 02:10:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Paweł Poławski <ppolawsk@redhat.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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
   f6bd3286ed..07fa6d1841  07fa6d1841abcfc58b226027d711ebb47559f442 -> xen-tested-master

