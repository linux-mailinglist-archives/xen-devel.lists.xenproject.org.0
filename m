Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201873D8B8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 09:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555360.867085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgtl-0003AQ-A3; Mon, 26 Jun 2023 07:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555360.867085; Mon, 26 Jun 2023 07:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgtl-000375-7P; Mon, 26 Jun 2023 07:44:33 +0000
Received: by outflank-mailman (input) for mailman id 555360;
 Mon, 26 Jun 2023 07:44:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDgtj-00036v-Vp; Mon, 26 Jun 2023 07:44:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDgtj-00024G-NG; Mon, 26 Jun 2023 07:44:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDgtj-0008RX-8O; Mon, 26 Jun 2023 07:44:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qDgtj-0002RY-7w; Mon, 26 Jun 2023 07:44:31 +0000
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
	bh=5L4lCWovWHvfg395vi348ygv30s02ptqz7bRSVqK/mw=; b=HnN8hr9pNrkNO6hyE9SxFpazsR
	ezD3TLo3an+FekQD/bjRtZrYY43f/k+CWhQJylcztcxmgPdyj/KWSACybMfi1R00tyU38LwajmuBc
	ZW3FQ/a9Ox3itIof4ELC36cKIRAwKTufPqCJcAEcIKy0pUoGLjFMnwkkSnmgbTirtfQ8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181599-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181599: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ac33eee8b83999ba591af04fe22e773cf8fc8193
X-Osstest-Versions-That:
    ovmf=57796711371d42d980d50bc9299972b109d09035
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Jun 2023 07:44:31 +0000

flight 181599 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181599/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ac33eee8b83999ba591af04fe22e773cf8fc8193
baseline version:
 ovmf                 57796711371d42d980d50bc9299972b109d09035

Last test of basis   181569  2023-06-23 20:44:26 Z    2 days
Testing same since   181599  2023-06-26 05:12:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aishwarya, KurugoduMelmatamX <kurugodumelmatamx.aishwarya@intel.com>
  kurugodx <kurugodumelmatamx.aishwarya@intel.com>

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
   5779671137..ac33eee8b8  ac33eee8b83999ba591af04fe22e773cf8fc8193 -> xen-tested-master

