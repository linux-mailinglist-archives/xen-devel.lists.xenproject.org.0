Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32A944F29
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 17:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769798.1180673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZXhm-0001BG-8C; Thu, 01 Aug 2024 15:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769798.1180673; Thu, 01 Aug 2024 15:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZXhm-00018p-5B; Thu, 01 Aug 2024 15:27:02 +0000
Received: by outflank-mailman (input) for mailman id 769798;
 Thu, 01 Aug 2024 15:27:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZXhk-00018f-U0; Thu, 01 Aug 2024 15:27:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZXhk-00088G-N9; Thu, 01 Aug 2024 15:27:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZXhk-00065x-Cd; Thu, 01 Aug 2024 15:27:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZXhk-0006RS-C9; Thu, 01 Aug 2024 15:27:00 +0000
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
	bh=Blho4DY+pD/VDHUnJ3TQVeMRBZ1dhOip08sp/0cFITA=; b=RwY4sdHyrH+XQAg2Ma9ZmXS8OK
	YP80nKMN/1kZoIQ0qGT+0q+ZU+fyUMExvl+zBU0Zb957N8S6zEyvaL38niH2K+aN8XLt1d2h6FoRM
	FrL8vqZkPMNs9YG/FjATmoMaleNSR4YfeKdWxZJCmH+9JOksP+FKlFmONcpFiFJtiBps=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187108: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a679ceca974e94a659f9b6b9e7a7900644220ef9
X-Osstest-Versions-That:
    ovmf=71b9bda1ace32a479d471f26b0e516d0618053bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Aug 2024 15:27:00 +0000

flight 187108 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187108/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a679ceca974e94a659f9b6b9e7a7900644220ef9
baseline version:
 ovmf                 71b9bda1ace32a479d471f26b0e516d0618053bc

Last test of basis   187105  2024-08-01 11:45:02 Z    0 days
Testing same since   187108  2024-08-01 13:45:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   71b9bda1ac..a679ceca97  a679ceca974e94a659f9b6b9e7a7900644220ef9 -> xen-tested-master

