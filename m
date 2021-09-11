Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1940741F
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 02:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184892.333697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOqWs-0007xk-8f; Sat, 11 Sep 2021 00:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184892.333697; Sat, 11 Sep 2021 00:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOqWs-0007uo-4x; Sat, 11 Sep 2021 00:05:58 +0000
Received: by outflank-mailman (input) for mailman id 184892;
 Sat, 11 Sep 2021 00:05:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOqWr-0007ue-5M; Sat, 11 Sep 2021 00:05:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOqWq-0003HC-V1; Sat, 11 Sep 2021 00:05:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOqWq-000360-E3; Sat, 11 Sep 2021 00:05:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mOqWq-0003HV-DZ; Sat, 11 Sep 2021 00:05:56 +0000
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
	bh=Avu5ZY8stUgTM6nsPhnyiZ26MysLwdXfv86hgZ2iDX4=; b=J72osOirRyZD+hlo17I6OXcnps
	40Vs1PWAwMcOmfdBl+q/GLtWSsrbVivQgIKsLyFcNd+1Aik1/Mh8ZgfqTGdMU6au9oXPQXG/o8x0p
	XrvbyoGdn0kp6Siq+F29oCbzEZFBZ7NhlGfOcjIiIOUj0c+JyyDhVchgEL9Su/n490+A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164937-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164937: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cf7c65059202e7858fbc00ce1f163ee243947e08
X-Osstest-Versions-That:
    ovmf=d248516b3a190c5cb5d51164b5721ead9d24469a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Sep 2021 00:05:56 +0000

flight 164937 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164937/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cf7c65059202e7858fbc00ce1f163ee243947e08
baseline version:
 ovmf                 d248516b3a190c5cb5d51164b5721ead9d24469a

Last test of basis   164913  2021-09-09 13:11:28 Z    1 days
Testing same since   164937  2021-09-10 05:29:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>

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
   d248516b3a..cf7c650592  cf7c65059202e7858fbc00ce1f163ee243947e08 -> xen-tested-master

