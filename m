Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1394BDB4D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 18:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276376.472517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMCYh-0004D2-Eu; Mon, 21 Feb 2022 17:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276376.472517; Mon, 21 Feb 2022 17:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMCYh-0004Ak-Bf; Mon, 21 Feb 2022 17:33:11 +0000
Received: by outflank-mailman (input) for mailman id 276376;
 Mon, 21 Feb 2022 17:33:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nMCYf-0004Aa-NL; Mon, 21 Feb 2022 17:33:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nMCYf-0002j2-MF; Mon, 21 Feb 2022 17:33:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nMCYf-0000wL-9J; Mon, 21 Feb 2022 17:33:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nMCYf-0003I0-8q; Mon, 21 Feb 2022 17:33:09 +0000
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
	bh=/QR9GFYOBcVJZp5owsMVDMJvKoMyyYsm5pWZTjhAFNQ=; b=H69yY7KQj9DGGwC1FD96AwDvKH
	42JA5bJQBA6GmcbYAmaRe5KAW1Y98SUdwyEEgFc7EOHEbETGNIx97CKc0ELzsr5ojjHIaY61vohy9
	DEeHKMVSVn8GqOd60466Jk6/bmxu803p1+LOusldbZG5ZA/Iz3+4h9wpQVNc71x4Ca8c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168185-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168185: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b24306f15daa2ff8510b06702114724b33895d3c
X-Osstest-Versions-That:
    ovmf=8a576733162bb72afb4d1eb3012b0aef8d265018
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Feb 2022 17:33:09 +0000

flight 168185 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168185/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b24306f15daa2ff8510b06702114724b33895d3c
baseline version:
 ovmf                 8a576733162bb72afb4d1eb3012b0aef8d265018

Last test of basis   168131  2022-02-16 12:13:29 Z    5 days
Testing same since   168185  2022-02-21 15:43:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>

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
   8a57673316..b24306f15d  b24306f15daa2ff8510b06702114724b33895d3c -> xen-tested-master

