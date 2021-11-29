Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20CE46147F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 13:05:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234506.406933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrfPQ-0000t5-L4; Mon, 29 Nov 2021 12:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234506.406933; Mon, 29 Nov 2021 12:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrfPQ-0000rE-Hz; Mon, 29 Nov 2021 12:05:24 +0000
Received: by outflank-mailman (input) for mailman id 234506;
 Mon, 29 Nov 2021 12:05:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrfPP-0000r2-88; Mon, 29 Nov 2021 12:05:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrfPP-0008LA-2R; Mon, 29 Nov 2021 12:05:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrfPO-0007MO-OQ; Mon, 29 Nov 2021 12:05:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mrfPO-0000zU-Nu; Mon, 29 Nov 2021 12:05:22 +0000
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
	bh=QY6/NWWKOoknVLPMFVot4X5flMKPhsHEPrCwk1OtrT0=; b=n8uybC6a/IW8pk0Ov1Ddny3FYs
	0fXZELb3ORq9FAPO8kF/ePxg+qecy7442xRAe39iwd+IdlUVhSNC6gV8n/1ufZ5xo8D+yzr5S3sFU
	ip0q1c8rP6xlfvQ+Iku0sG9HQ1fFohBcQpb1ICyxRgpHehud4N+4lRda3gM9OcHs+uY0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166951-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166951: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=76a1ce4d5fec7cd6906e6ea4ed6a4276b700e7ae
X-Osstest-Versions-That:
    ovmf=ef9a059cdb15844fe52a49af2bf7d86b9dd3e9bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Nov 2021 12:05:22 +0000

flight 166951 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166951/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 76a1ce4d5fec7cd6906e6ea4ed6a4276b700e7ae
baseline version:
 ovmf                 ef9a059cdb15844fe52a49af2bf7d86b9dd3e9bf

Last test of basis   166949  2021-11-29 06:11:36 Z    0 days
Testing same since   166951  2021-11-29 08:42:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Sean Brogan <sean.brogan@microsoft.com>

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
   ef9a059cdb..76a1ce4d5f  76a1ce4d5fec7cd6906e6ea4ed6a4276b700e7ae -> xen-tested-master

