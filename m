Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0D57F550
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jul 2022 15:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374027.606222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFc4E-0007zW-7o; Sun, 24 Jul 2022 13:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374027.606222; Sun, 24 Jul 2022 13:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFc4E-0007wj-57; Sun, 24 Jul 2022 13:54:46 +0000
Received: by outflank-mailman (input) for mailman id 374027;
 Sun, 24 Jul 2022 13:54:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFc4D-0007wZ-4J; Sun, 24 Jul 2022 13:54:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFc4D-0000Qz-2Q; Sun, 24 Jul 2022 13:54:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFc4C-0006aX-Jq; Sun, 24 Jul 2022 13:54:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oFc4C-00045Z-JN; Sun, 24 Jul 2022 13:54:44 +0000
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
	bh=WauBCrU0voTnsIr6bTYv4qWHamwLIvFiJOg2a1PqUig=; b=usr3HecSdRjBEzpJ4qEJ5mcyc4
	nS73S2F4YGQi5wWtcRsPqyGvpnGatFQyZ8yFnfyzZhsDuobYJPrN3gWa2Hm+gupcEXCu7ZGqYp5rs
	LINhSa7JncIf0IG+VwzZKvwYIvwDC3CM1flU81ladkQCtTBJmMwg2SFbw/qSG+41BEvQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171841-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171841: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8ee26529d1b554a31c1041f0b9ed4e2dd250bd7a
X-Osstest-Versions-That:
    ovmf=d32a84b5ad8eb5293710ca83dad2b4686479b653
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Jul 2022 13:54:44 +0000

flight 171841 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171841/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8ee26529d1b554a31c1041f0b9ed4e2dd250bd7a
baseline version:
 ovmf                 d32a84b5ad8eb5293710ca83dad2b4686479b653

Last test of basis   171834  2022-07-24 07:10:34 Z    0 days
Testing same since   171841  2022-07-24 11:40:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Konstantin Aladyshev <aladyshev22@gmail.com>

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
   d32a84b5ad..8ee26529d1  8ee26529d1b554a31c1041f0b9ed4e2dd250bd7a -> xen-tested-master

