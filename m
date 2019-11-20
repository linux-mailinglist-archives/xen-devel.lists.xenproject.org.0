Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BBC1037A2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 11:34:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXNG0-0005CI-RD; Wed, 20 Nov 2019 10:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kz7b=ZM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXNFz-0005CB-A2
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 10:30:43 +0000
X-Inumbo-ID: cd9a05b6-0b80-11ea-b678-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd9a05b6-0b80-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 10:30:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so578448wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 02:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NqKLRu8pPvLk4KTpsNYkAw9p0XKJt2+vRo+cuZRSIZk=;
 b=mBq+Ji6MhvzjsvyqPsu61sd544Ye8mtgN6GpnfJpnsQHGsUW4kEzmPjHC4GK0k5Pzq
 y+4CgcnN4HMVjEkHsFIJEElrIAXBDXweNfP8RQMDV6ZWLkxZJVEQWz+oFZ4kOGTusuhv
 LEmeAce4tRgXaM9so5wo7I2de3ue7AN6JsrkcQcE5+zH4BSC1si07mKHUcVN6oSDLwcv
 efijjdVokaRpgf625a6fgm7J6uDmd0eLt6skOuLI91l35AjliAM0l0zNxSk+i8003utF
 oLf88sMlF9cFq2vZJnoiPsF9jBwTpAkzclxJ8GK6EjG4fbICqEGUKG7YNHsdm1EUiCEf
 /0/w==
X-Gm-Message-State: APjAAAWygTA6fkxeRhEVQgWs/kwM0RhBoKJ+294ZYjeo7y3i8RFHx94A
 7UL/DP8LEWNkP1uiv3NRSJkckY/soPNiew==
X-Google-Smtp-Source: APXvYqzOupMgjTPpX2P9acg2XfWp/SubX3On8tmHFPDXtQq8gBR9h0u5BXUXNDNP8fy6cj25kMZdmA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr2222494wrw.238.1574245841713; 
 Wed, 20 Nov 2019 02:30:41 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id y8sm5927241wmi.9.2019.11.20.02.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 02:30:41 -0800 (PST)
Date: Wed, 20 Nov 2019 10:30:39 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <20191120103039.ulibfzcednfvubf4@debian>
References: <20191115161532.1231811-1-anthony.perard@citrix.com>
 <20191115162215.aeeypi2hzsdpw463@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115162215.aeeypi2hzsdpw463@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] configure: Fix test for python
 3.8
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDQ6MjI6MTVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIE5vdiAxNSwgMjAxOSBhdCAwNDoxNTozMlBNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuOC93aGF0c25ldy8zLjguaHRt
bCNkZWJ1Zy1idWlsZC11c2VzLXRoZS1zYW1lLWFiaS1hcy1yZWxlYXNlLWJ1aWxkCj4gPiAKPiA+
ID4gVG8gZW1iZWQgUHl0aG9uIGludG8gYW4gYXBwbGljYXRpb24sIGEgbmV3IC0tZW1iZWQgb3B0
aW9uIG11c3QgYmUKPiA+ID4gcGFzc2VkIHRvIHB5dGhvbjMtY29uZmlnIC0tbGlicyAtLWVtYmVk
IHRvIGdldCAtbHB5dGhvbjMuOCAobGluayB0aGUKPiA+ID4gYXBwbGljYXRpb24gdG8gbGlicHl0
aG9uKS4gVG8gc3VwcG9ydCBib3RoIDMuOCBhbmQgb2xkZXIsIHRyeQo+ID4gPiBweXRob24zLWNv
bmZpZyAtLWxpYnMgLS1lbWJlZCBmaXJzdCBhbmQgZmFsbGJhY2sgdG8gcHl0aG9uMy1jb25maWcK
PiA+ID4gLS1saWJzICh3aXRob3V0IC0tZW1iZWQpIGlmIHRoZSBwcmV2aW91cyBjb21tYW5kIGZh
aWxzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBOb3RlczoKPiA+ICAgICBZb3UgbWF5IHdh
bnQgdG8gcmVydW4gLi9hdXRvZ2VuLnNoIG9uIGNvbW1pdC4KPiAKPiBJbmRlZWQuIFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyBhIGxvdCBvZiB1bnJlbGF0ZWQgY2hhbmdlcywgcHJlc3VtYWJseSBkdWUK
PiB0byB0aGUgZGlmZmVyZW5jZSBpbiBhdXRvY29uZi4KPiAKPiA+IGRpZmYgLS1naXQgYS9tNC9w
eXRob25fZGV2ZWwubTQgYi9tNC9weXRob25fZGV2ZWwubTQKPiA+IGluZGV4IGUzNjVjZDY1OGUw
ZS4uYmJmMWUwMzU0YjJiIDEwMDY0NAo+ID4gLS0tIGEvbTQvcHl0aG9uX2RldmVsLm00Cj4gPiAr
KysgYi9tNC9weXRob25fZGV2ZWwubTQKPiA+IEBAIC0yMyw4ICsyMywxNSBAQCBBU19JRihbdGVz
dCB4IiRweWNvbmZpZyIgPSB4Im5vIl0sIFsKPiA+ICBdLCBbCj4gPiAgICAgIGRubCBJZiBweXRo
b24tY29uZmlnIGlzIGZvdW5kIHVzZSBpdAo+ID4gICAgICBDUFBGTEFHUz0iJENGTEFHUyBgJFBZ
VEhPTi1jb25maWcgLS1jZmxhZ3NgIgo+ID4gLSAgICBMREZMQUdTPSIkTERGTEFHUyBgJFBZVEhP
Ti1jb25maWcgLS1sZGZsYWdzYCIKPiA+IC0gICAgTElCUz0iJExJQlMgYCRQWVRIT04tY29uZmln
IC0tbGlic2AiCj4gPiArICAgIGRubCBXZSBuZWVkIHRvIHVzZSAtLWVtYmVkIHdpdGggcHl0aG9u
IDMuOCBidXQgbm90IHdpdGggZWFybGllciB2ZXJzaW9uIHNvCj4gPiArICAgIGRubCBjaGVjayBp
ZiBpdCBpcyByZWNvZ25pemVkLgo+ID4gKyAgICBweXRob25fZGV2ZWxfZW1iZWQ9IiIKPiA+ICsg
ICAgaWYgJFBZVEhPTi1jb25maWcgLS1lbWJlZCA+L2Rldi9udWxsIDI+L2Rldi9udWxsOyB0aGVu
Cj4gPiArICAgICAgcHl0aG9uX2RldmVsX2VtYmVkPSItLWVtYmVkIgo+ID4gKyAgICBmaQo+ID4g
KyAgICBMREZMQUdTPSIkTERGTEFHUyBgJFBZVEhPTi1jb25maWcgLS1sZGZsYWdzICRweXRob25f
ZGV2ZWxfZW1iZWRgIgo+ID4gKyAgICBMSUJTPSIkTElCUyBgJFBZVEhPTi1jb25maWcgLS1saWJz
ICRweXRob25fZGV2ZWxfZW1iZWRgIgo+ID4gKyAgICB1bnNldCBweXRob25fZGV2ZWxfZW1iZWQK
PiA+ICBdKQo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKSnVlcmdlbiwgc2lu
Y2Ugd2UncmUgZ29pbmcgdG8gYW5ub3VuY2UgWGVuIHRvIGJlIHB5dGhvbiAzIGNvbXBhdGlibGUg
Zm9yCnRoaXMgcmVsZWFzZSwgaXQgd291bGQgYmUgZ29vZCB0byBnZXQgdGhpcyBwYXRjaCBpbi4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
