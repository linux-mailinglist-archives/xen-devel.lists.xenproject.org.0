Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280296CF4B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 08:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790919.1200693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm60f-0005CJ-Rw; Thu, 05 Sep 2024 06:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790919.1200693; Thu, 05 Sep 2024 06:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm60f-000596-Ny; Thu, 05 Sep 2024 06:30:25 +0000
Received: by outflank-mailman (input) for mailman id 790919;
 Thu, 05 Sep 2024 06:30:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm60d-00058u-PT; Thu, 05 Sep 2024 06:30:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm60d-0001dw-GB; Thu, 05 Sep 2024 06:30:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm60d-0000wP-4J; Thu, 05 Sep 2024 06:30:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sm60d-0007WO-3x; Thu, 05 Sep 2024 06:30:23 +0000
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
	bh=mdFFd7TFJ3clOQ7lrJX7SA21lpltl7CGJZhOOksNiIQ=; b=UnKzRYnqm6eDIBlynIP56brI8b
	uSrpxwDEMIZThR4mJsyERv9zvgaIRMcyIvFF9mKjdjjQqlqz074kMGC0Zu86quuM6ILQ/nQY+40lv
	8DJefJTlC6dWTHevqVe4af4BU7Xe31Lz85VoYe8N5uuihbqhMC5BfRXOxJi9hh2130v4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187500-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187500: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7b9f2018d1f2a850eca2ce1431e9eba8f185a716
X-Osstest-Versions-That:
    ovmf=2ddce71142a6243aa4dc64242553d6591eb58def
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Sep 2024 06:30:23 +0000

flight 187500 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187500/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7b9f2018d1f2a850eca2ce1431e9eba8f185a716
baseline version:
 ovmf                 2ddce71142a6243aa4dc64242553d6591eb58def

Last test of basis   187499  2024-09-05 02:00:06 Z    0 days
Testing same since   187500  2024-09-05 04:13:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   2ddce71142..7b9f2018d1  7b9f2018d1f2a850eca2ce1431e9eba8f185a716 -> xen-tested-master

