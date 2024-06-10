Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47B902817
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737531.1143893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGjEc-0004SI-33; Mon, 10 Jun 2024 17:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737531.1143893; Mon, 10 Jun 2024 17:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGjEb-0004PZ-Vs; Mon, 10 Jun 2024 17:55:09 +0000
Received: by outflank-mailman (input) for mailman id 737531;
 Mon, 10 Jun 2024 17:55:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGjEa-0004PO-Km; Mon, 10 Jun 2024 17:55:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGjEa-0005FE-Hl; Mon, 10 Jun 2024 17:55:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGjEa-0003il-6g; Mon, 10 Jun 2024 17:55:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sGjEa-00067q-6G; Mon, 10 Jun 2024 17:55:08 +0000
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
	bh=s0O1leV4fgueMN58ad/Pq+E9YygjaIO2ND8UiSKxlj0=; b=TXTgAOWQKLfM+TJ/nEeBxkaY+n
	AW8cOMjrBEKq1zkCkW05Q+RB3l4wA0iFLJiM73p/SwtqsmoBQKNeKn39XtM9o61zdnT+5c0TYbimY
	E8rFKNfomsZ3PRSA/AYRvbvcAEl4qKLkN2dbPp8OUxzV9IqnoemjpeF1JSzP/eF7FkuM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186306-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186306: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6d15276ceddd2bf05995ee2efa86316fca1cd73a
X-Osstest-Versions-That:
    ovmf=3dcc7b73df2b1c38c3c1a31724d577f4085f3ab1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Jun 2024 17:55:08 +0000

flight 186306 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186306/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6d15276ceddd2bf05995ee2efa86316fca1cd73a
baseline version:
 ovmf                 3dcc7b73df2b1c38c3c1a31724d577f4085f3ab1

Last test of basis   186302  2024-06-10 09:11:12 Z    0 days
Testing same since   186306  2024-06-10 16:12:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sebastian Witt <sebastian.witt@siemens.com>

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
   3dcc7b73df..6d15276ced  6d15276ceddd2bf05995ee2efa86316fca1cd73a -> xen-tested-master

