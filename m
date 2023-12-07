Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE1809531
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 23:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650207.1015535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBMh9-00051J-J6; Thu, 07 Dec 2023 22:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650207.1015535; Thu, 07 Dec 2023 22:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBMh9-0004zD-GQ; Thu, 07 Dec 2023 22:18:11 +0000
Received: by outflank-mailman (input) for mailman id 650207;
 Thu, 07 Dec 2023 22:18:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBMh7-0004vQ-CK; Thu, 07 Dec 2023 22:18:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBMh7-0005gZ-2A; Thu, 07 Dec 2023 22:18:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBMh6-00046V-N2; Thu, 07 Dec 2023 22:18:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBMh6-0000vB-Mc; Thu, 07 Dec 2023 22:18:08 +0000
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
	bh=VCtRfA0AtshtsgPoAlNx+RbohB5ug8I0VBLysRCWX7g=; b=scnPevLVRWk9X2eNPqkX+ooa6s
	U9bH1uYDB4OD/Xb87/LzDebDT17nBfohKKIgxhXlEYYT1+AlGxehQJgtRPNOq/TB1/Qeo0RwNPkhM
	POCZ50StDUP5mqjCN3c++VMerhFAcjWXpiBX7xNYjA/FbC2btgpFxtwSDDmIwXLBiEz8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184028-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184028: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eccdab611c01aa40b6cefcfbcb4d23e54b4c0ec6
X-Osstest-Versions-That:
    ovmf=238690a30d02d3f95f0355c88c35dc0e4232342a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Dec 2023 22:18:08 +0000

flight 184028 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184028/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eccdab611c01aa40b6cefcfbcb4d23e54b4c0ec6
baseline version:
 ovmf                 238690a30d02d3f95f0355c88c35dc0e4232342a

Last test of basis   184027  2023-12-07 17:11:00 Z    0 days
Testing same since   184028  2023-12-07 20:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <corvink@FreeBSD.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Laszlo Ersek <lersek@redhat.com>

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
   238690a30d..eccdab611c  eccdab611c01aa40b6cefcfbcb4d23e54b4c0ec6 -> xen-tested-master

