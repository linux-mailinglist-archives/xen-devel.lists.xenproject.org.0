Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86288F37AD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 19:55:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSmt4-0001DO-JE; Thu, 07 Nov 2019 18:52:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RhM+=Y7=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iSmt3-0001DJ-8T
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 18:52:05 +0000
X-Inumbo-ID: af3b7821-018f-11ea-a1ca-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af3b7821-018f-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 18:52:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q130so3649893wme.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2019 10:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b/+ce6PhcmOzI3ux/gbujqeu66pzjwgwYS0YV3mWHaQ=;
 b=OZFD83V/Jgz3Ll6rReczJTEanz0GkqRJf/L96ww1Kl3FSpnkyUkcMqCvIicLh5GBna
 53mF7HU44RsN1A+yQM1eUt+Tsx+W5u+ja3nw4DcTDc2dUvDF8vKLNQIUDn/Wja56wq25
 ruwBV1pfFWYPASCaNvNdZSzfmi379Gw6ygzS6L7uu0sTfaekGzwK/I2wRYaSW6rY+j2t
 SJM93+N+mLLak4ZFdheMC4qIzaSpykRSXdP2RkYZYtSwkgD+Ea/qFAEyTrzYbNudyMgC
 bHEMLzA6bOs5aWQvUwJjXzyamT9U+QTFcJPM4BkguKsLZ5IJsHLH3x3adyhrKVJlxmac
 O3zw==
X-Gm-Message-State: APjAAAXymeVBJGf07NwR6CmZjP39FHq+b4NriBiSBzn9WOstg6n3ZUph
 HnnanaPTg/p8PnRvbXeklls=
X-Google-Smtp-Source: APXvYqwDKSl6CNtjPoeor7vuGRUr2kG3OSsFLyUHALs3zNNh0P+5CkJ7piSVmTADDTEuIc3bY605sg==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr4325808wmd.104.1573152722415; 
 Thu, 07 Nov 2019 10:52:02 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id z14sm3219010wrl.60.2019.11.07.10.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 10:52:01 -0800 (PST)
Date: Thu, 7 Nov 2019 18:52:00 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Message-ID: <20191107185200.5uw4nz3lqiguuyhl@debian>
References: <1573145894-13305-1-git-send-email-paul@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573145894-13305-1-git-send-email-paul@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDQ6NTg6MTRQTSArMDAwMCwgcGF1bEB4ZW4ub3JnIHdy
b3RlOgo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBUaGUg
dmlmLXJvdXRlIHNjcmlwdCBzaG91bGQgb25seSBjYWxsICdpcCByb3V0ZScgd2hlbiAnaXBjbWQn
IGhhcyBiZWVuCj4gc2V0LCBvdGhlcndpc2UgaXQgd2lsbCBmYWlsIGR1ZSB0byBhbiBpbmNvcnJl
Y3QgY29tbWFuZCBzdHJpbmcuCj4gCj4gVGhpcyBwYXRjaCBhbHNvIGFkZHMgcm91dGVzIGZvciAn
dGFwJyAoaS5lLiBlbXVsYXRlZCkgZGV2aWNlcyBhcyB3ZWxsIGFzCj4gJ3ZpZicgKGkuZS4gUFYp
IGRldmljZXMgYnkgbWFraW5nIHVzZSBvZiB0aGUgcm91dGUgbWV0cmljLiBFbXVsYXRlZAo+IGRl
dmljZXMgYXJlIHVzZWQgYnkgSFZNIGd1ZXN0cyB1bnRpbCB0aGV5IGFyZSB1bnBsdWdnZWQsIGF0
IHdoaWNoIHBvaW50IHRoZQo+IFBWIGRldmljZSBiZWNvbWVzIGFjdGl2ZS4gVGh1cyAndGFwJyBk
ZXZpY2VzIHNob3VsZCBnZXQgYSBoaWdoZXIgcHJpb3JpdHkKPiAoaS5lLiBsb3dlciBudW1iZXJl
ZCkgbWV0cmljIHRoYW4gJ3ZpZicgZGV2aWNlcy4KPiAKPiBUaGVyZSBpcyBhbHNvIG9uZSBzbWFs
bCB3aGl0ZXNwYWNlIGZpeC4KPiAKPiBOT1RFOiBFbXBpcmljYWxseSBvZmZsaW5lL29ubGluZSBj
b21tYW5kcyByZWxhdGUgdG8gJ3ZpZicgZGV2aWNlcywgYW5kCj4gICAgICAgYWRkL3JlbW92ZSBj
b21tYW5kcyByZWxhdGUgdG8gJ3RhcCcgZGV2aWNlcy4gSG93ZXZlciwgdGhpcyBwYXRjaAo+ICAg
ICAgIHRyZWF0cyB0aGVtIGVxdWFsbHkgYW5kIHVzZXMgJHt0eXBlX2lmfSB0byBkaXN0aW5ndWlz
aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
Cj4gLS0tCj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENj
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKTG9va3MgbGlrZSB5b3UgbmVlZCB0byB1
cGRhdGUgeW91ciBhZGRyZXNzIGJvb2suIDotKQoKPiAtLS0KPiAgdG9vbHMvaG90cGx1Zy9MaW51
eC92aWYtcm91dGUgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBtb2RlIGNoYW5nZSAxMDA2NDQg
PT4gMTAwNzU1IHRvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlCj4gCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlIGIvdG9vbHMvaG90cGx1Zy9MaW51eC92aWYt
cm91dGUKPiBvbGQgbW9kZSAxMDA2NDQKPiBuZXcgbW9kZSAxMDA3NTUKPiBpbmRleCBjMTQ5ZmZj
Li5lNzFhY2FlCj4gLS0tIGEvdG9vbHMvaG90cGx1Zy9MaW51eC92aWYtcm91dGUKPiArKysgYi90
b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZQo+IEBAIC0yMiwxMiArMjIsMTYgQEAgZGlyPSQo
ZGlybmFtZSAiJDAiKQo+ICBtYWluX2lwPSQoZG9tMF9pcCkKPiAgCj4gIGNhc2UgIiR7Y29tbWFu
ZH0iIGluCj4gKyAgICBhZGQpCj4gKyAgICAgICAgOyYKPiAgICAgIG9ubGluZSkKPiAgICAgICAg
ICBpZmNvbmZpZyAke2Rldn0gJHttYWluX2lwfSBuZXRtYXNrIDI1NS4yNTUuMjU1LjI1NSB1cAoK
SG1tLi4uIEkgdGhpbmsgd2UgbWF5IG5lZWQgdG8gcmVwbGFjZSBpZmNvbmZpZyB3aXRoIGlwIGJl
Y2F1c2Ugbm93CmRpc3Ryb3MgKGF0IGxlYXN0IERlYmlhbiBhbmQgQXJjaCkgZG9uJ3QgaW5zdGFs
bCBpZmNvbmZpZyBieSBkZWZhdWx0LgoKVGhpcyBjYW4gYmUgZG9uZSB3aXRoIGEgc2VwYXJhdGUg
cGF0Y2ggdGhvdWdoLgoKPiAgICAgICAgICBlY2hvIDEgPi9wcm9jL3N5cy9uZXQvaXB2NC9jb25m
LyR7ZGV2fS9wcm94eV9hcnAKPiAgICAgICAgICBpcGNtZD0nYWRkJwo+ICAgICAgICAgIGNtZHBy
ZWZpeD0nJwo+ICAgICAgICAgIDs7Cj4gKyAgICByZW1vdmUpCj4gKyAgICAgICAgOyYKPiAgICAg
IG9mZmxpbmUpCj4gICAgICAgICAgZG9fd2l0aG91dF9lcnJvciBpZmRvd24gJHtkZXZ9Cj4gICAg
ICAgICAgaXBjbWQ9J2RlbCcKPiBAQCAtMzUsMTEgKzM5LDIzIEBAIGNhc2UgIiR7Y29tbWFuZH0i
IGluCj4gICAgICAgICAgOzsKPiAgZXNhYwo+ICAKClRoZSBsaXN0IG9mIGFjdGlvbiBoZXJlIGlz
IGV4aGF1c3RpdmUgcGVyIHRoZSBjb21tZW50IG9mIHRoaXMgZmlsZSwKd2hpY2ggbWVhbnMgaXBj
bWQgd2lsbCBhbHdheXMgYmUgc2V0LiBUaGUgdGVzdCBmb3IgaXBjbWQgYmVsb3cgYmVjb21lcwp1
bm5lY2Vzc2FyeS4KCj4gLWlmIFsgIiR7aXB9IiBdIDsgdGhlbgo+ICtjYXNlICIke3R5cGVfaWZ9
IiBpbgo+ICsgICAgdGFwKQo+ICsJbWV0cmljPTEKPiArCTs7Cj4gKyAgICB2aWYpCj4gKwltZXRy
aWM9Mgo+ICsJOzsKPiArICAgICopCj4gKwlmYXRhbCAiVW5yZWNvZ25pc2VkIGludGVyZmFjZSB0
eXBlICR7dHlwZV9pZn0iCj4gKwk7Owo+ICtlc2FjCj4gKwo+ICtpZiBbICIke2lwY21kfSIgXSA7
IHRoZW4KPiAgICAgICMgSWYgd2UndmUgYmVlbiBnaXZlbiBhIGxpc3Qgb2YgSVAgYWRkcmVzc2Vz
LCB0aGVuIGFkZCByb3V0ZXMgZnJvbSBkb20wIHRvCj4gICAgICAjIHRoZSBndWVzdCB1c2luZyB0
aG9zZSBhZGRyZXNzZXMuCgpJIF90aGlua18gdGVzdGluZyAke2lwfSBoZXJlIGlzIHN0aWxsIHRo
ZSBjb3JyZWN0IGFjdGlvbi4gVGhlIGNvbW1lbnQKc3VnZ2VzdHMgdGhlcmUgY291bGQgYmUgbm8g
aXAgZ2l2ZW4uIElmIHRoYXQgYXNzdW1wdGlvbiBpcyBub3QgY29ycmVjdCwKcGxlYXNlIGZpeCB0
aGUgY29tbWVudCBhcyB3ZWxsLgoKV2VpLgoKPiAgICAgIGZvciBhZGRyIGluICR7aXB9IDsgZG8K
PiAtICAgICAgJHtjbWRwcmVmaXh9IGlwIHJvdXRlICR7aXBjbWR9ICR7YWRkcn0gZGV2ICR7ZGV2
fSBzcmMgJHttYWluX2lwfQo+ICsgICAgICAke2NtZHByZWZpeH0gaXAgcm91dGUgJHtpcGNtZH0g
JHthZGRyfSBkZXYgJHtkZXZ9IHNyYyAke21haW5faXB9IG1ldHJpYyAke21ldHJpY30KPiAgICAg
IGRvbmUKPiAgZmkKPiAgCj4gQEAgLTUwLDUgKzY2LDUgQEAgY2FsbF9ob29rcyB2aWYgcG9zdAo+
ICBsb2cgZGVidWcgIlN1Y2Nlc3NmdWwgdmlmLXJvdXRlICR7Y29tbWFuZH0gZm9yICR7ZGV2fS4i
Cj4gIGlmIFsgIiR7Y29tbWFuZH0iID0gIm9ubGluZSIgXQo+ICB0aGVuCj4gLSAgc3VjY2Vzcwo+
ICsgICAgc3VjY2Vzcwo+ICBmaQo+IC0tIAo+IDIuNy40Cj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
