Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104068C5F63
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 05:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721898.1125588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s75IC-0001TZ-G2; Wed, 15 May 2024 03:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721898.1125588; Wed, 15 May 2024 03:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s75IC-0001Qi-DQ; Wed, 15 May 2024 03:27:00 +0000
Received: by outflank-mailman (input) for mailman id 721898;
 Wed, 15 May 2024 03:26:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s75IB-0001QY-1G; Wed, 15 May 2024 03:26:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s75IA-000633-RV; Wed, 15 May 2024 03:26:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s75IA-0006Td-Fq; Wed, 15 May 2024 03:26:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s75IA-0002sI-FO; Wed, 15 May 2024 03:26:58 +0000
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
	bh=XpGbq7tPSN1Mjg+MS0GYBEIYmauVTzcN+N2R7NKhz4E=; b=HkTuuDE7IVwSwdsRHDFYUAzaGd
	aHZBDrtxgV4tiKJiDnKkiF5n+OvOygGzZFmUyb0BVuJc3Jt+ga17bnDMrUukKIWCGxedJYm1sit9J
	E+VaA+CtrzLSnBKZmawVoNMz0f475RpAhBmA6oLNPPTdwUMxgWXT/r+OU5RQpqKI/mxI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186000-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186000: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=558a25366d66e9ff96784ed3aab476f808531bf3
X-Osstest-Versions-That:
    ovmf=4b6ee06a090d956f80b4a92fb9bf03098a372f39
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 May 2024 03:26:58 +0000

flight 186000 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186000/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 558a25366d66e9ff96784ed3aab476f808531bf3
baseline version:
 ovmf                 4b6ee06a090d956f80b4a92fb9bf03098a372f39

Last test of basis   185967  2024-05-10 04:11:12 Z    4 days
Testing same since   186000  2024-05-15 01:41:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shun Cheng Liu <adam.liu@tw.synaptics.com>

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
   4b6ee06a09..558a25366d  558a25366d66e9ff96784ed3aab476f808531bf3 -> xen-tested-master

