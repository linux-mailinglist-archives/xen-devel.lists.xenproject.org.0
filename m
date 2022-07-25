Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76515803E0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 20:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374749.606923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG2cn-00073d-Lp; Mon, 25 Jul 2022 18:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374749.606923; Mon, 25 Jul 2022 18:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG2cn-000707-Ii; Mon, 25 Jul 2022 18:16:13 +0000
Received: by outflank-mailman (input) for mailman id 374749;
 Mon, 25 Jul 2022 18:16:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG2cl-0006ze-Na; Mon, 25 Jul 2022 18:16:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG2cl-0006V6-Kd; Mon, 25 Jul 2022 18:16:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG2cl-0005eS-D1; Mon, 25 Jul 2022 18:16:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oG2cl-0002Hd-CZ; Mon, 25 Jul 2022 18:16:11 +0000
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
	bh=hd3M1uPBmQjlSV1UB3senElrOAVbZHFT6pZ8cR86+L8=; b=xWw6AUYPsHYJAuTY8Bw7LdgxtF
	Wyji+FEBg7TIn9QrnU+mPCrn2TLPHDRiw6nRyx366d702MqB91Aiuj3QYe8hR2+lu+VKmgRnYOxq2
	Ii7Fh/6bV85shL9iziFgzbQarxKDAm2N1swDrVi9r7bX39ZcR4OZY5tuYgSo5iNFSSnA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171855-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171855: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a47241f1337c2ce78179b7db939faebd7828d8d0
X-Osstest-Versions-That:
    ovmf=8a5782d704cfeb78aafdec1c03685107586f4ee6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Jul 2022 18:16:11 +0000

flight 171855 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171855/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a47241f1337c2ce78179b7db939faebd7828d8d0
baseline version:
 ovmf                 8a5782d704cfeb78aafdec1c03685107586f4ee6

Last test of basis   171849  2022-07-25 02:42:04 Z    0 days
Testing same since   171855  2022-07-25 16:40:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  PaytonX Hsieh <paytonx.hsieh@intel.com>

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
   8a5782d704..a47241f133  a47241f1337c2ce78179b7db939faebd7828d8d0 -> xen-tested-master

