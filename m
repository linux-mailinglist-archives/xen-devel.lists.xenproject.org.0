Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7D57E99F
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jul 2022 00:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373497.605719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oF14f-0004ZS-Kh; Fri, 22 Jul 2022 22:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373497.605719; Fri, 22 Jul 2022 22:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oF14f-0004Wo-Gs; Fri, 22 Jul 2022 22:24:45 +0000
Received: by outflank-mailman (input) for mailman id 373497;
 Fri, 22 Jul 2022 22:24:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oF14e-0004We-3L; Fri, 22 Jul 2022 22:24:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oF14e-0007XG-2P; Fri, 22 Jul 2022 22:24:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oF14d-0004kb-Nr; Fri, 22 Jul 2022 22:24:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oF14d-0000di-NL; Fri, 22 Jul 2022 22:24:43 +0000
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
	bh=PZuPN/xj6e81JhaZbl/vDhkVQQNyb3xp1hTQsJuoR5c=; b=0rmXOKF9gNHkgioNUCbvyAJYtY
	qxv34Mxl6t2xiKXYca5DT/LY7wpYddRMSNbSkCBQMT8zHaKF+FSj6Fj86eCu+a15+ckI3VP9mMbON
	PUmu7gh86IVreRtolN4WSchr1qeJAYDVt2qnGWByqxil48ZSoxwMpIztXRAKmLNLebRI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171781-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171781: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5a3641bfcdcf99fd76817833488f2af8abb69383
X-Osstest-Versions-That:
    ovmf=c8af26627a4e9a3659255dc147d75596da08248e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Jul 2022 22:24:43 +0000

flight 171781 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171781/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5a3641bfcdcf99fd76817833488f2af8abb69383
baseline version:
 ovmf                 c8af26627a4e9a3659255dc147d75596da08248e

Last test of basis   171776  2022-07-22 17:41:16 Z    0 days
Testing same since   171781  2022-07-22 19:41:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   c8af26627a..5a3641bfcd  5a3641bfcdcf99fd76817833488f2af8abb69383 -> xen-tested-master

