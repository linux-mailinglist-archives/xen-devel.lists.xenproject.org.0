Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C597E58E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 07:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801637.1211604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssbEy-00008g-NH; Mon, 23 Sep 2024 05:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801637.1211604; Mon, 23 Sep 2024 05:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssbEy-00005H-KD; Mon, 23 Sep 2024 05:04:04 +0000
Received: by outflank-mailman (input) for mailman id 801637;
 Mon, 23 Sep 2024 05:04:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssbEx-000050-4p; Mon, 23 Sep 2024 05:04:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssbEx-0005H5-2X; Mon, 23 Sep 2024 05:04:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssbEw-0000wQ-K8; Mon, 23 Sep 2024 05:04:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ssbEw-0000Kx-Iw; Mon, 23 Sep 2024 05:04:02 +0000
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
	bh=uhHX9OXR5Pl0+Afwgt37N+wuBEtDZfAGqeA01adoL6k=; b=f3Tcab+U5qJBf5O8/kl0uq2p5D
	xlZo71TXRBkbbVg/9HVFjop6HQ3SjwAnkT26kYqS6KWuV+aViB8X813oVuhbEMZs2+fYzPhV90tQr
	oDP2sx26azW5Cm4gg14mNQcNs2dZVQkc/mpKs8jkowCK+IJjUI3yDDD9S25Kcd/KnZZo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187819-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187819: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=14bfcc402163d5e4fdefb1258740a24b6ee7261d
X-Osstest-Versions-That:
    ovmf=222e2854fe6bed443686e3809f155fd7b824fabd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Sep 2024 05:04:02 +0000

flight 187819 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187819/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 14bfcc402163d5e4fdefb1258740a24b6ee7261d
baseline version:
 ovmf                 222e2854fe6bed443686e3809f155fd7b824fabd

Last test of basis   187778  2024-09-20 09:13:35 Z    2 days
Testing same since   187819  2024-09-23 01:56:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   222e2854fe..14bfcc4021  14bfcc402163d5e4fdefb1258740a24b6ee7261d -> xen-tested-master

