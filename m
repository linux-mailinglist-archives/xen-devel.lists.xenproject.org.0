Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4740EF38
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 04:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188833.338168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR3fF-00077U-76; Fri, 17 Sep 2021 02:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188833.338168; Fri, 17 Sep 2021 02:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR3fF-00075I-3E; Fri, 17 Sep 2021 02:31:45 +0000
Received: by outflank-mailman (input) for mailman id 188833;
 Fri, 17 Sep 2021 02:31:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mR3fC-000758-WE; Fri, 17 Sep 2021 02:31:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mR3fC-00034S-GM; Fri, 17 Sep 2021 02:31:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mR3fC-0007O7-4U; Fri, 17 Sep 2021 02:31:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mR3fC-0007EA-2O; Fri, 17 Sep 2021 02:31:42 +0000
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
	bh=gc8EbGWbEuVj5eRX/GmXJJOAj5clp2UQ2lhPuytDN00=; b=TVCyQLJWCcCH/r4f3IndgoapTT
	UV0kkT9BdHTdZ/5UMZ9QBSLgQJgxQx85wB88x4g0aBxcQrpm402f+GYzGgb+CwpJvuTucb6xns4DS
	vRG6VgRpMxshuwlYe5kDO/Ua4v/Ucf/e9gCnxAFNAGaX+Oug4MdSxpU46Yt477YcCTVU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165013-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165013: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ac6388add4ade3ae5c4036ea6c2ce9c8d301d057
X-Osstest-Versions-That:
    ovmf=f4e72cf9d665a8f1a54170b0b62739a628823c8b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Sep 2021 02:31:42 +0000

flight 165013 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165013/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ac6388add4ade3ae5c4036ea6c2ce9c8d301d057
baseline version:
 ovmf                 f4e72cf9d665a8f1a54170b0b62739a628823c8b

Last test of basis   165007  2021-09-16 09:41:13 Z    0 days
Testing same since   165013  2021-09-16 15:12:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>
  Dun Tan <dun.tan@intel.com>
  Jason Lou <yun.lou@intel.com>
  Leif Lindholm <leif@nuviainc.com>
  Lou, Yun <Yun.Lou@intel.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Tan, Dun <dun.tan@intel.com>

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
   f4e72cf9d6..ac6388add4  ac6388add4ade3ae5c4036ea6c2ce9c8d301d057 -> xen-tested-master

