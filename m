Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C38989A36
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 07:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806996.1218145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv96X-0003sR-Iv; Mon, 30 Sep 2024 05:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806996.1218145; Mon, 30 Sep 2024 05:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv96X-0003q4-GI; Mon, 30 Sep 2024 05:37:53 +0000
Received: by outflank-mailman (input) for mailman id 806996;
 Mon, 30 Sep 2024 05:37:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sv96V-0003pu-SX; Mon, 30 Sep 2024 05:37:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sv96V-00048x-J9; Mon, 30 Sep 2024 05:37:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sv96V-0008HR-3I; Mon, 30 Sep 2024 05:37:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sv96V-0003Ew-2Y; Mon, 30 Sep 2024 05:37:51 +0000
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
	bh=NT78d+Kzr80oB1Ly1aw+OT8YhQST99HeGdGkUm7YFvI=; b=YJ3CEQRh6Y7IMTiUOcQKT9AA4U
	Er85XmO8PT+ZRiG8D9vhGWGeIbNdgCnZKOGvltbKv/P7Eguf34n+mwkRXf/ld02OM4kiOxhowcTLC
	BG7GxPFbysGQvWno2lKynxK+70xWXZgrk3ajh3PscrBMBWEy8qgHXHo/DYd0TGsh5hIQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187901-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187901: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=21e1fc5400c0d916ef9023a08b62eaf708727def
X-Osstest-Versions-That:
    ovmf=10783187ddb71808a4ea361e887800d3b899b85f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Sep 2024 05:37:51 +0000

flight 187901 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187901/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21e1fc5400c0d916ef9023a08b62eaf708727def
baseline version:
 ovmf                 10783187ddb71808a4ea361e887800d3b899b85f

Last test of basis   187883  2024-09-28 01:41:33 Z    2 days
Testing same since   187901  2024-09-30 02:41:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>

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
   10783187dd..21e1fc5400  21e1fc5400c0d916ef9023a08b62eaf708727def -> xen-tested-master

