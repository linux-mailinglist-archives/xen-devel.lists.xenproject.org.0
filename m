Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413D704181
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 01:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534892.832357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyi0n-0002IS-1G; Mon, 15 May 2023 23:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534892.832357; Mon, 15 May 2023 23:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyi0m-0002Gn-Up; Mon, 15 May 2023 23:53:52 +0000
Received: by outflank-mailman (input) for mailman id 534892;
 Mon, 15 May 2023 23:53:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pyi0m-0002Gd-0s; Mon, 15 May 2023 23:53:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pyi0l-0006K3-Js; Mon, 15 May 2023 23:53:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pyi0l-0002DJ-3Z; Mon, 15 May 2023 23:53:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pyi0l-0004r7-3D; Mon, 15 May 2023 23:53:51 +0000
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
	bh=QvimEqs5pOiTdcKBzwZXomYGXKkV7maVksLGqAVzdl8=; b=LEpaAbaqTliL463DqczWsUHU91
	m4iK4dPgC4EF3gKkZAfju94dlAwSmdVWclWXKb/Vz5VPwysnZzBno3bnPAhpT4gMZT5qe4nodPeol
	hZwIAILZ/ymJgUjvWEiKm7NLlIyCOzEOcMo3EJHrMncFqGet2wtHcm1bOjiNZUI534cA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180675-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180675: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e
X-Osstest-Versions-That:
    ovmf=80bc13db83ddbd5bbe757a20abcdd34daf4871f8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 May 2023 23:53:51 +0000

flight 180675 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180675/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e
baseline version:
 ovmf                 80bc13db83ddbd5bbe757a20abcdd34daf4871f8

Last test of basis   180665  2023-05-15 01:12:11 Z    0 days
Testing same since   180675  2023-05-15 21:40:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>

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
   80bc13db83..cafb4f3f36  cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e -> xen-tested-master

