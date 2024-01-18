Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B48320DC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 22:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668869.1041380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQZts-0004C5-Q5; Thu, 18 Jan 2024 21:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668869.1041380; Thu, 18 Jan 2024 21:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQZts-00048q-NO; Thu, 18 Jan 2024 21:26:12 +0000
Received: by outflank-mailman (input) for mailman id 668869;
 Thu, 18 Jan 2024 21:26:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQZtr-00048g-0b; Thu, 18 Jan 2024 21:26:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQZtq-0006oN-RG; Thu, 18 Jan 2024 21:26:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQZtq-0001hg-IL; Thu, 18 Jan 2024 21:26:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rQZtq-0007t5-Hp; Thu, 18 Jan 2024 21:26:10 +0000
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
	bh=sqYJzcwmpzYpfeAAF/dggHkpeTk7cSgv6fe+v1HhXwQ=; b=s8WEA4UQgF3iZYu7KoeFl4y1xx
	MCIVpSja507rUJIVAvVnM4QveQPb7hAQH6+W73o6lwkL2/DFnCGRYaFerMEcNg3Gf9hQwldAz3Y7w
	1kIGyZrVFaVeeJUcAQFGAFLwR76e3m147CAPAwIpsxghbQ97EoSGdnZTHoEvaI4Om4Yc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184395-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184395: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=264636d8e6983e0f6dc6be2fca9d84ec81315954
X-Osstest-Versions-That:
    ovmf=59f024c76ee57c2bec84794536302fc770cd6ec2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Jan 2024 21:26:10 +0000

flight 184395 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184395/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 264636d8e6983e0f6dc6be2fca9d84ec81315954
baseline version:
 ovmf                 59f024c76ee57c2bec84794536302fc770cd6ec2

Last test of basis   184379  2024-01-16 23:44:09 Z    1 days
Testing same since   184395  2024-01-18 19:44:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Doug Flick <dougflick@microsoft.com>
  Doug Flick [MSFT] <doug.edk2@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>

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
   59f024c76e..264636d8e6  264636d8e6983e0f6dc6be2fca9d84ec81315954 -> xen-tested-master

