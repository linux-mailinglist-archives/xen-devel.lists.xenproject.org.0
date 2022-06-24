Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADAB559CBB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 17:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355587.583311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4km6-0005LQ-Ad; Fri, 24 Jun 2022 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355587.583311; Fri, 24 Jun 2022 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4km6-0005Id-6z; Fri, 24 Jun 2022 14:59:10 +0000
Received: by outflank-mailman (input) for mailman id 355587;
 Fri, 24 Jun 2022 14:59:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4km5-0005IT-C9; Fri, 24 Jun 2022 14:59:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4km5-0008RB-AG; Fri, 24 Jun 2022 14:59:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4km4-0007NF-R5; Fri, 24 Jun 2022 14:59:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o4km4-0000iW-Qh; Fri, 24 Jun 2022 14:59:08 +0000
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
	bh=NW9SUsZSy53xlMB9rsT3E164MqBItnCV61J6loy3B8w=; b=DY1qEkz2Cl29xY5okatBXZZyhP
	kJszym7wbIizn27x3UeMJ+6PzfkrX0AYzRsh0qs5bb4gAkkWkcUx97xCuEw7EyP+D5f6nIk+uFJvF
	U9ERh8cgdlXWirv2YRyaeZn9Xti6y1ppehU79mZ83RLLyGpq/2UJHK8MY2o05tBv+OX4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171343-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171343: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2aee08c0b6bfb32d36bda17ab24645205a74df65
X-Osstest-Versions-That:
    ovmf=4bfd668e5edb59092a8e16414b3f6632efdac4f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Jun 2022 14:59:08 +0000

flight 171343 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171343/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2aee08c0b6bfb32d36bda17ab24645205a74df65
baseline version:
 ovmf                 4bfd668e5edb59092a8e16414b3f6632efdac4f2

Last test of basis   171324  2022-06-23 06:42:01 Z    1 days
Testing same since   171343  2022-06-24 13:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  KasimX Liu <kasimx.liu@intel.com>

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
   4bfd668e5e..2aee08c0b6  2aee08c0b6bfb32d36bda17ab24645205a74df65 -> xen-tested-master

