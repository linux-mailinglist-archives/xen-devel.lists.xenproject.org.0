Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFB2F10A2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64770.114493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyusP-0001yt-7q; Mon, 11 Jan 2021 10:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64770.114493; Mon, 11 Jan 2021 10:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyusP-0001yU-4J; Mon, 11 Jan 2021 10:56:45 +0000
Received: by outflank-mailman (input) for mailman id 64770;
 Mon, 11 Jan 2021 10:56:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyusO-0001yP-Dp
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:56:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyusO-00021H-CS
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:56:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyusO-0006oE-BH
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:56:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>) id 1kyusM-0003Oy-LS
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:56:42 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=XSugRPvmHn5o7Qi6C8PeX2+hKYJGdQQACsk65w1H6XM=; b=ydrHP7M/fagr/vwjVZQcAGiO1B
	258x06O+moiLKkx82PttjlKDcENiBelRfyHGS8OMkNLUxAQBLQFWhKA9m5spab2WYFgLvmn1APww4
	lM71LunEKF+56ltloaQicY3nDf8VXfQRzjjtqLyK1UqtymK2oXC7hTyX+SYWwvIpFKnA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24572.12010.428976.367984@mariner.uk.xensource.com>
Date: Mon, 11 Jan 2021 10:56:42 +0000
To: xen-devel@lists.xenproject.org
Subject: laxton0 (was Re: [xen-unstable test] 158335: regressions - trouble: blocked/broken/fail/pass)
In-Reply-To: <osstest-158335-mainreport@xen.org>
References: <osstest-158335-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

osstest service owner writes ("[xen-unstable test] 158335: regressions - trouble: blocked/broken/fail/pass"):
> flight 158335 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/158335/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64                     <job status>                 broken
>  build-arm64-xsm                 <job status>                 broken
>  build-arm64               4 host-install(4)        broken REGR. vs. 158290
>  build-arm64-xsm           4 host-install(4)        broken REGR. vs. 158290

This seems to have been laxton's pdu relay sticking.  The host history
suggests this has cleared for now so I am going to leave it in
service.

When we can do on-site work in the datacentre, we'll move it to one of
the new zero-crossing PDUs which should solve the problem properly.

Ian.

