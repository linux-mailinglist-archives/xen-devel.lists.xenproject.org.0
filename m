Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADAB5F1BFA
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 13:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414515.658824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeab5-0001Ho-E3; Sat, 01 Oct 2022 11:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414515.658824; Sat, 01 Oct 2022 11:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeab5-0001F0-An; Sat, 01 Oct 2022 11:23:55 +0000
Received: by outflank-mailman (input) for mailman id 414515;
 Sat, 01 Oct 2022 11:23:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeab3-0001Eq-RD; Sat, 01 Oct 2022 11:23:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeab3-0004RR-QA; Sat, 01 Oct 2022 11:23:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeab3-0006vK-Bk; Sat, 01 Oct 2022 11:23:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeab3-0007nN-BJ; Sat, 01 Oct 2022 11:23:53 +0000
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
	bh=Bqxgazd4O3tEHEW+s+4iOUkgD6gtbk0P0snSZgm8hfs=; b=Moh5dNYn8m8PRzApBu4cNg6nyA
	brdju1KxW9xAmLKtnqYihIgllLON5/RqH/JgsjUcYibsGgoZHxo8gAj67ci1t/n7aD4/UfGmxkuno
	fVPgH3h30rRMJMuwExk5dzAtpiXWli4f1oZ9KYjL7GPf5xFxmwXgR68LBuDYm1sGothY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173393-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173393: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7aa06237b856fd6f8187cc1715a3fe08ab4e98ed
X-Osstest-Versions-That:
    ovmf=b7213bbd59833fb0786c83a28df5f8244602ab5e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Oct 2022 11:23:53 +0000

flight 173393 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173393/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed
baseline version:
 ovmf                 b7213bbd59833fb0786c83a28df5f8244602ab5e

Last test of basis   173356  2022-09-28 14:40:29 Z    2 days
Testing same since   173386  2022-09-30 12:10:28 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rodrigo Gonzalez Del Cueto <rodrigo.gonzalez.del.cueto@intel.com>

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
   b7213bbd59..7aa06237b8  7aa06237b856fd6f8187cc1715a3fe08ab4e98ed -> xen-tested-master

