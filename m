Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D78894262B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 08:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768206.1178968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2Xt-0005Wj-6Y; Wed, 31 Jul 2024 06:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768206.1178968; Wed, 31 Jul 2024 06:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2Xt-0005UK-3y; Wed, 31 Jul 2024 06:10:45 +0000
Received: by outflank-mailman (input) for mailman id 768206;
 Wed, 31 Jul 2024 06:10:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ2Xr-0005UA-NG; Wed, 31 Jul 2024 06:10:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ2Xr-0003yz-FJ; Wed, 31 Jul 2024 06:10:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ2Xr-0000Oq-2i; Wed, 31 Jul 2024 06:10:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ2Xr-0000vO-2L; Wed, 31 Jul 2024 06:10:43 +0000
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
	bh=uCwTUPpLIRE37sZIq2ubMAmQpbPpIDu40XY9CfrD9MM=; b=RH1Oz0jYJRN2LB5WLnNuYNdwiX
	CjM1oKkZYDdAQcJ8tSee0hgz0p0D2Sp2knm5/7D5I/+4fowiFUWlwwYPkromoOJmG7uHgH/etr3C6
	Co3CIplA1drPBf3hjBWap/etVfBAhA1IPTB3TVEij3jYLnbO1/U5HVEFW1qka9RAY99E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187070-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187070: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9df400fd4d75831e02428e9ccb3dcfce85ceab82
X-Osstest-Versions-That:
    ovmf=f8f34edd9db82882fd70f14cb97ab28e9bb0b9a3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jul 2024 06:10:43 +0000

flight 187070 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187070/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9df400fd4d75831e02428e9ccb3dcfce85ceab82
baseline version:
 ovmf                 f8f34edd9db82882fd70f14cb97ab28e9bb0b9a3

Last test of basis   187066  2024-07-30 21:13:14 Z    0 days
Testing same since   187070  2024-07-31 04:13:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
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
   f8f34edd9d..9df400fd4d  9df400fd4d75831e02428e9ccb3dcfce85ceab82 -> xen-tested-master

