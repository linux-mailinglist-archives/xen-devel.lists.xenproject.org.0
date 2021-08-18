Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E983EF7B7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 03:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168051.306811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGAjl-0004YF-W6; Wed, 18 Aug 2021 01:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168051.306811; Wed, 18 Aug 2021 01:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGAjl-0004VI-QD; Wed, 18 Aug 2021 01:51:25 +0000
Received: by outflank-mailman (input) for mailman id 168051;
 Wed, 18 Aug 2021 01:51:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGAjj-0004V8-TM; Wed, 18 Aug 2021 01:51:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGAjj-0001L5-OP; Wed, 18 Aug 2021 01:51:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGAjj-0000kG-FR; Wed, 18 Aug 2021 01:51:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mGAjj-00068I-Ek; Wed, 18 Aug 2021 01:51:23 +0000
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
	bh=gcOgqkooJBM48rr/Vrm5Osyj7tvHhF5dk1Dt7sgqfn8=; b=30TAsZRj1kbaJA8glWfV7eGU37
	DaOP6IFR+EJnEsMl/Sqk0Uda5j7We7jdU30d6wAPwKnIbENTN8xyrjQYBlHg0ISo6B5KRbpvF+apo
	O91+McrhvNv8uNoT7XjiV6Te4UJzJAdp058fVO92Zg/YDLnGtYEH8LpXZ6cgUnyMp0X0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164229-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164229: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c
X-Osstest-Versions-That:
    ovmf=6fdd1c13a734609aff68d37e606e995d673d9aeb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Aug 2021 01:51:23 +0000

flight 164229 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164229/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c
baseline version:
 ovmf                 6fdd1c13a734609aff68d37e606e995d673d9aeb

Last test of basis   164173  2021-08-13 01:56:17 Z    4 days
Testing same since   164229  2021-08-17 14:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeremy Linton <jeremy.linton@arm.com>

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
   6fdd1c13a7..ef56f55d19  ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c -> xen-tested-master

