Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B9388CBE
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 13:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130005.243774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljKKI-0006xi-P8; Wed, 19 May 2021 11:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130005.243774; Wed, 19 May 2021 11:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljKKI-0006vj-L4; Wed, 19 May 2021 11:25:22 +0000
Received: by outflank-mailman (input) for mailman id 130005;
 Wed, 19 May 2021 11:25:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKKH-0006vZ-Bw; Wed, 19 May 2021 11:25:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKKH-0000ES-9L; Wed, 19 May 2021 11:25:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKKG-0002si-Vd; Wed, 19 May 2021 11:25:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKKG-0000jv-V8; Wed, 19 May 2021 11:25:20 +0000
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
	bh=xcam1RmKa/U7VRydrWmf9cCAruIOMeWcSIlQP07XfmI=; b=Kb0+/R52nngXAkFbnWoHxWIADv
	8z8h/pacSIfFhLSlu3zUGBvlswdt06zw4yS+VQdfMR9Y35ZX51lflK+Ja9/iNfXlX7lza3n0hz1vF
	61K4Pnc2Q2+hNHo9GvYr/VNZwHEWVxets6IBMBaVfZKxJoPHYR0kN2C/GtqE6hUjeL94=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162071-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162071: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=15ee7b76891a78141e6e30ef3f8572e8d6b326d2
X-Osstest-Versions-That:
    ovmf=42ec0a315b8a2f445b7a7d74b8d78965f1dff8f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 May 2021 11:25:20 +0000

flight 162071 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162071/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 15ee7b76891a78141e6e30ef3f8572e8d6b326d2
baseline version:
 ovmf                 42ec0a315b8a2f445b7a7d74b8d78965f1dff8f6

Last test of basis   162046  2021-05-18 17:10:06 Z    0 days
Testing same since   162071  2021-05-19 01:40:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sergei Dmitrouk <sergei@posteo.net>

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
   42ec0a315b..15ee7b7689  15ee7b76891a78141e6e30ef3f8572e8d6b326d2 -> xen-tested-master

