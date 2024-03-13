Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B387A1AA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 03:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692244.1079161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkERk-0001PV-E2; Wed, 13 Mar 2024 02:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692244.1079161; Wed, 13 Mar 2024 02:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkERk-0001O1-9e; Wed, 13 Mar 2024 02:34:24 +0000
Received: by outflank-mailman (input) for mailman id 692244;
 Wed, 13 Mar 2024 02:34:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkERj-0001Nr-37; Wed, 13 Mar 2024 02:34:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkERi-0000St-Nh; Wed, 13 Mar 2024 02:34:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkERi-0000lz-Be; Wed, 13 Mar 2024 02:34:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rkERi-00005k-9t; Wed, 13 Mar 2024 02:34:22 +0000
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
	bh=xaTE/iyBNVRb9eONytJzp0KHrDLcgtexqRCJpQQ2Pqw=; b=2NoUi5PWTvrlUkdIM50qUpzIXd
	3OTk6kzqb+7JERFlPPKMNkIJl2gLwjggQ+hRsIRPPjzZJBQFxC37yc7nDDSybc2Hwlxnh526k+TaY
	fSA8EcFndVc4ckYTQPkTQ76Dds5RpVGqm/4IVb/vHITuc97zfI5sma58qvZ3B2TvYOm8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185008-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185008: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ddaf39263a1ed84e60238622dfed83ff14ecc50a
X-Osstest-Versions-That:
    ovmf=ccf91b518f22102d446f26320110d30ea0fc1fa9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Mar 2024 02:34:22 +0000

flight 185008 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185008/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ddaf39263a1ed84e60238622dfed83ff14ecc50a
baseline version:
 ovmf                 ccf91b518f22102d446f26320110d30ea0fc1fa9

Last test of basis   184943  2024-03-08 09:11:25 Z    4 days
Testing same since   185008  2024-03-12 17:41:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   ccf91b518f..ddaf39263a  ddaf39263a1ed84e60238622dfed83ff14ecc50a -> xen-tested-master

