Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62CE300B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 13:15:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNb3O-0007re-2t; Thu, 24 Oct 2019 11:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNb3M-0007rZ-9Y
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 11:13:16 +0000
X-Inumbo-ID: 45a1c676-f64f-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45a1c676-f64f-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 11:13:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AFF26B4E6;
 Thu, 24 Oct 2019 11:13:13 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
References: <20191024110618.6436-1-wl@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e05ef290-8e71-046f-a687-9d1a8e1ea7fe@suse.com>
Date: Thu, 24 Oct 2019 13:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024110618.6436-1-wl@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to
 blktap2
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
Cc: lars.kurth@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTM6MDYsIFdlaSBMaXUgd3JvdGU6Cj4gQmxrdGFwMiBpcyBnb25lLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gLS0tCj4gICBDT05UUklCVVRJ
TkcgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL0NPTlRSSUJVVElORyBiL0NPTlRSSUJVVElORwo+IGluZGV4IDQ3ZjUzZTlhNDkuLjRmZmY0
ZmQ5ZjYgMTAwNjQ0Cj4gLS0tIGEvQ09OVFJJQlVUSU5HCj4gKysrIGIvQ09OVFJJQlVUSU5HCj4g
QEAgLTEzLDcgKzEzLDYgQEAgTW9zdCBvZiB0aGUgWGVuIFByb2plY3QgY29kZSBpcyBsaWNlbnNl
ZCB1bmRlciBHUEx2MiwgYnV0IGEgbnVtYmVyIG9mCj4gICBkaXJlY3RvcmllcyBhcmUgcHJpbWFy
aWx5IGxpY2Vuc2VkIHVuZGVyIGRpZmZlcmVudCBsaWNlbnNlcy4KPiAgIAo+ICAgTW9zdCBub3Rh
Ymx5Ogo+IC0gLSB0b29scy9ibGt0YXAyICAgICAgOiBCU0QtTW9kaWZpZWQKPiAgICAtIHRvb2xz
L2xpYnhjICAgICAgICA6IExHUEwgdjIuMQo+ICAgIC0gdG9vbHMvbGlieGwgICAgICAgIDogTEdQ
TCB2Mi4xCj4gICAgLSB0b29scy94bCAgICAgICAgICAgOiBMR1BMIHYyLjEKPiAKCk1pbmQgYWRk
aW5nIHRvb2xzL2xpYnMgaW5zdGVhZD8KCldpdGggdGhhdDoKClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
