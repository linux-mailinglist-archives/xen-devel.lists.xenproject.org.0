Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7E18CFCD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:15:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFINx-0006xe-3R; Fri, 20 Mar 2020 14:12:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ak30=5F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jFINv-0006xU-L4
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:12:27 +0000
X-Inumbo-ID: d3adbe78-6ab4-11ea-bd7c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3adbe78-6ab4-11ea-bd7c-12813bfff9fa;
 Fri, 20 Mar 2020 14:12:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21FCDAF76;
 Fri, 20 Mar 2020 14:12:26 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <24180.53001.370379.336253@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <486e328b-f0bc-72e8-5c71-ccd8f7edeb47@suse.com>
Date: Fri, 20 Mar 2020 15:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <24180.53001.370379.336253@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
 David Woodhouse <dwmw2@infradead.org>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAgMTU6MTEsIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtQQVRDSCAxLzJdIHRvb2xzL3hlbnN0b3JlOiBEbyBub3QgYWJvcnQgeGVuc3Rv
cmUtbHMgaWYgYSBub2RlIGRpc2FwcGVhcnMgd2hpbGUgaXRlcmF0aW5nIik6Cj4+IE9uIDE5LjAz
LjIwIDIxOjQwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+PiBGcm9tOiBEYXZpZCBXb29kaG91
c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+IC4uLgo+Pj4gRm9yIHRoZSBzcGVjaWZpYyBjYXNlIG9m
IEVOT0VOVCBpdCBzZWVtcyByZWFzb25hYmxlIHRvIGRlY2xhcmUgdGhhdCwKPj4+IGJ1dCBmb3Ig
dGhlIHRpbWluZywgd2UgbWlnaHQgYXMgd2VsbCBqdXN0IG5vdCBoYXZlIHNlZW4gdGhhdCBub2Rl
IGF0Cj4+PiBhbGwgd2hlbiBjYWxsaW5nIHhzX2RpcmVjdG9yeSgpIGZvciB0aGUgcGFyZW50LiBC
eSBpZ25vcmluZyB0aGUgZXJyb3IsCj4+PiB3ZSBnaXZlIGFjY2VwdGFibGUgb3V0cHV0Lgo+IAo+
IFRoYW5rcy4KPiAKPj4gSGF2ZSB5b3UgdGhvdWdodCBhYm91dCB0aGUgcG9zc2liaWxpdHkgdG8g
ZG8gdGhlIGNvbXBsZXRlIGhhbmRsaW5nIGluIGEKPj4gc2luZ2xlIHRyYW5zYWN0aW9uPyBUaGlz
IHdvdWxkIGVuc3VyZSBhIGNvbXBsZXRlIGNvbnNpc3RlbnQgcGljdHVyZQo+PiBmcm9tIHRoZSB0
aW1lIHRoZSBvcGVyYXRpb24gaGFzIHN0YXJ0ZWQuIEFueSBpbmNvbnNpc3RlbmN5IHNob3VsZCBi
ZQo+PiByZXBvcnRlZCBhcyBhbiBlcnJvciB0aGVuLgo+IAo+IEkgdGhpbmsgdGhpcyB3b3VsZCBi
ZSBhIGdvb2QgaWRlYSAobm90IGxlYXN0IGJlY2F1c2UgaXQgd291bGQgbWVhbgo+IHRoYXQgY2Fs
bGVycyBvZiB4ZW5zdG9yZS1scyB3b3VsZG4ndCBzZWUgaW5jb25zaXN0ZW50IGRhdGEpIGJ1dCBJ
Cj4gdGhpbmsgaXQgd291bGQgYmUgYW4gZW5oYW5jZW1lbnQuCj4gCj4gRm9yIG5vdywgZm9yIERh
dmlkJ3Mgb3JpZ2luYWwgcGF0Y2g6Cj4gCj4gUmV2aWV3ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+IElmIGFuZCB3aGVuIHdlIGludHJvZHVjZSBhIHRy
YW5zYWN0aW9uLCBEYXZpZCdzIDEvIHNob3VsZCBiZSByZXZlcnRlZAo+IGFzIGluZGVlZCB0aGVu
IGV2ZW4gRU5PRU5UIHdvdWxkIGluZGljYXRlIHNvbWUga2luZCBvZiBzZXJpb3VzCj4gcHJvYmxl
bS4KCkZpbmUgd2l0aCBtZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
