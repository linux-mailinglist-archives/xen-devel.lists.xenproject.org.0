Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994A34A691
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101716.194690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkv4-0000rj-Aa; Fri, 26 Mar 2021 11:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101716.194690; Fri, 26 Mar 2021 11:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkv4-0000rK-6w; Fri, 26 Mar 2021 11:46:26 +0000
Received: by outflank-mailman (input) for mailman id 101716;
 Fri, 26 Mar 2021 11:46:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPkv3-0000rB-6D
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:46:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPkv3-0005kx-5R
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:46:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPkv3-0007yZ-3Y
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:46:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPkuz-0002Iq-Oy; Fri, 26 Mar 2021 11:46:21 +0000
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
	bh=+eKoJVTrjcn6zLaYfAUlrGlZJq79N3zzDjZu59PLv9k=; b=Tvtaco5/0LJGc0WP6EpdcBjiLo
	RBvEtJYQ25svo6StoBUuFEQhsj4NDMSded/mD83JlY5fnEL3jOb61jElLmz2MZLZ6nwH6YvZiXNip
	807Gd0oa0JXVy/ypRU/CunGA5+mmKHNy42xOIxZaomfMQHqsVv6cqY3Zb6PIIQA76X3I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.51597.594171.236406@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:46:21 +0000
To: Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] Branching: Update version files etc. for newly
 unstable
In-Reply-To: <24669.51507.523770.695347@mariner.uk.xensource.com>
References: <20210324162831.7587-1-iwj@xenproject.org>
	<0c938aa8-a954-55f5-7d21-37f2c10ea136@suse.com>
	<24669.51507.523770.695347@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH 1/2] Branching: Update version files etc. for newly unstable"):
> Jan Beulich writes ("Re: [PATCH 1/2] Branching: Update version files etc. for newly unstable"):
> > I suppose you didn't mean to leave "-rc" in there?
> 
> You are right.  I will fix it in a moment.

Oh Andy already did so.  Thanks,

Ian.

