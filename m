Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F508FE026
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735988.1142127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7s3-0003Rw-8q; Thu, 06 Jun 2024 07:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735988.1142127; Thu, 06 Jun 2024 07:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7s3-0003PZ-64; Thu, 06 Jun 2024 07:49:15 +0000
Received: by outflank-mailman (input) for mailman id 735988;
 Thu, 06 Jun 2024 07:49:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sF7s1-0003PN-W8; Thu, 06 Jun 2024 07:49:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sF7s1-00049G-Tr; Thu, 06 Jun 2024 07:49:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sF7s1-0007yf-IT; Thu, 06 Jun 2024 07:49:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sF7s1-0005b8-I1; Thu, 06 Jun 2024 07:49:13 +0000
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
	bh=gGqvg+JVUu7P/ZBL9ffUqs5PJyYKRN7g0j4uiPrUyvk=; b=zIW7vzhYwLqwcmZlM6JyshuWkI
	2GXsXdPDZIef91U6xV9CH7XpQeISVhUeRnS7XF4ebu1krnkhCtDGj36vrPeh9apcy/2law7O1DAd6
	EAD10x1G22O70Ye9gwsSL8IUlYri2HznGFwy1+oElYVOyCL/UTSY2YcjHatqtlY+rkd4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186264-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186264: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=65b0d08786888284cd1bb705c58f53a65ae443b0
X-Osstest-Versions-That:
    ovmf=b45aff0dc9cb87f316eb17a11e5d4438175d9cca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Jun 2024 07:49:13 +0000

flight 186264 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186264/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 65b0d08786888284cd1bb705c58f53a65ae443b0
baseline version:
 ovmf                 b45aff0dc9cb87f316eb17a11e5d4438175d9cca

Last test of basis   186262  2024-06-06 02:42:55 Z    0 days
Testing same since   186264  2024-06-06 06:12:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   b45aff0dc9..65b0d08786  65b0d08786888284cd1bb705c58f53a65ae443b0 -> xen-tested-master

