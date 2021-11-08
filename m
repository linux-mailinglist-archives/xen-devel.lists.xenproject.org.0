Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A7447E6B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223244.385872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2QL-0003by-AY; Mon, 08 Nov 2021 11:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223244.385872; Mon, 08 Nov 2021 11:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2QL-0003a0-6n; Mon, 08 Nov 2021 11:02:49 +0000
Received: by outflank-mailman (input) for mailman id 223244;
 Mon, 08 Nov 2021 11:02:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mk2QJ-0003Zq-Jx; Mon, 08 Nov 2021 11:02:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mk2QJ-0002Ns-2H; Mon, 08 Nov 2021 11:02:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mk2QI-0001sk-PL; Mon, 08 Nov 2021 11:02:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mk2QI-0002j9-Os; Mon, 08 Nov 2021 11:02:46 +0000
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
	bh=3gWW1ZvbCJCRNg+H/J1bnUrQzZjiwF8IFnbVIdxTk7E=; b=e5sWxBfh+e63wu9QchpZmlXA7x
	N8wxFuZzi+p/Kj7Pxlv/JJRUy80tUoxWLM9R6N8GINOazcNpm8e7zFQ3XHg/OL124vfuSmSctMEeR
	xx4A605aM0A/aOlLInzb9L8PY5nb4pDTe3VehTbNAuP21KkQzuGH7mztU3p+ODt8D9lY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166083-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166083: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b5d4a35d90771ec86ce9cf28727f471ee589fb78
X-Osstest-Versions-That:
    ovmf=d79df34bebdd87aa01ccf78f541b4ae4c9f68f74
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Nov 2021 11:02:46 +0000

flight 166083 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166083/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b5d4a35d90771ec86ce9cf28727f471ee589fb78
baseline version:
 ovmf                 d79df34bebdd87aa01ccf78f541b4ae4c9f68f74

Last test of basis   166081  2021-11-08 03:41:16 Z    0 days
Testing same since   166083  2021-11-08 09:12:22 Z    0 days    1 attempts

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
   d79df34beb..b5d4a35d90  b5d4a35d90771ec86ce9cf28727f471ee589fb78 -> xen-tested-master

