Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552398FF32C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 19:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736145.1142236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFGSw-0002I1-AQ; Thu, 06 Jun 2024 16:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736145.1142236; Thu, 06 Jun 2024 16:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFGSw-0002Fq-7m; Thu, 06 Jun 2024 16:59:54 +0000
Received: by outflank-mailman (input) for mailman id 736145;
 Thu, 06 Jun 2024 16:59:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFGSu-0002Fg-A4; Thu, 06 Jun 2024 16:59:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFGSu-0006oU-7u; Thu, 06 Jun 2024 16:59:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFGSt-00040K-Uc; Thu, 06 Jun 2024 16:59:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFGSt-0004js-U4; Thu, 06 Jun 2024 16:59:51 +0000
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
	bh=KQKaVYNd9ZrOEeTkGeZCquNWxXDqEpSoufDVkJRQkSQ=; b=M+6J4R2GvTYIh2AdkJ0hbRxdzR
	hhHbxCmLx8cteZ+hl+AN599FbQ/bZdP5uvSxNLm/2ogrPaYsdnGb7Y+TOZV6d0AoKJX090SFE+UPk
	OuKB/CuTLCHjM/I8JbeW/FH3Pa17EYEnITLijU67KowXPK+Tb8+768bsX2fJ0NOxomPM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186267-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186267: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=71606314f80500ff0849f66553fad0da11bf4beb
X-Osstest-Versions-That:
    ovmf=90cb1ec33225a070e9fea1d94c72ff590bd38731
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Jun 2024 16:59:51 +0000

flight 186267 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186267/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 71606314f80500ff0849f66553fad0da11bf4beb
baseline version:
 ovmf                 90cb1ec33225a070e9fea1d94c72ff590bd38731

Last test of basis   186266  2024-06-06 09:12:51 Z    0 days
Testing same since   186267  2024-06-06 15:14:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   90cb1ec332..71606314f8  71606314f80500ff0849f66553fad0da11bf4beb -> xen-tested-master

