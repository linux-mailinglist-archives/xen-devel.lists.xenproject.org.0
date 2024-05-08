Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F2D8BF4E8
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 05:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718578.1121079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Xro-0006tf-8M; Wed, 08 May 2024 03:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718578.1121079; Wed, 08 May 2024 03:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Xro-0006rD-4b; Wed, 08 May 2024 03:21:16 +0000
Received: by outflank-mailman (input) for mailman id 718578;
 Wed, 08 May 2024 03:21:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Xrn-0006r3-2c; Wed, 08 May 2024 03:21:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Xrm-0005lM-Q7; Wed, 08 May 2024 03:21:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Xrm-0001Fy-I7; Wed, 08 May 2024 03:21:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Xrm-00047f-Hg; Wed, 08 May 2024 03:21:14 +0000
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
	bh=U6wxujaZzaSEyfduomq65dGTMOgmGkGZLQWoIxamONI=; b=NsYO+vlLZ9dpyjQOCcfhAxekxp
	CIQh35y5nkWTafsjewymHevz2mM2zPAaNBerZTeJ9IXf0gfuqOdjAalL9pyW77WgZ7RW+paDi2fCD
	UDUmxRw3h6fMoaZ2kJO2kOOh9VROy/wCE2hgaibHaFHpV1V3EJFvb2fTSir9RB4XNKkA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185941-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185941: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2727231b0a6fb4c043479d132df4d36cf9f751c2
X-Osstest-Versions-That:
    ovmf=987bea6525d70cd01649472c93d19f89d41d83a2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 May 2024 03:21:14 +0000

flight 185941 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185941/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2727231b0a6fb4c043479d132df4d36cf9f751c2
baseline version:
 ovmf                 987bea6525d70cd01649472c93d19f89d41d83a2

Last test of basis   185937  2024-05-07 07:43:05 Z    0 days
Testing same since   185941  2024-05-08 01:57:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   987bea6525..2727231b0a  2727231b0a6fb4c043479d132df4d36cf9f751c2 -> xen-tested-master

