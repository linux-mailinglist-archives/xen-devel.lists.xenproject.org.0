Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F3975C4C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 23:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796875.1206588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soUeY-0007T8-1J; Wed, 11 Sep 2024 21:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796875.1206588; Wed, 11 Sep 2024 21:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soUeX-0007RT-Ul; Wed, 11 Sep 2024 21:13:29 +0000
Received: by outflank-mailman (input) for mailman id 796875;
 Wed, 11 Sep 2024 21:13:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soUeW-0007RJ-KH; Wed, 11 Sep 2024 21:13:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soUeW-0003tT-HL; Wed, 11 Sep 2024 21:13:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soUeW-0005k0-5r; Wed, 11 Sep 2024 21:13:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soUeW-0004wi-5J; Wed, 11 Sep 2024 21:13:28 +0000
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
	bh=4WwZ6xCUJg7VEvKgZIWEncc1eJelaTJveNf9AbFrjFQ=; b=UOz0OueqglfPJ9g1qoVG3F8g8/
	eeP1YFi9PaMFO0kcSnoGxP77pFNJBTtXNYbxlHo4mbbqrt4Q22XooTJatPGixgZpm2R2e1jXEbuBx
	p4OOiiab2ewBw9Pvn2J/jPsvcesORtLifHtWkUw69gGl+JGRuFTDW3fhuoQ/TbFzo9pY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187662-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187662: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f2557032d61e7a6bf1eb76eca5e836e7de991b8a
X-Osstest-Versions-That:
    ovmf=589304e67fbfcbb7c250d1a3031ef23c4fb8a41b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Sep 2024 21:13:28 +0000

flight 187662 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187662/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f2557032d61e7a6bf1eb76eca5e836e7de991b8a
baseline version:
 ovmf                 589304e67fbfcbb7c250d1a3031ef23c4fb8a41b

Last test of basis   187660  2024-09-11 16:45:13 Z    0 days
Testing same since   187662  2024-09-11 19:41:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>

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
   589304e67f..f2557032d6  f2557032d61e7a6bf1eb76eca5e836e7de991b8a -> xen-tested-master

