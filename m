Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70C4A2C88
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 08:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262199.454381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDiHj-00055v-NM; Sat, 29 Jan 2022 07:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262199.454381; Sat, 29 Jan 2022 07:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDiHj-00053B-K7; Sat, 29 Jan 2022 07:36:35 +0000
Received: by outflank-mailman (input) for mailman id 262199;
 Sat, 29 Jan 2022 07:36:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDiHi-000531-0u; Sat, 29 Jan 2022 07:36:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDiHh-0003My-Tz; Sat, 29 Jan 2022 07:36:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDiHh-0007Wo-FG; Sat, 29 Jan 2022 07:36:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nDiHh-0001dq-Em; Sat, 29 Jan 2022 07:36:33 +0000
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
	bh=zZUaOC2sJ2RgpypghyGlE5nMeKqEIVTrkmXCV9LBInA=; b=AfvcxRpmz15o6Ty90QApEI2zHr
	JM5yVjh5wmwo+27bpYhGT/R+sGWLypfC7MNEMBvjH/fuIbwcJa3z/ykEKphGDcZh7PrO96F8d+AmX
	w03P0KpT88uJZkj9Fkealtw3mO7hwmXnVSqLx2/EIgzs/0aGuXFnPEvr8FY8wYPliSoU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167940-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167940: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8542fc5f956821841154d4c11851c5484847ac0d
X-Osstest-Versions-That:
    ovmf=f4b7b473b4afd0093768905529bfae09a2061d41
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Jan 2022 07:36:33 +0000

flight 167940 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167940/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8542fc5f956821841154d4c11851c5484847ac0d
baseline version:
 ovmf                 f4b7b473b4afd0093768905529bfae09a2061d41

Last test of basis   167933  2022-01-28 10:10:35 Z    0 days
Testing same since   167940  2022-01-29 01:41:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <gaoliming@byosoft.com.cn>

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
   f4b7b473b4..8542fc5f95  8542fc5f956821841154d4c11851c5484847ac0d -> xen-tested-master

