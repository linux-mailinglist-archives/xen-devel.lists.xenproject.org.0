Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15959475BEB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 16:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247447.426685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWJu-0006tw-M4; Wed, 15 Dec 2021 15:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247447.426685; Wed, 15 Dec 2021 15:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWJu-0006rt-ID; Wed, 15 Dec 2021 15:35:54 +0000
Received: by outflank-mailman (input) for mailman id 247447;
 Wed, 15 Dec 2021 15:35:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxWJt-0006rj-D6; Wed, 15 Dec 2021 15:35:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxWJs-0006Qm-V1; Wed, 15 Dec 2021 15:35:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxWJs-0007S7-GE; Wed, 15 Dec 2021 15:35:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mxWJs-0002H8-Ff; Wed, 15 Dec 2021 15:35:52 +0000
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
	bh=wVA1OYdIrhPf9B13j6zngZNL/439YPGYHzqb1MqBLhY=; b=wgtKtG5AKhKPQzZv3MBsm/L1Ko
	xUdJ9gmE0cDVkMonsT4nqSJ0xozpigwwtd0WpWQUEPYsN6LYDtP7wamMLmVgWmz4owKztHdpuPffX
	fiEbjzvU9eCUlEag6pPSJ+WFkdozz75kUI5eqpDwk0f3dNLMpia6oht3LP/XxCuKMj0U=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167419-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167419: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=38f6d78c3b62f8825e7d802697b7992418a72da7
X-Osstest-Versions-That:
    ovmf=9006967c8d24f5d9585278fb6363b08f2118d424
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Dec 2021 15:35:52 +0000

flight 167419 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167419/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 38f6d78c3b62f8825e7d802697b7992418a72da7
baseline version:
 ovmf                 9006967c8d24f5d9585278fb6363b08f2118d424

Last test of basis   167414  2021-12-14 16:10:26 Z    0 days
Testing same since   167419  2021-12-14 23:11:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   9006967c8d..38f6d78c3b  38f6d78c3b62f8825e7d802697b7992418a72da7 -> xen-tested-master

