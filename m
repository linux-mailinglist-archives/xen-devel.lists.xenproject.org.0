Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77B82A73B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 06:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665870.1036165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNnTv-00039b-5J; Thu, 11 Jan 2024 05:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665870.1036165; Thu, 11 Jan 2024 05:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNnTv-000377-2g; Thu, 11 Jan 2024 05:19:55 +0000
Received: by outflank-mailman (input) for mailman id 665870;
 Thu, 11 Jan 2024 05:19:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNnTt-00036x-F4; Thu, 11 Jan 2024 05:19:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNnTt-0004gB-As; Thu, 11 Jan 2024 05:19:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNnTs-0003xg-U3; Thu, 11 Jan 2024 05:19:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNnTs-0007W1-TU; Thu, 11 Jan 2024 05:19:52 +0000
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
	bh=xoV9saGmTg/85AoUdbP0tvGBEe4Uv6lNqWc67nbVMAU=; b=P6jE8Onx+uRHDMOqW4PFsAkBiW
	uWG0MQDRzqE0GZVFiYMVymqq3o7MNnjOpohP0hae9h2zoEH3pR77jOwMS3x3VZuVXuUCtECz1/wQn
	lmpze6khZGwdrKORTdjnK6MIllI25CwDDHb3Qpd4QEcmM04ylN/JiYS/hBVztfgihu8I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184315-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184315: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=889535caf8869e3d4818b75f95f2fc910c84a4d2
X-Osstest-Versions-That:
    ovmf=e7cfdc5f14b408e85fcbcb335aae7c15bbce4dfb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Jan 2024 05:19:52 +0000

flight 184315 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184315/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 889535caf8869e3d4818b75f95f2fc910c84a4d2
baseline version:
 ovmf                 e7cfdc5f14b408e85fcbcb335aae7c15bbce4dfb

Last test of basis   184310  2024-01-10 16:11:02 Z    0 days
Testing same since   184315  2024-01-11 03:12:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Junfeng Guan <junfengx.guan@intel.com>

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
   e7cfdc5f14..889535caf8  889535caf8869e3d4818b75f95f2fc910c84a4d2 -> xen-tested-master

