Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150FEDADB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 09:55:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRY5V-0007KE-VX; Mon, 04 Nov 2019 08:51:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRY5U-0007K9-L3
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 08:51:48 +0000
X-Inumbo-ID: 54fc1ce0-fee0-11e9-9595-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54fc1ce0-fee0-11e9-9595-12813bfff9fa;
 Mon, 04 Nov 2019 08:51:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2A53B132;
 Mon,  4 Nov 2019 08:51:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <6e358e65-2efe-9e4c-01e9-d9e317c6dfbc@amazon.com>
 <6b27b379-f996-4b33-bf24-178bec5ff6b9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd2076a5-2efd-a526-7477-9932e7482a04@suse.com>
Date: Mon, 4 Nov 2019 09:51:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b27b379-f996-4b33-bf24-178bec5ff6b9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Eslam Elnikety <elnikety@amazon.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAxNToyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMS8yMDE5
IDE0OjAwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4gVGhhbmtzIGZvciB0aGlzIHNlcmllcywg
SmFuLgo+Pgo+PiBPbiAzMC4xMC4xOSAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBUbyBm
dWxmaWxsIHRoZSAicHJvdGVjdGVkIiBpbiBpdHMgbmFtZSwgZG9uJ3QgbGV0IHRoZSByZWFsIGhh
cmR3YXJlCj4+PiB2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBSZXBvcnQgYSBjb250cm9sIHJlZ2lz
dGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFRCRDogRG8gd2Ugd2FudCB0byBw
ZXJtaXQgRG9tMCBhY2Nlc3M/Cj4+Cj4+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2l2ZSBhbiBhZG1p
bmlzdHJhdG9yIGEgd2F5IHRvIGdldCBQUElOIG91dHNpZGUKPj4gdGhlIGNvbnRleHQgb2YgYW4g
TUNFIHdoZW4gbmVlZGVkLgo+IAo+IEkgc3VwcG9zZSB0aGlzIGlzIGEgcmVhc29uYWJsZSByZXF1
ZXN0LsKgIFdlIHNob3VsZCBleHBvc2UgaXQgdG8gdGhlCj4gaGFyZHdhcmUgZG9tYWluLgoKVmlh
IChuZXcpIHN5c2N0bCAob3IgcGxhdGZvcm0gb3ApIG9yIGJ5IGFsbG93aW5nIGRpcmVjdCBNU1Ig
cmVhZCBhY2Nlc3M/CihJZiB0aGUgZm9ybWVyLCBJJ2Qgd2FudCB0byBtYWtlIHRoaXMgYWRkaXRp
b24gYSBzZXBhcmF0ZSBwYXRjaC4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
