Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05633250B6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89777.169405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGza-00047y-9z; Thu, 25 Feb 2021 13:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89777.169405; Thu, 25 Feb 2021 13:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGza-00047Z-6i; Thu, 25 Feb 2021 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 89777;
 Thu, 25 Feb 2021 13:47:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGzY-00047U-Bf
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:47:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGzY-0001IO-7E
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:47:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGzY-0006sY-6D
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:47:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFGzR-0001ZW-VP; Thu, 25 Feb 2021 13:47:38 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=AqxXIXnje+Cpc30fpYjhZLJ2MVLBZvmJuJWGNo8Ce44=; b=6KbY6id2LQO/Q7WcvOYj93qvDK
	NDj2uRAy6Cs3B5LKCHRijVqWL9rBXTkJElF1xv8tGKcOIbaVS9IKq19rJm8CXWOYzrVZL21nmFmK6
	q1Vj/9eoHddoTAtp9xEoTuVkEDeg51k0GTkbi1CtR5lkCB1JCN6kOTWBu3bM0Qvuspbg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.43641.705515.888498@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 13:47:37 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [4.15] Re: [PATCH] x86/EFI: suppress GNU ld 2.36'es creation of base
 relocs
In-Reply-To: <fff8e64c-f724-11e8-daa5-80147c6925dd@suse.com>
References: <6ce5b1a7-d7c2-c30c-ad78-233379ea130b@suse.com>
	<53c7a708-1664-0186-1fd6-1056f8e7839c@citrix.com>
	<f8e56c90-f51c-01f7-0987-4c0697a17bb0@suse.com>
	<a35dd0b7-b804-9c75-b93c-e764345df46b@citrix.com>
	<fff8e64c-f724-11e8-daa5-80147c6925dd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[4.15] Re: [PATCH] x86/EFI: suppress GNU ld 2.36'es creation of base relocs"):
> Since getting Andrew's ack has taken across the firm-freeze boundary,
> may I ask for a release-ack here?

Indeed.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

>  As noted this change (alongside
> the earlier one) will want backporting, perhaps even to security-
> support-only branches.

Noted.

Ian.

