Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E402D8197FA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 06:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657377.1026172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFov2-0003KC-FL; Wed, 20 Dec 2023 05:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657377.1026172; Wed, 20 Dec 2023 05:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFov2-0003Gs-CU; Wed, 20 Dec 2023 05:14:56 +0000
Received: by outflank-mailman (input) for mailman id 657377;
 Wed, 20 Dec 2023 05:14:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFov0-0003Gi-UZ; Wed, 20 Dec 2023 05:14:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFov0-0003Ug-L2; Wed, 20 Dec 2023 05:14:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFov0-0003Lx-Ay; Wed, 20 Dec 2023 05:14:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFov0-0006f3-AW; Wed, 20 Dec 2023 05:14:54 +0000
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
	bh=5mU0Yhyqb1eqNtBr2x3UZiOutybB3lVhei/AmTmUxY8=; b=nes95RAl3fVrV23SsKvfwHYb11
	8FUvJIblsV/88HzwsoscAHIPwSr4hzb6kTCYw9Ghkf1y3fLTyE0lV3QqKsCVqJ1fbLzVjkfdFBbFF
	OPbhIjmNjbzmf26MImvHZUfj4YrRNWDl/UCzyqKra/VK7MXV3Z6ptJBWKpdi4jeercGQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184185-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184185: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a83d953dc2741f650cc273f39fe803ae406b0fad
X-Osstest-Versions-That:
    ovmf=8c1e9f9c6fa7b5137003b0cfa6d54a6bada16d8e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Dec 2023 05:14:54 +0000

flight 184185 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184185/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a83d953dc2741f650cc273f39fe803ae406b0fad
baseline version:
 ovmf                 8c1e9f9c6fa7b5137003b0cfa6d54a6bada16d8e

Last test of basis   184177  2023-12-19 15:41:43 Z    0 days
Testing same since   184185  2023-12-20 02:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   8c1e9f9c6f..a83d953dc2  a83d953dc2741f650cc273f39fe803ae406b0fad -> xen-tested-master

