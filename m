Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A59589C79
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380380.614507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJakp-0006rs-Gj; Thu, 04 Aug 2022 13:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380380.614507; Thu, 04 Aug 2022 13:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJakp-0006pB-Dm; Thu, 04 Aug 2022 13:19:11 +0000
Received: by outflank-mailman (input) for mailman id 380380;
 Thu, 04 Aug 2022 13:19:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJako-0006p1-Ra; Thu, 04 Aug 2022 13:19:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJako-0004A8-PA; Thu, 04 Aug 2022 13:19:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJako-0007aW-84; Thu, 04 Aug 2022 13:19:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJako-0004U9-7f; Thu, 04 Aug 2022 13:19:10 +0000
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
	bh=DsU+wlYJYrIkPfUoXCjx+9Hv/LT24kPEflq756qCY3I=; b=VcT6LFBUAn/lG+/Pr/zinsFzoY
	S8FLPPK7cbb3nyaA9J1lotlrqYgQmT+vcc/UMfKRvimjQNnVJeYsLq5lnlaLF46iruGYtj74OYkvi
	VJJ6wQQnHEVf9Gnfh5xoLrPSuW488/PZ8Xckypsjfl73WgBlxrwy3ckb3/25c/aNo8ac=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172136: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
X-Osstest-Versions-That:
    ovmf=d2191197217f9d16541c2d051235c494fa80bce3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Aug 2022 13:19:10 +0000

flight 172136 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172136/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009
baseline version:
 ovmf                 d2191197217f9d16541c2d051235c494fa80bce3

Last test of basis   172126  2022-08-03 22:12:01 Z    0 days
Testing same since   172136  2022-08-04 06:43:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sean Rhodes <sean@starlabs.systems>

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
   d219119721..444260d45e  444260d45ec2a84e8f8c192b3539a3cd5591d009 -> xen-tested-master

