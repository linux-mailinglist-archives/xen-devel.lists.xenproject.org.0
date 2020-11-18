Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B72B77F3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29393.58755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfIQ4-0002HF-Cy; Wed, 18 Nov 2020 08:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29393.58755; Wed, 18 Nov 2020 08:02:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfIQ4-0002Gq-9G; Wed, 18 Nov 2020 08:02:24 +0000
Received: by outflank-mailman (input) for mailman id 29393;
 Wed, 18 Nov 2020 08:02:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F1t9=EY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kfIQ2-0002G9-8W
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:02:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4efa0bf5-f8b1-4b2f-9b0e-b1f2b7405c46;
 Wed, 18 Nov 2020 08:02:16 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfIPw-0002fX-6b; Wed, 18 Nov 2020 08:02:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfIPv-0000Fd-Uy; Wed, 18 Nov 2020 08:02:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kfIPv-0005e6-UT; Wed, 18 Nov 2020 08:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=F1t9=EY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kfIQ2-0002G9-8W
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:02:22 +0000
X-Inumbo-ID: 4efa0bf5-f8b1-4b2f-9b0e-b1f2b7405c46
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4efa0bf5-f8b1-4b2f-9b0e-b1f2b7405c46;
	Wed, 18 Nov 2020 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=mg4WjYJISKE53xPbcp2TVDvQedj5E4wmU86ASkZ1ggQ=; b=M6wey2m4pq2khmcj0/dbttGBLC
	fNsbcUFnMs0O43wbG6W808coOvgwOC2TwXdSozeVzu23RcBfVXst4OL2vS+PvaE/QBUzl3Vai5f1X
	C8+Lo4j/NOj4yh62ZMwuhbYzSZlR8JSE3/0oNg8WdXQYUtToz54g4qV1NlCgRVv1GrtY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfIPw-0002fX-6b; Wed, 18 Nov 2020 08:02:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfIPv-0000Fd-Uy; Wed, 18 Nov 2020 08:02:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfIPv-0005e6-UT; Wed, 18 Nov 2020 08:02:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156849-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156849: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=404250c8f77d09077321766602c3118cec7f6ecd
X-Osstest-Versions-That:
    ovmf=e6a12a0fc817e26ac05e8301e89433c2367ff362
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Nov 2020 08:02:15 +0000

flight 156849 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156849/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 404250c8f77d09077321766602c3118cec7f6ecd
baseline version:
 ovmf                 e6a12a0fc817e26ac05e8301e89433c2367ff362

Last test of basis   156838  2020-11-17 19:39:47 Z    0 days
Testing same since   156849  2020-11-18 05:10:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sheng Wei <w.sheng@intel.com>

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
   e6a12a0fc8..404250c8f7  404250c8f77d09077321766602c3118cec7f6ecd -> xen-tested-master

