Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FE988C3B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2024 00:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806543.1217929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suJ0x-0007P0-4Y; Fri, 27 Sep 2024 22:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806543.1217929; Fri, 27 Sep 2024 22:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suJ0x-0007Ms-1L; Fri, 27 Sep 2024 22:00:39 +0000
Received: by outflank-mailman (input) for mailman id 806543;
 Fri, 27 Sep 2024 22:00:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suJ0w-0007Mi-Hc; Fri, 27 Sep 2024 22:00:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suJ0w-0003z8-7R; Fri, 27 Sep 2024 22:00:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suJ0v-0002fP-Pe; Fri, 27 Sep 2024 22:00:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1suJ0v-0004qZ-P4; Fri, 27 Sep 2024 22:00:37 +0000
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
	bh=4IQ3amDcKdUXl3EtZRsVUqlUrXANWvOvgXygcuQC/vw=; b=Qhxc+8VkKQhL3g/TN4SqQeYyLM
	xYtWU0j+s9XzOII40/ZYmaSb3cVsIo4w5DY6JCnPmzU/rcSfwp/liiJWmc1cAGwvEhNxaJ/qSmSx6
	nZEVCK3uqa37EFVVLmTJAsMgi6NdVuo1ARHY8m/zDxEqxV2KTGa9ECrrkzNuB+e5Og9M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187881-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187881: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=48b5815d7771b92f343bfa2b32b70be36c98e6f3
X-Osstest-Versions-That:
    ovmf=8b295e0aad55cdf0c20eba6398862832ce188a0c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Sep 2024 22:00:37 +0000

flight 187881 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187881/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 48b5815d7771b92f343bfa2b32b70be36c98e6f3
baseline version:
 ovmf                 8b295e0aad55cdf0c20eba6398862832ce188a0c

Last test of basis   187879  2024-09-27 17:13:10 Z    0 days
Testing same since   187881  2024-09-27 19:41:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   8b295e0aad..48b5815d77  48b5815d7771b92f343bfa2b32b70be36c98e6f3 -> xen-tested-master

