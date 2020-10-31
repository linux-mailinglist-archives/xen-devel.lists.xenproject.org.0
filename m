Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED532A1AEA
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 23:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17045.41835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYz3G-0000S5-Cy; Sat, 31 Oct 2020 22:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17045.41835; Sat, 31 Oct 2020 22:08:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYz3G-0000Rg-9f; Sat, 31 Oct 2020 22:08:46 +0000
Received: by outflank-mailman (input) for mailman id 17045;
 Sat, 31 Oct 2020 22:08:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyv3=EG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kYz3F-0000Qx-7e
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 22:08:45 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b62d2fe-9dd3-4c39-a649-d5431753a97f;
 Sat, 31 Oct 2020 22:08:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYz38-0007In-K6; Sat, 31 Oct 2020 22:08:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYz38-0005qn-9y; Sat, 31 Oct 2020 22:08:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kYz38-0006Sj-9S; Sat, 31 Oct 2020 22:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nyv3=EG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kYz3F-0000Qx-7e
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 22:08:45 +0000
X-Inumbo-ID: 4b62d2fe-9dd3-4c39-a649-d5431753a97f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4b62d2fe-9dd3-4c39-a649-d5431753a97f;
	Sat, 31 Oct 2020 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=pcdTIXh7EHTnnw+EAjCl921EJ34pXehO6f4CQxmBt+w=; b=O9ztZfkiahQ2x6arTnm3t3LbBX
	ipfCiVP4KjYnF16xJBNDELJbzdjTWu07hggd5ASPZNjXHvYgK8WkwF2wvkZqJPTFPJIFP25H9vz/H
	b7+3YEwjrMQpmyRK4Jk1kySI83TcVtiqFsZSc4qodm9z3QuX7N8HgHHuTTDD2EERrEk8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYz38-0007In-K6; Sat, 31 Oct 2020 22:08:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYz38-0005qn-9y; Sat, 31 Oct 2020 22:08:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYz38-0006Sj-9S; Sat, 31 Oct 2020 22:08:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156329-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156329: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8ead7af22bc596de23cdcc46e1f1a8c4e721d6d0
X-Osstest-Versions-That:
    ovmf=8cadcaa13d882816052ad4dec77faddd44a1c108
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Oct 2020 22:08:38 +0000

flight 156329 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156329/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8ead7af22bc596de23cdcc46e1f1a8c4e721d6d0
baseline version:
 ovmf                 8cadcaa13d882816052ad4dec77faddd44a1c108

Last test of basis   156316  2020-10-30 10:41:41 Z    1 days
Testing same since   156329  2020-10-31 05:43:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>

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
   8cadcaa13d..8ead7af22b  8ead7af22bc596de23cdcc46e1f1a8c4e721d6d0 -> xen-tested-master

