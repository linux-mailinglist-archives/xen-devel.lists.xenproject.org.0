Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F06E737F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523148.812930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1bo-0005kp-2X; Wed, 19 Apr 2023 06:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523148.812930; Wed, 19 Apr 2023 06:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1bn-0005i5-VX; Wed, 19 Apr 2023 06:48:03 +0000
Received: by outflank-mailman (input) for mailman id 523148;
 Wed, 19 Apr 2023 06:48:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pp1bn-0005hv-Al; Wed, 19 Apr 2023 06:48:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pp1bn-0003xM-62; Wed, 19 Apr 2023 06:48:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pp1bm-0007Zd-SF; Wed, 19 Apr 2023 06:48:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pp1bm-0004tm-Rl; Wed, 19 Apr 2023 06:48:02 +0000
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
	bh=pJEdfnxb3cN5iJRZj7iINV80Uklzy2YCu8TUG4e+Zik=; b=GS0ZxmFi7C4qEYUscIXdt/I3qV
	KLrZ0x3pdAl/2pCRDAfxFrEBjKdVoqkz3VLP9LsaGlhn9M8DXJ0bqRmn2OGuy6zt8lj8sM8kmbROl
	jbPov4AhZNmJR+sZC33/9yacOBgADH7TGLQBQF8IwwFF6rlJ1zzwquUHknRcHPA0Zjh0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180307-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180307: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e3d2c08322bc61e9c5b87b3c282dd2af3d52aec6
X-Osstest-Versions-That:
    ovmf=b16284e2a0011489f6e16dfcc6af7623c3cbaf0b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Apr 2023 06:48:02 +0000

flight 180307 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180307/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e3d2c08322bc61e9c5b87b3c282dd2af3d52aec6
baseline version:
 ovmf                 b16284e2a0011489f6e16dfcc6af7623c3cbaf0b

Last test of basis   180295  2023-04-18 06:12:09 Z    1 days
Testing same since   180307  2023-04-19 04:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yi Li <yi1.li@intel.com>

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
   b16284e2a0..e3d2c08322  e3d2c08322bc61e9c5b87b3c282dd2af3d52aec6 -> xen-tested-master

