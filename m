Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB541883F
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 13:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196078.348923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mURvU-0002CP-6e; Sun, 26 Sep 2021 11:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196078.348923; Sun, 26 Sep 2021 11:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mURvU-00029P-2I; Sun, 26 Sep 2021 11:02:32 +0000
Received: by outflank-mailman (input) for mailman id 196078;
 Sun, 26 Sep 2021 11:02:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mURvS-00029F-Bj; Sun, 26 Sep 2021 11:02:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mURvS-0006Ly-62; Sun, 26 Sep 2021 11:02:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mURvR-0005Gn-P1; Sun, 26 Sep 2021 11:02:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mURvR-0000V5-Ob; Sun, 26 Sep 2021 11:02:29 +0000
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
	bh=8UIjU8CMr33USWypv6/6UdCl3PJWSqsvk2+D1zmWAog=; b=6YS6c6TFUcHuorlR9ayQRObb65
	SABtcvASocej8i9d26U7/wyNACqnRlwNsDCz4e9xxOoZUBB/mU3xktjMKPo8sAFsqM/LELUCaEVDb
	4NdcN4VTYFSyN6k8kDzBobM49ObRj9LRS5ekBSpGrXg+9zzzwhhn/ZKDqvwbfPlfwKIo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165200-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165200: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=46b4606ba23498d3d0e66b53e498eb3d5d592586
X-Osstest-Versions-That:
    ovmf=d60915b7516c87ec49ad579a1cb8ff9226d85928
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Sep 2021 11:02:29 +0000

flight 165200 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165200/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 46b4606ba23498d3d0e66b53e498eb3d5d592586
baseline version:
 ovmf                 d60915b7516c87ec49ad579a1cb8ff9226d85928

Last test of basis   165175  2021-09-24 03:46:51 Z    2 days
Testing same since   165200  2021-09-26 03:10:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  xueshengfeng <xueshengfeng@byosoft.com.cn>

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
   d60915b751..46b4606ba2  46b4606ba23498d3d0e66b53e498eb3d5d592586 -> xen-tested-master

