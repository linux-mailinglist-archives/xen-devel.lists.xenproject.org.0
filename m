Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D11831A090
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 15:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84292.158015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAZMC-0001uN-V4; Fri, 12 Feb 2021 14:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84292.158015; Fri, 12 Feb 2021 14:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAZMC-0001tt-R0; Fri, 12 Feb 2021 14:23:40 +0000
Received: by outflank-mailman (input) for mailman id 84292;
 Fri, 12 Feb 2021 14:23:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAZMB-0001tl-Bn; Fri, 12 Feb 2021 14:23:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAZMB-0007wH-5p; Fri, 12 Feb 2021 14:23:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAZMA-000126-Tx; Fri, 12 Feb 2021 14:23:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lAZMA-0001iZ-TV; Fri, 12 Feb 2021 14:23:38 +0000
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
	bh=l7CMZcYdOZL0Q88BUcPEBjL31Bkf514UB7r4SCsZy4A=; b=ZQOPvVyiyob1HzFAJotSTH3ScL
	/WlufR2vYWI3lq42Al8sWO5dQff2FFxVkIxVtNwYHFFrcUn8QgI9A/pnEcUf+TwgC9U2NG5S42Jfj
	/0ZwJHA80LpliOtY08L+cvl9Zhop5HGR6/GZqHes9E8DFejDu+lASCrC/pzs9Za4CsS0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159248-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159248: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1d27e58e401faea284309039f3962cb3cb4549fc
X-Osstest-Versions-That:
    ovmf=124f1dd1ee1140b441151043aacbe5d33bb5ab79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Feb 2021 14:23:38 +0000

flight 159248 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159248/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1d27e58e401faea284309039f3962cb3cb4549fc
baseline version:
 ovmf                 124f1dd1ee1140b441151043aacbe5d33bb5ab79

Last test of basis   159198  2021-02-10 11:26:55 Z    2 days
Testing same since   159248  2021-02-11 10:27:56 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>
  Rebecca Cran <rebecca@nuviainc.com>
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
   124f1dd1ee..1d27e58e40  1d27e58e401faea284309039f3962cb3cb4549fc -> xen-tested-master

