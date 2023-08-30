Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA178D732
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593098.926015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNKk-00033h-Lu; Wed, 30 Aug 2023 15:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593098.926015; Wed, 30 Aug 2023 15:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNKk-00030f-I8; Wed, 30 Aug 2023 15:42:18 +0000
Received: by outflank-mailman (input) for mailman id 593098;
 Wed, 30 Aug 2023 15:42:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbNKj-00030V-Mv; Wed, 30 Aug 2023 15:42:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbNKj-0000Uz-Cu; Wed, 30 Aug 2023 15:42:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbNKj-00032Q-3c; Wed, 30 Aug 2023 15:42:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbNKj-0000Yt-2w; Wed, 30 Aug 2023 15:42:17 +0000
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
	bh=pWFbIBH7Ryji3XJuaL3NJWWMVf8ZHhcRkn7C1Ku/GaQ=; b=XXz9gDFa5wQIav7/Jl4nF8v/b8
	GQHUIZbSGSoUKniFEl4r5w9VQGjsdH9CbvyiDvIdS/q26bWp4pRmEShGMn5XCWoPWFizCf5pH75fO
	tgbcWDsE8R9uCLGvSP9whBvsJBG8SW5T+cEFZus/8QybqtabX3yShYmz6X6U4iG34f3Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182568-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182568: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af
X-Osstest-Versions-That:
    ovmf=a481c1114474160f53b1662fd3726b48c88ae82e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Aug 2023 15:42:17 +0000

flight 182568 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182568/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af
baseline version:
 ovmf                 a481c1114474160f53b1662fd3726b48c88ae82e

Last test of basis   182567  2023-08-30 10:12:15 Z    0 days
Testing same since   182568  2023-08-30 13:13:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Tan, Dun <dun.tan@intel.com>
  Wu, Mingliang <mingliangx.wu@intel.com>
  Wu, MingliangX <mingliangx.wu@intel.com>

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
   a481c11144..0c4d0b6c8a  0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af -> xen-tested-master

