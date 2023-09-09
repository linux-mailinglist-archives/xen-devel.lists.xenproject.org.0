Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A568799549
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 03:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598322.933040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qemLh-00075q-7t; Sat, 09 Sep 2023 01:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598322.933040; Sat, 09 Sep 2023 01:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qemLh-00071d-4q; Sat, 09 Sep 2023 01:01:21 +0000
Received: by outflank-mailman (input) for mailman id 598322;
 Sat, 09 Sep 2023 01:01:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qemLg-0006fP-6P; Sat, 09 Sep 2023 01:01:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qemLg-0001RT-3y; Sat, 09 Sep 2023 01:01:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qemLf-0000hY-T3; Sat, 09 Sep 2023 01:01:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qemLf-00057M-Sa; Sat, 09 Sep 2023 01:01:19 +0000
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
	bh=4MH1PHkssf2oReLX4S+fZplWUZaKAm/1hHUrQz/4dJU=; b=52/bI0KE7VGy6IpghaQ4Vbm3wC
	DE9AyXLJTasFPTs9idFQ3BLBID29Y7QJMcpYIMcteS1oetZf4jX8nVL5ZEkV9R/+viEjK9S0aU2gO
	M7mNywRkFD1LCox4eFcmrK+VJ3AY/tmyI5DlRJcdR++99976R5xsa3rkQjkwpNjeIGW4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182786: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b240eab03530f063ef5438497d70a731b19a201e
X-Osstest-Versions-That:
    ovmf=d4ae5df71190148c902942c3462245e97ed2fcc8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Sep 2023 01:01:19 +0000

flight 182786 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182786/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b240eab03530f063ef5438497d70a731b19a201e
baseline version:
 ovmf                 d4ae5df71190148c902942c3462245e97ed2fcc8

Last test of basis   182779  2023-09-08 20:44:14 Z    0 days
Testing same since   182786  2023-09-08 22:40:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Otcheretianski <andrei.otcheretianski@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   d4ae5df711..b240eab035  b240eab03530f063ef5438497d70a731b19a201e -> xen-tested-master

