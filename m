Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A67143DE
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 08:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540550.842383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3W0y-0006yG-7Q; Mon, 29 May 2023 06:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540550.842383; Mon, 29 May 2023 06:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3W0y-0006vM-4e; Mon, 29 May 2023 06:05:56 +0000
Received: by outflank-mailman (input) for mailman id 540550;
 Mon, 29 May 2023 06:05:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3W0x-0006vA-54; Mon, 29 May 2023 06:05:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3W0x-0005Ea-47; Mon, 29 May 2023 06:05:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3W0w-0007ns-PA; Mon, 29 May 2023 06:05:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q3W0w-0002to-Oe; Mon, 29 May 2023 06:05:54 +0000
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
	bh=Ylr7UD94GA/kEkG+Vgu7Kr0Z5rUcxARD/g6TLjITZ9c=; b=Kw76xx4fOjoXl6rfwn9YzUK48Q
	YTUWoM8DdoSwFOV9wWaCPpTECA9sBublW5B0toggUQ31ArdWvdaE6qq/u78IBHYFLgpOP1JpUl4Ct
	wLqJRcZWcAlIyR/5wMlBYaigIjrI3tPIiWxTT74eUu66kvdKDgkykkUG4w3bB4VrqwD0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180994-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180994: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5258c4186f3a41c14a1d4cd40217810882ccd222
X-Osstest-Versions-That:
    ovmf=0f8323b44b20c982f303cc01ccf7146556bc3d4d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 May 2023 06:05:54 +0000

flight 180994 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180994/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5258c4186f3a41c14a1d4cd40217810882ccd222
baseline version:
 ovmf                 0f8323b44b20c982f303cc01ccf7146556bc3d4d

Last test of basis   180991  2023-05-29 01:42:18 Z    0 days
Testing same since   180994  2023-05-29 03:46:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>
  Nickle Wang <nicklew@nvidia.com>

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
   0f8323b44b..5258c4186f  5258c4186f3a41c14a1d4cd40217810882ccd222 -> xen-tested-master

