Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3460727300
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 01:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545043.851233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q72ca-0000a2-Cc; Wed, 07 Jun 2023 23:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545043.851233; Wed, 07 Jun 2023 23:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q72ca-0000YN-9f; Wed, 07 Jun 2023 23:31:20 +0000
Received: by outflank-mailman (input) for mailman id 545043;
 Wed, 07 Jun 2023 23:31:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q72cZ-0000YD-NP; Wed, 07 Jun 2023 23:31:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q72cZ-0001qJ-K8; Wed, 07 Jun 2023 23:31:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q72cZ-0005Ar-6t; Wed, 07 Jun 2023 23:31:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q72cZ-0005xK-6R; Wed, 07 Jun 2023 23:31:19 +0000
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
	bh=jxEK28QMdwiICY8djDepn9SQf1MfMj/ydS3dDOfip4E=; b=L+Nttt/egJ0dk47DG1Y84Ign3Y
	EGtugyYnArZMCXicqNmakPc1rE4wsjpFuoVZ5qLQeY5HYpTxLpVF4usX8m7T2WoDRfVq35k2mWTUr
	avKxg/6qIOT3LHmX52G2384mn3tAIqReR9tEoLOQ4HrAjCNQIHi/TO5ZKaghepHj4SEk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181268-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181268: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=69abcf1e78b67e7ce9ac53a9fe1ce61877df984c
X-Osstest-Versions-That:
    ovmf=8d238f1433397397b4d05b38cb2460929429241f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jun 2023 23:31:19 +0000

flight 181268 ovmf real [real]
flight 181276 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181268/
http://logs.test-lab.xenproject.org/osstest/logs/181276/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 181276-retest

version targeted for testing:
 ovmf                 69abcf1e78b67e7ce9ac53a9fe1ce61877df984c
baseline version:
 ovmf                 8d238f1433397397b4d05b38cb2460929429241f

Last test of basis   181257  2023-06-07 15:40:44 Z    0 days
Testing same since   181268  2023-06-07 18:40:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   8d238f1433..69abcf1e78  69abcf1e78b67e7ce9ac53a9fe1ce61877df984c -> xen-tested-master

