Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC397234E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 22:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794861.1203874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snkhx-0006I4-GB; Mon, 09 Sep 2024 20:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794861.1203874; Mon, 09 Sep 2024 20:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snkhx-0006GF-CZ; Mon, 09 Sep 2024 20:09:57 +0000
Received: by outflank-mailman (input) for mailman id 794861;
 Mon, 09 Sep 2024 20:09:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snkhw-0006G5-1O; Mon, 09 Sep 2024 20:09:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snkhv-0006WQ-Tj; Mon, 09 Sep 2024 20:09:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snkhv-0002VN-Jc; Mon, 09 Sep 2024 20:09:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snkhv-0001AW-J8; Mon, 09 Sep 2024 20:09:55 +0000
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
	bh=w+qQ8VnwZzJ6mUHsOtWPExTufgNuPT9Xp1AzRNND5Xg=; b=IUky8ANJrIjzlQfRyzSyrZaNNl
	YyrwmeI+Q/01lfE27a2fk3KyXu7tAk97Vx+m2/avShZ9xwj+mtBnz8RP1mUb1duZWOdCO926SwdVd
	rE3OQlDTcN4WKZ/l2/Yaljhzqhj6eqTAx/mggO86HGb8u7tc5evfZYvNNxoYeojPNcrQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187617-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187617: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3885a3edad618861168fe7081027867f1753ed42
X-Osstest-Versions-That:
    ovmf=e5715711a41b3a323b1605e41e5875d377e7c9c2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2024 20:09:55 +0000

flight 187617 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187617/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3885a3edad618861168fe7081027867f1753ed42
baseline version:
 ovmf                 e5715711a41b3a323b1605e41e5875d377e7c9c2

Last test of basis   187592  2024-09-09 03:11:34 Z    0 days
Testing same since   187617  2024-09-09 18:13:51 Z    0 days    1 attempts

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
   e5715711a4..3885a3edad  3885a3edad618861168fe7081027867f1753ed42 -> xen-tested-master

