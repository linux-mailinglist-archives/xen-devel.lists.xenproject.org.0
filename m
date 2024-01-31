Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1DB843ABC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 10:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673847.1048340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6hh-0007fN-JR; Wed, 31 Jan 2024 09:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673847.1048340; Wed, 31 Jan 2024 09:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6hh-0007cZ-G4; Wed, 31 Jan 2024 09:16:21 +0000
Received: by outflank-mailman (input) for mailman id 673847;
 Wed, 31 Jan 2024 09:16:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rV6hg-0007cP-DT; Wed, 31 Jan 2024 09:16:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rV6hg-0000wG-Ax; Wed, 31 Jan 2024 09:16:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rV6hg-000859-05; Wed, 31 Jan 2024 09:16:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rV6hf-0000GD-Vt; Wed, 31 Jan 2024 09:16:19 +0000
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
	bh=9x0/231TFddFz+ZeWMnWzdxJx/5eLu2uKyddzJcUf/g=; b=fQxiQ79OqYt/JydCmsNyMu6BxT
	XoEagp4Ke6MCAtR2O5X22E5Gir9jx3/0uJKS0DXE0MUxflsESinGpt5WLVEyW4VauqXMqpmI2Hsnh
	SGCBj7GD7ewOYyAeJ7ueX7EsB/l6ddbkA6an4vVvq8uVYqHsiXYKFaNyvL+1iiVyMdF4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184538-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184538: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=af6e0e728f652f496a6fb1e659617c9662f774ac
X-Osstest-Versions-That:
    ovmf=909a9a5ae4b8236c1ca7cad7f214c752a579bd67
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jan 2024 09:16:19 +0000

flight 184538 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184538/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 af6e0e728f652f496a6fb1e659617c9662f774ac
baseline version:
 ovmf                 909a9a5ae4b8236c1ca7cad7f214c752a579bd67

Last test of basis   184533  2024-01-30 15:12:47 Z    0 days
Testing same since   184538  2024-01-31 04:36:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   909a9a5ae4..af6e0e728f  af6e0e728f652f496a6fb1e659617c9662f774ac -> xen-tested-master

