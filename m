Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DF73B140
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554255.865349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCb8M-0004ik-Ug; Fri, 23 Jun 2023 07:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554255.865349; Fri, 23 Jun 2023 07:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCb8M-0004h3-R4; Fri, 23 Jun 2023 07:23:06 +0000
Received: by outflank-mailman (input) for mailman id 554255;
 Fri, 23 Jun 2023 07:23:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCb8K-0004gm-Ox; Fri, 23 Jun 2023 07:23:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCb8K-0000Sa-Ny; Fri, 23 Jun 2023 07:23:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCb8K-000555-8v; Fri, 23 Jun 2023 07:23:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qCb8K-0006TN-8Q; Fri, 23 Jun 2023 07:23:04 +0000
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
	bh=pqOobAw7w1jUF0IzzpUZ/a9oYPgERVHRa8wYX48QQns=; b=W33Nu+a9LFzLClmls5t3PnWDXE
	1oAyxaRHjY48HHVQzAtDk7JDzxhRpl/9o4mkZxYmsorieoGWePt8H3Dbdr48JtjIq7vn7WwaJfApO
	lw/flOaI3+ygWof9fHPejcEhEoTAmZko6uj/FmvuMVyWaVlLEYHIXNTZZHEJeGb/N+yo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181561-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181561: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=49f06b664018105090a42a0684fb5e6ea4c909cd
X-Osstest-Versions-That:
    ovmf=fcd71642df9a3a5932a2db116acc6fe23458d8f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Jun 2023 07:23:04 +0000

flight 181561 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181561/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 49f06b664018105090a42a0684fb5e6ea4c909cd
baseline version:
 ovmf                 fcd71642df9a3a5932a2db116acc6fe23458d8f5

Last test of basis   181536  2023-06-21 11:12:23 Z    1 days
Testing same since   181561  2023-06-23 05:12:24 Z    0 days    1 attempts

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
   fcd71642df..49f06b6640  49f06b664018105090a42a0684fb5e6ea4c909cd -> xen-tested-master

