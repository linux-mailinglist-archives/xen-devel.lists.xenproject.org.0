Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10106CB8A6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 09:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515571.798581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph45c-0007j5-5A; Tue, 28 Mar 2023 07:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515571.798581; Tue, 28 Mar 2023 07:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph45c-0007gb-1m; Tue, 28 Mar 2023 07:49:56 +0000
Received: by outflank-mailman (input) for mailman id 515571;
 Tue, 28 Mar 2023 07:49:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ph45a-0007gR-JB; Tue, 28 Mar 2023 07:49:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ph45a-0005Vm-H0; Tue, 28 Mar 2023 07:49:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ph45a-0008IN-20; Tue, 28 Mar 2023 07:49:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ph45a-0002R8-1X; Tue, 28 Mar 2023 07:49:54 +0000
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
	bh=NmveGSnp3Rbl9vAla/AMT+M1h6YMZjBIzhjKRiejA4Y=; b=PxoNZ31GD8Q4Wman2wqmqa4G9s
	MBFmXXNFemWdvaDat/EE1b+3LBFMgJZ/wknLB3xj5A8bYzNQ0ztdevhHrwWGgk32d/yKPvzyUaDqz
	jZRtdHaMEem8tvNiMVb8bJZSYB5NkhyWw0GCqD4IWxU6R0lkSKvkN3r7ILt8Dooh3fUk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180037-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180037: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=71fd87e98a3d68dffe2f37ec1bdc61732c01597a
X-Osstest-Versions-That:
    ovmf=144028626e0072c2c4fdfcc0fe1b72de319bdd2f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Mar 2023 07:49:54 +0000

flight 180037 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180037/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 71fd87e98a3d68dffe2f37ec1bdc61732c01597a
baseline version:
 ovmf                 144028626e0072c2c4fdfcc0fe1b72de319bdd2f

Last test of basis   180031  2023-03-27 16:40:42 Z    0 days
Testing same since   180037  2023-03-28 05:12:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sunil V L <sunilvl@ventanamicro.com>

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
   144028626e..71fd87e98a  71fd87e98a3d68dffe2f37ec1bdc61732c01597a -> xen-tested-master

