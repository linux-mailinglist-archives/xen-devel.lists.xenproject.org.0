Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDF91AEAB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 20:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750279.1158512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMtQI-0004fD-6E; Thu, 27 Jun 2024 18:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750279.1158512; Thu, 27 Jun 2024 18:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMtQI-0004cw-32; Thu, 27 Jun 2024 18:00:42 +0000
Received: by outflank-mailman (input) for mailman id 750279;
 Thu, 27 Jun 2024 18:00:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMtQH-0004cm-3u; Thu, 27 Jun 2024 18:00:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMtQH-0007j9-08; Thu, 27 Jun 2024 18:00:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMtQG-0001uc-MA; Thu, 27 Jun 2024 18:00:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMtQG-00037c-Lh; Thu, 27 Jun 2024 18:00:40 +0000
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
	bh=bWrB2WZJvV7YuxcOsDd7deLxeEfnA/wuwyca9SgwFjw=; b=Ppu5jqN3hc6Vd4L7pYce4y0Hss
	m8asWgM2rambogYq+so52zeYmkP3fmX6CEcw9XNBMBT0VmtCy2YQGftJMAHRcoQwwiO2/5rgfyaXM
	LQjidKDXGW24hT6C3fgltu6dIsmhFamElPXQHSTF9lS7OrTZOMzPqHZHubCgs59sn7D4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186536-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186536: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6862b9d538d96363635677198899e1669e591259
X-Osstest-Versions-That:
    ovmf=ae09721a65ab3294439f6fa233adaf3b897f702f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Jun 2024 18:00:40 +0000

flight 186536 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186536/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6862b9d538d96363635677198899e1669e591259
baseline version:
 ovmf                 ae09721a65ab3294439f6fa233adaf3b897f702f

Last test of basis   186520  2024-06-26 18:16:15 Z    0 days
Testing same since   186536  2024-06-27 15:41:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   ae09721a65..6862b9d538  6862b9d538d96363635677198899e1669e591259 -> xen-tested-master

