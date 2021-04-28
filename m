Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7D36D0F9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 05:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118973.225270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbbF5-00046r-RQ; Wed, 28 Apr 2021 03:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118973.225270; Wed, 28 Apr 2021 03:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbbF5-00046Q-MG; Wed, 28 Apr 2021 03:52:03 +0000
Received: by outflank-mailman (input) for mailman id 118973;
 Wed, 28 Apr 2021 03:52:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbbF3-00046I-Lg; Wed, 28 Apr 2021 03:52:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbbF3-0003v3-GS; Wed, 28 Apr 2021 03:52:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbbF3-0002SM-7I; Wed, 28 Apr 2021 03:52:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lbbF3-0000mH-6n; Wed, 28 Apr 2021 03:52:01 +0000
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
	bh=0300Mr2ZD+SAd845CscOIDhRjHYIo8SfY2hGXt6Rq1Q=; b=oMyrPO03o081KguljcmTT7FQHZ
	jhjQIfOes6+Jwqgm+z0ZGUiqKTZDoAmx5E31PZ7awVsq2U2cZyTjiLeiTjKdY7SD9Sq94CB5y8Mb4
	0e4QR5ofkEh4BClwsiLfeC78nW8Dxcu6YjUW5966t7Ga34UF94bG9N6Zf84VjD3G9wa4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161485-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161485: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5b90b8abb4049e2d98040f548ad23b6ab22d5d19
X-Osstest-Versions-That:
    ovmf=8d2012035db3cb869d1da8a95c1308025cadbeee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Apr 2021 03:52:01 +0000

flight 161485 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161485/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5b90b8abb4049e2d98040f548ad23b6ab22d5d19
baseline version:
 ovmf                 8d2012035db3cb869d1da8a95c1308025cadbeee

Last test of basis   161477  2021-04-27 06:10:06 Z    0 days
Testing same since   161485  2021-04-27 13:41:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@nuviainc.com>

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
   8d2012035d..5b90b8abb4  5b90b8abb4049e2d98040f548ad23b6ab22d5d19 -> xen-tested-master

