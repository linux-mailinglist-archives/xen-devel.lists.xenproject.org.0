Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7314BDCB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:32:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTjY-00076g-Nl; Tue, 28 Jan 2020 16:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwTjX-00076b-6K
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:28:59 +0000
X-Inumbo-ID: 48c75298-41eb-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48c75298-41eb-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 16:28:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCBB7AD29;
 Tue, 28 Jan 2020 16:28:57 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
References: <1580228659-6086-1-git-send-email-boris.ostrovsky@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9b1ae1c0-a80b-5ef4-5164-6bc74593c5c6@suse.com>
Date: Tue, 28 Jan 2020 17:28:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1580228659-6086-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/gntdev: Do not use mm notifiers with
 autotranslating guests
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
Cc: ilpo.jarvinen@cs.helsinki.fi, jgg@mellanox.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAgMTc6MjQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDb21taXQgZDNlZWIx
ZDc3YzVkICgieGVuL2dudGRldjogdXNlIG1tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQiKQo+
IG1pc3NlZCBhIHRlc3QgZm9yIHVzZV9wdGVtb2Qgd2hlbiBjYWxsaW5nIG1tdV9pbnRlcnZhbF9y
ZWFkX2JlZ2luKCkuIEZpeAo+IHRoYXQuCj4gCj4gRml4ZXM6IGQzZWViMWQ3N2M1ZCAoInhlbi9n
bnRkZXY6IHVzZSBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0IikKPiBDQzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZyAjIDUuNQo+IFJlcG9ydGVkLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5q
YXJ2aW5lbkBjcy5oZWxzaW5raS5maT4KPiBUZXN0ZWQtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBv
LmphcnZpbmVuQGNzLmhlbHNpbmtpLmZpPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNr
eSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpBY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
