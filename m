Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE843E008
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217905.378131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3ci-0003Mp-R7; Thu, 28 Oct 2021 11:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217905.378131; Thu, 28 Oct 2021 11:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3ci-0003Kw-My; Thu, 28 Oct 2021 11:31:08 +0000
Received: by outflank-mailman (input) for mailman id 217905;
 Thu, 28 Oct 2021 11:31:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mg3ch-0003Km-Ku; Thu, 28 Oct 2021 11:31:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mg3ch-0006BD-Fl; Thu, 28 Oct 2021 11:31:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mg3ch-0003x7-4k; Thu, 28 Oct 2021 11:31:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mg3ch-0000j1-4G; Thu, 28 Oct 2021 11:31:07 +0000
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
	bh=R9MJEY1V0mI1GImehJZjeSGXKbwTYW7BnpyZWuR4ivk=; b=kA8EcRKaCxiVYb8AqVn1aho8zA
	vPphNGHq4G5t+F17t7Raj3kTsCKJ0menph0lf3RXG4VGPmxwZ2zEbEXfoOkhOOOkJ4GB27lI57dLn
	M3uHkcmebWf5LhR96/1ko2aDWnJEYwM6vg60NxhNA5CEO1KqAROmJFYygUabV3DCB1WM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165921-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165921: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bb146ce32dd8edc463e792554351e50b9e5b769f
X-Osstest-Versions-That:
    ovmf=9a95d11023ac2f2ee49a2958cf80658270442c42
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 Oct 2021 11:31:07 +0000

flight 165921 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165921/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb146ce32dd8edc463e792554351e50b9e5b769f
baseline version:
 ovmf                 9a95d11023ac2f2ee49a2958cf80658270442c42

Last test of basis   165899  2021-10-27 12:10:06 Z    0 days
Testing same since   165921  2021-10-28 02:41:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Star Zeng <star.zeng@intel.com>
  Zeng, Star <star.zeng@intel.com>

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
   9a95d11023..bb146ce32d  bb146ce32dd8edc463e792554351e50b9e5b769f -> xen-tested-master

