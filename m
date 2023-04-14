Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8C66E27C6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521152.809506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnLoI-0001l6-Hw; Fri, 14 Apr 2023 15:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521152.809506; Fri, 14 Apr 2023 15:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnLoI-0001iC-DR; Fri, 14 Apr 2023 15:58:02 +0000
Received: by outflank-mailman (input) for mailman id 521152;
 Fri, 14 Apr 2023 15:58:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnLoH-0001i2-2k; Fri, 14 Apr 2023 15:58:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnLoH-0006hd-1f; Fri, 14 Apr 2023 15:58:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnLoG-0006zk-MQ; Fri, 14 Apr 2023 15:58:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pnLoG-0007Cs-Lv; Fri, 14 Apr 2023 15:58:00 +0000
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
	bh=KBuBFfQZqELlxjZoDe5vg5MXsq3VLmY7J8hnmSwdY/U=; b=MvTEoUI707dgw0asv8bo8cGx2r
	9OAyQMPxU1hhSSnvS4QiG2k6XLlA213YMNsujq6srIXb//WY61ZoSQ0O8z6n+gMxgtN278Ksl2juL
	EjMvkLUwwD8qpHYUQU2cGclOyLSfM0VCtO7ky0H99sHZMpQOB4AX9FxBTkBJtauec300=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180261-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180261: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c9fb11f92f52e06bcb1279b467a3b2667757be44
X-Osstest-Versions-That:
    ovmf=55b67b6950e648338adfe8ec54aeb26ed89d2c97
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Apr 2023 15:58:00 +0000

flight 180261 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180261/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c9fb11f92f52e06bcb1279b467a3b2667757be44
baseline version:
 ovmf                 55b67b6950e648338adfe8ec54aeb26ed89d2c97

Last test of basis   180250  2023-04-13 19:43:30 Z    0 days
Testing same since   180261  2023-04-14 13:43:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   55b67b6950..c9fb11f92f  c9fb11f92f52e06bcb1279b467a3b2667757be44 -> xen-tested-master

