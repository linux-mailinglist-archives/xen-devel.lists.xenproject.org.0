Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0E83D5F3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 10:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671880.1045390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIMV-0007zf-W9; Fri, 26 Jan 2024 09:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671880.1045390; Fri, 26 Jan 2024 09:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIMV-0007wr-TK; Fri, 26 Jan 2024 09:18:59 +0000
Received: by outflank-mailman (input) for mailman id 671880;
 Fri, 26 Jan 2024 09:18:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rTIMV-0007wh-2D; Fri, 26 Jan 2024 09:18:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rTIMU-0007oO-Px; Fri, 26 Jan 2024 09:18:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rTIMU-0000En-Bo; Fri, 26 Jan 2024 09:18:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rTIMU-0002tg-BL; Fri, 26 Jan 2024 09:18:58 +0000
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
	bh=6Zu3r8+8uSZkOtCNpS4XxU5UtukTr/j6MW27KVlcmnE=; b=y23Yz3BsvpbLY1Zg0hWefaId/k
	ckKzbGauEm6P5Y10CeAHcfnY2kILKjtHjukNdTuXJrfdncAl6SK7xG+pfcnToKqfregJgvLfxtX+O
	G9kJTkacGmRFoDhApBsBsH7XPZ0I+6I9P8n0HRzb/KdL15g7RNxTbJdO/ND94Ex8Egiw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184473-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184473: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7d7decfa3dc817775322505ae770a27f185465cf
X-Osstest-Versions-That:
    ovmf=9a75b030cf27d2530444e9a2f9f11867f79bf679
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jan 2024 09:18:58 +0000

flight 184473 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184473/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7d7decfa3dc817775322505ae770a27f185465cf
baseline version:
 ovmf                 9a75b030cf27d2530444e9a2f9f11867f79bf679

Last test of basis   184471  2024-01-26 03:42:49 Z    0 days
Testing same since   184473  2024-01-26 07:14:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   9a75b030cf..7d7decfa3d  7d7decfa3dc817775322505ae770a27f185465cf -> xen-tested-master

