Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E992CEAB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756715.1165426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRU5X-0002oG-TT; Wed, 10 Jul 2024 09:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756715.1165426; Wed, 10 Jul 2024 09:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRU5X-0002mE-Qh; Wed, 10 Jul 2024 09:58:15 +0000
Received: by outflank-mailman (input) for mailman id 756715;
 Wed, 10 Jul 2024 09:58:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRU5W-0002m4-Ju; Wed, 10 Jul 2024 09:58:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRU5W-0006hd-GA; Wed, 10 Jul 2024 09:58:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRU5W-0007bu-6w; Wed, 10 Jul 2024 09:58:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sRU5W-0003Go-6I; Wed, 10 Jul 2024 09:58:14 +0000
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
	bh=sXxPeq1dvLRHZukPBaNvjwkPC5swd06Vv2oMaf0J9L0=; b=HYnTE3ZAX8CRqamyffZdTT8txS
	nuf5nbA0zt9WEB1xu6GESj1yWow+lKWvmoTEwu5blrFpvIAGPxz92fc/lYfTvAGH7aVPOt+WdC1tG
	PYAoj6fIDTw9uU8PeXkkzZXoaseVuRTJpfVFZhwjkUPjzUYdQiLwF784JmOFqhTQc2T4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186751-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186751: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=497766f70975b9c1f88df42228c79095198f2b4e
X-Osstest-Versions-That:
    ovmf=f91211049c1522f7db2ae8f7a509ac270868d0e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jul 2024 09:58:14 +0000

flight 186751 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186751/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 497766f70975b9c1f88df42228c79095198f2b4e
baseline version:
 ovmf                 f91211049c1522f7db2ae8f7a509ac270868d0e9

Last test of basis   186746  2024-07-10 02:12:55 Z    0 days
Testing same since   186751  2024-07-10 06:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sam Kaynor <Sam.Kaynor@arm.com>
  Stuart Yoder <stuart.yoder@arm.com>

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
   f91211049c..497766f709  497766f70975b9c1f88df42228c79095198f2b4e -> xen-tested-master

