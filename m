Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702AF74037C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 20:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556237.868599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEDVx-0008Mg-Jq; Tue, 27 Jun 2023 18:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556237.868599; Tue, 27 Jun 2023 18:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEDVx-0008Kz-HA; Tue, 27 Jun 2023 18:34:09 +0000
Received: by outflank-mailman (input) for mailman id 556237;
 Tue, 27 Jun 2023 18:34:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEDVv-0008Kp-NW; Tue, 27 Jun 2023 18:34:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEDVv-0001rp-D1; Tue, 27 Jun 2023 18:34:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEDVv-0006pV-0Q; Tue, 27 Jun 2023 18:34:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEDVu-0001ol-WF; Tue, 27 Jun 2023 18:34:07 +0000
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
	bh=+eBDZqMJGehslz3cMVhbRQ1pw7jlZIll0CfALl6Yq3U=; b=KRt+g+q6/d3sLD6v/Nz0EbgNFx
	1vBNerpWGNqQYL47jdVx1DeM/hx1fzTWKJE+zXW2/jMbjf0FcG1fsW/5687xLwF1TVxmH7M2SVpj9
	DP0wLqOLeHq/9RijdGyuzXHMQyGq4dxaHyQzqyVKwM+KkpoMWgt1Ah5I+kfkyNq/Az/M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181615-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181615: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ea7a3015a2404e1358218463dd25df5ae7615352
X-Osstest-Versions-That:
    ovmf=28eb51dd54217d48869a8f02534243404308482a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Jun 2023 18:34:06 +0000

flight 181615 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181615/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ea7a3015a2404e1358218463dd25df5ae7615352
baseline version:
 ovmf                 28eb51dd54217d48869a8f02534243404308482a

Last test of basis   181612  2023-06-27 10:43:49 Z    0 days
Testing same since   181615  2023-06-27 16:42:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>

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
   28eb51dd54..ea7a3015a2  ea7a3015a2404e1358218463dd25df5ae7615352 -> xen-tested-master

