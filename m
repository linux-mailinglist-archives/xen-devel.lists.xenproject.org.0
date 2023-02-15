Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7CA6974EF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 04:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495705.766115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS8Xt-0006it-2S; Wed, 15 Feb 2023 03:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495705.766115; Wed, 15 Feb 2023 03:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS8Xs-0006hz-U7; Wed, 15 Feb 2023 03:33:24 +0000
Received: by outflank-mailman (input) for mailman id 495705;
 Wed, 15 Feb 2023 03:33:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pS8Xr-0006hn-73; Wed, 15 Feb 2023 03:33:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pS8Xr-0003Om-5G; Wed, 15 Feb 2023 03:33:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pS8Xq-0006Wv-UE; Wed, 15 Feb 2023 03:33:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pS8Xq-0002ak-Ti; Wed, 15 Feb 2023 03:33:22 +0000
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
	bh=1VHulUNQkQCGQ6mxrpE5MuJDNkBOdaAFtCQYdbJU9WE=; b=radzowW6KY5Qe0lamlzjn+jNs6
	kmt9pHK/w+XHMs3VEkidJM+zO9B/el71vacM6G5zVMa0aVbo7cf/5ceohhTL0PF8DsU6ZBpOVbuBD
	16JiYkLbg+3TTx4FhHjFU0KZqHMg/jsZfKQMvnzZq1oinwbls25r9c+ERWpD3hGt/hfs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177328-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177328: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1b5420e8071b4f9ba13136f19365542dfe66bf04
X-Osstest-Versions-That:
    ovmf=540522fec06b87bf11ad5624abe23b515f282d60
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Feb 2023 03:33:22 +0000

flight 177328 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177328/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1b5420e8071b4f9ba13136f19365542dfe66bf04
baseline version:
 ovmf                 540522fec06b87bf11ad5624abe23b515f282d60

Last test of basis   177239  2023-02-14 03:48:16 Z    0 days
Testing same since   177328  2023-02-15 00:12:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dionna Glaze <dionnaglaze@google.com>

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
   540522fec0..1b5420e807  1b5420e8071b4f9ba13136f19365542dfe66bf04 -> xen-tested-master

