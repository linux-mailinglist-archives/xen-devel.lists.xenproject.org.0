Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67206912023
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745142.1152303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKaFw-000235-Uf; Fri, 21 Jun 2024 09:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745142.1152303; Fri, 21 Jun 2024 09:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKaFw-00021a-Rj; Fri, 21 Jun 2024 09:08:28 +0000
Received: by outflank-mailman (input) for mailman id 745142;
 Fri, 21 Jun 2024 09:08:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKaFv-00021O-DW; Fri, 21 Jun 2024 09:08:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKaFv-0005HB-0x; Fri, 21 Jun 2024 09:08:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKaFu-0008Hw-Og; Fri, 21 Jun 2024 09:08:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sKaFu-0008Uh-Nj; Fri, 21 Jun 2024 09:08:26 +0000
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
	bh=Rs7PiOksJqdVboV7xJeU5Tp6GL1gTDpUWbTtjYPyDrQ=; b=hzHxZauw9qV62XuQfZDoFEZZMy
	wQNQpPQrcOE/2MhUhf68bA3HNYCdgbZi2vE4+RtYXdkq+YQTnD4g8YuM/k2pM8VmCF8XCCCkdnCwg
	Q90pDNgQX8/6US54ADFBbp0mqHQ32e8u8Ydcg6ovUPxAvU8DdwJy4SP78PERwlU20Rm4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186443-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186443: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=be38c01da2dd949e0a6f8bceeb88d2e19c8c65f7
X-Osstest-Versions-That:
    ovmf=d512bd31293c7f2aeef9b60fb6f112d0e90adff3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jun 2024 09:08:26 +0000

flight 186443 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186443/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 be38c01da2dd949e0a6f8bceeb88d2e19c8c65f7
baseline version:
 ovmf                 d512bd31293c7f2aeef9b60fb6f112d0e90adff3

Last test of basis   186440  2024-06-21 03:11:13 Z    0 days
Testing same since   186443  2024-06-21 07:11:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   d512bd3129..be38c01da2  be38c01da2dd949e0a6f8bceeb88d2e19c8c65f7 -> xen-tested-master

