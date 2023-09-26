Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBDC7AE9C6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 11:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608385.946842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4qZ-0004XW-1e; Tue, 26 Sep 2023 09:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608385.946842; Tue, 26 Sep 2023 09:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4qY-0004V4-Ur; Tue, 26 Sep 2023 09:59:14 +0000
Received: by outflank-mailman (input) for mailman id 608385;
 Tue, 26 Sep 2023 09:59:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ql4qY-0004Uu-47; Tue, 26 Sep 2023 09:59:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ql4qX-00052c-Vi; Tue, 26 Sep 2023 09:59:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ql4qX-00047S-Lw; Tue, 26 Sep 2023 09:59:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ql4qX-0008G0-LV; Tue, 26 Sep 2023 09:59:13 +0000
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
	bh=SFwngfqM87PFEQZH6+M346q3CRrF555aDu4XvvAJ9Pw=; b=bcDNQ/oT1O7tDFBq8KpzPy+t2E
	2GmBiHacLRUBt09aJ/7OlxnZbZmQ+4A0IhkhblYzudMb8a5fNk+mtJy4PzzVWLcXfb12jYbqHF0xU
	pGbXS48Zm5Wv6PaU/ykIUcEa6pT2r54tND6F0tbTNkKTz7UMs9V75+RaSmFoWixff91o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183174-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183174: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=39f3c26e8c40e092baeb0ec4d0396498506e0a9e
X-Osstest-Versions-That:
    ovmf=c70d91442889078eb94e0abf777f74e403b72d37
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Sep 2023 09:59:13 +0000

flight 183174 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183174/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 39f3c26e8c40e092baeb0ec4d0396498506e0a9e
baseline version:
 ovmf                 c70d91442889078eb94e0abf777f74e403b72d37

Last test of basis   183155  2023-09-25 08:40:51 Z    1 days
Testing same since   183174  2023-09-26 07:42:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  BruceX Wang <brucex.wang@intel.com>
  Brucex.Wang <brucex.wang@intel.com>

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
   c70d914428..39f3c26e8c  39f3c26e8c40e092baeb0ec4d0396498506e0a9e -> xen-tested-master

