Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C088E7E89B5
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 09:03:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630883.984051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1iwJ-0000fX-Dc; Sat, 11 Nov 2023 08:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630883.984051; Sat, 11 Nov 2023 08:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1iwJ-0000dP-Ap; Sat, 11 Nov 2023 08:01:59 +0000
Received: by outflank-mailman (input) for mailman id 630883;
 Sat, 11 Nov 2023 08:01:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1iwH-0000dF-Mn; Sat, 11 Nov 2023 08:01:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1iwG-000109-Uq; Sat, 11 Nov 2023 08:01:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1iwG-00046g-Ga; Sat, 11 Nov 2023 08:01:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r1iwG-00024a-G9; Sat, 11 Nov 2023 08:01:56 +0000
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
	bh=iOCT4dGveLVf7SxTOO0guXl3ymkUPwgySTd+wgcOFXE=; b=R80qK7/ltcgry1IUv8C3ZpUhj0
	ePUO2jL3PAnGW8XOHnECDbSFj/fsaKgNOGnYKZK6K8BTAI/klSy/SFyBbpa6R7oEMgQ/ufxdH13os
	YMuiWpx3wM5aYNoignjcg6KL8UypuPolUHEoQ/h16hjMr46CJfwDUG3xQX7GXuVEAnWs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183733-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183733: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=33deaa3b845f0d588ffd068003558be46f90aaac
X-Osstest-Versions-That:
    ovmf=589f2e49e5f9ff998bd4f08cbf28a1572ab7b544
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Nov 2023 08:01:56 +0000

flight 183733 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183733/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 33deaa3b845f0d588ffd068003558be46f90aaac
baseline version:
 ovmf                 589f2e49e5f9ff998bd4f08cbf28a1572ab7b544

Last test of basis   183725  2023-11-10 01:45:00 Z    1 days
Testing same since   183733  2023-11-11 02:41:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   589f2e49e5..33deaa3b84  33deaa3b845f0d588ffd068003558be46f90aaac -> xen-tested-master

