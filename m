Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950B93A1F1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763237.1173499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFuh-0008Af-88; Tue, 23 Jul 2024 13:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763237.1173499; Tue, 23 Jul 2024 13:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFuh-00088p-4G; Tue, 23 Jul 2024 13:50:47 +0000
Received: by outflank-mailman (input) for mailman id 763237;
 Tue, 23 Jul 2024 13:50:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWFuf-00088f-Mz; Tue, 23 Jul 2024 13:50:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWFuf-0007Kz-G0; Tue, 23 Jul 2024 13:50:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWFue-0003Zw-VG; Tue, 23 Jul 2024 13:50:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWFue-0007vH-Uc; Tue, 23 Jul 2024 13:50:44 +0000
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
	bh=qdAGfAyVrvHxnOftmDdy0y+KR57jGsrs6AD4E43br68=; b=csGOjR93UVOOAC4Ha39Hsj9U/7
	GqVkRMZFAk/NGJy1spmXt+iF9m/b0+i7iCVYjhnDQOwanVZ0PLVQhyN4yhtZPRN70J8DXa+iZlT2g
	gM07dq1wGPZS5B60W9uk+F+O4LhbWC/Y0ScMgMcf8IT/Jt13WyilKHx738utXp/ARFSM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186964-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186964: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f96298d75cebfe2a7707157ed644eb86bf6d46ca
X-Osstest-Versions-That:
    ovmf=46eb0ca29bf6bd84381af8506e0d9b1755f767d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jul 2024 13:50:44 +0000

flight 186964 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186964/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f96298d75cebfe2a7707157ed644eb86bf6d46ca
baseline version:
 ovmf                 46eb0ca29bf6bd84381af8506e0d9b1755f767d9

Last test of basis   186962  2024-07-23 08:46:52 Z    0 days
Testing same since   186964  2024-07-23 11:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  levi.yun <yeoreum.yun@arm.com>

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
   46eb0ca29b..f96298d75c  f96298d75cebfe2a7707157ed644eb86bf6d46ca -> xen-tested-master

