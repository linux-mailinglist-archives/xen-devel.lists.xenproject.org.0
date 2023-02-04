Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705368A81D
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 05:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489425.757773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO9wd-0006yv-FL; Sat, 04 Feb 2023 04:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489425.757773; Sat, 04 Feb 2023 04:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO9wd-0006wt-B7; Sat, 04 Feb 2023 04:14:31 +0000
Received: by outflank-mailman (input) for mailman id 489425;
 Sat, 04 Feb 2023 04:14:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pO9wb-0006wh-DJ; Sat, 04 Feb 2023 04:14:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pO9wb-0000kj-Bd; Sat, 04 Feb 2023 04:14:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pO9wa-0006pJ-QB; Sat, 04 Feb 2023 04:14:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pO9wa-0004V5-Pl; Sat, 04 Feb 2023 04:14:28 +0000
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
	bh=oHLo30xeGK6s5LgE58EI6gtskWaaYXgAai7etaFqKT4=; b=e/H8dm9RC+EsDPKXWvxZGOsWj0
	PZp9cH+OV6tbB3STQ7UuGltnnRI73iL9YhBzkobgVWmuqzGxYWBhHifRdjFOnXmoIBeRO96pe3QzO
	0TlQkaEn2gJsQzcOaOZuT/B/sQD2qmXbnlbJQy3fQFnx2rmru/V/ewzqIn09snNCOr4E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176356-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176356: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7623b4bf6a4541b1bc5ad1978f27a55f2fb62c5f
X-Osstest-Versions-That:
    ovmf=13b97736c876919b9786055829caaa4fa46984b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Feb 2023 04:14:28 +0000

flight 176356 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176356/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7623b4bf6a4541b1bc5ad1978f27a55f2fb62c5f
baseline version:
 ovmf                 13b97736c876919b9786055829caaa4fa46984b7

Last test of basis   176348  2023-02-03 14:13:42 Z    0 days
Testing same since   176356  2023-02-04 01:55:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuan Yu <yuanyu@google.com>

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
   13b97736c8..7623b4bf6a  7623b4bf6a4541b1bc5ad1978f27a55f2fb62c5f -> xen-tested-master

