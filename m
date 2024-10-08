Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE5993D3D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 05:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812589.1225358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy0VL-0006M5-Go; Tue, 08 Oct 2024 03:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812589.1225358; Tue, 08 Oct 2024 03:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy0VL-0006JA-D2; Tue, 08 Oct 2024 03:03:19 +0000
Received: by outflank-mailman (input) for mailman id 812589;
 Tue, 08 Oct 2024 03:03:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sy0VJ-0006J0-Kh; Tue, 08 Oct 2024 03:03:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sy0VJ-0007Pu-JC; Tue, 08 Oct 2024 03:03:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sy0VJ-0008Ce-8M; Tue, 08 Oct 2024 03:03:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sy0VJ-000662-7u; Tue, 08 Oct 2024 03:03:17 +0000
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
	bh=wD666rq1Na+w+1mlwO7dfUMr92aZ6tlE2aRDCWhKv2A=; b=2VE/ajqNduH2SIUB7UUU1dPYKH
	vML6AypEKmlVBLk2CQCv4NPGm+JQpC8vJu+cwg9Am/YyYC6Xc/aQNDbSU8/HPaNpSn4mLne1UjfaW
	hw+9w0BBF6w8AxdNk98CVYKv86DhC4tp3ASCLoLVUBpcyAakXPseC2Kd9IugVqqfg3lw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188004-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188004: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d99045f39220e2ad075ae5b93b53bbabd5923cb4
X-Osstest-Versions-That:
    ovmf=596773f5e33ec03968b8e8621ff4958b3eeaf412
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Oct 2024 03:03:17 +0000

flight 188004 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188004/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d99045f39220e2ad075ae5b93b53bbabd5923cb4
baseline version:
 ovmf                 596773f5e33ec03968b8e8621ff4958b3eeaf412

Last test of basis   187996  2024-10-07 07:43:20 Z    0 days
Testing same since   188004  2024-10-08 00:41:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>

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
   596773f5e3..d99045f392  d99045f39220e2ad075ae5b93b53bbabd5923cb4 -> xen-tested-master

