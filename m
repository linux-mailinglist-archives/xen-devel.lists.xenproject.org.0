Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8C66506E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 01:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475017.736509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFP97-000692-Nl; Wed, 11 Jan 2023 00:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475017.736509; Wed, 11 Jan 2023 00:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFP97-00067E-JE; Wed, 11 Jan 2023 00:39:13 +0000
Received: by outflank-mailman (input) for mailman id 475017;
 Wed, 11 Jan 2023 00:39:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFP96-000672-FZ; Wed, 11 Jan 2023 00:39:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFP96-0006sf-El; Wed, 11 Jan 2023 00:39:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFP96-0003Vw-4l; Wed, 11 Jan 2023 00:39:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pFP96-0004PW-4J; Wed, 11 Jan 2023 00:39:12 +0000
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
	bh=XACOe9Jsv3kvkMOy/6uZk5JMJ1rX1a1UMfnkoSfWIIE=; b=2CKg48WWqAJj2S9YWDd83uN4jW
	vcPXSu/yPLzdK41Mz1tn269mg8gmolyFKFRsXEAFxcQJqPR+yIfTRQNLgkSBUq7iSYPv5TUw2j2R3
	OCNgGsKGVbtgPzHrHRimJyFjHYO+N00bEIRBy4kUO0Osd31oFmqYhkhGpZ3tWFfrL8EI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175711-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175711: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=fe405f08a09e9f2306c72aa23d8edfbcfaa23bff
X-Osstest-Versions-That:
    ovmf=ec54ce1f1ab41b92782b37ae59e752fff0ef9c41
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Jan 2023 00:39:12 +0000

flight 175711 ovmf real [real]
flight 175713 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/175711/
http://logs.test-lab.xenproject.org/osstest/logs/175713/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 175713-retest

version targeted for testing:
 ovmf                 fe405f08a09e9f2306c72aa23d8edfbcfaa23bff
baseline version:
 ovmf                 ec54ce1f1ab41b92782b37ae59e752fff0ef9c41

Last test of basis   175707  2023-01-10 17:40:54 Z    0 days
Testing same since   175711  2023-01-10 21:40:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Zachary Clark-Williams <zachary.clark-williams@intel.com>
  Zachary Clark-Williams <zclarkw112@gmail.com>

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
   ec54ce1f1a..fe405f08a0  fe405f08a09e9f2306c72aa23d8edfbcfaa23bff -> xen-tested-master

