Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0B2E95B0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61180.107411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPje-00089L-Kq; Mon, 04 Jan 2021 13:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61180.107411; Mon, 04 Jan 2021 13:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPje-00088r-Fp; Mon, 04 Jan 2021 13:17:22 +0000
Received: by outflank-mailman (input) for mailman id 61180;
 Mon, 04 Jan 2021 13:17:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwPjd-00088j-9s; Mon, 04 Jan 2021 13:17:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwPjd-0001fj-4f; Mon, 04 Jan 2021 13:17:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwPjc-0003Sd-R2; Mon, 04 Jan 2021 13:17:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kwPjc-0004cy-QV; Mon, 04 Jan 2021 13:17:20 +0000
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
	bh=wNhzedL1Z1p8CVCnoXh1R1vVcAoJ7XGCNp093WOVfMA=; b=o48bvquTAiFbJYdTjr2E7o88gU
	v/JHSlcd8Svhyz9iV8upNKNsc7fw6j9TZJCc70E12qMlPljdfoW0Rywd1m/9RISKhEmeSYZYtKkko
	YBwcGZNzMD9rBpF5tz8pJjJ2QtanakDWqdd0HNwlgL1rHq7n693rjURYdowuHPtNxtUM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158125-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158125: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0785c619a58a450091d2bf6755591012533b80b8
X-Osstest-Versions-That:
    ovmf=140674a4601f804302e79d08cb06f91c882ddf28
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 04 Jan 2021 13:17:20 +0000

flight 158125 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158125/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0785c619a58a450091d2bf6755591012533b80b8
baseline version:
 ovmf                 140674a4601f804302e79d08cb06f91c882ddf28

Last test of basis   157875  2020-12-24 14:39:42 Z   10 days
Testing same since   158121  2021-01-04 08:39:43 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>
  Luo, Heng <heng.luo@intel.com>

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
   140674a460..0785c619a5  0785c619a58a450091d2bf6755591012533b80b8 -> xen-tested-master

