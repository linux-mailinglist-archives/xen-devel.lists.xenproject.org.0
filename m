Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1363BFA2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 13:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449353.706029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozzJ2-0007QM-8y; Tue, 29 Nov 2022 12:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449353.706029; Tue, 29 Nov 2022 12:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozzJ2-0007OE-63; Tue, 29 Nov 2022 12:01:44 +0000
Received: by outflank-mailman (input) for mailman id 449353;
 Tue, 29 Nov 2022 12:01:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozzJ0-0007Cu-2w; Tue, 29 Nov 2022 12:01:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozzJ0-0004uV-15; Tue, 29 Nov 2022 12:01:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozzIz-0008So-IF; Tue, 29 Nov 2022 12:01:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ozzIz-0001tR-Hs; Tue, 29 Nov 2022 12:01:41 +0000
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
	bh=xYWL4ykDZrc2ZoIYHBBjniCSPHRKoDfA9A/oh+c+8LA=; b=XC1mX4L/TLQmVHKp9glmI2o52q
	2MHNyWfbZw1hysyx3YnS0WrKGHd0V8aWrvR7Q2qpEs/p/xyMqxVqgM+UGmkLFcLVy0iTIciErAo9I
	a35QWSn/7FitLAZtxDpaXF1M7apy65VBEknBtOK8Q+hacaVbbPzeGyDN7FdKoIWwuLzU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174987-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174987: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b92e0495221a3b298b069d9fb01e48fd2a0469f6
X-Osstest-Versions-That:
    ovmf=c8c978d32882413eeaf2b9917409af83af68cb5d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Nov 2022 12:01:41 +0000

flight 174987 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174987/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b92e0495221a3b298b069d9fb01e48fd2a0469f6
baseline version:
 ovmf                 c8c978d32882413eeaf2b9917409af83af68cb5d

Last test of basis   174986  2022-11-29 04:42:06 Z    0 days
Testing same since   174987  2022-11-29 10:13:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sunil V L <sunilvl@ventanamicro.com>
  Zhihao Li <zhihao.li@intel.com>

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
   c8c978d328..b92e049522  b92e0495221a3b298b069d9fb01e48fd2a0469f6 -> xen-tested-master

