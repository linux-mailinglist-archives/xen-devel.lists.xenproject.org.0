Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B360573D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426188.674506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOrd-0006q1-RK; Thu, 20 Oct 2022 06:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426188.674506; Thu, 20 Oct 2022 06:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOrd-0006oE-OO; Thu, 20 Oct 2022 06:17:09 +0000
Received: by outflank-mailman (input) for mailman id 426188;
 Thu, 20 Oct 2022 06:17:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olOrc-0006o0-RM; Thu, 20 Oct 2022 06:17:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olOrc-0008AE-Qf; Thu, 20 Oct 2022 06:17:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olOrc-0006YV-Ge; Thu, 20 Oct 2022 06:17:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1olOrc-0000H7-G9; Thu, 20 Oct 2022 06:17:08 +0000
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
	bh=/yVeFn5EHYIZcTym9MUTRny2fVOFegrs9uPBcR0w6XQ=; b=vsITL4hE8ATck0rJuwpBuS3uYO
	IeoCgL4HplLdo0J3nopI2IoscB58JB3ydye0s+yf3OhxnhFwPFy9qQGlKqSf7ZwZF7/6ki1014YXd
	y+okEAsJOePjWl2BwTz2l3CqFcl99jasxSQ0+aBmdHsv6mmW1iNqemRqE04F1/ZPQbnE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174116-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174116: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c6720db5ddffec747bb0b2830e528511b1a4bfb2
X-Osstest-Versions-That:
    ovmf=31b16384688df9ce0e8f59021fd667e47d7d3972
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Oct 2022 06:17:08 +0000

flight 174116 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174116/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c6720db5ddffec747bb0b2830e528511b1a4bfb2
baseline version:
 ovmf                 31b16384688df9ce0e8f59021fd667e47d7d3972

Last test of basis   174092  2022-10-19 12:10:19 Z    0 days
Testing same since   174116  2022-10-20 03:43:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  jdzhang <jdzhang@kunluntech.com.cn>

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
   31b1638468..c6720db5dd  c6720db5ddffec747bb0b2830e528511b1a4bfb2 -> xen-tested-master

