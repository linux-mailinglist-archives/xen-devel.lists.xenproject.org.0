Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD82870B68
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 21:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688519.1072739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhEmR-0004TV-Ct; Mon, 04 Mar 2024 20:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688519.1072739; Mon, 04 Mar 2024 20:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhEmR-0004Sd-A2; Mon, 04 Mar 2024 20:19:23 +0000
Received: by outflank-mailman (input) for mailman id 688519;
 Mon, 04 Mar 2024 20:19:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhEmQ-0004ST-LV; Mon, 04 Mar 2024 20:19:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhEmQ-0007kT-Jl; Mon, 04 Mar 2024 20:19:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhEmQ-00081R-B8; Mon, 04 Mar 2024 20:19:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rhEmQ-0000nj-Ac; Mon, 04 Mar 2024 20:19:22 +0000
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
	bh=tPS1pn//TthNN6c2zdnMerUucuLIk5jriuOUuAbNeq0=; b=joQvcvEYIo6Q2dLGE/lXeB6shX
	4E369OL+4l9euWEMBhVnkKlJQsYJOak0UF3WCaW+1r/5Y1jtgrzSkeeG3Pt5g0OiADuNFZnO6YUL+
	UUhPsdLqtP9xm9rghKVvzN6KOUa5EDQCSWpadNlNMDbd0V99hyrwb0U/z/9G+q6TrbBA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184903-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184903: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=918288ab5a7c3abe9c58d576ccc0ae32e2c7dea0
X-Osstest-Versions-That:
    ovmf=bff9815b616669f1cf743e412bc0000efe22dfb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 04 Mar 2024 20:19:22 +0000

flight 184903 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184903/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 918288ab5a7c3abe9c58d576ccc0ae32e2c7dea0
baseline version:
 ovmf                 bff9815b616669f1cf743e412bc0000efe22dfb4

Last test of basis   184899  2024-03-04 16:43:32 Z    0 days
Testing same since   184903  2024-03-04 18:41:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   bff9815b61..918288ab5a  918288ab5a7c3abe9c58d576ccc0ae32e2c7dea0 -> xen-tested-master

