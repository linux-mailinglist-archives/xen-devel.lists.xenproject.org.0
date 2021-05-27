Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EC3937B4
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 22:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133673.249074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmN4s-0001Wb-JK; Thu, 27 May 2021 20:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133673.249074; Thu, 27 May 2021 20:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmN4s-0001Te-FD; Thu, 27 May 2021 20:58:02 +0000
Received: by outflank-mailman (input) for mailman id 133673;
 Thu, 27 May 2021 20:58:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lmN4r-0001TU-9G; Thu, 27 May 2021 20:58:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lmN4r-00004t-4D; Thu, 27 May 2021 20:58:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lmN4q-0001xN-T6; Thu, 27 May 2021 20:58:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lmN4q-0007yh-Sa; Thu, 27 May 2021 20:58:00 +0000
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
	bh=4il0ZNitqhtkXOi7JaxzIaYHT6iUQgFS57LFOWR7GnA=; b=YXwO3t1nrEmL/nXwlQLxxzv4gU
	X36wDclDCz9yVpJL+e8XOuZ+gvfZOBIqAb3SWijIxqxzOCqBVJ7s9vv0S1IjB7vyoD/Wb4e/y25vg
	/MPeAWB5ChzTK4u8CjH1e238+LycZxYrAhOndE0Vlkb+zuyXKUBqQsu4nL5XEzejOao8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162217-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162217: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e1999b264f1f9d7230edf2448f757c73da567832
X-Osstest-Versions-That:
    ovmf=cfa6ffb113f2c0d922034cc77c0d6c52eea05497
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 May 2021 20:58:00 +0000

flight 162217 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162217/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e1999b264f1f9d7230edf2448f757c73da567832
baseline version:
 ovmf                 cfa6ffb113f2c0d922034cc77c0d6c52eea05497

Last test of basis   162131  2021-05-23 12:12:23 Z    4 days
Testing same since   162217  2021-05-27 10:11:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andreas Sandberg <andreas.sandberg@arm.com>
  Joey Gouly <joey.gouly@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   cfa6ffb113..e1999b264f  e1999b264f1f9d7230edf2448f757c73da567832 -> xen-tested-master

