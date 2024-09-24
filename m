Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974FD984E38
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 00:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803362.1213894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stESx-0007J1-5W; Tue, 24 Sep 2024 22:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803362.1213894; Tue, 24 Sep 2024 22:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stESx-0007H8-2Y; Tue, 24 Sep 2024 22:57:07 +0000
Received: by outflank-mailman (input) for mailman id 803362;
 Tue, 24 Sep 2024 22:57:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stESv-0007Gy-Ff; Tue, 24 Sep 2024 22:57:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stESv-0002oW-C7; Tue, 24 Sep 2024 22:57:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stESu-0008Hy-Sd; Tue, 24 Sep 2024 22:57:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1stESu-0003wi-SD; Tue, 24 Sep 2024 22:57:04 +0000
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
	bh=Ci7Wa65QKB0krVFHzPsNW+V/9gMceynk4RpmkzIYQFM=; b=WsR5UCaJAzByZUiq+ku+BEEPf5
	k/YhbUF3Q/+3xc0t1+dV5Ee/JrFF/FylVrOuNoI9lggwtmPzMbO15p/sf3Fm+GOVlsdUnsMIp6Kcd
	W1pD/eKmEZmV6Ex+5/5rM4wci2IJRkQJY00DdoW51zs14+4pkXKQj/dfHzhmUWO2tFrU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187849-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187849: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b8122cc9d8b6c9017905ac5f4c846b4c0f535d01
X-Osstest-Versions-That:
    ovmf=a131839a3db7f933f51efc6c13d5986d7f09eab3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Sep 2024 22:57:04 +0000

flight 187849 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187849/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b8122cc9d8b6c9017905ac5f4c846b4c0f535d01
baseline version:
 ovmf                 a131839a3db7f933f51efc6c13d5986d7f09eab3

Last test of basis   187833  2024-09-23 18:41:31 Z    1 days
Testing same since   187849  2024-09-24 17:13:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

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
   a131839a3d..b8122cc9d8  b8122cc9d8b6c9017905ac5f4c846b4c0f535d01 -> xen-tested-master

