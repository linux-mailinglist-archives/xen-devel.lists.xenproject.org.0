Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636345B7DD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230267.398081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpp1i-0002I1-78; Wed, 24 Nov 2021 09:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230267.398081; Wed, 24 Nov 2021 09:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpp1i-0002Er-2T; Wed, 24 Nov 2021 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 230267;
 Wed, 24 Nov 2021 09:57:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpp1g-0002Eh-Gq; Wed, 24 Nov 2021 09:57:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpp1g-0003nf-6P; Wed, 24 Nov 2021 09:57:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpp1f-0000oy-T4; Wed, 24 Nov 2021 09:57:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mpp1f-0006PE-SW; Wed, 24 Nov 2021 09:57:15 +0000
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
	bh=QiPT4SCdw3l1wks8bSDll2eP1sRuCdV/RZRFPcFVo4k=; b=lB5Bpmnyjp6e+U4QmpNW81kVZe
	LRM8P3nj5p31Hbjab3Ep/4+n7QpFL8kE7Jysywg4cdAF36+znf0Pbf0qXfvGzh2zo3Tc2VD7k5vor
	pjHXU4jmc8FPtqQE5rQWPDrKm3nHTZeVbzDMIDKPk2s048ej33jrR22X763IVTdLekNE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166347-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166347: all pass - PUSHED
X-Osstest-Versions-This:
    xen=a5706b80f42e028c5153fc50734a1e86a99ff9d2
X-Osstest-Versions-That:
    xen=be12fcca8b784e456df3adedbffe657d753c5ff9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Nov 2021 09:57:15 +0000

flight 166347 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166347/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  a5706b80f42e028c5153fc50734a1e86a99ff9d2
baseline version:
 xen                  be12fcca8b784e456df3adedbffe657d753c5ff9

Last test of basis   166258  2021-11-21 09:18:28 Z    3 days
Testing same since   166347  2021-11-24 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   be12fcca8b..a5706b80f4  a5706b80f42e028c5153fc50734a1e86a99ff9d2 -> coverity-tested/smoke

