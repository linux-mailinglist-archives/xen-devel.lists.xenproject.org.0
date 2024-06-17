Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F346A90AFC2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742300.1149070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCdG-0006lh-5K; Mon, 17 Jun 2024 13:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742300.1149070; Mon, 17 Jun 2024 13:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCdG-0006jA-2S; Mon, 17 Jun 2024 13:42:50 +0000
Received: by outflank-mailman (input) for mailman id 742300;
 Mon, 17 Jun 2024 13:42:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJCdE-0006it-5T; Mon, 17 Jun 2024 13:42:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJCdD-0007XR-Nx; Mon, 17 Jun 2024 13:42:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJCdD-0001cd-GX; Mon, 17 Jun 2024 13:42:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJCdD-0007Gf-Fx; Mon, 17 Jun 2024 13:42:47 +0000
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
	bh=hK92EAs0X1M1EyxPaYYEhxxXGX4zOCOJM3b1PRHhzwI=; b=ugMMKvI12rCDmXgbDWr58h3rgP
	rAuc0bvgGP+Bkim7l0QOa/JwBEHFQJnqw42PNj92BRosOTXxm6+kIhrKWdUwSCSR3ZAtu+P/SUlGO
	C/GuBubQlK0sK+pSDD/ojeTLQv4Ps2GB3jAqXkJbs6CKV8F1RxQ8l2w+Les2IjWvoJiw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186379-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186379: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9fc61309bf56aa7863e36b8f418a49ca6d8364d0
X-Osstest-Versions-That:
    ovmf=587100a95d7bfddc60bc5699ae0cca45914f1d81
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jun 2024 13:42:47 +0000

flight 186379 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186379/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9fc61309bf56aa7863e36b8f418a49ca6d8364d0
baseline version:
 ovmf                 587100a95d7bfddc60bc5699ae0cca45914f1d81

Last test of basis   186378  2024-06-17 08:14:56 Z    0 days
Testing same since   186379  2024-06-17 12:12:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   587100a95d..9fc61309bf  9fc61309bf56aa7863e36b8f418a49ca6d8364d0 -> xen-tested-master

