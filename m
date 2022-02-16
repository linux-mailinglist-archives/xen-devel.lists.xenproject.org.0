Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC24B9135
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 20:32:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274363.469812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKQ19-0001Kw-2A; Wed, 16 Feb 2022 19:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274363.469812; Wed, 16 Feb 2022 19:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKQ18-0001J1-VI; Wed, 16 Feb 2022 19:31:10 +0000
Received: by outflank-mailman (input) for mailman id 274363;
 Wed, 16 Feb 2022 19:31:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKQ16-0001Ir-RH; Wed, 16 Feb 2022 19:31:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKQ16-0007RM-OG; Wed, 16 Feb 2022 19:31:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKQ16-0006kn-9C; Wed, 16 Feb 2022 19:31:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nKQ16-0003Fq-8h; Wed, 16 Feb 2022 19:31:08 +0000
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
	bh=VqfectJqNpaWWxmXzyisGLc1OgG7RyWsR5T47r19GDw=; b=n9DYdyW5NvkMNlFFKjWBCPaKtz
	kYRSCp887UuJHoO/vuo+QpCqMbuswdD1hgEzW/MAJalE80Fja0WNvQ3rHr4Ri3MNUR/DEwcF/AQ5e
	NQg0FX0FfH5GsiF7UwqtRCLkoig1b77N2MFijfoD5IVgaOabaTtS9XGo9mrPcUBa3Hq0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168131-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168131: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8a576733162bb72afb4d1eb3012b0aef8d265018
X-Osstest-Versions-That:
    ovmf=c28e376edc46e6db6e4a551c94b6ac90df0d8d6e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Feb 2022 19:31:08 +0000

flight 168131 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168131/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8a576733162bb72afb4d1eb3012b0aef8d265018
baseline version:
 ovmf                 c28e376edc46e6db6e4a551c94b6ac90df0d8d6e

Last test of basis   168127  2022-02-16 07:13:58 Z    0 days
Testing same since   168131  2022-02-16 12:13:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  MohammedX Rehan <mohammedx.rehan@intel.com>
  Rehan, MohammedX <mohammedx.rehan@intel.com>

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
   c28e376edc..8a57673316  8a576733162bb72afb4d1eb3012b0aef8d265018 -> xen-tested-master

