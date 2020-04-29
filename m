Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FA1BE1C7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:54:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTo6F-0001g4-Do; Wed, 29 Apr 2020 14:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTo6E-0001fz-DR
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:54:10 +0000
X-Inumbo-ID: 47faf0be-8a29-11ea-9954-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47faf0be-8a29-11ea-9954-12813bfff9fa;
 Wed, 29 Apr 2020 14:54:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A18CFABD7;
 Wed, 29 Apr 2020 14:54:07 +0000 (UTC)
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
 <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
 <69deb8f4-bafe-734c-f6fa-de41ecf539d2@xen.org>
 <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
 <48d591a8-ce4f-2952-19f8-983637c9cfa5@suse.com>
 <208798a2-e0e5-916f-cf8d-31a976fa3e39@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3e48e70-0fff-c4dc-1e46-4e436e8b84e2@suse.com>
Date: Wed, 29 Apr 2020 16:54:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <208798a2-e0e5-916f-cf8d-31a976fa3e39@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 16:13, Julien Grall wrote:
> So can you please have another and explain how the line can be drawn with just two architectures in place.

There are abstract considerations that can be used to draw the
line, as well as knowledge of people on architectures Xen doesn't
run on, but where one can - with such knowledge - extrapolate how
it would want to be implemented.

I don't think the question at this point is where to draw the
line, but whether to have asm-generic/ in the first place.

Jan

