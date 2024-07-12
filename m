Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D192F566
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 08:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757774.1166908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS9ZY-0003OC-JC; Fri, 12 Jul 2024 06:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757774.1166908; Fri, 12 Jul 2024 06:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS9ZY-0003LN-FA; Fri, 12 Jul 2024 06:16:00 +0000
Received: by outflank-mailman (input) for mailman id 757774;
 Fri, 12 Jul 2024 06:15:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS9ZX-0003LB-08; Fri, 12 Jul 2024 06:15:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS9ZW-00034K-UB; Fri, 12 Jul 2024 06:15:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS9ZW-0002Wh-Ir; Fri, 12 Jul 2024 06:15:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sS9ZW-0007RR-IW; Fri, 12 Jul 2024 06:15:58 +0000
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
	bh=fKcjrJfeN9+8PcfrHvH4DjJsdFuAP+oC6cAm5yxQILc=; b=ZgMdC8sbvcBYfIn2mEeGMkz/fA
	a0tFIQXO9cb4dilGqed5ZREqcz1laGEA5tyiatNg0G41u6GyF4Qs3no6IyFXX/5ILwfjgQ/0hFAgR
	VC9xL22kR1CMjp+IBPrF2f7ZrlntabJGaT4b54VtZJzh8xkRVXamFWQdNQYU/iaEpjUs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186772-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186772: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=72d6e247b781cca65aac71c97c5094650b003a9d
X-Osstest-Versions-That:
    ovmf=f122c6f639cd3babedc0dd9b38b279d94b087c7a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jul 2024 06:15:58 +0000

flight 186772 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186772/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 72d6e247b781cca65aac71c97c5094650b003a9d
baseline version:
 ovmf                 f122c6f639cd3babedc0dd9b38b279d94b087c7a

Last test of basis   186770  2024-07-12 02:11:12 Z    0 days
Testing same since   186772  2024-07-12 04:11:24 Z    0 days    1 attempts

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
   f122c6f639..72d6e247b7  72d6e247b781cca65aac71c97c5094650b003a9d -> xen-tested-master

