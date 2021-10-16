Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DAE43008F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 08:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211256.368458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbdHS-0006UH-If; Sat, 16 Oct 2021 06:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211256.368458; Sat, 16 Oct 2021 06:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbdHS-0006Ri-FW; Sat, 16 Oct 2021 06:34:54 +0000
Received: by outflank-mailman (input) for mailman id 211256;
 Sat, 16 Oct 2021 06:34:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mbdHR-0006RY-By; Sat, 16 Oct 2021 06:34:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mbdHR-00014F-7f; Sat, 16 Oct 2021 06:34:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mbdHQ-0003Q5-Ug; Sat, 16 Oct 2021 06:34:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mbdHQ-0000il-U8; Sat, 16 Oct 2021 06:34:52 +0000
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
	bh=izEddrwuHlFch2d44AR09hTZ44m7UCPh6yPrL8BWr/Q=; b=f7l38eBSUEbkQ8J9pV5zndjGiJ
	k/12QzCyEr+GvR079vaFnu2ZZWX/1b2JAi72itzZxaHHr4USp1Jpc8jmIvCziwSWj+7CHIAAFT4cd
	9i6K3S0Aem/6cQvRKc9afm51RQpwLArMWFwwRwKvRBiMiZkCm1sQfeOeraNTkoEm1VR8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165531-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165531: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f10a112f08f3fb4a92c3d22f069f6066a12db3be
X-Osstest-Versions-That:
    ovmf=7e43d3e08611ac4c4bc41c46470052d4118168eb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 16 Oct 2021 06:34:52 +0000

flight 165531 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165531/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f10a112f08f3fb4a92c3d22f069f6066a12db3be
baseline version:
 ovmf                 7e43d3e08611ac4c4bc41c46470052d4118168eb

Last test of basis   165523  2021-10-15 11:10:08 Z    0 days
Testing same since   165531  2021-10-15 22:11:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>

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
   7e43d3e086..f10a112f08  f10a112f08f3fb4a92c3d22f069f6066a12db3be -> xen-tested-master

