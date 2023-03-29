Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E56CF167
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 19:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516325.800263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phZtt-0000vk-B3; Wed, 29 Mar 2023 17:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516325.800263; Wed, 29 Mar 2023 17:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phZtt-0000tu-89; Wed, 29 Mar 2023 17:47:57 +0000
Received: by outflank-mailman (input) for mailman id 516325;
 Wed, 29 Mar 2023 17:47:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phZts-0000tk-O4; Wed, 29 Mar 2023 17:47:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phZts-00021v-Lb; Wed, 29 Mar 2023 17:47:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phZts-000175-6t; Wed, 29 Mar 2023 17:47:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1phZts-0005uS-6R; Wed, 29 Mar 2023 17:47:56 +0000
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
	bh=uXn5mNE2ZifXKdxEIdPvvEXJ8cigq+YPNmLC7ELXT0A=; b=QIPJacVplGLp3QFZgsVm8pX+8Y
	CwcMq/L0PvxrSkrHp0ePC9oE9+Drz0Jot5rkSAB67bg8MQucWeRERVOd8VHkfVAdPbKNFXhLyMSIJ
	p8hhgQ/9mdi37cIxU+r003UK/yhFpD2bJVcPtBCmkuSzivqPvjC8ITa0dir0DOY32EKs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180054-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180054: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6f415f8af48d0ba3e5d4719062a62cbfc3577227
X-Osstest-Versions-That:
    ovmf=b697a31a8db5f23ed1030f0fea1b56c107ca85a3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Mar 2023 17:47:56 +0000

flight 180054 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180054/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6f415f8af48d0ba3e5d4719062a62cbfc3577227
baseline version:
 ovmf                 b697a31a8db5f23ed1030f0fea1b56c107ca85a3

Last test of basis   180053  2023-03-29 13:10:42 Z    0 days
Testing same since   180054  2023-03-29 15:42:14 Z    0 days    1 attempts

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
   b697a31a8d..6f415f8af4  6f415f8af48d0ba3e5d4719062a62cbfc3577227 -> xen-tested-master

