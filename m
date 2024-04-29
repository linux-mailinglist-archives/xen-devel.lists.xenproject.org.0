Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD28B5F75
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 19:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714308.1115485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ULf-0005PB-4c; Mon, 29 Apr 2024 16:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714308.1115485; Mon, 29 Apr 2024 16:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ULf-0005Lz-1h; Mon, 29 Apr 2024 16:59:27 +0000
Received: by outflank-mailman (input) for mailman id 714308;
 Mon, 29 Apr 2024 16:59:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1ULc-0005Lp-Ml; Mon, 29 Apr 2024 16:59:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1ULc-0001Ll-Gh; Mon, 29 Apr 2024 16:59:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1ULc-0006dz-3C; Mon, 29 Apr 2024 16:59:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s1ULc-0004ky-2l; Mon, 29 Apr 2024 16:59:24 +0000
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
	bh=h1msT/pcE+ZfWNMDclUgVI4hg64bFaY60K30gWcev7Q=; b=Y00hZeLxUf5CJdjYWhoCMJH21p
	qr6UhbqOdGAWLWjLXxfaRmVAFTnAdZ4ONsKv5x4lay2aef7+OCLAstKIU4327Xsd8D74wZjIHdpRl
	nOnQBHX8/IGREDFOkZ0vR32CJlwBE+7TZNSz/SPpTvbCsX0M+3rsoWBt7ZiyKXlFyYnE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185868-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185868: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=094727264f887e275444bd11d9d99c651a85c2e4
X-Osstest-Versions-That:
    ovmf=c0dfe3ec1f364dbdaf6b241e01343e560b21dd03
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Apr 2024 16:59:24 +0000

flight 185868 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185868/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 094727264f887e275444bd11d9d99c651a85c2e4
baseline version:
 ovmf                 c0dfe3ec1f364dbdaf6b241e01343e560b21dd03

Last test of basis   185803  2024-04-26 03:11:18 Z    3 days
Testing same since   185868  2024-04-29 10:45:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Foster Nong <foster.nong@intel.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   c0dfe3ec1f..094727264f  094727264f887e275444bd11d9d99c651a85c2e4 -> xen-tested-master

