Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E293B1A9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764221.1174581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc5R-0003Am-RH; Wed, 24 Jul 2024 13:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764221.1174581; Wed, 24 Jul 2024 13:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc5R-00038Y-Ob; Wed, 24 Jul 2024 13:31:21 +0000
Received: by outflank-mailman (input) for mailman id 764221;
 Wed, 24 Jul 2024 13:31:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWc5Q-00038M-Sv; Wed, 24 Jul 2024 13:31:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWc5Q-0007FA-J8; Wed, 24 Jul 2024 13:31:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWc5Q-0001R9-4s; Wed, 24 Jul 2024 13:31:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWc5Q-0002g9-4P; Wed, 24 Jul 2024 13:31:20 +0000
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
	bh=dncC1FbnYwKvlXwJ9HJSvbjnc0dSWNZ+20LrZXltVys=; b=TQg6r4ZvYMiHJbh8oWQx3ndkSI
	ivh/fT8IHVPqMtOGuCL1Gl31b8KEIejF/GW8gaP2Jis8S0jQF0RNcJ+LOUe6D7uqqgkyqg91SNYt4
	t6+qUcBCmr20mNkOAzpKtrSVaWu8ELizTH+bgvrciLWVqnqRbdcjXBv5Qny/A0zSsscc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186983-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186983: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a9c8c47d5347c74f5e7e7cb859912a276c6e9fb8
X-Osstest-Versions-That:
    ovmf=d4ae23b1e6c5fe95205818fcae9d5561c20588d3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jul 2024 13:31:20 +0000

flight 186983 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186983/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a9c8c47d5347c74f5e7e7cb859912a276c6e9fb8
baseline version:
 ovmf                 d4ae23b1e6c5fe95205818fcae9d5561c20588d3

Last test of basis   186980  2024-07-24 08:17:07 Z    0 days
Testing same since   186983  2024-07-24 10:43:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   d4ae23b1e6..a9c8c47d53  a9c8c47d5347c74f5e7e7cb859912a276c6e9fb8 -> xen-tested-master

