Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5FF96686B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 19:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786561.1196147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk5mc-0001Bb-4l; Fri, 30 Aug 2024 17:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786561.1196147; Fri, 30 Aug 2024 17:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk5mc-00019f-18; Fri, 30 Aug 2024 17:51:38 +0000
Received: by outflank-mailman (input) for mailman id 786561;
 Fri, 30 Aug 2024 17:51:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk5ma-00019V-IJ; Fri, 30 Aug 2024 17:51:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk5ma-0003Bm-20; Fri, 30 Aug 2024 17:51:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk5mZ-00089R-Is; Fri, 30 Aug 2024 17:51:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sk5mZ-00087k-IQ; Fri, 30 Aug 2024 17:51:35 +0000
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
	bh=JEawaVONr8OV6ODsRwe2SknnPYw2fjHnhDTQUjSQUqQ=; b=2RDKfzHBear8/qawfgwIopwFdS
	mLjvciSxmlDF8C4pjsdkse7TfV+G8SnB8MaoBrKb+Fze/6XTEzkyKzjnSsTHokIHXkhLOxSIJE8mI
	t5Oy4zgOEvM5aZQ2aXAw5dWyEIXGbStpAHwO2RF069RNUgitZOju48j0eYfd8AERtWsE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187423-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187423: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9d5a9940e4b1bf7cc9080ff245485abbf1858d2c
X-Osstest-Versions-That:
    ovmf=a1b0703e8ea59b2b353e644b92f01b8cad182d04
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 17:51:35 +0000

flight 187423 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187423/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9d5a9940e4b1bf7cc9080ff245485abbf1858d2c
baseline version:
 ovmf                 a1b0703e8ea59b2b353e644b92f01b8cad182d04

Last test of basis   187421  2024-08-30 14:13:16 Z    0 days
Testing same since   187423  2024-08-30 16:11:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>

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
   a1b0703e8e..9d5a9940e4  9d5a9940e4b1bf7cc9080ff245485abbf1858d2c -> xen-tested-master

