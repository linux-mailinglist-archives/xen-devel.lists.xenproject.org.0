Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84966394DCF
	for <lists+xen-devel@lfdr.de>; Sat, 29 May 2021 21:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134201.249798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ln4Oq-0002Fq-2Z; Sat, 29 May 2021 19:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134201.249798; Sat, 29 May 2021 19:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ln4Op-0002CX-SW; Sat, 29 May 2021 19:13:31 +0000
Received: by outflank-mailman (input) for mailman id 134201;
 Sat, 29 May 2021 19:13:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ln4On-0002CN-Sd; Sat, 29 May 2021 19:13:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ln4On-0002mM-LY; Sat, 29 May 2021 19:13:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ln4On-0000mM-CC; Sat, 29 May 2021 19:13:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ln4On-0000uR-Bk; Sat, 29 May 2021 19:13:29 +0000
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
	bh=x+r5YfVl21rE72etvMgCPS7dqN91Wv1+XJASZm7I4ds=; b=uWR9W7jJFQmKybQGHRISJ4/26S
	sfdDbvPeCzscXaDflHn7DpQxrW7CLxYft70zVOlSIS1bt/GVBDYdtsTVNtqmGgzs6TnlB2QvOF4UB
	OjOQkEGWF2Sr82tDfbFChmJ6e6Z8jKUQSAhT+QYVkAGmbcoiauN8M+MFnrZccQsMZwZ8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162256-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162256: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b8ed8c0fb2c9a5e97d0286a23827f2b5356ca552
X-Osstest-Versions-That:
    ovmf=e1999b264f1f9d7230edf2448f757c73da567832
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 May 2021 19:13:29 +0000

flight 162256 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162256/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b8ed8c0fb2c9a5e97d0286a23827f2b5356ca552
baseline version:
 ovmf                 e1999b264f1f9d7230edf2448f757c73da567832

Last test of basis   162217  2021-05-27 10:11:38 Z    2 days
Testing same since   162256  2021-05-29 11:11:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>

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
   e1999b264f..b8ed8c0fb2  b8ed8c0fb2c9a5e97d0286a23827f2b5356ca552 -> xen-tested-master

