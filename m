Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61517991401
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 04:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810725.1223477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swulk-0003hS-Sj; Sat, 05 Oct 2024 02:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810725.1223477; Sat, 05 Oct 2024 02:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swulk-0003fA-QA; Sat, 05 Oct 2024 02:43:44 +0000
Received: by outflank-mailman (input) for mailman id 810725;
 Sat, 05 Oct 2024 02:43:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swulj-0003f0-HU; Sat, 05 Oct 2024 02:43:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swulj-0002a4-9Z; Sat, 05 Oct 2024 02:43:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swuli-0002eD-OO; Sat, 05 Oct 2024 02:43:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swuli-00016U-N3; Sat, 05 Oct 2024 02:43:42 +0000
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
	bh=IAlq6Sfc1WNJlsP/BTCi95+C259uX3Q87TGgzNemf1I=; b=1NL6zck22yGkCDr1GpDD3yf6TE
	s+kHnfOCI6JTpDME0jsv6Rsx4eTX5kAni7+yoekv041SJJEXVJw13bywKFBYdJOm8RfJD/9/iQBlA
	+jBY18zsWGdkzsVq/ok1OrdCG4wldwrpql8Rai0fcmxppFjO79FY4noWmQonoHqUKvys=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187977-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187977: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=80d9b4449182cd17484cae72269992e642095a00
X-Osstest-Versions-That:
    ovmf=8cce048d4834d6967a568f3a0adc1efcf97c80c7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Oct 2024 02:43:42 +0000

flight 187977 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187977/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 80d9b4449182cd17484cae72269992e642095a00
baseline version:
 ovmf                 8cce048d4834d6967a568f3a0adc1efcf97c80c7

Last test of basis   187974  2024-10-04 23:13:20 Z    0 days
Testing same since   187977  2024-10-05 01:11:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Benjamin Doron <benjamin.doron@9elements.com>

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
   8cce048d48..80d9b44491  80d9b4449182cd17484cae72269992e642095a00 -> xen-tested-master

