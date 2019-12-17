Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075F5122FDE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:14:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEVX-00082T-SC; Tue, 17 Dec 2019 15:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TTnd=2H=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihEVW-00082L-On
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:11:30 +0000
X-Inumbo-ID: 7ff22342-20df-11ea-8ef0-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ff22342-20df-11ea-8ef0-12813bfff9fa;
 Tue, 17 Dec 2019 15:11:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576595490; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=k4Lka88POklMGcNE3CRegLU7shc7gVNx0SvoLdTw18c=;
 b=ldhZQp+I1C8vMQEL4UAVe/0OcVLMbmARJ22RnWI1PzGPzgkTwkwlj4VjCKm2GcGRrebxhULt
 JrZUoCR0XbWpnD6xE9s2ZUW82lPCI+bzqL8w4EpiZseELeuHbVXxaLXocIotit+FoqMi33XQ
 DlWG+JYywf6iVyIPBU1feutZIAw=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5df8f017.7f92870f8cb0-smtp-out-n01;
 Tue, 17 Dec 2019 15:11:19 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d16so11698954wre.10
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 07:11:19 -0800 (PST)
X-Gm-Message-State: APjAAAXvNR6Bcjoy7Jo1KfW4nL3KjINdN7yAltPgq73KyY4K+grdDvKX
 fsiBEf4qFdM85TM2rY1KhQdI9Z8mKS3pL4Nr3y8=
X-Google-Smtp-Source: APXvYqytl+B7m2/PvMGsz9IzTJI5Tl6Jr/wrguQQsXkVfCTge+Y6oL4RbWI+y5lCqvWmbUa1xoy88i+bwdyjeLPsiDs=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr35557578wre.372.1576595478556; 
 Tue, 17 Dec 2019 07:11:18 -0800 (PST)
MIME-Version: 1.0
References: <96a1376e-9464-f797-30fd-f6923efbf6c7@list.ru>
 <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
 <CABfawh=c6tEAZX4PzAO_fMWeGvKE=UFw2dkWjRkTiRQ28AJRbA@mail.gmail.com>
In-Reply-To: <CABfawh=c6tEAZX4PzAO_fMWeGvKE=UFw2dkWjRkTiRQ28AJRbA@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 17 Dec 2019 08:10:43 -0700
X-Gmail-Original-Message-ID: <CABfawhmFdgHua-ociayg8BE2NF90UrQ1naywdaVHRrqtMR9v=w@mail.gmail.com>
Message-ID: <CABfawhmFdgHua-ociayg8BE2NF90UrQ1naywdaVHRrqtMR9v=w@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH v1 1/1] x86/vm_event: add fast single
 step
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Sergey Kovalev <valor@list.ru>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgODowOCBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgNzo0OCBBTSBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBP
biAxNy8xMi8yMDE5IDE0OjQwLCBTZXJnZXkgS292YWxldiB3cm90ZToKPiA+ID4gT24gYnJlYWsg
cG9pbnQgZXZlbnQgZWlnaHQgY29udGV4dCBzd2l0Y2hlcyBvY2N1cmVzLgo+ID4gPgo+ID4gPiBX
aXRoIGZhc3Qgc2luZ2xlIHN0ZXAgaXQgaXMgcG9zc2libGUgdG8gc2hvcnRlbiBwYXRoIGZvciB0
d28gY29udGV4dAo+ID4gPiBzd2l0Y2hlcwo+ID4gPiBhbmQgZ2FpbiAzNSUgc3BlYWQtdXAuCj4g
PiA+Cj4gPiA+IFdhcyB0ZXN0ZWQgb24gRGViaWFuIGJyYW5jaCBvZiBYZW4gNC4xMi4gU2VlIGF0
Ogo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vc2t2bC94ZW4vdHJlZS9kZWJpYW4va25vcnJpZS80
LjEyL2Zhc3Qtc2luZ2xlc3RlcAo+ID4gPgo+ID4gPiBSZWJhc2VkIG9uIG1hc3RlcjoKPiA+ID4g
aHR0cHM6Ly9naXRodWIuY29tL3NrdmwveGVuL3RyZWUvZmFzdC1zaW5nbGVzdGVwCj4gPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2IDx2YWxvckBsaXN0LnJ1Pgo+ID4KPiA+
IDM1JSBsb29rcyBsaWtlIGEgZ29vZCBudW1iZXIsIGJ1dCB3aGF0IGlzICJmYXN0IHNpbmdsZSBz
dGVwIj8gIEFsbCB0aGlzCj4gPiBhcHBlYXJzIHRvIGJlIGlzIHBsdW1iaW5nIGZvciB0byBjYXVz
ZSBhbiBhbHRwMm0gc3dpdGNoIG9uIHNpbmdsZSBzdGVwLgo+Cj4gWWVzLCBhIGJldHRlciBleHBs
YW5hdGlvbiB3b3VsZCBiZSBtdWNoIG5lZWRlZCBoZXJlIGFuZCBJJ20gbm90IDEwMCUKPiBzdXJl
IGl0IGNvcnJlY3RseSBpbXBsZW1lbnRzIHdoYXQgSSB0aGluayBpdCB0cmllcyB0by4KPgo+IFRo
aXMgaXMgbXkgaW50ZXJwcmV0YXRpb24gb2Ygd2hhdCB0aGUgaWRlYSBpczogd2hlbiB1c2luZyBE
UkFLVlVGIChvcgo+IGFub3RoZXIgc3lzdGVtIHVzaW5nIGFsdHAybSB3aXRoIHNoYWRvdyBwYWdl
cyBzaW1pbGFyIHRvIHdoYXQgSQo+IGRlc2NyaWJlIGluIGh0dHBzOi8veGVucHJvamVjdC5vcmcv
MjAxNi8wNC8xMy9zdGVhbHRoeS1tb25pdG9yaW5nLXdpdGgteGVuLWFsdHAybSksCj4gYWZ0ZXIg
YSBicmVha3BvaW50IGlzIGhpdCB0aGUgc3lzdGVtIHN3aXRjaGVzIHRvIHRoZSBkZWZhdWx0Cj4g
dW5yZXN0cmljdGVkIGFsdHAybSB2aWV3IHdpdGggc2luZ2xlc3RlcCBlbmFibGVkLiBXaGVuIHRo
ZSBzaW5nbGVzdGVwCj4gdHJhcHMgdG8gWGVuIGFub3RoZXIgdm1fZXZlbnQgaXMgc2VudCB0byB0
aGUgbW9uaXRvciBhZ2VudCwgd2hpY2ggdGhlbgo+IG5vcm1hbGx5IGRpc2FibGVzIHNpbmdsZXN0
ZXBwaW5nIGFuZCBzd2l0Y2hlcyB0aGUgYWx0cDJtIHZpZXcgYmFjayB0bwo+IHRoZSByZXN0cmlj
dGVkIHZpZXcuIFRoaXMgcGF0Y2ggbG9va3MgbGlrZSBpdHMgc2hvcnQtY2lyY3VpdGluZyB0aGF0
Cj4gbGFzdCBwYXJ0IHNvIHRoYXQgaXQgZG9lc24ndCBuZWVkIHRvIHNlbmQgdGhlIHZtX2V2ZW50
IG91dCBmb3IgdGhlCj4gc2luZ2xlc3RlcCBldmVudCBhbmQgc2hvdWxkIHN3aXRjaCBiYWNrIHRv
IHRoZSByZXN0cmljdGVkIHZpZXcgaW4gWGVuCj4gYXV0b21hdGljYWxseS4gSXQncyBhIG5pY2Ug
b3B0aW1pemF0aW9uLiBCdXQgd2hhdCBzZWVtcyB0byBiZSBtaXNzaW5nCj4gaXMgdGhlIGFsdHAy
bSBzd2l0Y2ggaXRzZWxmLgoKTmV2ZXIgbWluZCwgcDJtX2FsdHAybV9jaGVjayBkb2VzIHRoZSBh
bHRwMm0gc3dpdGNoIGFzIHdlbGwsIHNvIHRoaXMKcGF0Y2ggaW1wbGVtZW50cyB3aGF0IEkgZGVz
Y3JpYmVkIGFib3ZlLiBQbGVhc2UgdXBkYXRlIHRoZSBwYXRjaAptZXNzYWdlIHRvIGJlIG1vcmUg
ZGVzY3JpcHRpdmUgKHlvdSBjYW4gY29weSBteSBkZXNjcmlwdGlvbiBmcm9tCmFib3ZlKS4KClRo
YW5rcyEKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
