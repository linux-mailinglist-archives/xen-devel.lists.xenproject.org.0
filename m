Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F5361035
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111433.213141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4tq-00072E-0T; Thu, 15 Apr 2021 16:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111433.213141; Thu, 15 Apr 2021 16:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4tp-00071m-Sj; Thu, 15 Apr 2021 16:31:25 +0000
Received: by outflank-mailman (input) for mailman id 111433;
 Thu, 15 Apr 2021 16:31:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lX4to-00071e-60; Thu, 15 Apr 2021 16:31:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lX4tn-0004UR-UB; Thu, 15 Apr 2021 16:31:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lX4tn-0003Nd-ND; Thu, 15 Apr 2021 16:31:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lX4tn-0000to-Mi; Thu, 15 Apr 2021 16:31:23 +0000
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
	bh=1994qxJezLtvub3ACalghDUFqCtRLLLciofrY9hXsxU=; b=LMqg0IDZmzgieL5taN/lRnx+Wz
	1CYpzf/DwwnYXilfa/DgIWt5WSF9W/2BdptXaBalpAVWwzdMN90kBCo2j10zD6nYJBIt7OY0kqxyg
	wVwS6/pxzRlnueL6wHI/tk3KyDjGypMUCe2MGhiwDdQOZ5lNvr5g+4IFlM6YUBz9BE3g=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161169-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161169: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7cc8cd7b588964348013a3a01edf38c0182eca10
X-Osstest-Versions-That:
    ovmf=2ad22420a710dc07e3b644f91a5b55c09c39ecf3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Apr 2021 16:31:23 +0000

flight 161169 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161169/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7cc8cd7b588964348013a3a01edf38c0182eca10
baseline version:
 ovmf                 2ad22420a710dc07e3b644f91a5b55c09c39ecf3

Last test of basis   161159  2021-04-15 05:25:16 Z    0 days
Testing same since   161169  2021-04-15 12:40:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   2ad22420a7..7cc8cd7b58  7cc8cd7b588964348013a3a01edf38c0182eca10 -> xen-tested-master

