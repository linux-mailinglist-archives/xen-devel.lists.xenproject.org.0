Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182834301F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 23:45:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99581.189375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNkJw-0000rT-9r; Sat, 20 Mar 2021 22:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99581.189375; Sat, 20 Mar 2021 22:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNkJw-0000qx-49; Sat, 20 Mar 2021 22:43:48 +0000
Received: by outflank-mailman (input) for mailman id 99581;
 Sat, 20 Mar 2021 22:43:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNkJu-0000qp-6n; Sat, 20 Mar 2021 22:43:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNkJt-00088A-UH; Sat, 20 Mar 2021 22:43:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNkJt-000431-F9; Sat, 20 Mar 2021 22:43:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lNkJt-0005jQ-ES; Sat, 20 Mar 2021 22:43:45 +0000
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
	bh=hXPcn2Gw/rNr9khnsJSJUbHVezHGDPl/dqH90uBdQJY=; b=VK2g/V7s5OaNncOJOx27+wv4A2
	G/1WYRWK0RbneCQ1kvM/lrF2mbcULbnOz3CNZbVGi8DGIaIvi17Lx+Z1IHd1aZGEO/xf6reuZ8nfU
	9m76HSziYSlmpkbBvygREy9IjF3btLyhW4kIj9Mk3lEUaICZUOHRlg4mhj3aX9XBT6po=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160145-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160145: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ca318882714080fb81fe9eb89a7b7934efc5bfae
X-Osstest-Versions-That:
    ovmf=eb07bfb09ef5483ad58ed0eba713f32fb0c909f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 Mar 2021 22:43:45 +0000

flight 160145 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160145/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ca318882714080fb81fe9eb89a7b7934efc5bfae
baseline version:
 ovmf                 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9

Last test of basis   160131  2021-03-18 17:39:48 Z    2 days
Testing same since   160145  2021-03-19 18:44:15 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Martin Radev <martin.b.radev@gmail.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   eb07bfb09e..ca31888271  ca318882714080fb81fe9eb89a7b7934efc5bfae -> xen-tested-master

