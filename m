Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE238065A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 11:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127281.239190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUHR-0007TV-Ml; Fri, 14 May 2021 09:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127281.239190; Fri, 14 May 2021 09:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUHR-0007R1-Iz; Fri, 14 May 2021 09:38:49 +0000
Received: by outflank-mailman (input) for mailman id 127281;
 Fri, 14 May 2021 09:38:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhUHP-0007Qr-Hf; Fri, 14 May 2021 09:38:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhUHP-0005dM-Fu; Fri, 14 May 2021 09:38:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhUHP-0001zA-5E; Fri, 14 May 2021 09:38:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lhUHP-0000fa-4i; Fri, 14 May 2021 09:38:47 +0000
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
	bh=JxkINIF3SO5KM6aci/6y4GM/w3B52SONwayuDv5EKp0=; b=hf0qEcx7MRIrpJVdUjJKbKPFjm
	Y4yXJ5fT5JestONM/XWjRb2ngMm+XrMDD5h7F+Kk5xII204o7cpn6EHndQqRbMi5+D2OnfBAYPCBm
	6cK3uZk1AQC15HnOP4MR42B7oDs9fkumVzNRSu39dzWErz6uU6r76yT5jLY2F3BUDtrY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161943-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161943: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=22ac5cc9d9db34056f7c97e994fd9def683ebb2e
X-Osstest-Versions-That:
    ovmf=5531fd48ded1271b8775725355ab83994e4bc77c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 May 2021 09:38:47 +0000

flight 161943 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161943/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 22ac5cc9d9db34056f7c97e994fd9def683ebb2e
baseline version:
 ovmf                 5531fd48ded1271b8775725355ab83994e4bc77c

Last test of basis   161912  2021-05-12 02:02:58 Z    2 days
Testing same since   161943  2021-05-14 03:41:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sachin Agrawal <sachin.agrawal@intel.com>

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
   5531fd48de..22ac5cc9d9  22ac5cc9d9db34056f7c97e994fd9def683ebb2e -> xen-tested-master

