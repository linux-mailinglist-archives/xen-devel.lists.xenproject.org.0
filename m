Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05271F4047
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 07:16:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSxX9-0006wT-W2; Fri, 08 Nov 2019 06:14:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSxX8-0006wO-K8
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:14:10 +0000
X-Inumbo-ID: f9c50f5a-01ee-11ea-a1d0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9c50f5a-01ee-11ea-a1d0-12813bfff9fa;
 Fri, 08 Nov 2019 06:14:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6F79AB98;
 Fri,  8 Nov 2019 06:14:08 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191104153047.568013-1-anthony.perard@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <85b50a92-489c-a820-0031-7df20c96fd3e@suse.com>
Date: Fri, 8 Nov 2019 07:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191104153047.568013-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix setting vncpasswd
 to empty string
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMTkgMTY6MzAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEJlZm9yZSA5M2RjYzIy
LCBlcnJvciBmcm9tIHNldHRpbmcgdGhlIHZuYyBwYXNzd29yZCB0byBhbiBlbXB0eQo+IHN0cmlu
Zywgd2hlbiBRRU1VIHdhc24ndCBleHBlY3RlZCBhIHBhc3N3b3JkLCBuZXZlciBwcmV2ZW50ZWQg
dGhlIGNyZWF0aW9uCj4gb2YgYSBndWVzdCwgYW5kIG9ubHkgbG9nZ2VkIGFuIGVycm9yIG1lc3Nh
Z2UuCj4gCj4gUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+IEZpeGVzOiA5M2RjYzIyZmU3OThjOWZhNWNlMTE3ZjFlZDZkYjBkOGJkNzc5MDIwCj4g
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
