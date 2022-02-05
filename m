Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE824AA8BE
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 13:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266008.459649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGK90-0001DH-F7; Sat, 05 Feb 2022 12:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266008.459649; Sat, 05 Feb 2022 12:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGK90-0001BS-B1; Sat, 05 Feb 2022 12:26:22 +0000
Received: by outflank-mailman (input) for mailman id 266008;
 Sat, 05 Feb 2022 12:26:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGK8z-0001BI-2b; Sat, 05 Feb 2022 12:26:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGK8y-0003dB-Vd; Sat, 05 Feb 2022 12:26:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGK8y-0001Es-GQ; Sat, 05 Feb 2022 12:26:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nGK8y-0002Ka-Fy; Sat, 05 Feb 2022 12:26:20 +0000
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
	bh=xKfFze3WaWXlhr+tP7IFM//KJHgVoDwK52OKY8xswf4=; b=qD6Kue5uY/KELkc55RswaovwGo
	CAAN46A1RYGYG5Rob3L9fR6OjAlRKKNNtqpCiLH3KUciBb/Qh5itMYWjmVnk8ZBZlHB+oWOMQjVe2
	IldQDQ/8p3b0N8wOe8oPQB1BbTZbs/SscI75GGFBFM+wAffSUKxMaTh3CL32iz97U+68=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168017-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168017: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a4b7aa362d94bbe0287663cab9af4ab503f6185d
X-Osstest-Versions-That:
    ovmf=33189f05278345eab608ff56e87905bdeacdbd47
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Feb 2022 12:26:20 +0000

flight 168017 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168017/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a4b7aa362d94bbe0287663cab9af4ab503f6185d
baseline version:
 ovmf                 33189f05278345eab608ff56e87905bdeacdbd47

Last test of basis   167989  2022-02-02 18:40:35 Z    2 days
Testing same since   168017  2022-02-04 18:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   33189f0527..a4b7aa362d  a4b7aa362d94bbe0287663cab9af4ab503f6185d -> xen-tested-master

