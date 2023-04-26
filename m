Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1EF6EF12D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 11:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526609.818486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prbRl-0008AA-Rn; Wed, 26 Apr 2023 09:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526609.818486; Wed, 26 Apr 2023 09:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prbRl-000885-P3; Wed, 26 Apr 2023 09:28:21 +0000
Received: by outflank-mailman (input) for mailman id 526609;
 Wed, 26 Apr 2023 09:28:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prbRl-00087v-01; Wed, 26 Apr 2023 09:28:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prbRk-0007X5-O4; Wed, 26 Apr 2023 09:28:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prbRk-0005ci-EQ; Wed, 26 Apr 2023 09:28:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1prbRk-0006SL-E1; Wed, 26 Apr 2023 09:28:20 +0000
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
	bh=BW38ziko93v2XHUfx6IUbK/3fFV5RFEYgxJOznr++7g=; b=1RwscuhgFLulJgYCe0tMKZUsYk
	9+W4OgIFZrfOOvGJg3EBO/1iZvKxAMGapXeOeY0CKfkBpZsIObN+XvUcr3MuWsWbiw715U1wHjHtT
	1NiRCjr8PKGk+IxFAawjy1AbJJX3YbkGLfMK2QPADAbPPUQD+1HjFFsX8CcyoQtTum2s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180423-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180423: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5a349b96b171e85744024904b0c8453d06d2fb45
X-Osstest-Versions-That:
    ovmf=18f463edbaa911b6e2c32a3e783bf6c2c9997512
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Apr 2023 09:28:20 +0000

flight 180423 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180423/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5a349b96b171e85744024904b0c8453d06d2fb45
baseline version:
 ovmf                 18f463edbaa911b6e2c32a3e783bf6c2c9997512

Last test of basis   180409  2023-04-25 11:10:48 Z    0 days
Testing same since   180423  2023-04-26 03:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Igor Kulchytskyy <igork@ami.com>

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
   18f463edba..5a349b96b1  5a349b96b171e85744024904b0c8453d06d2fb45 -> xen-tested-master

