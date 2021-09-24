Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8841780E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195502.348236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTnXl-0000eZ-O0; Fri, 24 Sep 2021 15:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195502.348236; Fri, 24 Sep 2021 15:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTnXl-0000bR-KF; Fri, 24 Sep 2021 15:55:21 +0000
Received: by outflank-mailman (input) for mailman id 195502;
 Fri, 24 Sep 2021 15:55:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTnXj-0000bH-Ur; Fri, 24 Sep 2021 15:55:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTnXj-0004SU-MQ; Fri, 24 Sep 2021 15:55:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTnXj-0000oI-EO; Fri, 24 Sep 2021 15:55:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mTnXj-0003J9-Du; Fri, 24 Sep 2021 15:55:19 +0000
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
	bh=KdTQVxKwPBteNtqr652iRXsPOVdIWVu6htTmBZNUG+M=; b=V7ojLSxEw71fXUorvu63XUMuLr
	E3THUa+1DPk+7hcO9ZuLEng/c+MX0gVwxEnTfZadNT5p0+MkRGE4Q541tDPlh99p3cRPUydsjozeQ
	n8eZ5pGmj66vLYhQBsjvbO5KPZJeauQgHUDLIUudRJQxNiBbbJMe5ONyFWeOYG2O4qCo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165175-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165175: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d60915b7516c87ec49ad579a1cb8ff9226d85928
X-Osstest-Versions-That:
    ovmf=7ea7f9c07757b9445c24b23acf4c2e8e60b30b7e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Sep 2021 15:55:19 +0000

flight 165175 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165175/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d60915b7516c87ec49ad579a1cb8ff9226d85928
baseline version:
 ovmf                 7ea7f9c07757b9445c24b23acf4c2e8e60b30b7e

Last test of basis   165170  2021-09-23 18:41:23 Z    0 days
Testing same since   165175  2021-09-24 03:46:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   7ea7f9c077..d60915b751  d60915b7516c87ec49ad579a1cb8ff9226d85928 -> xen-tested-master

