Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D42E0E95
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 20:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58059.101904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krn59-0001U9-EY; Tue, 22 Dec 2020 19:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58059.101904; Tue, 22 Dec 2020 19:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krn59-0001Tj-9m; Tue, 22 Dec 2020 19:12:27 +0000
Received: by outflank-mailman (input) for mailman id 58059;
 Tue, 22 Dec 2020 19:12:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krn57-0001Tb-55; Tue, 22 Dec 2020 19:12:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krn56-0005s2-SI; Tue, 22 Dec 2020 19:12:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krn56-0004Py-JL; Tue, 22 Dec 2020 19:12:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1krn56-0006Z8-Ip; Tue, 22 Dec 2020 19:12:24 +0000
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
	bh=C0ApLLKiYQ12jqxPRThrehJO+zajrRDtd+F89RVnZf4=; b=Uveali0P357b+2Xc5FwM9s3XaM
	ghWbrrV1XP/Zus0PBix1BlZa759+SBpwByk2VZDeBhcPVLM5lobxWHxGSW/4bTzY51WXfYd9RtUCd
	RyTr5dxBHzU75ocnQP10xKCaZ0npXtFlp2DYteGxNZJH6JamPyH1ntPmkhz/0Day0ddk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157804-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157804: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=88e47d1959bfaf9417cfd4865ef3c6a926c1978b
X-Osstest-Versions-That:
    ovmf=d4945b102730a54f58be6bda3369c6844565b7ee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Dec 2020 19:12:24 +0000

flight 157804 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157804/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 88e47d1959bfaf9417cfd4865ef3c6a926c1978b
baseline version:
 ovmf                 d4945b102730a54f58be6bda3369c6844565b7ee

Last test of basis   157787  2020-12-22 09:58:43 Z    0 days
Testing same since   157804  2020-12-22 14:11:38 Z    0 days    1 attempts

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
   d4945b1027..88e47d1959  88e47d1959bfaf9417cfd4865ef3c6a926c1978b -> xen-tested-master

