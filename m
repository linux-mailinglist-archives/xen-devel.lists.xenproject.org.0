Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF184A32C1
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 01:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262345.454540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDxpF-0003m4-7F; Sun, 30 Jan 2022 00:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262345.454540; Sun, 30 Jan 2022 00:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDxpF-0003jU-3H; Sun, 30 Jan 2022 00:12:13 +0000
Received: by outflank-mailman (input) for mailman id 262345;
 Sun, 30 Jan 2022 00:12:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDxpD-0003jK-Ge; Sun, 30 Jan 2022 00:12:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDxpD-0005wo-ED; Sun, 30 Jan 2022 00:12:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDxpD-0004Id-5W; Sun, 30 Jan 2022 00:12:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nDxpD-0007AP-54; Sun, 30 Jan 2022 00:12:11 +0000
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
	bh=1tzb4U3wEAKKpVdDS2RYGhcmkkSYfTw49u7yslDNE7I=; b=HnvRxkoiHvKU3EIBh8fNAg68Cw
	1BHLLtlcHuhNl7vnvsAUf9v/w8f/sKwRc2tVUHoVH14hNi4dL7GUXr9x9T8hNfyro6VLPfaathTcL
	QFOwpejDnGAGgnjewMN3QdfqyqelrCBxBfd6Tip23hNMOJjc/We0MuJRU2fr5bt3qT18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167950-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167950: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ba79becd553c4d9118fafcaedef4d36f1cb9c851
X-Osstest-Versions-That:
    ovmf=ae35314e7b86417c166eb873eb26df012ae3787a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 30 Jan 2022 00:12:11 +0000

flight 167950 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167950/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ba79becd553c4d9118fafcaedef4d36f1cb9c851
baseline version:
 ovmf                 ae35314e7b86417c166eb873eb26df012ae3787a

Last test of basis   167946  2022-01-29 15:43:04 Z    0 days
Testing same since   167950  2022-01-29 20:11:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Ard Biesheuvel <ardb@kernel.org>
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
   ae35314e7b..ba79becd55  ba79becd553c4d9118fafcaedef4d36f1cb9c851 -> xen-tested-master

