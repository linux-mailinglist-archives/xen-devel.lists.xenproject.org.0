Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF92A933608
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 06:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759849.1169544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTwIR-0008OC-OB; Wed, 17 Jul 2024 04:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759849.1169544; Wed, 17 Jul 2024 04:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTwIR-0008MC-Kt; Wed, 17 Jul 2024 04:29:43 +0000
Received: by outflank-mailman (input) for mailman id 759849;
 Wed, 17 Jul 2024 04:29:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTwIQ-0008Lz-7s; Wed, 17 Jul 2024 04:29:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTwIQ-00056a-63; Wed, 17 Jul 2024 04:29:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTwIP-0007fe-M2; Wed, 17 Jul 2024 04:29:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTwIP-0004SF-LZ; Wed, 17 Jul 2024 04:29:41 +0000
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
	bh=ob6P94Sefw5VpR8IqD7kMqXvH6oWQxjzaDQsBmPKxdQ=; b=gBg7kas3QAb8tAV8VyodL8wjfx
	0fZtQ8pKUnJJFcvAXbKLN3hOImmjQ94F7bQjP5HrRlVa1AlgXvBT+UzzBa82z/EKIfwB9cIO0oWS/
	DSByIYPISuDgfW0x99dqCIataRIDZw85LyIbXMrgycD3dq0w6DzS1qk576cdZNvM7hBU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186832-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186832: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=43b7a856fad2e25b1b5bddeb6cb08881a29caf4d
X-Osstest-Versions-That:
    ovmf=6b4dd3625b24fbb9ac5d6d931dd11ff50e288a79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 04:29:41 +0000

flight 186832 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186832/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 43b7a856fad2e25b1b5bddeb6cb08881a29caf4d
baseline version:
 ovmf                 6b4dd3625b24fbb9ac5d6d931dd11ff50e288a79

Last test of basis   186831  2024-07-17 01:44:05 Z    0 days
Testing same since   186832  2024-07-17 03:10:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@os.amperecomputing.com>

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
   6b4dd3625b..43b7a856fa  43b7a856fad2e25b1b5bddeb6cb08881a29caf4d -> xen-tested-master

