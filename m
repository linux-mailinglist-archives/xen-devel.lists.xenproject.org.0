Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39982D449
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 07:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667192.1038222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPGkX-0002U3-Q8; Mon, 15 Jan 2024 06:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667192.1038222; Mon, 15 Jan 2024 06:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPGkX-0002Sp-MP; Mon, 15 Jan 2024 06:47:09 +0000
Received: by outflank-mailman (input) for mailman id 667192;
 Mon, 15 Jan 2024 06:47:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPGkX-0002Sf-0M; Mon, 15 Jan 2024 06:47:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPGkW-0003s1-Qu; Mon, 15 Jan 2024 06:47:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPGkW-0007zE-5b; Mon, 15 Jan 2024 06:47:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPGkW-0000bf-58; Mon, 15 Jan 2024 06:47:08 +0000
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
	bh=xLI0/wD++zBAtv0fRGZexOl4NyWG2OlYtPiC9afxXBM=; b=vvMwG17nj0ONlziJeK78NyC0OJ
	jEmXYbp4YuxWkNXOM5sa/U/s3pGMCWoTUjWQlMeNeSduCgiUSXMkHqTaaHSnb9YKvWV1wj0j2agJH
	4GyBKahgVJjgr35YUUP7QT88MhcgeGmbTvg/xJOPlfpB85sQ3mqW7RbLOOv0FPKmzFEM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184348-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184348: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f5b91c60ef24eecf5702e061dd7fd700943405b2
X-Osstest-Versions-That:
    ovmf=cfe48465724293abd0a7d92c2a72f8ee3cf15628
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jan 2024 06:47:08 +0000

flight 184348 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184348/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f5b91c60ef24eecf5702e061dd7fd700943405b2
baseline version:
 ovmf                 cfe48465724293abd0a7d92c2a72f8ee3cf15628

Last test of basis   184331  2024-01-12 06:14:31 Z    3 days
Testing same since   184348  2024-01-15 01:56:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   cfe4846572..f5b91c60ef  f5b91c60ef24eecf5702e061dd7fd700943405b2 -> xen-tested-master

