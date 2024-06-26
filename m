Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535DC9176EE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 05:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748305.1155933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMJbs-0004vs-Vq; Wed, 26 Jun 2024 03:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748305.1155933; Wed, 26 Jun 2024 03:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMJbs-0004t0-Rz; Wed, 26 Jun 2024 03:46:16 +0000
Received: by outflank-mailman (input) for mailman id 748305;
 Wed, 26 Jun 2024 03:46:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMJbr-0004sq-B1; Wed, 26 Jun 2024 03:46:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMJbr-0004Bx-A4; Wed, 26 Jun 2024 03:46:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMJbq-00075e-W4; Wed, 26 Jun 2024 03:46:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMJbq-0008Hc-VW; Wed, 26 Jun 2024 03:46:14 +0000
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
	bh=HosKY/nVlBmZ4ncJ4+yLTogNFiZbnhMee+z/YJv5f68=; b=WljJVKbZ9REY9n+ZEK3sVCqKFE
	R6i/dhSaTLo2lyfEJiaZrgqiHq+/QB6Nw8dKfe/uf+FL/WMkLNN2vbogiw6ht5lUsv0EXrqAfTV+/
	ic8ZeY1OH/vs3hrcVUcu5eOvG4ctBGjG4EO0vBy71aFjj9r8b3ltK2xoPYVgw6lj5Mc4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186505-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186505: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0333faf50e49d3b3ea2c624b4d403b405b3107a1
X-Osstest-Versions-That:
    ovmf=dc93ff8a5561a3085eeda9d4ac00d40545eb43cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2024 03:46:14 +0000

flight 186505 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186505/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0333faf50e49d3b3ea2c624b4d403b405b3107a1
baseline version:
 ovmf                 dc93ff8a5561a3085eeda9d4ac00d40545eb43cd

Last test of basis   186502  2024-06-26 00:13:00 Z    0 days
Testing same since   186505  2024-06-26 02:03:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dongyan Qian <qiandongyan@loongson.cn>
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   dc93ff8a55..0333faf50e  0333faf50e49d3b3ea2c624b4d403b405b3107a1 -> xen-tested-master

