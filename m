Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34076497986
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 08:34:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259706.448176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBtqp-0002mp-JS; Mon, 24 Jan 2022 07:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259706.448176; Mon, 24 Jan 2022 07:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBtqp-0002jM-GB; Mon, 24 Jan 2022 07:33:19 +0000
Received: by outflank-mailman (input) for mailman id 259706;
 Mon, 24 Jan 2022 07:33:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nBtqo-0002jC-Dl; Mon, 24 Jan 2022 07:33:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nBtqo-0002qZ-CU; Mon, 24 Jan 2022 07:33:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nBtqo-0000qL-2i; Mon, 24 Jan 2022 07:33:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nBtqo-0003yE-2M; Mon, 24 Jan 2022 07:33:18 +0000
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
	bh=8N53SN2hk88RHsHbomIhNJM6B2bYT41aTsAAjiHHbR0=; b=xjbDkIw+kWg9+lc05l6ej4ZAS8
	4T5CwH3rQqGK1yaT0nOrKpir6OQ8kofvxJF23UaPEuTl62f+N4CtK40rfYFpXdMl40nc5S/lu9xTB
	haM0iuStf5yi4htRdh5g8WsbKSKzjWaGqSiitYhuGj++mgDupdvtIfUq3m4H2AyWBRZA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167803-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167803: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7e5c603cba0823fd97456984f4cfc21c4c831b52
X-Osstest-Versions-That:
    ovmf=21320ef66989f8af5a9e9b57df73d20a70bea85f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Jan 2022 07:33:18 +0000

flight 167803 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167803/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7e5c603cba0823fd97456984f4cfc21c4c831b52
baseline version:
 ovmf                 21320ef66989f8af5a9e9b57df73d20a70bea85f

Last test of basis   167775  2022-01-21 02:42:11 Z    3 days
Testing same since   167803  2022-01-24 01:55:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aiman Rosli <muhammad.aiman.rosli@intel.com>

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
   21320ef669..7e5c603cba  7e5c603cba0823fd97456984f4cfc21c4c831b52 -> xen-tested-master

