Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C928BF642
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 08:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718599.1121088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4aob-00044d-8i; Wed, 08 May 2024 06:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718599.1121088; Wed, 08 May 2024 06:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4aob-00041v-60; Wed, 08 May 2024 06:30:09 +0000
Received: by outflank-mailman (input) for mailman id 718599;
 Wed, 08 May 2024 06:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4aoZ-00041l-UV; Wed, 08 May 2024 06:30:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4aoZ-0000x6-Kc; Wed, 08 May 2024 06:30:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4aoZ-0001AL-9f; Wed, 08 May 2024 06:30:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s4aoZ-0001Jz-9A; Wed, 08 May 2024 06:30:07 +0000
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
	bh=pJ9bPejv2pngdd8qC96+p4v5SmKfKzvYWlnOhPHcP80=; b=ONHwY8+OWeRIRv40UWv3w1wshN
	E6ilmqq1tNOxkvKATbxBg/NUtXPUJ2DkxxvO68A0KiuTveHjwPzFiPq99wnZ6h/6l5R2KmAzsGQLR
	6Z0yVqDI8+gw0EoUOx0dpazkLu5zSx8UjSiNOkWr+Y9H5Zjdf0kR5awKSL509vTZ0fk8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185944-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185944: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=952b5cf94c8727b65e04d3d507c0134743be2a66
X-Osstest-Versions-That:
    ovmf=2727231b0a6fb4c043479d132df4d36cf9f751c2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 May 2024 06:30:07 +0000

flight 185944 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185944/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 952b5cf94c8727b65e04d3d507c0134743be2a66
baseline version:
 ovmf                 2727231b0a6fb4c043479d132df4d36cf9f751c2

Last test of basis   185941  2024-05-08 01:57:46 Z    0 days
Testing same since   185944  2024-05-08 05:11:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Brit Chesley <brit.chesley@amd.com>

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
   2727231b0a..952b5cf94c  952b5cf94c8727b65e04d3d507c0134743be2a66 -> xen-tested-master

