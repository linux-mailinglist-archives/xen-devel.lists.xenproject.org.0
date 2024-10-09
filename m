Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9A99783E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 00:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815203.1228897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syer4-0005Y9-0G; Wed, 09 Oct 2024 22:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815203.1228897; Wed, 09 Oct 2024 22:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syer3-0005WB-T6; Wed, 09 Oct 2024 22:08:25 +0000
Received: by outflank-mailman (input) for mailman id 815203;
 Wed, 09 Oct 2024 22:08:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syer2-0005W1-5A; Wed, 09 Oct 2024 22:08:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syer2-0003Pi-3c; Wed, 09 Oct 2024 22:08:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syer1-0005JO-NC; Wed, 09 Oct 2024 22:08:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syer1-0001Jb-Mi; Wed, 09 Oct 2024 22:08:23 +0000
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
	bh=15u7FiKNghnkEv8Ywn7+xDCmgtocoMbZFizn8narAiM=; b=NpNmaIAf1iUfdWv+UqwguEbJ8m
	Y57Z35urgYvdA9sgBHfruNOjmPIeAJ65TevvKyGjP7/PWW9xgCezCbolpX46/rrWop9p79eRKgS0d
	Tj4gNRkRCvt4mPi6OnMZHjcxb4tULyQygtdIc6q4YbvGLtl+E1RFjM/VovaFh0DuW99o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188037-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188037: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=da1c6dd62a19361186739a00a4f86d7cf630708c
X-Osstest-Versions-That:
    ovmf=7bac0a940e905941487c3a2f2f5fb6ee43ff040a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2024 22:08:23 +0000

flight 188037 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188037/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 da1c6dd62a19361186739a00a4f86d7cf630708c
baseline version:
 ovmf                 7bac0a940e905941487c3a2f2f5fb6ee43ff040a

Last test of basis   188031  2024-10-09 11:13:23 Z    0 days
Testing same since   188037  2024-10-09 19:42:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sean Rhodes <sean@starlabs.systems>

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
   7bac0a940e..da1c6dd62a  da1c6dd62a19361186739a00a4f86d7cf630708c -> xen-tested-master

