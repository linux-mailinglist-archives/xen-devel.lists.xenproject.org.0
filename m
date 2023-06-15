Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2EF731503
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 12:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549503.858075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9k0T-0006kI-1U; Thu, 15 Jun 2023 10:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549503.858075; Thu, 15 Jun 2023 10:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9k0S-0006hz-Tj; Thu, 15 Jun 2023 10:15:08 +0000
Received: by outflank-mailman (input) for mailman id 549503;
 Thu, 15 Jun 2023 10:15:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9k0R-0006gn-Kc; Thu, 15 Jun 2023 10:15:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9k0R-0000Kl-IQ; Thu, 15 Jun 2023 10:15:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9k0R-0004qW-36; Thu, 15 Jun 2023 10:15:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q9k0R-0002Hi-1n; Thu, 15 Jun 2023 10:15:07 +0000
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
	bh=GoAc7gpUaN8kzGyVCvn0/WRavzTZEiSF4nMb8NI5x9Q=; b=5/r3DmT1NhzGBNpHjSElOjO2bB
	YTxUiDi6jB29mRyalSWobPNqrx3GUadheFoGHM9gfQTUKeirDsBcBqsYzjnsn7IMck+eyesUpFJRJ
	5GqWgZVKzr6vTF4h5F5He/7OpeU2kkz2pEjuLpV0i9fJnk9Z7tpS7cLWzYS9+orsuSEo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181438-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181438: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-localmigrate/x10:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=ea55bd8f66eeca5f4e80c3679bcf1b1007286b8a
X-Osstest-Versions-That:
    ovmf=aad98d915abe5ba092e318913028ed47937a9447
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Jun 2023 10:15:07 +0000

flight 181438 ovmf real [real]
flight 181441 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181438/
http://logs.test-lab.xenproject.org/osstest/logs/181441/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-ovmf-amd64 18 guest-localmigrate/x10 fail pass in 181441-retest

version targeted for testing:
 ovmf                 ea55bd8f66eeca5f4e80c3679bcf1b1007286b8a
baseline version:
 ovmf                 aad98d915abe5ba092e318913028ed47937a9447

Last test of basis   181429  2023-06-14 15:14:02 Z    0 days
Testing same since   181438  2023-06-15 05:42:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tuan Phan <tphan@ventanamicro.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
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
   aad98d915a..ea55bd8f66  ea55bd8f66eeca5f4e80c3679bcf1b1007286b8a -> xen-tested-master

