Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2835988ABF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 21:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806531.1217920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suGfA-0004fb-Mo; Fri, 27 Sep 2024 19:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806531.1217920; Fri, 27 Sep 2024 19:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suGfA-0004d1-K8; Fri, 27 Sep 2024 19:30:00 +0000
Received: by outflank-mailman (input) for mailman id 806531;
 Fri, 27 Sep 2024 19:29:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suGf8-0004cp-Fu; Fri, 27 Sep 2024 19:29:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suGf8-0000Z1-Az; Fri, 27 Sep 2024 19:29:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suGf8-0002gT-0M; Fri, 27 Sep 2024 19:29:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1suGf7-0000T6-W4; Fri, 27 Sep 2024 19:29:57 +0000
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
	bh=Q4SP4YsDA6n74t/V8ZQbux3hO2f7EWHTj/CCLw+uu88=; b=QLO2dneRMXuBu1PDouasBQwaq6
	+xLqePjgAcKYlJXZHm/TI60s+RfnX79k8AuoASHkrum+8mnRyKeE3Qd1yE8aNjqMSxUWcVAJLuC65
	U+U/HPOGNeQ2Z0Gf3Fg/4l/usxMxqqKEeRhOXCEyLBlzhFj70yfqZJOVik26F47P6Yto=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187879-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187879: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8b295e0aad55cdf0c20eba6398862832ce188a0c
X-Osstest-Versions-That:
    ovmf=ded3ae2cf4ba974313f8ab043f610b1e6d3ddcdc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Sep 2024 19:29:57 +0000

flight 187879 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187879/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8b295e0aad55cdf0c20eba6398862832ce188a0c
baseline version:
 ovmf                 ded3ae2cf4ba974313f8ab043f610b1e6d3ddcdc

Last test of basis   187877  2024-09-27 13:13:17 Z    0 days
Testing same since   187879  2024-09-27 17:13:10 Z    0 days    1 attempts

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
   ded3ae2cf4..8b295e0aad  8b295e0aad55cdf0c20eba6398862832ce188a0c -> xen-tested-master

