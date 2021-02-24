Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA87323AA8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89252.167980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEraZ-0001bx-8t; Wed, 24 Feb 2021 10:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89252.167980; Wed, 24 Feb 2021 10:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEraZ-0001bY-5c; Wed, 24 Feb 2021 10:40:15 +0000
Received: by outflank-mailman (input) for mailman id 89252;
 Wed, 24 Feb 2021 10:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEraX-0001bT-QE
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:40:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d2cc7c-1fbb-492f-bd0e-5d14d4c0037c;
 Wed, 24 Feb 2021 10:40:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B53A6ADE5;
 Wed, 24 Feb 2021 10:40:11 +0000 (UTC)
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
X-Inumbo-ID: 24d2cc7c-1fbb-492f-bd0e-5d14d4c0037c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614163211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTuUl2xtB7P8DiJLTPQATjG5gYNCqVCkgtBitZgCg4Q=;
	b=J9wF47lwAd/6Uxv8/LdoQd8RDfv0/rV2n1YFnO6NWksaOC5liujjU4MjMv2pRzDylJVZ51
	zuGksERZdhVn1s5zlqdtIfBL/BetaDhv0+LcOQeuDcDpvV27baIfFcZfCJOXd9cqFfGyZS
	f+ma7dh+eow/AL1E/2hD5DF77y4Ja3o=
Subject: Re: [PATCH 1/2] hvmloader: use Xen private header for elf structs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8531c7e-abdd-67da-f8a1-583126c265f5@suse.com>
Date: Wed, 24 Feb 2021 11:40:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224102641.89455-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.02.2021 11:26, Roger Pau Monne wrote:
> Do not use the system provided elf.h, and instead use elfstructs.h
> from libelf.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


