Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A2714262
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 05:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540532.842353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3TpI-0008J5-Vb; Mon, 29 May 2023 03:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540532.842353; Mon, 29 May 2023 03:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3TpI-0008GX-SF; Mon, 29 May 2023 03:45:44 +0000
Received: by outflank-mailman (input) for mailman id 540532;
 Mon, 29 May 2023 03:45:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3TpG-0008GK-QM; Mon, 29 May 2023 03:45:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3TpG-0001cS-Jr; Mon, 29 May 2023 03:45:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3TpG-0007ta-1Z; Mon, 29 May 2023 03:45:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q3TpG-0007G4-0o; Mon, 29 May 2023 03:45:42 +0000
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
	bh=4hA5eqgjmgr4woVLtlEMn/v34BYhMfR1RcOUJex29PI=; b=ruv1t81nKbbGj7834JbS2ok2dY
	M7xbsRtYkezqfVS67DPlFOQIj/5iYY8t1zH+Vv9G6fg8OkVJO8UqYQHYIgFU/a9SqJAvFovtmlbiG
	XXCwM5+zP8DQi1xijSl2jIYIQd5uYFEMAkYheNy9iKNARY1uLdevtH6lbh8uH/z/3dQ0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180991-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180991: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0f8323b44b20c982f303cc01ccf7146556bc3d4d
X-Osstest-Versions-That:
    ovmf=ba91d0292e593df8528b66f99c1b0b14fadc8e16
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 May 2023 03:45:42 +0000

flight 180991 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180991/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0f8323b44b20c982f303cc01ccf7146556bc3d4d
baseline version:
 ovmf                 ba91d0292e593df8528b66f99c1b0b14fadc8e16

Last test of basis   180928  2023-05-24 13:10:44 Z    4 days
Testing same since   180991  2023-05-29 01:42:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   ba91d0292e..0f8323b44b  0f8323b44b20c982f303cc01ccf7146556bc3d4d -> xen-tested-master

