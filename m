Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461096F810A
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 12:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530285.825826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1put0g-0004T1-2Z; Fri, 05 May 2023 10:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530285.825826; Fri, 05 May 2023 10:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1put0f-0004Pz-Ul; Fri, 05 May 2023 10:49:57 +0000
Received: by outflank-mailman (input) for mailman id 530285;
 Fri, 05 May 2023 10:49:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1put0e-0004PW-Gu; Fri, 05 May 2023 10:49:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1put0e-0007cm-9A; Fri, 05 May 2023 10:49:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1put0d-0006JW-Qy; Fri, 05 May 2023 10:49:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1put0d-0002Kr-QV; Fri, 05 May 2023 10:49:55 +0000
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
	bh=aZ4YPEUeltTxZDJ9naQnd4NpCEuEcAb3Pysn2T/C2uw=; b=pjxsSRnJLDJAHkFGKcAbN4RLvN
	iXkPvHTsw3LrdBZcJJg7+kwsbPuEK9IXnN3kP0HQlUDcpXdEpJkj9qw+MB7zx5QjoZ04+vdjIxSUf
	XDLCHoV26k+GNp/vENBjzdFGJkdf2jNE8Ds0j0gJ+VvVN7lPAq/MqzzHM+awfSEPxz18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180542-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180542: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=94c802e108a082d6f74c854bea8bd98fe7808453
X-Osstest-Versions-That:
    ovmf=ff7cb2d7c98f8b832180e054848459fc24a0910a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 May 2023 10:49:55 +0000

flight 180542 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180542/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 94c802e108a082d6f74c854bea8bd98fe7808453
baseline version:
 ovmf                 ff7cb2d7c98f8b832180e054848459fc24a0910a

Last test of basis   180538  2023-05-05 04:12:21 Z    0 days
Testing same since   180542  2023-05-05 08:42:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Liming Gao <gaoliming@byosoft.com.cn>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   ff7cb2d7c9..94c802e108  94c802e108a082d6f74c854bea8bd98fe7808453 -> xen-tested-master

