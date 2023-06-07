Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE630725D1A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 13:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544709.850678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6rLR-0005mY-GE; Wed, 07 Jun 2023 11:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544709.850678; Wed, 07 Jun 2023 11:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6rLR-0005kN-DZ; Wed, 07 Jun 2023 11:28:53 +0000
Received: by outflank-mailman (input) for mailman id 544709;
 Wed, 07 Jun 2023 11:28:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6rLP-0005kC-M8; Wed, 07 Jun 2023 11:28:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6rLP-0001ip-Ff; Wed, 07 Jun 2023 11:28:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6rLP-0006Md-4F; Wed, 07 Jun 2023 11:28:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6rLP-0008JJ-3m; Wed, 07 Jun 2023 11:28:51 +0000
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
	bh=69C8EjMaBC8j1RWuZ97dQTFX5N6S8Aayzu6DF4Domk0=; b=YOo9XtFuv+TQ2lSIdRA49IVWnM
	ecSRnKcdKGofMvcmLfMNXDy62sjkz3zR5HybXEuVlCy9Iuj1qLYVgva8y6e0FxAQpVBRzO8CLgdcY
	aB3NIRRksQBP6X/zFwBNYjoZje+/+jh1ZMkzkIGmYFmbp+/YOutOUkxsQXsTGk3sftTE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181245-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181245: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c082da89cfb2dd9640272741b7f176ede3cc41bb
X-Osstest-Versions-That:
    ovmf=67fc78d026490ea4c375eeb19724abb40e7be8f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jun 2023 11:28:51 +0000

flight 181245 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181245/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c082da89cfb2dd9640272741b7f176ede3cc41bb
baseline version:
 ovmf                 67fc78d026490ea4c375eeb19724abb40e7be8f2

Last test of basis   181234  2023-06-07 03:42:43 Z    0 days
Testing same since   181245  2023-06-07 09:11:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   67fc78d026..c082da89cf  c082da89cfb2dd9640272741b7f176ede3cc41bb -> xen-tested-master

