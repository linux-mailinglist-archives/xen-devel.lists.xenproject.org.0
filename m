Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B18969088
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 01:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788518.1197933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slGqw-0006mv-Nv; Mon, 02 Sep 2024 23:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788518.1197933; Mon, 02 Sep 2024 23:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slGqw-0006kU-J9; Mon, 02 Sep 2024 23:52:58 +0000
Received: by outflank-mailman (input) for mailman id 788518;
 Mon, 02 Sep 2024 23:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slGqu-0006kK-QQ; Mon, 02 Sep 2024 23:52:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slGqu-0006UG-EF; Mon, 02 Sep 2024 23:52:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slGqu-0007YJ-47; Mon, 02 Sep 2024 23:52:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slGqu-0001ih-3T; Mon, 02 Sep 2024 23:52:56 +0000
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
	bh=7zWQyd2BLANemLcs05lSKsC440k0jTR2nVq4NMomwDI=; b=EBaOeIifp1sFXfbHT+WQHtBYPr
	MYr7D10P4qoV0FWbz7FReb7UHyV/3DnAsPJO+VOe6cWKkPlgHmWYMkCNB/fMr+1RFfj2c8Nt3hcCz
	ton35Puv0vnPFJy2Jib4+ZEbAlQDbAzG402e2uwyGc2b5G6VgMS6fu5M9MfMUe7xSVwM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187460-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187460: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=82c5cacd134d64ea0d0f4dabdbbde38017acb70d
X-Osstest-Versions-That:
    ovmf=eaf78e43f206f8587bdf6c0f78c0f021192d5859
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Sep 2024 23:52:56 +0000

flight 187460 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187460/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 82c5cacd134d64ea0d0f4dabdbbde38017acb70d
baseline version:
 ovmf                 eaf78e43f206f8587bdf6c0f78c0f021192d5859

Last test of basis   187459  2024-09-02 17:41:31 Z    0 days
Testing same since   187460  2024-09-02 21:45:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>

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
   eaf78e43f2..82c5cacd13  82c5cacd134d64ea0d0f4dabdbbde38017acb70d -> xen-tested-master

