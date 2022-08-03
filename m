Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829F5885D8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 04:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379500.612981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ4GF-0007xr-0y; Wed, 03 Aug 2022 02:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379500.612981; Wed, 03 Aug 2022 02:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ4GE-0007v2-UE; Wed, 03 Aug 2022 02:37:26 +0000
Received: by outflank-mailman (input) for mailman id 379500;
 Wed, 03 Aug 2022 02:37:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ4GE-0007us-2M; Wed, 03 Aug 2022 02:37:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ4GD-00049x-W5; Wed, 03 Aug 2022 02:37:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ4GD-00077v-Hq; Wed, 03 Aug 2022 02:37:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJ4GD-0001Ep-HO; Wed, 03 Aug 2022 02:37:25 +0000
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
	bh=ib/UgknZiNAlaps3g4kHBMlgQVDici+kB0OtB/9VrVo=; b=KZMRiaBRHtTMnrGpKFMBNnVLCC
	ZCdmx0466CCPBOAKeNSV6wAwpmBLxodoPvIvHzrO6KFYX3UvIS97FTnzxNh3xaAPIsVB/Eo66ayVq
	/ps9uEfRNajTl4/dPOYlzTekQhoIfE3uTmEmCgp4o/uBhMJb/AmsNZDRbxm+2U8Lf+04=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172091-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172091: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0dc9b78a46813d61533b2bb0f7ef897a06a273be
X-Osstest-Versions-That:
    ovmf=a551de0d9310ed930cf090348c58fdec75044a53
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Aug 2022 02:37:25 +0000

flight 172091 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172091/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0dc9b78a46813d61533b2bb0f7ef897a06a273be
baseline version:
 ovmf                 a551de0d9310ed930cf090348c58fdec75044a53

Last test of basis   172085  2022-08-02 17:10:27 Z    0 days
Testing same since   172091  2022-08-03 00:41:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb+tianocore@kernel.org>
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
   a551de0d93..0dc9b78a46  0dc9b78a46813d61533b2bb0f7ef897a06a273be -> xen-tested-master

