Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6E38A0F1B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 12:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703824.1099708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rurXq-0008WN-AH; Thu, 11 Apr 2024 10:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703824.1099708; Thu, 11 Apr 2024 10:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rurXq-0008UL-7Q; Thu, 11 Apr 2024 10:20:38 +0000
Received: by outflank-mailman (input) for mailman id 703824;
 Thu, 11 Apr 2024 10:20:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rurXo-0008UB-MX; Thu, 11 Apr 2024 10:20:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rurXo-0000jr-KJ; Thu, 11 Apr 2024 10:20:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rurXo-0005cO-6A; Thu, 11 Apr 2024 10:20:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rurXo-0007JE-5r; Thu, 11 Apr 2024 10:20:36 +0000
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
	bh=5IJXMSvYBk5tRmGN4HH5Zq0OGKf6Wdo89+tGTxMMwyc=; b=xm8LZttsQG8F6WGxzJmcXgM1dx
	yiwukuKz8zjOXXeXZgINPjkMPuyIleH1gmULMv1o3ECs/Jepbw6VGbmxDd2a34KU4Nn/tBsRqXFDn
	O5lEGgOvnrjkLLfu18vH/X8nE5zzMTjg+fxBRSlJqZcs4z1poAKbUUWYssjRhabcp7C0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185309-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185309: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=98f150a954b35cc74bd87ae355cf35d8c9e1580d
X-Osstest-Versions-That:
    ovmf=963671d3801a6992d1aa06f05d86e32efa6b205e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Apr 2024 10:20:36 +0000

flight 185309 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185309/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 98f150a954b35cc74bd87ae355cf35d8c9e1580d
baseline version:
 ovmf                 963671d3801a6992d1aa06f05d86e32efa6b205e

Last test of basis   185293  2024-04-10 02:11:42 Z    1 days
Testing same since   185309  2024-04-11 08:11:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@...>
  Dhaval <dhaval@rivosinc.com>
  Dhaval Sharma <dhaval@rivosinc.com>

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
   963671d380..98f150a954  98f150a954b35cc74bd87ae355cf35d8c9e1580d -> xen-tested-master

