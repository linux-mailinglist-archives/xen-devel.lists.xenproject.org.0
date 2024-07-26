Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D28693D19F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 13:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765394.1175990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXIlN-0003Jz-9e; Fri, 26 Jul 2024 11:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765394.1175990; Fri, 26 Jul 2024 11:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXIlN-0003HS-6w; Fri, 26 Jul 2024 11:05:29 +0000
Received: by outflank-mailman (input) for mailman id 765394;
 Fri, 26 Jul 2024 11:05:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXIlL-0003HI-Ri; Fri, 26 Jul 2024 11:05:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXIlL-0001kp-MR; Fri, 26 Jul 2024 11:05:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXIlL-0004wk-Bw; Fri, 26 Jul 2024 11:05:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sXIlL-0003VZ-BW; Fri, 26 Jul 2024 11:05:27 +0000
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
	bh=L2kem68nlQjUeQEA5pi7yddtJ1ZzZx28l3E37IfbJ+4=; b=oC0rqu3yUEsfOF19c8n1oA48yi
	OeXn1Us3oJNlwaggFftXepysmKLrr1EK9z7+ocig9AV3Rs5TcBsp+RYUDkyyjN98zR6XvY7iCq8pp
	JE3SGpES1A88iU46+ykl32JgPWc3pposDx86n5jfkyy2AacuSCCtqQCb/0EQifjgRnQM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187015-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187015: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6589843cc619b3a5e2d2c0e5b12451b11a3f2288
X-Osstest-Versions-That:
    ovmf=68300746421eed4df291e4d075c1fd566d1d5169
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jul 2024 11:05:27 +0000

flight 187015 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187015/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6589843cc619b3a5e2d2c0e5b12451b11a3f2288
baseline version:
 ovmf                 68300746421eed4df291e4d075c1fd566d1d5169

Last test of basis   187014  2024-07-26 07:15:06 Z    0 days
Testing same since   187015  2024-07-26 09:43:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   6830074642..6589843cc6  6589843cc619b3a5e2d2c0e5b12451b11a3f2288 -> xen-tested-master

