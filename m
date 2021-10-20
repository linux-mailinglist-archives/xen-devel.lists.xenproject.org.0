Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFC43485A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 11:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213740.372050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8HB-0005U4-CA; Wed, 20 Oct 2021 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213740.372050; Wed, 20 Oct 2021 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8HB-0005Rt-8p; Wed, 20 Oct 2021 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 213740;
 Wed, 20 Oct 2021 09:52:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1md8H9-0005Rh-7Q; Wed, 20 Oct 2021 09:52:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1md8H8-0001zh-VH; Wed, 20 Oct 2021 09:52:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1md8H8-0002kO-Mt; Wed, 20 Oct 2021 09:52:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1md8H8-0007gN-MP; Wed, 20 Oct 2021 09:52:46 +0000
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
	bh=Zu/6lJ7vqei28YRVIhefRMMUrAKMMJ/CtNcCBvNyhz4=; b=V0Sg5meEaOW4wjC0vPu9OS1+HW
	3AxPilxbq/UNpU8mqjx4w0Llfx7rwu2lRXAdZ6HitjGmHYTXY3mezjiM53OD2bNtUqYalwg/WsuyM
	PEWvL3JtjD4YVRpDYBd1WqgvZ1gzgvM/wOKZYYHUagLELSrcMlY7WbzeWx8Yj8VmTCBg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165686-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165686: all pass - PUSHED
X-Osstest-Versions-This:
    xen=6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
X-Osstest-Versions-That:
    xen=52d0847d7c6972baa74156f14ee8544f5aba1d2d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Oct 2021 09:52:46 +0000

flight 165686 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165686/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
baseline version:
 xen                  52d0847d7c6972baa74156f14ee8544f5aba1d2d

Last test of basis   165617  2021-10-17 09:18:30 Z    3 days
Testing same since   165686  2021-10-20 09:20:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   52d0847d7c..6809998c5f  6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2 -> coverity-tested/smoke

