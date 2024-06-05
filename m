Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4448FC13B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 03:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735519.1141648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEfJs-0006JG-RT; Wed, 05 Jun 2024 01:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735519.1141648; Wed, 05 Jun 2024 01:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEfJs-0006FV-OT; Wed, 05 Jun 2024 01:20:04 +0000
Received: by outflank-mailman (input) for mailman id 735519;
 Wed, 05 Jun 2024 01:20:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEfJr-00061L-HI; Wed, 05 Jun 2024 01:20:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEfJr-0001Cw-9T; Wed, 05 Jun 2024 01:20:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEfJq-0008WP-Ut; Wed, 05 Jun 2024 01:20:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEfJq-0006dL-UL; Wed, 05 Jun 2024 01:20:02 +0000
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
	bh=kV7Kn9f6N1uwpp/wBQtD0+6WlbujHD8NvetGVo6mELc=; b=poU4mUW1e1GADUCuZiuiEnH/ZY
	xNd+32uYTSa6A8DvFd9obSWA2vtx5lW2LlpGC37+WuKcsirMqjRcnVhmXXeKsOolIZiuxu3gKmZXD
	USzGnGfRgIUTVF/EHNquoP8aIyHDKlZV4YQuY7yWb/+rpJkvAQZHxozZahAUO4fE0CL4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186251-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186251: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7772e339bdbbaad81e84086eec0f8577e54e0f28
X-Osstest-Versions-That:
    ovmf=de4cc40b8c1d9044df82e077e72ef6e192ea12e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Jun 2024 01:20:02 +0000

flight 186251 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186251/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7772e339bdbbaad81e84086eec0f8577e54e0f28
baseline version:
 ovmf                 de4cc40b8c1d9044df82e077e72ef6e192ea12e2

Last test of basis   186249  2024-06-04 19:12:56 Z    0 days
Testing same since   186251  2024-06-04 23:14:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>
  Gerd Hoffmann <kraxel@redhat.com>

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
   de4cc40b8c..7772e339bd  7772e339bdbbaad81e84086eec0f8577e54e0f28 -> xen-tested-master

