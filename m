Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A32996237
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813843.1226887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRr8-0007n6-6Z; Wed, 09 Oct 2024 08:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813843.1226887; Wed, 09 Oct 2024 08:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRr8-0007kt-3y; Wed, 09 Oct 2024 08:15:38 +0000
Received: by outflank-mailman (input) for mailman id 813843;
 Wed, 09 Oct 2024 08:15:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syRr7-0007kj-7r; Wed, 09 Oct 2024 08:15:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syRr7-00044y-6m; Wed, 09 Oct 2024 08:15:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syRr6-0000Mo-LC; Wed, 09 Oct 2024 08:15:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syRr6-0008Qw-Kj; Wed, 09 Oct 2024 08:15:36 +0000
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
	bh=soFbHUusaKNvv+yLFwyhHdf3DA2BCjVCHhGMbFg3Ey8=; b=teyQklaGSa5OGy01R7qHGzEO/w
	RLYRI143GKaBLM7qrSGTDHC+K4kxqu3V6VhaPpMO2rm0/9m07niXw2MxP7elPFL0x3eHnqOJGL9a1
	BQ93zxmGeAfPClWPdirVAVeszvNjyDJG3+3NR7wNxjN/6ab/mzyEAs32JcgIKfr9E1AE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188023-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188023: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fd619ec4608564fe6cf5ba8f9ae986206355861e
X-Osstest-Versions-That:
    ovmf=06da7daab1eb129a1bf3eb93ed74c102d1587071
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2024 08:15:36 +0000

flight 188023 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188023/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fd619ec4608564fe6cf5ba8f9ae986206355861e
baseline version:
 ovmf                 06da7daab1eb129a1bf3eb93ed74c102d1587071

Last test of basis   188020  2024-10-09 02:41:45 Z    0 days
Testing same since   188023  2024-10-09 06:15:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   06da7daab1..fd619ec460  fd619ec4608564fe6cf5ba8f9ae986206355861e -> xen-tested-master

