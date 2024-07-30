Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53379415E1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767946.1178659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpAZ-0006Yy-4v; Tue, 30 Jul 2024 15:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767946.1178659; Tue, 30 Jul 2024 15:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpAZ-0006Wi-1f; Tue, 30 Jul 2024 15:53:47 +0000
Received: by outflank-mailman (input) for mailman id 767946;
 Tue, 30 Jul 2024 15:53:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYpAX-0006WJ-LY; Tue, 30 Jul 2024 15:53:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYpAX-00081c-EF; Tue, 30 Jul 2024 15:53:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYpAX-0001A7-1z; Tue, 30 Jul 2024 15:53:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYpAX-0000QC-1Y; Tue, 30 Jul 2024 15:53:45 +0000
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
	bh=dr/RiovMZx48WZz9SL8y11L6kJdZnL9JNltxd8bup8g=; b=kd+KhH811MzQk9Yx5gnodoGveG
	gUcQx8Xd+HuK06f/FintKYgaod8hX721NoqEqakvkN79OcBf38clX/Ki73Oi9PiOTYR0d4pFosSxB
	WRSk1iOHEzm0oOHZJul5tkHJqgh/WGTe/q/MSiVVHZ9TGyUjiMLLOsr50um+DhS8f4ko=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187058-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187058: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5b08df03f8193261e4837ed4e91ff81fa7d17e4d
X-Osstest-Versions-That:
    ovmf=91a822749a6664dcaf0f67a837dcf0cd05783d17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jul 2024 15:53:45 +0000

flight 187058 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187058/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5b08df03f8193261e4837ed4e91ff81fa7d17e4d
baseline version:
 ovmf                 91a822749a6664dcaf0f67a837dcf0cd05783d17

Last test of basis   187055  2024-07-30 11:41:31 Z    0 days
Testing same since   187058  2024-07-30 14:13:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Awiral Shrivastava <awiral.shrivastava@intel.com>

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
   91a822749a..5b08df03f8  5b08df03f8193261e4837ed4e91ff81fa7d17e4d -> xen-tested-master

