Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D17546DD
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jul 2023 06:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563851.881305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKWyk-0002jU-JV; Sat, 15 Jul 2023 04:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563851.881305; Sat, 15 Jul 2023 04:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKWyk-0002hD-GK; Sat, 15 Jul 2023 04:33:58 +0000
Received: by outflank-mailman (input) for mailman id 563851;
 Sat, 15 Jul 2023 04:33:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKWyi-0002h3-G6; Sat, 15 Jul 2023 04:33:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKWyi-0006ou-4d; Sat, 15 Jul 2023 04:33:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKWyh-0000VQ-Ly; Sat, 15 Jul 2023 04:33:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qKWyh-0006H3-Lc; Sat, 15 Jul 2023 04:33:55 +0000
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
	bh=kQIZA4ocPK0BXDhFzZpyfV9+qB6ZUqKUDS24ytwrsNk=; b=DUIKZTRcNxXHhTk2/OY4/pckyV
	nwILc9AxkHgI4UPPOOTDiVz6Ea29TIANxo30aBIDHgpijOLoBpDoVCAsaLM8bToz254m8RiQJRKwh
	PMsLE4yupB4MKo47r62nM975AqobDFrpWKM6zBzIIzBs80hrZ87vcB2dipOucUiyY8BE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181806-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181806: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e674096accc8e57cd0dd84679905e1222423251e
X-Osstest-Versions-That:
    ovmf=ff3382a51ca726a90f49623a2b2d2e8ad8459ce2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jul 2023 04:33:55 +0000

flight 181806 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181806/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e674096accc8e57cd0dd84679905e1222423251e
baseline version:
 ovmf                 ff3382a51ca726a90f49623a2b2d2e8ad8459ce2

Last test of basis   181786  2023-07-13 17:42:16 Z    1 days
Testing same since   181802  2023-07-14 23:12:30 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tom Lendacky <thomas.lendacky@amd.com>

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
   ff3382a51c..e674096acc  e674096accc8e57cd0dd84679905e1222423251e -> xen-tested-master

