Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8738CE6A
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 21:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131393.245604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkBFV-000739-EK; Fri, 21 May 2021 19:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131393.245604; Fri, 21 May 2021 19:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkBFV-00071I-8I; Fri, 21 May 2021 19:55:57 +0000
Received: by outflank-mailman (input) for mailman id 131393;
 Fri, 21 May 2021 19:55:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkBFT-000718-Vk; Fri, 21 May 2021 19:55:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkBFT-0006bx-PH; Fri, 21 May 2021 19:55:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkBFT-0004Ph-EW; Fri, 21 May 2021 19:55:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lkBFT-0001Mm-E3; Fri, 21 May 2021 19:55:55 +0000
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
	bh=137KHVGM4TaFymjaVA4I1+RBWP/sN74+i61p1i38vGg=; b=XvO3SE7pIoOpH3mYgDmX8Dj6gq
	GzIhnZD68WLlwY1m6/j+qAvCZb+20nJwcW+KSfmbgSEP2sTYRelZ1sVDERlG+rF1lVRHba+dbZAdo
	fOpOm2APSzks+aPwcjPr0LrLeT+mmVto7QRDpUQVxvY4eF6nUXx2YQNV/AqQp+sO1PcE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162113-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162113: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1fb80369b72c6ba7f80b442e4acf771a6dd56ee7
X-Osstest-Versions-That:
    ovmf=04ae17218deec25c6f488609c5e2ca9c419d2c4b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 May 2021 19:55:55 +0000

flight 162113 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162113/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1fb80369b72c6ba7f80b442e4acf771a6dd56ee7
baseline version:
 ovmf                 04ae17218deec25c6f488609c5e2ca9c419d2c4b

Last test of basis   162111  2021-05-21 07:11:13 Z    0 days
Testing same since   162113  2021-05-21 13:41:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Li, Walon <walon.li@hpe.com>
  Walon Li <walon.li@hpe.com>

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
   04ae17218d..1fb80369b7  1fb80369b72c6ba7f80b442e4acf771a6dd56ee7 -> xen-tested-master

