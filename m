Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B449A07DB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819962.1233455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11em-0004Tf-1T; Wed, 16 Oct 2024 10:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819962.1233455; Wed, 16 Oct 2024 10:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11el-0004RF-U0; Wed, 16 Oct 2024 10:53:31 +0000
Received: by outflank-mailman (input) for mailman id 819962;
 Wed, 16 Oct 2024 10:53:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t11ek-0004R3-0q; Wed, 16 Oct 2024 10:53:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t11ej-0000DP-NK; Wed, 16 Oct 2024 10:53:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t11ej-0005HA-DO; Wed, 16 Oct 2024 10:53:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t11ej-0000dl-Cw; Wed, 16 Oct 2024 10:53:29 +0000
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
	bh=5eL4c9vH/tf89mZb/6LgwvWtt6fu/ivLQLKltxBGs9g=; b=4Kk6qrZ+KNZoZY5dy0hS8+m5Ix
	vJDnLjuP7GidPUGJyXl27Rm19uX+v32XAGlBWh4EkMz4Qj1rYXSkGswX2GEq8JEWlU9wVi2tBfd4M
	vTSEUF0nS63JZX/ervduCigYn18oDDMguh2r6Plz6It39mHGfl+0RJiS3ddq+kMoREyY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d44b82270b6b1589cc2850fde24a3686cb5ef779
X-Osstest-Versions-That:
    ovmf=a232e0cd2fe2bb882a5dd0cafe322a2899a44d51
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Oct 2024 10:53:29 +0000

flight 188114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d44b82270b6b1589cc2850fde24a3686cb5ef779
baseline version:
 ovmf                 a232e0cd2fe2bb882a5dd0cafe322a2899a44d51

Last test of basis   188107  2024-10-16 04:13:13 Z    0 days
Testing same since   188114  2024-10-16 08:44:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  kuqin12 <42554914+kuqin12@users.noreply.github.com>
  Raymond Diaz <raymonddiaz@microsoft.com>

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
   a232e0cd2f..d44b82270b  d44b82270b6b1589cc2850fde24a3686cb5ef779 -> xen-tested-master

