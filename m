Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5F555510
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 21:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354327.581404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o46MI-0003tl-JF; Wed, 22 Jun 2022 19:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354327.581404; Wed, 22 Jun 2022 19:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o46MI-0003rJ-GV; Wed, 22 Jun 2022 19:49:50 +0000
Received: by outflank-mailman (input) for mailman id 354327;
 Wed, 22 Jun 2022 19:49:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o46MG-0003r9-UI; Wed, 22 Jun 2022 19:49:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o46MG-0003wP-RT; Wed, 22 Jun 2022 19:49:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o46MG-0000R6-FK; Wed, 22 Jun 2022 19:49:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o46MG-0001TD-Eg; Wed, 22 Jun 2022 19:49:48 +0000
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
	bh=QQ9TBVc1dFsIH4iCHCiL9hgb55PbfYE6GlswViB7tYI=; b=SXhznsUwuJ/+nkGeQohVVkRNXa
	8JCnoPK3w6Y4736AG9kOvx0Iis2kjRKYs2MD2y4jOCiWLHTOVsEmacngHWG9PwL4cXL+IAT4qtAxk
	1DNLNZGK1595p/ebKC3wtbSdEzHSA0c2veJ+Nz47jD+ilwzGSm1u3hvf4xWdxprRXcso=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171311-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171311: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3930d1791a0657a422d50f4d2e2d2683c36e34b8
X-Osstest-Versions-That:
    ovmf=b97243dea3c95ad923fa4ca190940158209e8384
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Jun 2022 19:49:48 +0000

flight 171311 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171311/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3930d1791a0657a422d50f4d2e2d2683c36e34b8
baseline version:
 ovmf                 b97243dea3c95ad923fa4ca190940158209e8384

Last test of basis   171304  2022-06-22 01:40:36 Z    0 days
Testing same since   171311  2022-06-22 15:11:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   b97243dea3..3930d1791a  3930d1791a0657a422d50f4d2e2d2683c36e34b8 -> xen-tested-master

