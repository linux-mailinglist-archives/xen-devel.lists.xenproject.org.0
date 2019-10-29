Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36764E8B7D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPT4o-00032l-Fi; Tue, 29 Oct 2019 15:06:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hhGJ=YW=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iPT4m-00032f-Vg
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:06:29 +0000
X-Inumbo-ID: ae745ff8-fa5d-11e9-8aca-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae745ff8-fa5d-11e9-8aca-bc764e2007e4;
 Tue, 29 Oct 2019 15:06:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p4so14027796wrm.8
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 08:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=47RxmDNB2dIs9e09tnYSkKAXfZPJzmU7BEMfOXWtS2A=;
 b=pneEc0HJaJIIN8s0GkslAhr8IJ/5kLqrS8bPC8kFz/0gL/Mu38y7WGhyhHJL+kt02q
 nvJn3sZ3rVp+6ZSDL5RU2RaVRhHUaPo2pD+KOiGJ/UTSvM5FSWF355gwXn/aA5iXWN4t
 wu54LcH11lwn2kYuWscxZC8LdCVaGsGbFO6DHalrP88zZQjPyIF/TQlB0kasNRbsxQ3V
 SMGb9fXYTvRxILfkH+zOzfHmRbBBRerUeUwYmsYxCtXPmnCg3F1DmCdOdShhDOHTvAIN
 QHnOv1P9VOOjqsMiJ5NKAz8JAKF63jUal+Fsn85zeW7A3m2OVDK80E3YtAvG15W6P07F
 LR3Q==
X-Gm-Message-State: APjAAAW1FqFm5K0jyW9vk3NW94mNIh3zwWHrtkhG7FPusCkK1gzdoOHz
 wkoh2Pu04Rbof/ztgeUDui8=
X-Google-Smtp-Source: APXvYqxT8fsYC1TRKx6f9Oi3fwCjEX/FPj/6K9DNrn4VPeIDKaxU3aIUY/eFRALoKtO3c7Im8j8wCQ==
X-Received: by 2002:a5d:404d:: with SMTP id w13mr21330607wrp.185.1572361587386; 
 Tue, 29 Oct 2019 08:06:27 -0700 (PDT)
Received: from ?IPv6:::1? ([206.189.23.0])
 by smtp.gmail.com with ESMTPSA id k3sm14458437wro.77.2019.10.29.08.06.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 08:06:26 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
 <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
 <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
 <bf0bcc92-7ac9-1cc1-0440-04a2c97a7fd1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <66e9d8f0-dbc4-394f-7f06-4cd05bdba7f1@xen.org>
Date: Tue, 29 Oct 2019 15:06:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bf0bcc92-7ac9-1cc1-0440-04a2c97a7fd1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjkvMTAvMjAxOSAxNDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjku
MTAuMjAxOSAxNTozMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyOC8xMC8yMDE5
IDIxOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBNb24sIDI4IE9jdCAyMDE5
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAyNS8xMC8yMDE5IDEx
OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gQWxsLAo+Pj4+Pgo+Pj4+PiB0aGUgNC4xMS4z
IHN0YWJsZSByZWxlYXNlIGlzIGR1ZS4gSSBpbnRlbmQgdG8gd2FpdCBmb3IgdGhlIFhTQSBmaXhl
cwo+Pj4+PiBnb2luZyBwdWJsaWMgb24gdGhlIDMxc3QsIGJ1dCBub3QgKG11Y2gpIGxvbmdlci4g
UGxlYXNlIHBvaW50IG91dAo+Pj4+PiBiYWNrcG9ydGluZyBjYW5kaWRhdGVzIHRoYXQgeW91IGZp
bmQgbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlCj4+Pj4+IHN0YWJsZSB0cmVlcy4gSSBoYXZl
IHRocmVlIG9uZXMgcXVldWVkIHdoaWNoIGhhdmVuJ3QgcGFzc2VkIHRoZSBwdXNoCj4+Pj4+IGdh
dGUgdG8gdGhlIG1hc3RlciBicmFuY2ggeWV0Ogo+Pj4+Pgo+Pj4+PiA5MjU3YzIxOGU1CXg4Ni92
dm14OiBGaXggdGhlIHVzZSBvZiBSRFRTQ1Agd2hlbiBpdCBpcyBpbnRlcmNlcHRlZCBhdCBMMAo+
Pj4+PiA3ZWVlOWMxNmQ2CXg4Ni90c2M6IHVwZGF0ZSB2Y3B1IHRpbWUgaW5mbyBvbiBndWVzdCBU
U0MgYWRqdXN0bWVudHMKPj4+Pj4gOTYzMzkyOTgyNAl4ODY6IGZpeCBvZmYtYnktb25lIGluIGlz
X3hlbl9maXhlZF9tZm4oKQo+Pj4+Cj4+Pj4gV2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGJhY2twb3J0
ZWQgcGF0Y2hlcyBmb3IgcXVpdGUgYSB3aGlsZSBvbiBBcm0uIFNvbWUgb2YgbXkKPj4+PiBwYXRj
aGVzIGhhdmUgYmVlbiBtYXJrZWQgYXMgdG8gYmUgYmFja3BvcnRlZCBmcm9tIHRoZSBiZWdpbm5p
bmcgWzFdLiBJIGFtCj4+Pj4gc3BlY2lmaWNhbGx5IHRoaW5raW5nIHRvOgo+Pj4+IAkKPj4+PiBl
MDQ4MThiNDZkIHhlbi9hcm06IHRyYXBzOiBBdm9pZCB1c2luZyBCVUdfT04oKSB0byBjaGVjayBn
dWVzdCBzdGF0ZSBpbgo+Pj4+IGFkdmFuY2VfcGMoKQo+Pgo+PiBVcmdoLCBJIGdhdmUgdGhlIGNv
cnJlY3QgdGl0bGUgYnV0IHRoZSB3cm9uZyBjb21taXQgc2hhMS4gSXQgc2hvdWxkIGJlCj4+Cj4+
IDcyNjE1ZjJlNmI5OGU4NjFjMDhhYmIxZDJiMTk0MTI2MDEzZDU0ZmUKPj4KPj4+Cj4+PiBJIGhh
dmUgZTA0ODE4YjQ2ZCwgcGx1cyB0aGUgZm9sbG93aW5nIG1hcmtlZCBmb3IgYmFja3BvcnQ6Cj4+
Pgo+Pj4gZTk4ZWRjY2I5NDRhODBkYjc4MmU1NTFmMzA5MDYyOGU2NmM3ZmI1MiB4ZW4vYXJtOiBT
Q1RMUl9FTDEgaXMgYSA2NC1iaXQgcmVnaXN0ZXIgb24gQXJtNjQKPj4KPj4gVGhlcmUgYXJlIG1v
cmUgdGhhbiB0aGF0IHRvIGJhY2twb3J0Ogo+Pgo+PiAzMGY1MDQ3YjJjNGU1Nzc0MzZiNTA1YmE3
NjI3ZjM0YzNiZTAyMDE0ICAgIHhlbi9hcm06IGdpYzogTWFrZSBzdXJlIHRoZSBudW1iZXIgb2Yg
aW50ZXJydXB0IGxpbmVzIGlzIHZhbGlkIGJlZm9yZSB1c2luZyBpdCAgWzQuMTFdCj4+IDhhYTI3
NjIzNWI5M2VlYjRmODEwOTVjNjM4OTcwOTAwZTE5YjMxZTUgICAgeGVuL2FybTogaXJxOiBFbmQg
Y2xlYW5seSBzcHVyaW91cyBpbnRlcnJ1cHQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBbNC4xMV0KPj4gYjRkZjczZGU0OTM5NTRjNDRmMjQwZjc4Nzc5YzliZDM3ODJlMTU3MiAg
ICB4ZW4vYXJtOiBnaWMtdjI6IGRlYWN0aXZhdGUgaW50ZXJydXB0cyBkdXJpbmcgaW5pdGlhbGl6
YXRpb24gICAgICAgICAgICAgICAgICAgIFs0LjExXQo+PiAwMzIyZTBkYjViMjlhMGQxY2U0YjQ1
Mjg4NWUzNDAyM2UzYTRiMDBlICAgIGFybTogZ2ljLXYzOiBkZWFjdGl2YXRlIGludGVycnVwdHMg
ZHVyaW5nIGluaXRpYWxpemF0aW9uICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTFdCj4+Cj4+
IDViYTFjNWQwNjQxY2Y2MzA4NmIzMDU4ZTU0N2ZjZDI4YzNjNGEwMTEgICAgeGVuL2FybTogbWVt
YWNjZXNzOiBJbml0aWFsaXplIGNvcnJlY3RseSAqYWNjZXNzIGluIF9fcDJtX2dldF9tZW1fYWNj
ZXNzICAgICAgICBbNC4xMl0KPj4gMDdlNDRiM2QxYmUzMmZhMjE2NWMyMzY3YWUzZWY5YzZjOGIz
OWUxZSAgICB4ZW4vYXJtOiBJbXBsZW1lbnQgd29ya2Fyb3VuZCBmb3IgQ29ydGV4IEEtNTcgYW5k
IENvcnRleCBBNzIgQVQgc3BlY3VsYXRlICAgICAgIFs0LjEyXQo+Pgo+PiAwOGUyMDU5ZmFjZDc4
ZDVmZmFmMjA2YmEwNmFjMjAxN2M0YWRlZWQ0ICAgIHhlbi9hcm06IHNldHVwOiBDYWxjdWxhdGUg
Y29ycmVjdGx5IHRoZSBzaXplIG9mIFhlbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWzQu
MTErXQo+PiA4ZGJhOWE4MWU3YzYyYjhhN2RiZTAyM2ZmZmVjZDJlMTZjYzIwNDg2ICAgIHhlbi9h
cm06IERvbid0IHVzZSBfZW5kIGluIGlzX3hlbl9maXhlZF9tZm4oKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWzQuMTErXQo+PiA2NzE4Nzg3Nzk3NDFiMzhjNWYyMzYzYWRjZWVm
OGRlMmNlMGIzOTQ1ICAgIHhlbi9hcm06IHAybTogRnJlZSB0aGUgcDJtIGVudHJ5IGFmdGVyIGZs
dXNoaW5nIHRoZSBJT01NVSBUTEJzICAgICAgICAgICAgICAgICAgWzQuMTErXQo+PiA3ZjQyMTdj
YzYwNTc0ODY2Y2I5MGQ2N2Q5NzUwMjI4YzZiODZjOTFlICAgIHhlbi9hcm06IHZzbWM6IFRoZSBm
dW5jdGlvbiBpZGVudGlmaWVyIGlzIGFsd2F5cyAzMi1iaXQgICAgICAgICAgICAgICAgICAgICAg
ICAgWzQuMTErXQo+PiA2MTJkNDc2ZTc0YTMxNGJlNTE0ZWU2YTk3NDRlZWE4ZGIwOWQzMmU1ICAg
IHhlbi9hcm02NDogQ29ycmVjdGx5IGNvbXB1dGUgdGhlIHZpcnR1YWwgYWRkcmVzcyBpbiBtYWRk
cl90b192aXJ0KCkgICAgICAgICAgICAgWzQuMTErXQo+PiBmNTEwMjdiZTA2ODg1NDBhYWFiNjE1
MTNiMDZhODY5M2EzN2U0YzAwICAgIHhlbi9hcm06IGZpeCBucl9wZHhzIGNhbGN1bGF0aW9uICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTErXQo+PiBh
MTg5ZWYwMjdkYmI3YTNjMGRmZTU2NjEzN2YwNWMwNmQ2Njg1ZmI5ICAgIHhlbi9hcm06IG1tOiBG
bHVzaCB0aGUgVExCcyBldmVuIGlmIGEgbWFwcGluZyBmYWlsZWQgaW4gY3JlYXRlX3hlbl9lbnRy
aWVzICAgICAgWzQuMTErXQo+IAo+IFRoaXMgaXMgcXVpdGUgbG9uZyBhIGxpc3QgZm9yIGEgcmVs
ZWFzZSBhYm91dCB0byBiZSBjdXQuIExvb2tpbmcKPiBhdCB0aGUgYnJhbmNoIEkgZG9uJ3Qgc2Vl
IGFueSBBcm0gYmFja3BvcnRzIG90aGVyIHRoYW4gdGhlIG9uZXMKPiBkb25lIHllc3RlcmRheSBw
b3N0LTQuMTEuMi4gSSdtIGZpbmUgd2l0aCBiYXRjaGluZywgYnV0IG1heSBJCj4gYXNrIGZvciBz
dWNoIGJhdGNoZXMgdG8gbm90IGJlIHBvc3Rwb25lZCB1bnRpbCB0aGUgbGFzdCBtaW51dGU/CgpU
aGF0J3MgfjEgeWVhciB3b3J0aCBvZiBiYWNrcG9ydCBiZWNhdXNlIG5vYm9keSBsb29rZWQgYXQg
aXQuIEFwb2xvZ2llcyBpZiBpdCAKY29tZXMgbGF0ZSBidXQgSSBvbmx5IG5vdGljZWQgdGhlIGJh
Y2twb3J0IHJlcXVlc3QgZS1tYWlsIHllc3RlcmRheSBhcyBJIGFtIG5vdCAKQ0NlZC4KCkkgYW0g
aGFwcHkgdG8gdGFrZSBvdmVyIHRoZSBiYWNrcG9ydHMgZm9yIEFybSBpZiB0aGF0IGhlbHBzIHRv
IGdldCBwYXRjaGVzIApiYWNrcG9ydGVkIGluIGEgbW9yZSB0aW1lbHkgbWFubmVyLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
