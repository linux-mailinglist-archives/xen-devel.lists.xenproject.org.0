Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B941978872
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 21:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798433.1208671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBbE-0007sv-8e; Fri, 13 Sep 2024 19:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798433.1208671; Fri, 13 Sep 2024 19:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBbE-0007qy-5U; Fri, 13 Sep 2024 19:04:56 +0000
Received: by outflank-mailman (input) for mailman id 798433;
 Fri, 13 Sep 2024 19:04:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spBbC-0007qo-Da; Fri, 13 Sep 2024 19:04:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spBbC-00057p-BV; Fri, 13 Sep 2024 19:04:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spBbB-000196-S4; Fri, 13 Sep 2024 19:04:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1spBbB-0001gh-RF; Fri, 13 Sep 2024 19:04:53 +0000
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
	bh=RnJ7eGez5J8Kn6AlZCXKFPBWyZpsib74EWWjZcLyDiM=; b=TaQcUHg0GZMdj2Aa5L9pyUA94Q
	0uje0svtbGc6Ms8Fzafb1ui+Yw3Li9J2Yy3sOBrzxPr4MOLMmyVQjxzBUmsb4J3HGEHrxRiI0BA1i
	w5QDmdWlj0OCdYptwIZLx4HIhRyLRTkA6xp/f9sUKcb5mi0CDcvLMTKT6Qo5H494Sy+o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187694-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187694: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=262ab6259f30203306d8a94de530d08998dab121
X-Osstest-Versions-That:
    ovmf=273f43cec97c48890ddd1ce08de2ca9129a8c348
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 19:04:53 +0000

flight 187694 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187694/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 262ab6259f30203306d8a94de530d08998dab121
baseline version:
 ovmf                 273f43cec97c48890ddd1ce08de2ca9129a8c348

Last test of basis   187693  2024-09-13 16:13:22 Z    0 days
Testing same since   187694  2024-09-13 17:43:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>

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
   273f43cec9..262ab6259f  262ab6259f30203306d8a94de530d08998dab121 -> xen-tested-master

