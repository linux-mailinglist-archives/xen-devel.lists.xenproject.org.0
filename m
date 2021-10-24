Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D84388B4
	for <lists+xen-devel@lfdr.de>; Sun, 24 Oct 2021 13:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215515.374773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mec1X-0000U7-Bq; Sun, 24 Oct 2021 11:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215515.374773; Sun, 24 Oct 2021 11:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mec1X-0000Re-6n; Sun, 24 Oct 2021 11:50:47 +0000
Received: by outflank-mailman (input) for mailman id 215515;
 Sun, 24 Oct 2021 11:50:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mec1V-0000RU-If; Sun, 24 Oct 2021 11:50:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mec1V-0000a7-9H; Sun, 24 Oct 2021 11:50:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mec1V-00045p-0y; Sun, 24 Oct 2021 11:50:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mec1V-00065i-0T; Sun, 24 Oct 2021 11:50:45 +0000
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
	bh=XkPG9wOJRKsmb+X2RRwxe7WFIJX8mh2Iycocp4+dM6A=; b=S3AathEUIEOIi+jwc8MUVB+FVF
	IUIKKJi8BznXlNaMpz4Fd6A37cAUp71vCqeyqoK8hW3wOQm3iI0qlL67E62OvOncVf4JP0LxiMIf7
	6p5R842ZsiYiXBZt6E0SmB0SNCDNw+0/eMtujXvw1XNAo+F555j/waPOKHW/f9KREyr0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165827-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165827: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8b76f235340922a6d293bff05978ba57d3b498e1
X-Osstest-Versions-That:
    ovmf=62540372230ecb5318a9c8a40580a14beeb9ded0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Oct 2021 11:50:45 +0000

flight 165827 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165827/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8b76f235340922a6d293bff05978ba57d3b498e1
baseline version:
 ovmf                 62540372230ecb5318a9c8a40580a14beeb9ded0

Last test of basis   165808  2021-10-23 08:42:15 Z    1 days
Testing same since   165827  2021-10-24 02:10:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Min Xu <min.m.xu@intel.com>

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
   6254037223..8b76f23534  8b76f235340922a6d293bff05978ba57d3b498e1 -> xen-tested-master

