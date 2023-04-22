Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D2F6EB6A9
	for <lists+xen-devel@lfdr.de>; Sat, 22 Apr 2023 03:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524696.815795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pq25w-0005k9-JV; Sat, 22 Apr 2023 01:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524696.815795; Sat, 22 Apr 2023 01:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pq25w-0005hc-Dz; Sat, 22 Apr 2023 01:31:20 +0000
Received: by outflank-mailman (input) for mailman id 524696;
 Sat, 22 Apr 2023 01:31:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pq25u-0005hS-Rm; Sat, 22 Apr 2023 01:31:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pq25u-0006Ut-Hc; Sat, 22 Apr 2023 01:31:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pq25t-0005Cw-Va; Sat, 22 Apr 2023 01:31:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pq25t-0007Dp-Uy; Sat, 22 Apr 2023 01:31:17 +0000
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
	bh=lhfzxdW3vabCw5h8oUKDqlauSemujDEW55VV7ykrL/E=; b=aprXE7SunKDN5lseUlGpQTnta7
	5RIwPBaAx0h8+nWcCfcykq8eggIrNBDqSjrmuY+muLlHcN9/hb2q5hp5QDrVSWugzuP9Ledaoh09J
	S6f6BOXFQrcG0+8WhbqMfnZBW0zk1P3wwPriLWWrX8zmZg+2Un2bSWVgqfJPN9yl/VAw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180368-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180368: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2c2cb235289642775a7c4e6eaeffa6d3828d279c
X-Osstest-Versions-That:
    ovmf=ed2ff315db7e800dd7718b1d1320ea8024d4e8b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 22 Apr 2023 01:31:17 +0000

flight 180368 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180368/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2c2cb235289642775a7c4e6eaeffa6d3828d279c
baseline version:
 ovmf                 ed2ff315db7e800dd7718b1d1320ea8024d4e8b2

Last test of basis   180365  2023-04-21 16:12:18 Z    0 days
Testing same since   180368  2023-04-21 19:10:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

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
   ed2ff315db..2c2cb23528  2c2cb235289642775a7c4e6eaeffa6d3828d279c -> xen-tested-master

