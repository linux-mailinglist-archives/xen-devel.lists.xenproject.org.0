Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBF6CA2EF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515246.797936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pglT9-0006LY-Bf; Mon, 27 Mar 2023 11:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515246.797936; Mon, 27 Mar 2023 11:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pglT9-0006Jo-7F; Mon, 27 Mar 2023 11:56:59 +0000
Received: by outflank-mailman (input) for mailman id 515246;
 Mon, 27 Mar 2023 11:56:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pglT8-0006Je-Cb; Mon, 27 Mar 2023 11:56:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pglT8-0002SK-Aa; Mon, 27 Mar 2023 11:56:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pglT7-0007Pm-Sf; Mon, 27 Mar 2023 11:56:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pglT7-0004F0-SC; Mon, 27 Mar 2023 11:56:57 +0000
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
	bh=xnERLzi10Gtn3KOu/MyjNyM7ppMfC8mH40eD60LpXHc=; b=deYctZyvlCNFZMKnSGG1uJwiWR
	EvPeHCaAHGSFuJZvmpaSGkIS6ic6XkOKVkPsgo0dU4LMnG0T7CvciNRjTIuf22+SDQfMagc1yW3+J
	yVsoDvLbMEQC1cUOeIwloVyLXAhLy0JfR9ZAtTwLYe5yC5eww+yLhelGaWOKEx/uRF/o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180028-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180028: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2bc854588309b6a9b348655297f3f82165de23a7
X-Osstest-Versions-That:
    ovmf=d55d73152ebf5c793b645d6ec5bc517d219881cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 Mar 2023 11:56:57 +0000

flight 180028 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180028/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2bc854588309b6a9b348655297f3f82165de23a7
baseline version:
 ovmf                 d55d73152ebf5c793b645d6ec5bc517d219881cd

Last test of basis   180027  2023-03-27 07:42:12 Z    0 days
Testing same since   180028  2023-03-27 09:42:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   d55d73152e..2bc8545883  2bc854588309b6a9b348655297f3f82165de23a7 -> xen-tested-master

