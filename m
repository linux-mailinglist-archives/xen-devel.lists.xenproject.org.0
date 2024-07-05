Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76963928B03
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 16:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754336.1162739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkKs-00028T-5u; Fri, 05 Jul 2024 14:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754336.1162739; Fri, 05 Jul 2024 14:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkKs-00025v-2i; Fri, 05 Jul 2024 14:54:54 +0000
Received: by outflank-mailman (input) for mailman id 754336;
 Fri, 05 Jul 2024 14:54:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPkKq-00025l-Ho; Fri, 05 Jul 2024 14:54:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPkKq-0002TO-8w; Fri, 05 Jul 2024 14:54:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPkKq-0006me-1n; Fri, 05 Jul 2024 14:54:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPkKq-0008Ma-1F; Fri, 05 Jul 2024 14:54:52 +0000
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
	bh=+QCOK21NZMrCZpPbf3DUIr82Rmo7aTA7aiOSkj8oUjM=; b=nqtgK9IbQDeepvzQeXu7Cg/Ahe
	CSPoBUTlxK815b/Sq8zI4VMP2Am9PdrWez4TeP1XkFr539/BVPHMfpHByPjdpukHIXkoN3B3MwVlJ
	d2xxauL9Cy2rQ3OADaC3duaEjXW+XxG764Oiw2ifEKrelBV+tuJfXifh6DY59o+RSNt4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186701-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186701: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=051c7bb434f9f6b908aac2a0b00368192aa616ec
X-Osstest-Versions-That:
    ovmf=bef0d333dc4fccdfc75e4be31e067b467a9a4093
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jul 2024 14:54:52 +0000

flight 186701 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186701/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 051c7bb434f9f6b908aac2a0b00368192aa616ec
baseline version:
 ovmf                 bef0d333dc4fccdfc75e4be31e067b467a9a4093

Last test of basis   186694  2024-07-05 08:41:11 Z    0 days
Testing same since   186701  2024-07-05 13:11:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   bef0d333dc..051c7bb434  051c7bb434f9f6b908aac2a0b00368192aa616ec -> xen-tested-master

