Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309276B3D78
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 12:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508475.783156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paaj1-0003wM-Nv; Fri, 10 Mar 2023 11:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508475.783156; Fri, 10 Mar 2023 11:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paaj1-0003u0-Kk; Fri, 10 Mar 2023 11:15:51 +0000
Received: by outflank-mailman (input) for mailman id 508475;
 Fri, 10 Mar 2023 11:15:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paaj0-0003tq-9T; Fri, 10 Mar 2023 11:15:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paaiz-0000XY-Oe; Fri, 10 Mar 2023 11:15:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paaiz-000386-Bt; Fri, 10 Mar 2023 11:15:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1paaiz-0000qy-9L; Fri, 10 Mar 2023 11:15:49 +0000
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
	bh=a7BsgjCjAp1mG8TySNmO/5Tl6zKJYTW0cUWH5LJxJaM=; b=O3pg2g/ft9G2BJnkWvzCruFQvy
	n1Bg4p+eWTjigHRJebAUpZP1/BOQCBcKfLuiW4q7H08aPLogbxGvcRfbVdnDFE66UN4IU6YIbtWqB
	6Ymia+Y4W18btJyoZ6ACgk7cdZkosllIWJgFzRIzLvvfw0rmyAIVvH64ZToK8Nc2TS8E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179532-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179532: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a4c9c2b0f00a8f950b3058d4e97534a2613ed8bf
X-Osstest-Versions-That:
    ovmf=4ca4041b0dbb310109d9cb047ed428a0082df395
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Mar 2023 11:15:49 +0000

flight 179532 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179532/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a4c9c2b0f00a8f950b3058d4e97534a2613ed8bf
baseline version:
 ovmf                 4ca4041b0dbb310109d9cb047ed428a0082df395

Last test of basis   179530  2023-03-10 06:12:17 Z    0 days
Testing same since   179532  2023-03-10 09:10:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Darbin Reyes <darbin.reyes@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Hao A Wu <hao.a.wu@intel.com>
  Yu Pu <yu.pu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   4ca4041b0d..a4c9c2b0f0  a4c9c2b0f00a8f950b3058d4e97534a2613ed8bf -> xen-tested-master

