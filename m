Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAA2C0A61
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34267.65177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBoW-0007Fn-NZ; Mon, 23 Nov 2020 13:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34267.65177; Mon, 23 Nov 2020 13:23:28 +0000
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
	id 1khBoW-0007FN-Jo; Mon, 23 Nov 2020 13:23:28 +0000
Received: by outflank-mailman (input) for mailman id 34267;
 Mon, 23 Nov 2020 13:23:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBoV-0007FD-EC
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:23:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 601600ac-bd94-402e-a552-eca6ca2eaaad;
 Mon, 23 Nov 2020 13:23:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF0F6ACC6;
 Mon, 23 Nov 2020 13:23:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBoV-0007FD-EC
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:23:27 +0000
X-Inumbo-ID: 601600ac-bd94-402e-a552-eca6ca2eaaad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 601600ac-bd94-402e-a552-eca6ca2eaaad;
	Mon, 23 Nov 2020 13:23:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606137806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckY06JkNzZUVtS4pxyVz0NwIbNY7+mHt0ItbeV5rr0g=;
	b=S5pjf58xRZR31IwC5B9ka71XPJl4r/Z59hN3QGRFDipOehQ/lk7PbNhyKxfJku3GaDWIBL
	wgY/H+W44YmuQiMI64jQR1e84ZAXmmxgZG56MNuksiVxOrRsQ9qPLVbMw1IZzKDYSm8wfQ
	UGxt3ePzw/Y66aYneBT2356XF6ynBv0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF0F6ACC6;
	Mon, 23 Nov 2020 13:23:25 +0000 (UTC)
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH_2/2=5d_tools/libs=3a_fix_uninstall?=
 =?UTF-8?Q?_rule_for_header_files?=
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
 <74c629db-0f63-aba0-f294-9668c29b8f70@suse.com>
 <5495896C-2AD6-413E-A1A6-D9994F10D391@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <937093c2-3d7a-af83-8919-b74caff2663e@suse.com>
Date: Mon, 23 Nov 2020 14:23:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5495896C-2AD6-413E-A1A6-D9994F10D391@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.10.2020 16:24, Bertrand Marquis wrote:
>> On 19 Oct 2020, at 08:21, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> This again was working right only as long as $(LIBHEADER) consisted of
>> just one entry.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> The change is obviously fixing a bug :-) and the double $ is required to protect from make.

I'll give it a day or two more to get an ack (or any negative
form of feedback), but I guess I'll go ahead and commit this
with just Bertrand's R-b otherwise.

Jan

