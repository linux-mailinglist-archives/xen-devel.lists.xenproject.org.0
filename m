Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40BF714CA3
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 17:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540655.842553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3eNj-0001zp-O2; Mon, 29 May 2023 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540655.842553; Mon, 29 May 2023 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3eNj-0001xC-L8; Mon, 29 May 2023 15:01:59 +0000
Received: by outflank-mailman (input) for mailman id 540655;
 Mon, 29 May 2023 15:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3eNi-0001x2-BQ; Mon, 29 May 2023 15:01:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3eNi-00010O-1o; Mon, 29 May 2023 15:01:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3eNh-00057u-Jl; Mon, 29 May 2023 15:01:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q3eNh-0003aw-JL; Mon, 29 May 2023 15:01:57 +0000
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
	bh=Q+T0mB5I8re5shnjqiZfkRoR/1maJslybSCzFGsjpGg=; b=0UBIRSaZDinFpyj49cJjPN5GTs
	u8FXzNVacT7Npp2JcUmf4nRZ+eErLsuajgid7bdThMkHxngOD7mpcdD8Oq9c1uoINaLuDksyYatKX
	ng+0gVEzRS0fepg2deJuAEI3CBvhcI360xYp4E3qXS/fYTjIesH4aDpSQJ9GLAyupLGs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180999-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180999: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=04c5b3023e49c35d291f41d2c39b4d12a62b8f9c
X-Osstest-Versions-That:
    ovmf=c0bce66068c76b5d46f901027daf1074316031ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 May 2023 15:01:57 +0000

flight 180999 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180999/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 04c5b3023e49c35d291f41d2c39b4d12a62b8f9c
baseline version:
 ovmf                 c0bce66068c76b5d46f901027daf1074316031ac

Last test of basis   180998  2023-05-29 10:43:39 Z    0 days
Testing same since   180999  2023-05-29 13:12:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
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
   c0bce66068..04c5b3023e  04c5b3023e49c35d291f41d2c39b4d12a62b8f9c -> xen-tested-master

