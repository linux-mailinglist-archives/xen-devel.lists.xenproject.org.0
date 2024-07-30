Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B030940A32
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 09:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767303.1177909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhYd-0004FF-4a; Tue, 30 Jul 2024 07:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767303.1177909; Tue, 30 Jul 2024 07:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhYd-0004DT-0w; Tue, 30 Jul 2024 07:46:07 +0000
Received: by outflank-mailman (input) for mailman id 767303;
 Tue, 30 Jul 2024 07:46:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYhYb-0004DJ-Py; Tue, 30 Jul 2024 07:46:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYhYb-0007C8-JY; Tue, 30 Jul 2024 07:46:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYhYb-000164-6a; Tue, 30 Jul 2024 07:46:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYhYb-0006la-66; Tue, 30 Jul 2024 07:46:05 +0000
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
	bh=3P6mEAHq7iqfOK2RsHt/pvgqA70uZd7V9RbiB7AE+Xs=; b=pNo0tDJ9bdisW5isV5W8D0fQ1l
	maDZ+m2eOLqFvQnXp7OOtReyDT8/kOWB5N9g5yCjTzZ/j6yZhAoqS+72PwkHQ13SfnYBiEjvGiKen
	wV99+zpKmHoi4T9Bs5KNFGcst4ug4c8A4x513VW43sUkxH0ZlKyS8DSJIakAJ1SlpaYQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187052-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187052: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=621a30c676d55bfe0049f65e98f65104528218db
X-Osstest-Versions-That:
    ovmf=84fc1ec52fc0f650187359bb081ee5a9400d9675
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jul 2024 07:46:05 +0000

flight 187052 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187052/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 621a30c676d55bfe0049f65e98f65104528218db
baseline version:
 ovmf                 84fc1ec52fc0f650187359bb081ee5a9400d9675

Last test of basis   187049  2024-07-30 03:43:18 Z    0 days
Testing same since   187052  2024-07-30 05:45:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhishek Mainkar <abmainkar@nvidia.com>

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
   84fc1ec52f..621a30c676  621a30c676d55bfe0049f65e98f65104528218db -> xen-tested-master

