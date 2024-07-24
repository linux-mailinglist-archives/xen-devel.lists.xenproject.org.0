Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAE93AFC5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 12:23:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764094.1174429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWZ9A-0006RW-4Q; Wed, 24 Jul 2024 10:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764094.1174429; Wed, 24 Jul 2024 10:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWZ9A-0006Q0-18; Wed, 24 Jul 2024 10:23:00 +0000
Received: by outflank-mailman (input) for mailman id 764094;
 Wed, 24 Jul 2024 10:22:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWZ98-0006Pq-6I; Wed, 24 Jul 2024 10:22:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWZ97-0003dy-UI; Wed, 24 Jul 2024 10:22:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWZ97-0000o5-G5; Wed, 24 Jul 2024 10:22:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWZ97-0005Zq-Ef; Wed, 24 Jul 2024 10:22:57 +0000
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
	bh=QBXzmcs5uGruq1JyImNfWQwLMon35y3ERkny294OWe8=; b=fmxF1iume8xJrNJe5G+plq1z4G
	1SSb5MpuWHsqa2ZWc8JAdW1Lz/nDk+r6U6LxrgbdU0ciygv63U7Xt87oploLafRSZCy5G/8CKoB0R
	yV3zNyfp8UGD+4bBB/pGp3NcSJ48qCVUAtxr185AUDQKFj12o68nofAh0rssuVVz65AA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186980-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186980: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d4ae23b1e6c5fe95205818fcae9d5561c20588d3
X-Osstest-Versions-That:
    ovmf=9bc7a361200215fc5065dfaa6d90d4eb50fec00c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jul 2024 10:22:57 +0000

flight 186980 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186980/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d4ae23b1e6c5fe95205818fcae9d5561c20588d3
baseline version:
 ovmf                 9bc7a361200215fc5065dfaa6d90d4eb50fec00c

Last test of basis   186975  2024-07-24 03:15:02 Z    0 days
Testing same since   186980  2024-07-24 08:17:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dongyan Qian <qiandongyan@loongson.cn>

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
   9bc7a36120..d4ae23b1e6  d4ae23b1e6c5fe95205818fcae9d5561c20588d3 -> xen-tested-master

