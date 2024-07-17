Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38867933C2E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 13:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759939.1169641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2lm-0007RK-T0; Wed, 17 Jul 2024 11:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759939.1169641; Wed, 17 Jul 2024 11:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2lm-0007Pj-QG; Wed, 17 Jul 2024 11:24:26 +0000
Received: by outflank-mailman (input) for mailman id 759939;
 Wed, 17 Jul 2024 11:24:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU2lk-0007PZ-Nq; Wed, 17 Jul 2024 11:24:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU2lk-00078Q-JM; Wed, 17 Jul 2024 11:24:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU2lk-00051s-2s; Wed, 17 Jul 2024 11:24:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sU2lk-0003Rg-2N; Wed, 17 Jul 2024 11:24:24 +0000
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
	bh=teGF/z9jR1WjiQ/8Ep7gcuApxLy9gqwWc8aagl6KGJ0=; b=BW0ZxqfKZD8t2O499niW/rRhgw
	Bi6B/YPSjZj93j/5Fr1TmZs0+UnxgMNYrVamu8lzX4BhCIBBRzkh4wSxiQgorkg0QrPRKz6TV89CF
	RU0llSkAPjyzwt9wO3kgLDxcrTOVBG5hcI4q+JS6ur3Oxjt3P/bxr9xbtwbrqrSkfVA4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186839-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186839: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e32d24ef8c8211e76c020fa7a395328cd176190c
X-Osstest-Versions-That:
    ovmf=b3441e01003ab91df816263df98f9675b2cd2aa1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 11:24:24 +0000

flight 186839 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186839/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e32d24ef8c8211e76c020fa7a395328cd176190c
baseline version:
 ovmf                 b3441e01003ab91df816263df98f9675b2cd2aa1

Last test of basis   186836  2024-07-17 06:11:12 Z    0 days
Testing same since   186839  2024-07-17 08:45:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dongyan Qian <dongyan0314@gmail.com>
  Dongyan Qian <qiandongyan@loongson.cn>

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
   b3441e0100..e32d24ef8c  e32d24ef8c8211e76c020fa7a395328cd176190c -> xen-tested-master

