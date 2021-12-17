Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE84792C5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 18:24:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248789.429147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myGxV-0006o6-8y; Fri, 17 Dec 2021 17:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248789.429147; Fri, 17 Dec 2021 17:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myGxV-0006lq-61; Fri, 17 Dec 2021 17:23:53 +0000
Received: by outflank-mailman (input) for mailman id 248789;
 Fri, 17 Dec 2021 17:23:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myGxT-0006lg-V6; Fri, 17 Dec 2021 17:23:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myGxT-0008PZ-Sm; Fri, 17 Dec 2021 17:23:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myGxT-0002mM-Ix; Fri, 17 Dec 2021 17:23:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1myGxT-0003EW-IT; Fri, 17 Dec 2021 17:23:51 +0000
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
	bh=ZtexqQI8YwDMXM5UcXfKf/ISEJS3yOPxjko8K/s9Xt0=; b=jDUJu8wMmhQXIKDs3m6OkLKcoy
	slOwqmNRKiiU3eqeu4zw46sSum6NO4vLGUjQL6yi4U0I4IZlJ23+wL75Axzl/losntu9JuaRV7+iF
	T/l7/QRmM7CDPmWcePgo9RdOTf6pcWbgA0ayHi8ebvKfqRndV/M3sKysoHdFqwpsAMSg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167463-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167463: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ab5ab2f60348138a4b7b1c95ad6f5d0954fb96f1
X-Osstest-Versions-That:
    ovmf=b451c6908878c448c2a2aa6e9ca2a2dfe078fbb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Dec 2021 17:23:51 +0000

flight 167463 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167463/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ab5ab2f60348138a4b7b1c95ad6f5d0954fb96f1
baseline version:
 ovmf                 b451c6908878c448c2a2aa6e9ca2a2dfe078fbb8

Last test of basis   167450  2021-12-16 18:10:32 Z    0 days
Testing same since   167463  2021-12-17 15:10:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rodrigo Gonzalez del Cueto <rodrigo.gonzalez.del.cueto@intel.com>

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
   b451c69088..ab5ab2f603  ab5ab2f60348138a4b7b1c95ad6f5d0954fb96f1 -> xen-tested-master

