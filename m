Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D53468FAB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 04:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238567.413450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu4U7-0004cL-Gk; Mon, 06 Dec 2021 03:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238567.413450; Mon, 06 Dec 2021 03:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu4U7-0004aO-Bd; Mon, 06 Dec 2021 03:16:11 +0000
Received: by outflank-mailman (input) for mailman id 238567;
 Mon, 06 Dec 2021 03:16:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mu4U5-0004aD-95; Mon, 06 Dec 2021 03:16:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mu4U5-0002tz-2Y; Mon, 06 Dec 2021 03:16:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mu4U4-0004S8-N2; Mon, 06 Dec 2021 03:16:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mu4U4-0003nd-MW; Mon, 06 Dec 2021 03:16:08 +0000
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
	bh=bPVuO/UwVwmujqFYVxLBNbdLviHTcLKk6RZpYyhvuGk=; b=VYV7MQWLSGIuRc/4T+O7H5T5iS
	0XxOLNsT7BycDi/0zDXfeLdytOUR5cfGJkZM3GO9APwmN7L1a2wCPZOGvXv17/CdlGVFxUzJChJCj
	TqRDoK8Ga/Uitm2UdogQHMtNYuRpt9Kdpb6WUiW1oYlGnFyyc3VE5AZ4PT6q/80A6ewY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167122-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167122: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dfafa8e45382939fb5dc78e9d37b97b500a43613
X-Osstest-Versions-That:
    ovmf=f0f3f5aae7c4d346ea5e24970936d80dc5b60657
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Dec 2021 03:16:08 +0000

flight 167122 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167122/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dfafa8e45382939fb5dc78e9d37b97b500a43613
baseline version:
 ovmf                 f0f3f5aae7c4d346ea5e24970936d80dc5b60657

Last test of basis   166961  2021-11-30 14:41:39 Z    5 days
Testing same since   167081  2021-12-03 10:10:57 Z    2 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>

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
   f0f3f5aae7..dfafa8e453  dfafa8e45382939fb5dc78e9d37b97b500a43613 -> xen-tested-master

