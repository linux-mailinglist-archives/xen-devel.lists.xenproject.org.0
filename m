Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB979419A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 18:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596739.930754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdvb9-0006Sp-Kt; Wed, 06 Sep 2023 16:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596739.930754; Wed, 06 Sep 2023 16:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdvb9-0006Qb-HX; Wed, 06 Sep 2023 16:41:47 +0000
Received: by outflank-mailman (input) for mailman id 596739;
 Wed, 06 Sep 2023 16:41:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvb7-0006QR-Mq; Wed, 06 Sep 2023 16:41:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvb7-0003hq-L4; Wed, 06 Sep 2023 16:41:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvb7-0003VY-Ed; Wed, 06 Sep 2023 16:41:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qdvb7-0005H6-E2; Wed, 06 Sep 2023 16:41:45 +0000
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
	bh=MW4pGcluimJr68VnBYEskm18eR4Q6GSgciOzoOQbjKw=; b=3wBiHy5jUxei/AySBPd4Lay3vm
	PNoXKpXm1xe8xCe33Z/NG7265q5jiNjEbtR0zy75uJxlwgr+jaYGbLDEgoj+sG77wInG8gfY4rFKt
	1+9EOT9+CwWORCqf/3mtraJk9Dz/94fhAS7YIAQLBviaJfgU7GraelMhA67xJkBoj7Ls=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182665-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182665: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4d196352f35ac516b477e568265b4e537b0283d8
X-Osstest-Versions-That:
    ovmf=d1e4a16f868fb1ccfa8bed8eaba5f9617ec8382d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Sep 2023 16:41:45 +0000

flight 182665 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182665/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4d196352f35ac516b477e568265b4e537b0283d8
baseline version:
 ovmf                 d1e4a16f868fb1ccfa8bed8eaba5f9617ec8382d

Last test of basis   182654  2023-09-06 08:12:34 Z    0 days
Testing same since   182665  2023-09-06 11:10:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   d1e4a16f86..4d196352f3  4d196352f35ac516b477e568265b4e537b0283d8 -> xen-tested-master

