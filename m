Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CBF6F179A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527280.819738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN6O-0008TV-Kd; Fri, 28 Apr 2023 12:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527280.819738; Fri, 28 Apr 2023 12:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN6O-0008Qx-Hh; Fri, 28 Apr 2023 12:21:28 +0000
Received: by outflank-mailman (input) for mailman id 527280;
 Fri, 28 Apr 2023 12:21:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psN6M-0008Qi-Ct; Fri, 28 Apr 2023 12:21:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psN6M-0004DA-8K; Fri, 28 Apr 2023 12:21:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psN6L-0004xa-Ua; Fri, 28 Apr 2023 12:21:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psN6L-0000yt-UA; Fri, 28 Apr 2023 12:21:25 +0000
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
	bh=DSG7FFoq2INCoQh9buaKvYHAPxW5ZY9fiuNDPPwHhpo=; b=2zK80gB1Z8CK2eKPK76aOKGmJ/
	T/Zyqg7uqQDhSxuKRtj4OuxC/xJ/Ov7TXGLPgdMLBc0k5xd5wEfSoxVtyyIWpVV0tjljPWNNE9aXj
	+YvXGJEH5b8d9FobbNpNgKZUH4cK0lUIqZGV6O+etIwCsAh0Nq6xeMlhsx63Y+9ZpmWk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180467-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180467: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ecbcff0f4935395f66ecc9e9ac76b804ecdec2e8
X-Osstest-Versions-That:
    ovmf=95ef765839a8d0de52095e3dec3584fc347b94b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Apr 2023 12:21:25 +0000

flight 180467 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180467/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ecbcff0f4935395f66ecc9e9ac76b804ecdec2e8
baseline version:
 ovmf                 95ef765839a8d0de52095e3dec3584fc347b94b2

Last test of basis   180463  2023-04-28 06:10:48 Z    0 days
Testing same since   180467  2023-04-28 09:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>
  Nickle Wang <nicklew@nvidia.com>

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
   95ef765839..ecbcff0f49  ecbcff0f4935395f66ecc9e9ac76b804ecdec2e8 -> xen-tested-master

