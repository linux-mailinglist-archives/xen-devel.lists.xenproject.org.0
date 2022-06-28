Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087E55C0CD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 13:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357046.585448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o69lu-0005ZB-2t; Tue, 28 Jun 2022 11:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357046.585448; Tue, 28 Jun 2022 11:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o69lu-0005Wr-0D; Tue, 28 Jun 2022 11:52:46 +0000
Received: by outflank-mailman (input) for mailman id 357046;
 Tue, 28 Jun 2022 11:52:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o69lt-0005Wh-5i; Tue, 28 Jun 2022 11:52:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o69lt-0005n1-3M; Tue, 28 Jun 2022 11:52:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o69ls-0001fA-JH; Tue, 28 Jun 2022 11:52:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o69ls-0002KN-In; Tue, 28 Jun 2022 11:52:44 +0000
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
	bh=DGGCRDlrT8uWkYRD1kkfmX3hTzICTODviI0RG8a9+3g=; b=dOrtiKZ4GJ6cANCy1Gppg5mHBI
	M8HsVLeg6wFRBiHsM/hGRVWspdhheLNcds9Z8EHdB943oZ9JqLvV/75032MUmAUXrjIQonN3QDUva
	oPXq5aoZCU1wtJIHr9xP2Je/n4xN2eF+vAr4rfnESzt0E3YsoYwQRW9tgHbAw4rOR6pk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171381-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171381: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=59141288716f8917968d4bb96367b7d08fe5ab8a
X-Osstest-Versions-That:
    ovmf=7f4eca4cc2e01d4160ef265f477f9d098d7d33df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Jun 2022 11:52:44 +0000

flight 171381 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171381/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 59141288716f8917968d4bb96367b7d08fe5ab8a
baseline version:
 ovmf                 7f4eca4cc2e01d4160ef265f477f9d098d7d33df

Last test of basis   171365  2022-06-27 02:58:42 Z    1 days
Testing same since   171381  2022-06-28 09:41:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Feng, Bob C <bob.c.feng@intel.com>

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
   7f4eca4cc2..5914128871  59141288716f8917968d4bb96367b7d08fe5ab8a -> xen-tested-master

