Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6F437C054
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 16:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126259.237654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgpzT-0007tb-9o; Wed, 12 May 2021 14:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126259.237654; Wed, 12 May 2021 14:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgpzT-0007qJ-5P; Wed, 12 May 2021 14:37:35 +0000
Received: by outflank-mailman (input) for mailman id 126259;
 Wed, 12 May 2021 14:37:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgpzR-0007q9-OU; Wed, 12 May 2021 14:37:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgpzR-0004Zb-Hn; Wed, 12 May 2021 14:37:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgpzR-0005je-7W; Wed, 12 May 2021 14:37:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lgpzR-00026i-73; Wed, 12 May 2021 14:37:33 +0000
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
	bh=JK5dmsCdwsjr+ZN4dM3i9Jvsga84MN7AKir5s9qMjrI=; b=qHok3Djkj27k8QAxbs4sT0tHEy
	Dl+gxhff4C3Hl1v14mXxTxbK+d5pxlfhL1hbVB03UUdEdksLzthrSqZDO2n91tZPfeVbR5Rjvuh8G
	TzqAz3837GeLbX+4NPAmgQ69f6XN7EVPUSVuAKCrrg2YkBljIoRqf4u8quMTKfT9FcrI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161912-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161912: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5531fd48ded1271b8775725355ab83994e4bc77c
X-Osstest-Versions-That:
    ovmf=4e5ecdbac8bdf235b2072baa0c5e170cd9f57463
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 May 2021 14:37:33 +0000

flight 161912 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161912/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5531fd48ded1271b8775725355ab83994e4bc77c
baseline version:
 ovmf                 4e5ecdbac8bdf235b2072baa0c5e170cd9f57463

Last test of basis   161908  2021-05-11 16:40:04 Z    0 days
Testing same since   161912  2021-05-12 02:02:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Lendacky, Thomas <thomas.lendacky@amd.com>
  Sughosh Ganu <sughosh.ganu@linaro.org>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   4e5ecdbac8..5531fd48de  5531fd48ded1271b8775725355ab83994e4bc77c -> xen-tested-master

