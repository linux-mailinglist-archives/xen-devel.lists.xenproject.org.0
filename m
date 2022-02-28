Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A64C62BD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 07:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280150.477994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOZAl-0003fj-29; Mon, 28 Feb 2022 06:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280150.477994; Mon, 28 Feb 2022 06:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOZAk-0003dd-Ut; Mon, 28 Feb 2022 06:06:14 +0000
Received: by outflank-mailman (input) for mailman id 280150;
 Mon, 28 Feb 2022 06:06:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOZAj-0003dT-66; Mon, 28 Feb 2022 06:06:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOZAj-00060T-4s; Mon, 28 Feb 2022 06:06:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOZAi-0006db-NV; Mon, 28 Feb 2022 06:06:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nOZAi-0003vC-Km; Mon, 28 Feb 2022 06:06:12 +0000
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
	bh=SSq0lZdLUeh807I+40dEr675QVc4OJrt4OzPSQDTeLQ=; b=XGmbmk15gixpVWA0eljlJw4XG8
	nUto6l7Ldtn3KOoYAf4uOey9/vxDna+E25BtS81e/YGSPqX1lI5tTMPioU+AA43BZA5GduxJjxHng
	TGBwTTHCNNM0/5Kbm9XZnP2gi3xMfGMEj1XvFz3aircIAd3jOv0Q4M1FmWMnLhnWReLs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168249: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f1d1c337e7c0575da7fd248b2dd9cffc755940df
X-Osstest-Versions-That:
    ovmf=54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Feb 2022 06:06:12 +0000

flight 168249 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168249/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f1d1c337e7c0575da7fd248b2dd9cffc755940df
baseline version:
 ovmf                 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8

Last test of basis   168232  2022-02-25 16:10:29 Z    2 days
Testing same since   168249  2022-02-28 03:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <jiewen.yao@intel.com>

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
   54cddc3ad4..f1d1c337e7  f1d1c337e7c0575da7fd248b2dd9cffc755940df -> xen-tested-master

