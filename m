Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E510901CB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:39:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybU2-0002xC-5O; Fri, 16 Aug 2019 12:37:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5V6G=WM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hybU0-0002wz-OT
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 12:37:28 +0000
X-Inumbo-ID: 9a462a7c-c022-11e9-8bb5-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a462a7c-c022-11e9-8bb5-12813bfff9fa;
 Fri, 16 Aug 2019 12:37:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k2so1413242wrq.2
 for <xen-devel@lists.xen.org>; Fri, 16 Aug 2019 05:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+s0ogbGA4v5Gf6txnxf8+nlgB5+FfbIVsgxOZf7Gw2o=;
 b=nN8jSOi2Q5gZxPXcyrc0UHnog/qdXAGh8rwdZqHojfy2C+h2D2mkd0ijWOOJg5XvB4
 QuIkzJIhE7LFe1iEr9wBiPC3aRdnS8lIPKaUqIoTGTJMs0fuBthyH3agBV5SaANum7Pr
 zDZJACFe73VdnVcjIrKKg+mQfa+5yngGT/v40UdviXznQN9Mk8WTxMTc1ob0hBjlgBRa
 CV0oYCm6Cc3kQMrpinjjZg6i2dMemeribed1e1y3P+lk3tPz2L+DWeKH72XrM98xXdmY
 KOLihP+ZjeoUrcoCnMXt78AOmq0aggQD5zW0vBUXiDbjvEeQYHyqENLulTtEWZ26gI4I
 XAzw==
X-Gm-Message-State: APjAAAXHh5PsFis0nPbODo0paECf9RojEswTQgu1RLN1sv5Jh6xXvQy0
 rhfPTGAAG8QwGxa4P/b7OMA=
X-Google-Smtp-Source: APXvYqynTqysXCrqTA9PI9bU+i04yFb5ICSEu/OKDl42q2bygNN+LMLtmm2XGsF6Xo+t9xULx3UPqQ==
X-Received: by 2002:adf:e390:: with SMTP id e16mr129121wrm.153.1565959045814; 
 Fri, 16 Aug 2019 05:37:25 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id e10sm5817582wrn.33.2019.08.16.05.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:37:24 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:37:23 +0000
From: Wei Liu <wl@xen.org>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190816123723.exwa7zln2nh7rjkb@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190815113646.12918-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815113646.12918-1-wipawel@amazon.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH livepatch-python 1/1] livepatch: Add python
 bindings for livepatch operations
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
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, mpohlack@amazon.de,
 amazein@amazon.de, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTE6MzY6NDZBTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRXh0ZW5kIHRoZSBYQyBweXRob24gYmluZGluZ3MgbGlicmFyeSB0byBz
dXBwb3J0IGFsc28gYWxsIGNvbW1vbgo+IGxpdmVwYXRjaCBvcGVyYXRpb25zIGFuZCBhY3Rpb25z
Lgo+IAo+IEFkZCB0aGUgcHl0aG9uIGJpbmRpbmdzIGZvciB0aGUgZm9sbG93aW5nIG9wZXJhdGlv
bnM6Cj4gLSBzdGF0dXMgKHB5eGNfbGl2ZXBhdGNoX3N0YXR1cyk6Cj4gICBSZXF1aXJlcyBhIHBh
eWxvYWQgbmFtZSBhcyBhbiBpbnB1dC4KPiAgIFJldHVybnMgYSBzdGF0dXMgZGljdCBjb250YWlu
aW5nIGEgc3RhdGUgc3RyaW5nIGFuZCBhIHJldHVybiBjb2RlCj4gICBpbnRlZ2VyLgo+IC0gYWN0
aW9uIChweXhjX2xpdmVwYXRjaF9hY3Rpb24pOgo+ICAgUmVxdWlyZXMgYSBwYXlsb2FkIG5hbWUg
YW5kIGFuIGFjdGlvbiBpZCBhcyBhbiBpbnB1dC4gVGltZW91dCBhbmQKPiAgIGZsYWdzIGFyZSBv
cHRpb25hbCBwYXJhbWV0ZXJzLgo+ICAgUmV0dXJucyBhIHJldHVybiBjb2RlIGludGVnZXIuCj4g
LSB1cGxvYWQgKHB5eGNfbGl2ZXBhdGNoX3VwbG9hZCk6Cj4gICBSZXF1aXJlcyBhIHBheWxvYWQg
bmFtZSBhbmQgYSBtb2R1bGUncyBmaWxlbmFtZSBhcyBhbiBpbnB1dC4KPiAgIFJldHVybnMgYSBy
ZXR1cm4gY29kZSBpbnRlZ2VyLgo+IC0gbGlzdCAocHl4Y19saXZlcGF0Y2hfbGlzdCk6Cj4gICBU
YWtlcyBubyBwYXJhbWV0ZXJzLgo+ICAgUmV0dXJucyBhIGxpc3Qgb2YgZGljdHMgY29udGFpbmlu
ZyBlYWNoIHBheWxvYWQnczoKPiAgICogbmFtZSBhcyBhIHN0cmluZwo+ICAgKiBzdGF0ZSBhcyBh
IHN0cmluZwo+ICAgKiByZXR1cm4gY29kZSBhcyBhbiBpbnRlZ2VyCj4gICAqIGxpc3Qgb2YgbWV0
YWRhdGEga2V5PXZhbHVlIHN0cmluZ3MKPiAKPiBFYWNoIGZ1bmN0aW9ucyB0aHJvd3MgYW4gZXhj
ZXB0aW9uIGVycm9yIGJhc2VkIG9uIHRoZSBlcnJubyB2YWx1ZQo+IHJlY2VpdmVkIGZyb20gaXRz
IGNvcnJlc3BvbmRpbmcgbGlieGMgZnVuY3Rpb24gY2FsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
YXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE1h
cnRpbiBNYXplaW4gPGFtYXplaW5AYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBBbmRyYS1Jcmlu
YSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IExlb25hcmQg
Rm9lcnN0ZXIgPGZvZXJzbGVvQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50
aGV5IDxubWFudGhleUBhbWF6b24uZGU+CgpJIGhhdmVuJ3QgbG9va2VkIGluIGRldGFpbHMsIGJ1
dCBJJ20gZmluZSB3aXRoIHRoZXNlIG5ldyBmdW5jdGlvbmFsaXRpZXMKaW4gZ2VuZXJhbC4gTGV0
J3Mgc2VlIGlmIE1hcmVrIGhhcyBhbnkgb2JqZWN0aW9ucy4KCldoaWNoIHZlcnNpb24gb2YgUHl0
aG9uIGRvIHlvdSB1c2UgdG8gYnVpbGQgdGhlc2U/IFRoZSByZXF1aXJlbWVudCBoZXJlCmlzIHRo
ZSBjb2RlIHNob3VsZCBidWlsZCB3aXRoIGJvdGggUHl0aG9uIDIuNSBhbmQgUHl0aG9uIDMuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
