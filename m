Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573598A3F1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 15:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807385.1218805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svG6B-0003qK-Kz; Mon, 30 Sep 2024 13:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807385.1218805; Mon, 30 Sep 2024 13:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svG6B-0003oV-I1; Mon, 30 Sep 2024 13:05:59 +0000
Received: by outflank-mailman (input) for mailman id 807385;
 Mon, 30 Sep 2024 13:05:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1svG69-0003oJ-My; Mon, 30 Sep 2024 13:05:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1svG69-0004Df-A2; Mon, 30 Sep 2024 13:05:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1svG68-00013v-VK; Mon, 30 Sep 2024 13:05:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1svG68-0004Lb-Un; Mon, 30 Sep 2024 13:05:56 +0000
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
	bh=axGlRU05s+AsP3J9/mQmb7czrhoqtZsiMSL4nJqLJKg=; b=iu/bKyLM5TOrDNDr4bvgT9yug0
	EqR9Hflsmqz5Qg75vzZAQ9hKAikSN/J8jeb39UTRjPelHPhNKhIzBxN+J4EzuJOIyuc+SoS+JUSYr
	KjWHHy74p5TPVAJDGuhTb716ikgMQ+sAHguHFYU1z9cSJz9/v5k2G/JVWyuanKc0wN7U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187907-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187907: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=517019a55302b1222c152ee05226d55883050642
X-Osstest-Versions-That:
    ovmf=a6b472131e6f49ec6ec309a06fed3b70b97a8602
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Sep 2024 13:05:56 +0000

flight 187907 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187907/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 517019a55302b1222c152ee05226d55883050642
baseline version:
 ovmf                 a6b472131e6f49ec6ec309a06fed3b70b97a8602

Last test of basis   187905  2024-09-30 08:41:38 Z    0 days
Testing same since   187907  2024-09-30 11:45:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>

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
   a6b472131e..517019a553  517019a55302b1222c152ee05226d55883050642 -> xen-tested-master

