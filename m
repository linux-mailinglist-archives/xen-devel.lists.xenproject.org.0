Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F605908EC6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 17:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740781.1147883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI8sm-0006fK-DU; Fri, 14 Jun 2024 15:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740781.1147883; Fri, 14 Jun 2024 15:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI8sm-0006d0-8x; Fri, 14 Jun 2024 15:30:28 +0000
Received: by outflank-mailman (input) for mailman id 740781;
 Fri, 14 Jun 2024 15:30:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sI8sk-0006cq-Nj; Fri, 14 Jun 2024 15:30:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sI8sk-0007rl-I7; Fri, 14 Jun 2024 15:30:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sI8sk-00027A-BM; Fri, 14 Jun 2024 15:30:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sI8sk-0004N2-Ak; Fri, 14 Jun 2024 15:30:26 +0000
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
	bh=aRkbbZNvo4L+FG8kbhD38NfOvh93qyESAdH61muZZMo=; b=HY4KD0MkN0nJpJnIvbeLDgQoq5
	XvL2KvVBZxZ6f+NQToCVScaWaJJobtEjvq4xuLEO8r8kFkwJM7CG71Gy/CuNJ2poY1LLF7q0QbO7X
	InB9yrplJOu4e5g4Jo1EeuzgZZarG903akiO65QDENinoQ9k26t4nOioM6XeUILefvX8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186352-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186352: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5e776299a2604b336a947e68593012ab2cc16eb4
X-Osstest-Versions-That:
    ovmf=ce91687a1b2d4e03b01abb474b4665629776f588
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Jun 2024 15:30:26 +0000

flight 186352 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186352/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5e776299a2604b336a947e68593012ab2cc16eb4
baseline version:
 ovmf                 ce91687a1b2d4e03b01abb474b4665629776f588

Last test of basis   186346  2024-06-14 07:13:40 Z    0 days
Testing same since   186352  2024-06-14 13:42:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   ce91687a1b..5e776299a2  5e776299a2604b336a947e68593012ab2cc16eb4 -> xen-tested-master

