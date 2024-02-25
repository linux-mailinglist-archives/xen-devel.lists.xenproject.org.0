Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB06862D76
	for <lists+xen-devel@lfdr.de>; Sun, 25 Feb 2024 23:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685223.1065634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reNOf-0005bP-6z; Sun, 25 Feb 2024 22:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685223.1065634; Sun, 25 Feb 2024 22:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reNOf-0005ZL-4R; Sun, 25 Feb 2024 22:55:01 +0000
Received: by outflank-mailman (input) for mailman id 685223;
 Sun, 25 Feb 2024 22:55:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reNOe-0005ZB-6w; Sun, 25 Feb 2024 22:55:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reNOe-0003Xr-2g; Sun, 25 Feb 2024 22:55:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reNOd-0003Tp-K6; Sun, 25 Feb 2024 22:54:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1reNOd-0000C1-Jh; Sun, 25 Feb 2024 22:54:59 +0000
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
	bh=Eqr8O2rwvQGi28uLtowinEGx7awVmOpsdX4JzPd5CfI=; b=CBh+S7ZXqUqNcMyM04T8yojc1B
	U5IsISM1NTFgny4J36M6pRRz7d7wzuOtgKBvlqwbPIWZazeZvNte1pAAL42fIjx5tqdsWoa/qnIGb
	/YOU6Mby7fmq/FA0ufJNNi8HXH0JjpeOSXI0IEmV64rMOcuoZZgxApXVeAxAFIlfnE6A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184761-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184761: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ba96acd963e794e86633ffd5e7f96cbc03db673c
X-Osstest-Versions-That:
    ovmf=f881b4d129602a49e3403043fc27550a74453234
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 25 Feb 2024 22:54:59 +0000

flight 184761 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184761/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ba96acd963e794e86633ffd5e7f96cbc03db673c
baseline version:
 ovmf                 f881b4d129602a49e3403043fc27550a74453234

Last test of basis   184759  2024-02-25 17:44:36 Z    0 days
Testing same since   184761  2024-02-25 20:12:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Woodhouse <dwmw@amazon.co.uk>

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
   f881b4d129..ba96acd963  ba96acd963e794e86633ffd5e7f96cbc03db673c -> xen-tested-master

