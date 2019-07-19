Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960386E1D0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 09:38:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoNPJ-000610-82; Fri, 19 Jul 2019 07:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfBs=VQ=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hoNPH-00060v-Of
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 07:34:19 +0000
X-Inumbo-ID: 9b693d18-a9f7-11e9-be39-2f7d831fb558
Received: from gandi.net (unknown [217.70.182.73])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b693d18-a9f7-11e9-be39-2f7d831fb558;
 Fri, 19 Jul 2019 07:34:14 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id AC33D16053E;
 Fri, 19 Jul 2019 07:34:13 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190718215428.6727-1-george.dunlap@citrix.com>
From: Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
Date: Fri, 19 Jul 2019 09:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718215428.6727-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3LzE4LzE5IDExOjU0IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IFRoZSBHbyBiaW5k
aW5ncyBmb3IgbGlieGwgbWlzcyBmdW5jdGlvbnMgZnJvbSBsaWJ4bF91dGlscywgbGV0J3Mgc3Rh
cnQKPiB3aXRoIHRoZSBzaW1wbGUgbGlieGxfZG9taWRfdG9fbmFtZSBhbmQgaXRzIGNvdW50ZXJw
YXJ0Cj4gbGlieGxfbmFtZV90b19kb21pZC4KPgo+IE5CIHRoYXQgQy5Hb1N0cmluZygpIHdpbGwg
cmV0dXJuICIiIGlmIGl0J3MgcGFzc2VkIGEgTlVMTDsgc2VlCj4gaHR0cHM6Ly9naXRodWIuY29t
L2dvbGFuZy9nby9pc3N1ZXMvMzI3MzQjaXNzdWVjb21tZW50LTUwNjgzNTQzMgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0Pgo+IFNp
Z25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAt
LS0KPiB2MzoKPiAgLSBXaXJlIGludG8gYnVpbGQgc3lzdGVtCj4gIC0gQWRkIHJlZmVyZW5jZSB0
byBDLkdvU3RyaW5nKCkgaGFuZGxpbmcgTlVMTCB0byBjb21taXQgbWVzc2FnZQo+Cj4gTmljb2xh
cywgY291bGQgeW91IHRlc3QgdG8gc2VlIGlmIHRoaXMgYWN0dWFsbHkgd29ya3MgZm9yIHlvdT8K
VGVzdGVkIGl0LCBpdCB3b3Jrcy4KCkkgbXVzdCBjb25mZXNzIEkgZG8gbm90IHVzZSB0aGF0IGlt
cG9ydCBwYXRoIGFzIHRoZSBuZXcgbW9kdWxlcyBtZWNoYW5pc20KaW50cm9kdWNlZCBpbiBHbzEu
MTEgZG93bmxvYWRzIGFuZCBjb21waWxlIGEgdmVyc2lvbmVkIGNvcHkgb2YgZXZlcnkKZGVwZW5k
ZW5jeSBwZXIgcHJvamVjdCwgYW5kIHRoaXMgYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGgg
dGhlIGJ1aWxkCnN5c3RlbSB1c2VkIGhlcmUuCgpOaWNvbGFzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
