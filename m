Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6D689AE9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 15:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489213.757547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNwiy-00054L-Rr; Fri, 03 Feb 2023 14:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489213.757547; Fri, 03 Feb 2023 14:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNwiy-00052F-Ow; Fri, 03 Feb 2023 14:07:32 +0000
Received: by outflank-mailman (input) for mailman id 489213;
 Fri, 03 Feb 2023 14:07:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNwix-000525-QX; Fri, 03 Feb 2023 14:07:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNwix-0006hv-NU; Fri, 03 Feb 2023 14:07:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNwix-0004bI-65; Fri, 03 Feb 2023 14:07:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNwix-0001er-5V; Fri, 03 Feb 2023 14:07:31 +0000
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
	bh=C+VDcNHPHApfZskE1+QZs+MVpsMsFE2XxI3bb8pwk6o=; b=T4D2LGLXS2kNjrvW03RyprdxEU
	IGxpOQ+mrPxWL0GxAfYq/Lw7z6a7Byv/THQvmM32Pwb7MwnvJlK7dStQuXoBEgjVUmhV6rfT/hZvz
	rimEboHf6kSi5BQMI4h+BsgiU9DxerZKZnXfP08IYer2LH/agCZ69dTZjCxTqozc7EfU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176346-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176346: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=11f0014c0e3046e3762eac420b760091d0cdc063
X-Osstest-Versions-That:
    ovmf=ae6e470252d9312dce20d0b21e7f622c4ca9ad0a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Feb 2023 14:07:31 +0000

flight 176346 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176346/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 11f0014c0e3046e3762eac420b760091d0cdc063
baseline version:
 ovmf                 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a

Last test of basis   176328  2023-02-02 06:12:22 Z    1 days
Testing same since   176346  2023-02-03 08:11:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   ae6e470252..11f0014c0e  11f0014c0e3046e3762eac420b760091d0cdc063 -> xen-tested-master

