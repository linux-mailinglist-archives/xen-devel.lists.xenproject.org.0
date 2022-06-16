Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AE854EA46
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 21:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350860.577286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1vNr-0000h7-AG; Thu, 16 Jun 2022 19:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350860.577286; Thu, 16 Jun 2022 19:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1vNr-0000f5-67; Thu, 16 Jun 2022 19:42:27 +0000
Received: by outflank-mailman (input) for mailman id 350860;
 Thu, 16 Jun 2022 19:42:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1vNp-0000ev-9k; Thu, 16 Jun 2022 19:42:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1vNp-0001cm-6f; Thu, 16 Jun 2022 19:42:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1vNo-0007l6-Nl; Thu, 16 Jun 2022 19:42:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o1vNo-000650-NK; Thu, 16 Jun 2022 19:42:24 +0000
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
	bh=6oSUpXTdZKc9f0/vPgzSckFNm6JYjUhTar5iAWd7xig=; b=g/CvebmInnvZ80eQRJxthXhtLA
	GyzEJSKJpgqe43W4CDWkXJV6QW3zPiO1owdr13tdCBxIX6vWydzW92rffeJlCqxwao9cmC4FHOlny
	XYhPWuACE5PTzy/cZk931M/+tJpSzJISrk/uCjteXc5avhz+5wgaopWdDVeDVU6WzrZ8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171202-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171202: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=92ab049719afe96913c0452bcf12946e0af0f0d5
X-Osstest-Versions-That:
    ovmf=05e57cc9ced67d2cd633c2bdcf70b5e1352bf635
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Jun 2022 19:42:24 +0000

flight 171202 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171202/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 92ab049719afe96913c0452bcf12946e0af0f0d5
baseline version:
 ovmf                 05e57cc9ced67d2cd633c2bdcf70b5e1352bf635

Last test of basis   171192  2022-06-16 08:10:35 Z    0 days
Testing same since   171202  2022-06-16 12:43:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ni, Ray <ray.ni@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   05e57cc9ce..92ab049719  92ab049719afe96913c0452bcf12946e0af0f0d5 -> xen-tested-master

