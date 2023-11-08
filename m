Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609B7E502A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 06:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629192.981201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0bRI-00064C-RE; Wed, 08 Nov 2023 05:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629192.981201; Wed, 08 Nov 2023 05:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0bRI-00062X-OX; Wed, 08 Nov 2023 05:49:20 +0000
Received: by outflank-mailman (input) for mailman id 629192;
 Wed, 08 Nov 2023 05:49:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0bRH-00062N-55; Wed, 08 Nov 2023 05:49:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0bRG-0001oO-P9; Wed, 08 Nov 2023 05:49:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0bRG-0005EW-Aa; Wed, 08 Nov 2023 05:49:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r0bRG-0003PA-A6; Wed, 08 Nov 2023 05:49:18 +0000
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
	bh=acakCuzwr8QnP5TFAI1d3xxRRfSCTqDb29EhRgiuP1E=; b=HtarxU3IEatDf+KuVt3yg8DoVf
	5khk0VXCQusLaQX+n4ZNa9g6LX9myzEiCFuCg6SQoqGBemOO+pZ9Tjzidj8EGMEv7gfW9pqgALQIL
	8bYswv55jlZOcgvpr0NQUQR8ejS9KquHoE267bGbVnYrfaKsRjUuDz2m4t9czz8cKegU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183711-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183711: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bb18fb80abb9d35d01be5d693086a9ed4b9d65b5
X-Osstest-Versions-That:
    ovmf=c96b4da2a079eb837ab3af9aeb86a97078b3bde6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Nov 2023 05:49:18 +0000

flight 183711 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183711/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb18fb80abb9d35d01be5d693086a9ed4b9d65b5
baseline version:
 ovmf                 c96b4da2a079eb837ab3af9aeb86a97078b3bde6

Last test of basis   183700  2023-11-07 03:42:39 Z    1 days
Testing same since   183711  2023-11-08 03:11:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   c96b4da2a0..bb18fb80ab  bb18fb80abb9d35d01be5d693086a9ed4b9d65b5 -> xen-tested-master

