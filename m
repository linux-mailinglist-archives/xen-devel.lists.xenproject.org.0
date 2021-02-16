Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623831C716
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 09:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85422.160174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBvII-00029C-5f; Tue, 16 Feb 2021 08:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85422.160174; Tue, 16 Feb 2021 08:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBvIH-00028Y-W3; Tue, 16 Feb 2021 08:01:13 +0000
Received: by outflank-mailman (input) for mailman id 85422;
 Tue, 16 Feb 2021 08:01:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lBvIG-000277-Et; Tue, 16 Feb 2021 08:01:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lBvIG-0003sJ-8n; Tue, 16 Feb 2021 08:01:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lBvIF-0003VS-TG; Tue, 16 Feb 2021 08:01:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lBvIF-0007Gx-Sl; Tue, 16 Feb 2021 08:01:11 +0000
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
	bh=nodN9cNrMj6FDFVtCEpCMReMDu25NE5qJCSi5qHcqtE=; b=owCQx0r+tOGt2vDKgDtN7A5g6F
	t1t0c28Jgi6eNyn3TBrDqKEGpV0eXjuGMojmvh36LmTKvDhRCuxYzPPXNb4glVewlMs9NxJX667BU
	yWQ3qbMjg7+C/KacG3WbFP25MYaIcpJS9WlPQBvtX8BwpViQhXuRSSO33Guv4INafkJE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159394-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159394: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f4d862c1c7232a18347616d94c343c929657fdb
X-Osstest-Versions-That:
    ovmf=2e1e8c35f3178df95d79da81ac6deec242da74c2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Feb 2021 08:01:11 +0000

flight 159394 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159394/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f4d862c1c7232a18347616d94c343c929657fdb
baseline version:
 ovmf                 2e1e8c35f3178df95d79da81ac6deec242da74c2

Last test of basis   159300  2021-02-12 14:25:09 Z    3 days
Testing same since   159394  2021-02-15 23:39:45 Z    0 days    1 attempts

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
   2e1e8c35f3..4f4d862c1c  4f4d862c1c7232a18347616d94c343c929657fdb -> xen-tested-master

