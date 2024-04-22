Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265428ACFF0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 16:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710002.1109066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryv1i-0004sI-PK; Mon, 22 Apr 2024 14:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710002.1109066; Mon, 22 Apr 2024 14:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryv1i-0004qm-Me; Mon, 22 Apr 2024 14:52:14 +0000
Received: by outflank-mailman (input) for mailman id 710002;
 Mon, 22 Apr 2024 14:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryv1i-0004qc-6D; Mon, 22 Apr 2024 14:52:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryv1h-0007vz-PV; Mon, 22 Apr 2024 14:52:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryv1h-0004iJ-Es; Mon, 22 Apr 2024 14:52:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ryv1h-0003sg-EL; Mon, 22 Apr 2024 14:52:13 +0000
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
	bh=NFUuyw5VWP6Cqk8WxspO26iY1qZiRZGHBvWDyTdBlyM=; b=u8LjHZR6Ol00eZyjXCnIOyUiFF
	PbuYeu9MY6aGoAIqSo32B2w6kLF5CrYUA389anPK6GFcMNm1IrAfdcIge+3eQBzxKRnHdkYRU/+m8
	bYYcqxkr8kIoQwaX2j+iuAsitsRd8qQGCDNfl5aShLFXpaLwAYUqqnZl8Od1b+Qq19C0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185759-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185759: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7dd7b890582b4d696ca5fd436dbc5fb4bc30e385
X-Osstest-Versions-That:
    ovmf=be92e09206c2e4bb388e7c9127f048689841dd01
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Apr 2024 14:52:13 +0000

flight 185759 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185759/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7dd7b890582b4d696ca5fd436dbc5fb4bc30e385
baseline version:
 ovmf                 be92e09206c2e4bb388e7c9127f048689841dd01

Last test of basis   185756  2024-04-22 03:19:18 Z    0 days
Testing same since   185759  2024-04-22 13:14:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Konstantin Kostiuk <kkostiuk@redhat.com>

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
   be92e09206..7dd7b89058  7dd7b890582b4d696ca5fd436dbc5fb4bc30e385 -> xen-tested-master

