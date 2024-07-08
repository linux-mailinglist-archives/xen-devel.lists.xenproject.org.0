Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0ED92A978
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 21:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755578.1163982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQtah-0005O8-Ph; Mon, 08 Jul 2024 18:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755578.1163982; Mon, 08 Jul 2024 18:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQtah-0005MJ-Mu; Mon, 08 Jul 2024 18:59:59 +0000
Received: by outflank-mailman (input) for mailman id 755578;
 Mon, 08 Jul 2024 18:59:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQtag-0005M9-7x; Mon, 08 Jul 2024 18:59:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQtag-0003wY-6Q; Mon, 08 Jul 2024 18:59:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQtaf-0001ga-SJ; Mon, 08 Jul 2024 18:59:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sQtaf-0007ju-Rx; Mon, 08 Jul 2024 18:59:57 +0000
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
	bh=CZuVhJEbcFm0mC3AtcPdc9kVILoU9DrvXYsD+gW3FDw=; b=63cgPZjW5lc65/icDHJLwkyFiW
	pOT32Wq2XLeA4bw1Z27tqsOWyTIdWwfq88/hA+1WzbdbEht+85hKpg2Ad5qWKZs5KIkx2c3kqET0X
	2GoLRaHe9y4XT3mMGD2tHv0ngd2RSv6IG7stZaKXTUXr+UXLgy6L4NxPqQAuJrGgX3Yk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186731-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186731: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=95a6892aacfef6c7862058fcdc495f6b35df9367
X-Osstest-Versions-That:
    ovmf=049e12c03d27f0a6bf57f4f1835cab5e205661a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jul 2024 18:59:57 +0000

flight 186731 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186731/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 95a6892aacfef6c7862058fcdc495f6b35df9367
baseline version:
 ovmf                 049e12c03d27f0a6bf57f4f1835cab5e205661a7

Last test of basis   186722  2024-07-07 11:14:38 Z    1 days
Testing same since   186731  2024-07-08 17:11:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Pop <aaronpop@microsoft.com>
  Matthew Carlson <matthewfcarlson@gmail.com>

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
   049e12c03d..95a6892aac  95a6892aacfef6c7862058fcdc495f6b35df9367 -> xen-tested-master

