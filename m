Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567EC91751C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 02:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748169.1155765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMG4k-0000cW-Cz; Tue, 25 Jun 2024 23:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748169.1155765; Tue, 25 Jun 2024 23:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMG4k-0000ah-9b; Tue, 25 Jun 2024 23:59:50 +0000
Received: by outflank-mailman (input) for mailman id 748169;
 Tue, 25 Jun 2024 23:59:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMG4i-0000aX-Iq; Tue, 25 Jun 2024 23:59:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMG4i-0000Ps-Cg; Tue, 25 Jun 2024 23:59:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMG4h-0005jy-Pc; Tue, 25 Jun 2024 23:59:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMG4h-00064N-PC; Tue, 25 Jun 2024 23:59:47 +0000
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
	bh=7AXUQjkQGh77OnMFFI0moOVui4xWC3ZjG3rFAA8kmaw=; b=0zaHOE1/X2QnIfIM7L6QpNHoJC
	lD1Irl44b4g703Hipu7HpaF0uYo9jHaePyCvPFmqOEZFGeLGORCqtdfUoYQcK88O/MLx0c/+j+UWA
	jefs79JzQ+zetz96VbixbMAGkY6n0hB78UJlsHfyjNlZb7db633cs/G2HjYo41Iu4Bjs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186498-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186498: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=84d8eb08e15e455826ef66a4b1f1f61758cb9aba
X-Osstest-Versions-That:
    ovmf=10b4bb8d6d0c515ed9663691aea3684be8f7b0fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jun 2024 23:59:47 +0000

flight 186498 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186498/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 84d8eb08e15e455826ef66a4b1f1f61758cb9aba
baseline version:
 ovmf                 10b4bb8d6d0c515ed9663691aea3684be8f7b0fc

Last test of basis   186490  2024-06-25 15:41:13 Z    0 days
Testing same since   186498  2024-06-25 22:11:10 Z    0 days    1 attempts

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
   10b4bb8d6d..84d8eb08e1  84d8eb08e15e455826ef66a4b1f1f61758cb9aba -> xen-tested-master

