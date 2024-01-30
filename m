Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA4841740
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 01:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673200.1047448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUbay-0005Hw-Lf; Tue, 30 Jan 2024 00:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673200.1047448; Tue, 30 Jan 2024 00:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUbay-0005Ga-J1; Tue, 30 Jan 2024 00:03:20 +0000
Received: by outflank-mailman (input) for mailman id 673200;
 Tue, 30 Jan 2024 00:03:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rUbax-0005GQ-02; Tue, 30 Jan 2024 00:03:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rUbaw-0006Pv-Qc; Tue, 30 Jan 2024 00:03:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rUbaw-00064p-DW; Tue, 30 Jan 2024 00:03:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rUbaw-0004Y8-D2; Tue, 30 Jan 2024 00:03:18 +0000
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
	bh=qVXG6uZihfP4sjiUCvscbzycCsSnK4Og1XkqnM8eUhE=; b=yIjde8Uj7zEzwO8+FowTzqdOe5
	SqVrGq4hqv+do4ZZG15JZHzgIOfz89jlcfZdpRvWzeh3T7PxQn22a/eA6q8Q307PUXCjFWBPaR02u
	yNY7fJGU3dX4LJd9zD9qUN2UXq8CfVe/1NnMU1FrOj+fIipfRSnkUJV15sL93OuZNIR8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184522-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184522: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=98c7cb3be73d0f15151133abe91bc880a4400794
X-Osstest-Versions-That:
    ovmf=dc3339470166884197e9be5a6b3e7afe13104f1f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jan 2024 00:03:18 +0000

flight 184522 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184522/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 98c7cb3be73d0f15151133abe91bc880a4400794
baseline version:
 ovmf                 dc3339470166884197e9be5a6b3e7afe13104f1f

Last test of basis   184519  2024-01-29 17:12:56 Z    0 days
Testing same since   184522  2024-01-29 22:12:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Erdem Aktas <erdemaktas@google.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   dc33394701..98c7cb3be7  98c7cb3be73d0f15151133abe91bc880a4400794 -> xen-tested-master

