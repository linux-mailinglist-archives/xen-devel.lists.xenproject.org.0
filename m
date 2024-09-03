Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63396917F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 04:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788566.1197977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slJT3-0003Fm-4c; Tue, 03 Sep 2024 02:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788566.1197977; Tue, 03 Sep 2024 02:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slJT3-0003DG-1k; Tue, 03 Sep 2024 02:40:29 +0000
Received: by outflank-mailman (input) for mailman id 788566;
 Tue, 03 Sep 2024 02:40:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slJT1-0003D5-54; Tue, 03 Sep 2024 02:40:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slJT0-0001A9-WC; Tue, 03 Sep 2024 02:40:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slJT0-0004BM-FI; Tue, 03 Sep 2024 02:40:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slJT0-0005N6-En; Tue, 03 Sep 2024 02:40:26 +0000
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
	bh=UPxgNaTIKDvchg7R+xd67IOdUerNSbzLeoY5MziYT0s=; b=q/OF2giFdAv5PlN2XyPBmcV4jp
	g05aSAI2T7OuIzj6jar4cKjs4H/hK8/lXb46/biyFkc4op1WATgvIeFaY+D8Y6wHCTtDXljaJa90q
	iHNQWvQUEtcfhD5mzfN2ANeWNZ8Bg+KL3/JTkd38z1/0Qf4oOVIsqcIiJd+Of4OrRuv4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187462-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187462: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5b6ec1a7f487404504991c33918a6b02516f778a
X-Osstest-Versions-That:
    ovmf=82c5cacd134d64ea0d0f4dabdbbde38017acb70d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Sep 2024 02:40:26 +0000

flight 187462 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187462/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5b6ec1a7f487404504991c33918a6b02516f778a
baseline version:
 ovmf                 82c5cacd134d64ea0d0f4dabdbbde38017acb70d

Last test of basis   187460  2024-09-02 21:45:12 Z    0 days
Testing same since   187462  2024-09-03 00:12:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>
  Nickle Wang <nicklew@nvidia.com>

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
   82c5cacd13..5b6ec1a7f4  5b6ec1a7f487404504991c33918a6b02516f778a -> xen-tested-master

