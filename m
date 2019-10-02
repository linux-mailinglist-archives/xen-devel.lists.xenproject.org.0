Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8FC88CB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 14:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFdqw-0007LM-0A; Wed, 02 Oct 2019 12:35:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFdqu-0007LH-EH
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 12:35:32 +0000
X-Inumbo-ID: 1dfc61c1-e511-11e9-9714-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 1dfc61c1-e511-11e9-9714-12813bfff9fa;
 Wed, 02 Oct 2019 12:35:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A757AF26;
 Wed,  2 Oct 2019 12:35:30 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191001152233.55491-1-roger.pau@citrix.com>
 <20191001164407.GJ1163@perard.uk.xensource.com>
 <20191002100843.dq3m53awg22dcrj7@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c7df9cd3-2821-913f-e670-3a6531c93a0d@suse.com>
Date: Wed, 2 Oct 2019 14:35:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002100843.dq3m53awg22dcrj7@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] libxl: wait for the ack when issuing
 power control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, DavidScott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMTI6MDgsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+IEFkZGluZyBKdWVy
Z2VuIGZvciBhIHJlbGVhc2UtYWNrLgo+IAo+IE9uIFR1ZSwgT2N0IDAxLCAyMDE5IGF0IDA1OjQ0
OjA3UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+PiBPbiBUdWUsIE9jdCAwMSwgMjAx
OSBhdCAwNToyMjozM1BNICswMjAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBDdXJyZW50
bHkgb25seSBzdXNwZW5kIHBvd2VyIGNvbnRyb2wgcmVxdWVzdHMgd2FpdCBmb3IgYW4gYWNrIGZy
b20gdGhlCj4+PiBkb21haW4sIHdoaWxlIHBvd2VyIG9mZiBvciByZWJvb3QgcmVxdWVzdHMgc2lt
cGx5IHdyaXRlIHRoZSBjb21tYW5kIHRvCj4+PiB4ZW5zdG9yZSBhbmQgZXhpdC4KPj4+Cj4+PiBJ
bnRyb2R1Y2UgYSAxIG1pbnV0ZSB3YWl0IGZvciB0aGUgZG9tYWluIHRvIGFja25vd2xlZGdlIHRo
ZSByZXF1ZXN0LCBvcgo+Pj4gZWxzZSByZXR1cm4gYW4gZXJyb3IuIFRoZSBzdXNwZW5kIGNvZGUg
aXMgc2xpZ2h0bHkgbW9kaWZpZWQgdG8gdXNlIHRoZQo+Pj4gbmV3IGluZnJhc3RydWN0dXJlIGFk
ZGVkLCBidXQgc2hvdWxkbid0IGhhdmUgYW55IGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pj4KPj4+IEZp
eCB0aGUgb2NhbWwgYmluZGluZ3MgYW5kIGFsc28gcHJvdmlkZSBhIGJhY2t3YXJkcyBjb21wYXRp
YmxlCj4+PiBpbnRlcmZhY2UgZm9yIHRoZSByZWJvb3QgYW5kIHBvd2Vyb2ZmIGxpYnhsIEFQSSBm
dW5jdGlvbnMuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
