Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3F61E50F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 18:49:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438590.692597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orjkB-0004xt-9O; Sun, 06 Nov 2022 17:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438590.692597; Sun, 06 Nov 2022 17:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orjkB-0004uk-4h; Sun, 06 Nov 2022 17:47:39 +0000
Received: by outflank-mailman (input) for mailman id 438590;
 Sun, 06 Nov 2022 17:47:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orjk9-0004ua-PJ; Sun, 06 Nov 2022 17:47:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orjk9-0004if-KS; Sun, 06 Nov 2022 17:47:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orjk9-0002Dm-2k; Sun, 06 Nov 2022 17:47:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1orjk9-0006Ip-2K; Sun, 06 Nov 2022 17:47:37 +0000
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
	bh=jhJ/aN9eJFAR31J48V6lh8ZEFwaPYd1+K6/GBnxksPg=; b=XYCwIeD6gA8J/IN0ReY/d3xK3r
	Y6r+NwiwmwBGvx8KyNTZ4MDKEqZeifboKbrWfEE7JE8g+i3p2+02OH6aRinOTWIRPeCBLJJ8LhrBf
	5nEmsdnLCgdUyr4B2NSRP3upMqEXdjhx+8AdWI1F8aV0SP2kszR7w5DqovoJRAfkWgJg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174647-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174647: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cc650a0378f86a4980e7a0d37fef90d46d33afe1
X-Osstest-Versions-That:
    ovmf=eff44c008d99eca6e3700e864b014821ba88683c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Nov 2022 17:47:37 +0000

flight 174647 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174647/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cc650a0378f86a4980e7a0d37fef90d46d33afe1
baseline version:
 ovmf                 eff44c008d99eca6e3700e864b014821ba88683c

Last test of basis   174623  2022-11-04 12:13:19 Z    2 days
Testing same since   174647  2022-11-06 15:43:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   eff44c008d..cc650a0378  cc650a0378f86a4980e7a0d37fef90d46d33afe1 -> xen-tested-master

