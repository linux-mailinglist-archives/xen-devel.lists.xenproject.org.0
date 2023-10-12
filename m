Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9497C6C18
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 13:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615760.957171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqtdy-000304-8Y; Thu, 12 Oct 2023 11:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615760.957171; Thu, 12 Oct 2023 11:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqtdy-0002wg-4s; Thu, 12 Oct 2023 11:14:18 +0000
Received: by outflank-mailman (input) for mailman id 615760;
 Thu, 12 Oct 2023 11:14:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqtdw-0002wW-Cd; Thu, 12 Oct 2023 11:14:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqtdw-000448-68; Thu, 12 Oct 2023 11:14:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqtdv-0003HL-Lw; Thu, 12 Oct 2023 11:14:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qqtdv-0003HU-LQ; Thu, 12 Oct 2023 11:14:15 +0000
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
	bh=yMfvOF/7KLbhiwMlil5guDv8Nx7EpbX38S2MQ3hNrgM=; b=yZWRmvSAOlrPNCfRdrAXezahUW
	rsxCiuh2lsZVd5q6ARc4PayEQeaRwKZ/0MY5eo54HJf5FYLddPfPfdJPyQX8udA9ajJVSXzWCl184
	Rq1z8yq79GkU33J3DXcTSFJIyxsO1MlEZDof4IiZEaeYZn4EvumoU+00jOIFX8dicmDo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183355-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183355: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=326b9e1d815c4ae4b0b207fcb0bfa16864af5400
X-Osstest-Versions-That:
    ovmf=eebd446875a4b1e4879e03764f63c6c358fd64f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Oct 2023 11:14:15 +0000

flight 183355 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183355/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 326b9e1d815c4ae4b0b207fcb0bfa16864af5400
baseline version:
 ovmf                 eebd446875a4b1e4879e03764f63c6c358fd64f5

Last test of basis   183352  2023-10-12 05:42:31 Z    0 days
Testing same since   183355  2023-10-12 09:13:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuanhao Xie <yuanhao.xie@intel.com>
  YuanhaoXie <yuanhao.xie@intel.com>

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
   eebd446875..326b9e1d81  326b9e1d815c4ae4b0b207fcb0bfa16864af5400 -> xen-tested-master

