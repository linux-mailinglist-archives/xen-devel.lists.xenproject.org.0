Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12392287C2A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4586.12042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbN5-0008MJ-Qf; Thu, 08 Oct 2020 19:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4586.12042; Thu, 08 Oct 2020 19:14:35 +0000
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
	id 1kQbN5-0008Lu-NM; Thu, 08 Oct 2020 19:14:35 +0000
Received: by outflank-mailman (input) for mailman id 4586;
 Thu, 08 Oct 2020 19:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbN4-0008Lk-Dr
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0144c565-3c22-414f-b139-cf38414afbf5;
 Thu, 08 Oct 2020 19:14:33 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN3-0004R0-Hp
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:33 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN3-0003pX-G5
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:33 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN1-0006So-Jc; Thu, 08 Oct 2020 20:14:31 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbN4-0008Lk-Dr
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
X-Inumbo-ID: 0144c565-3c22-414f-b139-cf38414afbf5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0144c565-3c22-414f-b139-cf38414afbf5;
	Thu, 08 Oct 2020 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=K5qarsK62Og7Ss+hbnvf8Yalf+UlShpHtXrprG47jgU=; b=OkRPZXNg3ZqMCsVsp0ZH8rq+D/
	JJo6Nr/IEHm5KutUTroBv3kBaGGTtYOGy4QVevrM5Ff4YPJtzFZXlWX7ibUhgTv5xAnlbdHd77j+D
	BTLLv3P5OmTqT6XvuOmTwLdT9mVCmWsj/0RCd/QglH8qPT/3jdA38gL0QkvHdNKrWKXY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN3-0004R0-Hp
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:33 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN3-0003pX-G5
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:33 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN1-0006So-Jc; Thu, 08 Oct 2020 20:14:31 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	committers@xenproject.org
Subject: [OSSTEST PATCH 00/13] Immediately retry failing tests
Date: Thu,  8 Oct 2020 20:14:09 +0100
Message-Id: <20201008191422.5683-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We discussed this at the Xen Summit.  What I do here is immediate
retry the jobs with regressions, and then reanalyse the original full
flight.  If the retries showed the failures were heisenbugs, this will
let them though.

This should reduce the negative impact on development, of heisenbugs,
but it won't do anything to help keep them out of the tree.

I think this approach was basically already agreed, but I'm CCing the
committers here for form's sake.

 README.dev          |  9 +++----
 cr-daily-branch     | 58 ++++++++++++++++++++++++++++++++++++++++++---
 cr-disk-report      |  2 +-
 cr-try-bisect-adhoc |  2 +-
 cri-args-hostlists  | 28 +++++++++++++++-------
 cs-bisection-step   |  4 ++--
 sg-report-flight    | 35 +++++++++++++++++++++++----
 sg-run-job          |  9 ++++++-
 8 files changed, 121 insertions(+), 26 deletions(-)

-- 
2.20.1


