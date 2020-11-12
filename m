Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E112B0D77
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 20:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26018.54138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdHxj-0000vs-NL; Thu, 12 Nov 2020 19:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26018.54138; Thu, 12 Nov 2020 19:08:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdHxj-0000vT-Jv; Thu, 12 Nov 2020 19:08:51 +0000
Received: by outflank-mailman (input) for mailman id 26018;
 Thu, 12 Nov 2020 19:08:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kdHxi-0000vO-Ar
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 19:08:50 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf15e19-eebc-41d7-9ada-b7865fba89d3;
 Thu, 12 Nov 2020 19:08:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdHxg-00069e-0d; Thu, 12 Nov 2020 19:08:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdHxf-0005ZS-N6; Thu, 12 Nov 2020 19:08:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kdHxf-0001pU-MZ; Thu, 12 Nov 2020 19:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kdHxi-0000vO-Ar
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 19:08:50 +0000
X-Inumbo-ID: 2cf15e19-eebc-41d7-9ada-b7865fba89d3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2cf15e19-eebc-41d7-9ada-b7865fba89d3;
	Thu, 12 Nov 2020 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=vKWDXLzdSOZf5O7y7eEnyxGuoqi7lxuCXx8h6B7Jt44=; b=ofIWlMZWoxy0Kuq52NoRE8eq16
	e6N1PH+J6pAKAWZGvpTlO3mWkqcZncSn/+fSzAa6jeNeZjcC0wwSJ0VdFfBf75OJpit7+Sp3hZRNT
	7sqyOLnW1l77UOu55m3XFq6mkcVd3tjSNKn2W7dC1C14HJVfukYuRt2td9neZmlTthSo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdHxg-00069e-0d; Thu, 12 Nov 2020 19:08:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdHxf-0005ZS-N6; Thu, 12 Nov 2020 19:08:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdHxf-0001pU-MZ; Thu, 12 Nov 2020 19:08:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156693-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 156693: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=8ab15139728a8efd3ebbb60beb16a958a6a93fa1
X-Osstest-Versions-That:
    xtf=848c3f2dd42711c4d9fc01839d6630c115daa22f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Nov 2020 19:08:47 +0000

flight 156693 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156693/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  8ab15139728a8efd3ebbb60beb16a958a6a93fa1
baseline version:
 xtf                  848c3f2dd42711c4d9fc01839d6630c115daa22f

Last test of basis   156541  2020-11-07 19:44:12 Z    4 days
Testing same since   156693  2020-11-12 00:13:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   848c3f2..8ab1513  8ab15139728a8efd3ebbb60beb16a958a6a93fa1 -> xen-tested-master

