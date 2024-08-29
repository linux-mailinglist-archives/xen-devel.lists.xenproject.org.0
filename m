Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF29648DA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785954.1195505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjgOA-0008FZ-5Y; Thu, 29 Aug 2024 14:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785954.1195505; Thu, 29 Aug 2024 14:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjgOA-0008Cu-2G; Thu, 29 Aug 2024 14:44:42 +0000
Received: by outflank-mailman (input) for mailman id 785954;
 Thu, 29 Aug 2024 14:44:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjgO8-0008Cb-Bq; Thu, 29 Aug 2024 14:44:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjgO8-0005JM-1d; Thu, 29 Aug 2024 14:44:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjgO7-00063o-Ij; Thu, 29 Aug 2024 14:44:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjgO7-0005Ck-IF; Thu, 29 Aug 2024 14:44:39 +0000
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
	bh=WgCTcbMwEyA0BVQuSDy884+iC3EwpFWQ0EMA2JOUixc=; b=hxGFaH8VuCPgJuFU/KT2O0Qk0R
	E9CkXckAleH9plaDW3yt4p3efVd5Cm7ceV7r/Q7rrMYrSUW4/0va8hHMCnGbxYuGUfSvnNzeaLm9l
	gu1iS9DbA5Is4/yqp1rKZo+bB91nI95bNhxPzZUwMdNiCGign5hFtd8ifZCN2RCFtL8Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187403-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187403: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=01735bbe4a46a6fb7d5d739d0fc5a14897ad18da
X-Osstest-Versions-That:
    ovmf=bb248a95091ab542440053d9c289a97e80eb6630
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2024 14:44:39 +0000

flight 187403 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187403/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da
baseline version:
 ovmf                 bb248a95091ab542440053d9c289a97e80eb6630

Last test of basis   187402  2024-08-29 10:11:27 Z    0 days
Testing same since   187403  2024-08-29 13:15:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   bb248a9509..01735bbe4a  01735bbe4a46a6fb7d5d739d0fc5a14897ad18da -> xen-tested-master

