Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E99F56FEAD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364986.594969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqRB-0007wT-Mu; Mon, 11 Jul 2022 10:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364986.594969; Mon, 11 Jul 2022 10:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqRB-0007tr-Jm; Mon, 11 Jul 2022 10:14:45 +0000
Received: by outflank-mailman (input) for mailman id 364986;
 Mon, 11 Jul 2022 10:14:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oAqRA-0007th-DI; Mon, 11 Jul 2022 10:14:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oAqRA-0003g4-5G; Mon, 11 Jul 2022 10:14:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oAqR9-0001PA-KW; Mon, 11 Jul 2022 10:14:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oAqR9-0004c8-K4; Mon, 11 Jul 2022 10:14:43 +0000
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
	bh=nVxQjvQJiniIuWudLtsAIeTdH4slyk82tBH4guHHKTU=; b=elnWTLHfcdenbc6aNzg8ITh2i6
	yJiKDrYoGZGZz7x9Lluva/O5oA6gZCFAhPeLim72GjEhpbLWC/KBcZjKTwwBjpiZd4ApUfJEM09nv
	8IOLW6FIU6UZmDfWZmgVc9dRM/Q0albOv1AjtV/0LGndKpoar0bfE1ZQlV4ivjaF48pw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171581-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171581: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=12dd064a1804536518eb12229836fa572c232502
X-Osstest-Versions-That:
    ovmf=f6f3cc7eadcfb20898b8d67fbcae21ef56f6897b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Jul 2022 10:14:43 +0000

flight 171581 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171581/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 12dd064a1804536518eb12229836fa572c232502
baseline version:
 ovmf                 f6f3cc7eadcfb20898b8d67fbcae21ef56f6897b

Last test of basis   171580  2022-07-11 04:42:03 Z    0 days
Testing same since   171581  2022-07-11 08:42:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Robert Kowalewski <robert.kowalewski@intel.com>

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
   f6f3cc7ead..12dd064a18  12dd064a1804536518eb12229836fa572c232502 -> xen-tested-master

