Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE3197A64
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 13:09:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIsFZ-0004AG-8L; Mon, 30 Mar 2020 11:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIsFX-0004AB-Hn
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 11:06:35 +0000
X-Inumbo-ID: 84970492-7276-11ea-b9c0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84970492-7276-11ea-b9c0-12813bfff9fa;
 Mon, 30 Mar 2020 11:06:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26BDFAF6D;
 Mon, 30 Mar 2020 11:06:34 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Simran Singhal <singhalsimran0@gmail.com>
References: <20200329063747.GA13063@simran-Inspiron-5558>
 <20200329134914.lt77omzqybkzc5rs@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8275bc5f-724b-d4cf-02d8-6a0def944468@suse.com>
Date: Mon, 30 Mar 2020 13:06:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200329134914.lt77omzqybkzc5rs@debian>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] xen/x86: Remove parentheses from return
 arguments
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.03.2020 15:49, Wei Liu wrote:
> On Sun, Mar 29, 2020 at 12:07:47PM +0530, Simran Singhal wrote:
>> This patch remove unnecessary parentheses from return arguments.
>>
>> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
> 
> Reviewed-by: Wei Liu <wl@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

