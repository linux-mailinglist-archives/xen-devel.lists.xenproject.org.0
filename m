Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D958537ACE
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 14:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338555.563342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvesA-0007Cf-Cf; Mon, 30 May 2022 12:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338555.563342; Mon, 30 May 2022 12:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvesA-00079K-9n; Mon, 30 May 2022 12:51:50 +0000
Received: by outflank-mailman (input) for mailman id 338555;
 Mon, 30 May 2022 12:51:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nves8-00079A-P8; Mon, 30 May 2022 12:51:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nves8-0003E6-JS; Mon, 30 May 2022 12:51:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nves8-0001fO-AY; Mon, 30 May 2022 12:51:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nves8-000206-A7; Mon, 30 May 2022 12:51:48 +0000
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
	bh=xx/ANy0xMjdfOd5GgocSAMOhMjC9KqnWs+VXf1VoFmM=; b=frKLDijgEkh2mamT3zV0+GZt9K
	RaLlII3Wpi6QEbRhfvxLuKVmVUgZvMmK1X/1QzqdKcWZPuJB4edcffcuIexU18/oX8zyo9XnNYKBp
	jLeDyOIbmYt9Wb37fTkuRj7Bs0OcVPonvgcGDA/YFActMP6bMrJx54PSOHj6s3e87sKU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170776-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170776: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3ca7326b37c5d20d9473f47266074e61ea384c5b
X-Osstest-Versions-That:
    ovmf=dac2fc8146e42ef19cd50ecbe32ccb7705b76fa3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 May 2022 12:51:48 +0000

flight 170776 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170776/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3ca7326b37c5d20d9473f47266074e61ea384c5b
baseline version:
 ovmf                 dac2fc8146e42ef19cd50ecbe32ccb7705b76fa3

Last test of basis   170755  2022-05-27 16:42:14 Z    2 days
Testing same since   170776  2022-05-30 11:14:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   dac2fc8146..3ca7326b37  3ca7326b37c5d20d9473f47266074e61ea384c5b -> xen-tested-master

