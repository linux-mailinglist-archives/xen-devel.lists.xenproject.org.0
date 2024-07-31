Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D925D9433FD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768956.1179864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBz6-0005Fv-0j; Wed, 31 Jul 2024 16:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768956.1179864; Wed, 31 Jul 2024 16:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBz5-0005E9-Tp; Wed, 31 Jul 2024 16:15:27 +0000
Received: by outflank-mailman (input) for mailman id 768956;
 Wed, 31 Jul 2024 16:15:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZBz5-0005Dx-43; Wed, 31 Jul 2024 16:15:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZBz4-0007lr-Fl; Wed, 31 Jul 2024 16:15:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZBz4-0006O9-20; Wed, 31 Jul 2024 16:15:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZBz4-0004un-1W; Wed, 31 Jul 2024 16:15:26 +0000
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
	bh=7mWcDMA/B/AdpYyDDhyKjyDXxTdobQOExwifYd+vEBs=; b=m+QGLW8iMk6B9GXgyeUTp5he93
	f+VZs9D3y815xs+NSeD6+M5uIvhihI+hw1TAQlhl/f7PJ+XxJWdbPD6hz55/Y0Wz+h7/UBLCavTJH
	mEDvWMAWRlzzdIBy09mulc8ga3KZ0uY3/Ohn+I27uoRnM6aHTkYHd3Oyru89RLjrpR8s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187085-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187085: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1fc55a3933b0d17430c2857629ee54abefaad7eb
X-Osstest-Versions-That:
    ovmf=02f7ecbbb2da356585f5c4df4a5e7aa64a6b985d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jul 2024 16:15:26 +0000

flight 187085 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187085/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1fc55a3933b0d17430c2857629ee54abefaad7eb
baseline version:
 ovmf                 02f7ecbbb2da356585f5c4df4a5e7aa64a6b985d

Last test of basis   187079  2024-07-31 12:11:29 Z    0 days
Testing same since   187085  2024-07-31 14:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>

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
   02f7ecbbb2..1fc55a3933  1fc55a3933b0d17430c2857629ee54abefaad7eb -> xen-tested-master

