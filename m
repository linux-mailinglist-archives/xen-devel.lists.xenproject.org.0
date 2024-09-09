Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A82970CC8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 06:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.793971.1202631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snWJ7-0003fk-5o; Mon, 09 Sep 2024 04:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 793971.1202631; Mon, 09 Sep 2024 04:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snWJ7-0003e7-32; Mon, 09 Sep 2024 04:47:21 +0000
Received: by outflank-mailman (input) for mailman id 793971;
 Mon, 09 Sep 2024 04:47:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snWJ6-0003dx-EO; Mon, 09 Sep 2024 04:47:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snWJ6-0001T5-8J; Mon, 09 Sep 2024 04:47:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snWJ5-00051U-SM; Mon, 09 Sep 2024 04:47:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snWJ5-00032H-Rf; Mon, 09 Sep 2024 04:47:19 +0000
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
	bh=/Grjpk8DKEHTK0byyQIy/01DdYtEMGI14RJ9kbaw2vk=; b=32mszTAyg4vsJGFLCrttR7rWDQ
	+kM7yEH2AkWvJ+oujsUXdjA+2fM09w+KDOodzX7qDXexM1m8I2sQStI/U8AheK+H47SNGc1Jxeycq
	qoPt3G4QMwHCYLIj2ug3oDW8YIo4TfhXmoskun5sfu+Bv1+2EF7UBbBp6m9KBelKv4No=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187592-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187592: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e5715711a41b3a323b1605e41e5875d377e7c9c2
X-Osstest-Versions-That:
    ovmf=b437b5ca4c1a6725897dfd0740de6ef20cacd226
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2024 04:47:19 +0000

flight 187592 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187592/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e5715711a41b3a323b1605e41e5875d377e7c9c2
baseline version:
 ovmf                 b437b5ca4c1a6725897dfd0740de6ef20cacd226

Last test of basis   187527  2024-09-06 09:13:26 Z    2 days
Testing same since   187592  2024-09-09 03:11:34 Z    0 days    1 attempts

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
   b437b5ca4c..e5715711a4  e5715711a41b3a323b1605e41e5875d377e7c9c2 -> xen-tested-master

