Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9AD6043FD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 13:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425775.673826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol7fN-0003h3-R5; Wed, 19 Oct 2022 11:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425775.673826; Wed, 19 Oct 2022 11:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol7fN-0003fC-O7; Wed, 19 Oct 2022 11:55:21 +0000
Received: by outflank-mailman (input) for mailman id 425775;
 Wed, 19 Oct 2022 11:55:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol7fM-0003f2-TS; Wed, 19 Oct 2022 11:55:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol7fM-0002b2-Qf; Wed, 19 Oct 2022 11:55:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol7fM-0002UZ-Gi; Wed, 19 Oct 2022 11:55:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ol7fM-00020W-GF; Wed, 19 Oct 2022 11:55:20 +0000
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
	bh=QqRapo815BkPu7Ambx+98i2sdlinKB0p9MWohgX97d4=; b=ZowwF+qqTVZQnP0dlS3Qw2nWHB
	iZXmrOcXWdl3UfgkmJb7CqgKHqS0Jcy3H/H/2VFGSeWQ5UUbYIK9nW6mpzktJMLqtiOmSrtYkif1m
	lgY4tn0AT9L+WP/Xr8MqxC4wCY+aZc35lmYwilxVwmnJUeVpufLPw+sfV0cCwYvIuvTM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174081: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0f6eccdbf75885631221388d362417eb7b873ce0
X-Osstest-Versions-That:
    ovmf=c4663e7277d12835a886994919822e218a01b62e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Oct 2022 11:55:20 +0000

flight 174081 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174081/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0f6eccdbf75885631221388d362417eb7b873ce0
baseline version:
 ovmf                 c4663e7277d12835a886994919822e218a01b62e

Last test of basis   174075  2022-10-19 04:40:29 Z    0 days
Testing same since   174081  2022-10-19 08:11:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   c4663e7277..0f6eccdbf7  0f6eccdbf75885631221388d362417eb7b873ce0 -> xen-tested-master

