Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BECA97652B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797086.1206893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofnB-00016q-FR; Thu, 12 Sep 2024 09:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797086.1206893; Thu, 12 Sep 2024 09:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofnB-00013a-AK; Thu, 12 Sep 2024 09:07:09 +0000
Received: by outflank-mailman (input) for mailman id 797086;
 Thu, 12 Sep 2024 09:07:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sofnA-00013Q-5A; Thu, 12 Sep 2024 09:07:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sofnA-0000aC-3e; Thu, 12 Sep 2024 09:07:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sofn9-0007hX-Mn; Thu, 12 Sep 2024 09:07:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sofn9-0003F9-MH; Thu, 12 Sep 2024 09:07:07 +0000
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
	bh=+fD8rLkUbptvi2vTRWExRTFrCLBbJf+9rY/t/IGfCpo=; b=AWYyY5SYYSRiwTCypoblZM9s4t
	002qcejnAxE5NgHPr7H0lxTOoJZSMAbCyO89mt/qDDO2aNSqnjYxoDERudIHuLx2mc2aMFhZob0/i
	RAXpBmTSbizIeVLEBjxtE9wHHbnqG2yM5uAqpwB9ekPutTxbLdAVXdAeGIl0sW3RgcXQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187670-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187670: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=babccb841dbb39de2b4485bdb63dcc5bb6122bd8
X-Osstest-Versions-That:
    ovmf=bacee5113e813520b92babf0fc6f5914cdfc9fab
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2024 09:07:07 +0000

flight 187670 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187670/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 babccb841dbb39de2b4485bdb63dcc5bb6122bd8
baseline version:
 ovmf                 bacee5113e813520b92babf0fc6f5914cdfc9fab

Last test of basis   187668  2024-09-12 04:43:25 Z    0 days
Testing same since   187670  2024-09-12 06:41:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>

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
   bacee5113e..babccb841d  babccb841dbb39de2b4485bdb63dcc5bb6122bd8 -> xen-tested-master

