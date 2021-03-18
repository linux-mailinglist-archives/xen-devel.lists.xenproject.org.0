Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9123340232
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 10:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98862.187800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMp5i-0003aL-6c; Thu, 18 Mar 2021 09:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98862.187800; Thu, 18 Mar 2021 09:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMp5i-0003Zw-3I; Thu, 18 Mar 2021 09:37:18 +0000
Received: by outflank-mailman (input) for mailman id 98862;
 Thu, 18 Mar 2021 09:37:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMp5g-0003Zr-WC
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 09:37:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58efed81-6adc-4f99-b7a4-9a9e6c567116;
 Thu, 18 Mar 2021 09:37:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3732AC17;
 Thu, 18 Mar 2021 09:37:15 +0000 (UTC)
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
X-Inumbo-ID: 58efed81-6adc-4f99-b7a4-9a9e6c567116
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616060235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukLAMNIvBpq4HyhRpau2cPanzqY5VLTTuKDiy09K4O4=;
	b=CkGqLCTOrHcLxo+EVNv9nR0j5gXBbXeLR0pY2PiX9VskQh/xd2ItsYyIvT/qxbR05dRqf2
	1sSa6/LqTnK0iOdYEpRWDNWuo/NGi+sMa5egnDT1jroU6q+ZXA/A3k5VVrzlpHTIcL+k7w
	BJsJcI7ydTkvPHNhMiI07KOXtdyltjg=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <24658.1583.601613.903527@mariner.uk.xensource.com>
 <4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
 <24658.5692.932979.892439@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <089b9e31-e767-8e01-7a62-466d45f83b7d@suse.com>
Date: Thu, 18 Mar 2021 10:37:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24658.5692.932979.892439@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.03.2021 15:46, Ian Jackson wrote:
> Jan, what is your summary opinion about patch 3 ?

Just to answer this question explicitly: I can't form one yet
without further information provided to me.

Jan

