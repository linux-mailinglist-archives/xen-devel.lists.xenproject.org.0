Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF834CE87
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 13:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102953.196515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpo6-0006r1-LI; Mon, 29 Mar 2021 11:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102953.196515; Mon, 29 Mar 2021 11:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpo6-0006qc-IB; Mon, 29 Mar 2021 11:11:42 +0000
Received: by outflank-mailman (input) for mailman id 102953;
 Mon, 29 Mar 2021 11:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQpo4-0006qE-Hk
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 11:11:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d28439f-c7fa-419a-9a30-3e25f47a9dbd;
 Mon, 29 Mar 2021 11:11:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CD39B454;
 Mon, 29 Mar 2021 11:11:33 +0000 (UTC)
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
X-Inumbo-ID: 1d28439f-c7fa-419a-9a30-3e25f47a9dbd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617016293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g0ufvfcK6pCGF1gqf8ZNOjSLsB+r2xUS5n9A5y63ipE=;
	b=n/8H+mwFqBqFI12fvV6EBU8j/4JAOua5hlEAjCUIBd0C3LfdZnkpQ/ouMmvoLi1YUE6HcE
	2ZgLsQlobhFvQSEnfsNYqX1/juAceTZME6pqoTuv25AG/QTRN44iNFEuYhf2fdAAcCzb5W
	nbok2nrGUaIIa8UeQbfpts7Yus4rTpI=
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.13.3 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <47e12a5f-173c-81ff-97be-d854c9d57527@suse.com>
Date: Mon, 29 Mar 2021 13:11:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

I am pleased to announce the release of Xen 4.13.3. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.13
(tag RELEASE-4.13.3) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-3/
(where a list of changes can also be found).

We recommend all users of the 4.13 stable series to update to this
latest point release.

Regards, Jan

