Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30E52FA077
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 13:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69656.124824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1U3A-0003ew-PJ; Mon, 18 Jan 2021 12:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69656.124824; Mon, 18 Jan 2021 12:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1U3A-0003eT-M7; Mon, 18 Jan 2021 12:54:28 +0000
Received: by outflank-mailman (input) for mailman id 69656;
 Mon, 18 Jan 2021 12:54:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1U38-0003eK-VO; Mon, 18 Jan 2021 12:54:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1U38-0001Tg-Pk; Mon, 18 Jan 2021 12:54:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1U38-0000IJ-FT; Mon, 18 Jan 2021 12:54:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l1U38-0008Oa-F1; Mon, 18 Jan 2021 12:54:26 +0000
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
	bh=Q7GeNgu03lKp6Q1M0I57/7503/kH9KdZL4w8taA6jCw=; b=PWmSFKX86tkp3bewPR/7IGweOF
	DtwLU6rWwoK4e78vkEsbB0K9QZQNO/pdrsZ4NV3CdwC45O9uClhgk0rD4NzSvpb1lUaMYf6FULXix
	QcUJpu/GulAPYhjZfsR59UOCt/rZVvay5z9cAjtyfeB3xVVOZphtxUU5zxqfZ/mUe/OI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158484-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158484: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a7ef2a03b96c464c776a139c104471fb2b84e39b
X-Osstest-Versions-That:
    ovmf=c88736f8605eab3b0877d9301f8e845291c6fdd9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Jan 2021 12:54:26 +0000

flight 158484 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158484/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a7ef2a03b96c464c776a139c104471fb2b84e39b
baseline version:
 ovmf                 c88736f8605eab3b0877d9301f8e845291c6fdd9

Last test of basis   158459  2021-01-16 03:39:47 Z    2 days
Testing same since   158479  2021-01-18 01:39:49 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zarcd Zhong <zarcd.zhong@intel.com>

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
   c88736f860..a7ef2a03b9  a7ef2a03b96c464c776a139c104471fb2b84e39b -> xen-tested-master

