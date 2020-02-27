Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A7172BC9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 23:55:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7S0R-0001aL-Dw; Thu, 27 Feb 2020 22:51:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONkH=4P=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7S0Q-0001aG-5U
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 22:51:46 +0000
X-Inumbo-ID: b93f4264-59b3-11ea-97ea-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b93f4264-59b3-11ea-97ea-12813bfff9fa;
 Thu, 27 Feb 2020 22:51:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m13so1028894edb.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 14:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eA7GCiVCRslWnzHmfegVu9p/bQ0HAooxpyhy0Tq5hs0=;
 b=NdSRbwGbPDVJe+yyFbPCzYxDQPlmQHIZOEe7ecuJkaIkd2ist34QHgjOWNSOjpsZ+K
 1k44bzRpwiHPJGha2lCMksQQMQZfQiG/qdjiXlxT3BllVWgX28CXSRuyh2aN3Uxm42Rb
 Cat/ax/UoE40I7nHpxZLpqJ1DdU5C75Lu2mDj4+poMva/AqTQNYQKr59yRPuU4jZEf5g
 FuLZfRMrjMM9bIs5faZgeIdhKSd644qKSkIF5/RXXsnBMl3kmrXWx6/U0SgUMFm+Qy58
 MOcOeTUGpTamltDofpokKDIrg2pMUFk1mYpLNc08o4DRIAA38Yq7ovoLl+Wue11HV12u
 qlyw==
X-Gm-Message-State: APjAAAWBhHx/KkYu6VHLUj8aQRUudKwnaSVuL+3nNvJeahdsqnYDTkGI
 IAca6N8Al6T8mhF3JUcC5jA=
X-Google-Smtp-Source: APXvYqwxWwGhVQ/2uSTbdIQQmjwoCB8qbV69SIce4CN1Zq4orXxvL4xPEqZ6G0a2W//cAMdEloXt8w==
X-Received: by 2002:a17:906:edd0:: with SMTP id
 sb16mr1142313ejb.151.1582843903901; 
 Thu, 27 Feb 2020 14:51:43 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id r23sm452708edx.24.2020.02.27.14.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 14:51:43 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200226160848.1854-1-pdurrant@amazon.com>
 <20200226160848.1854-3-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4ad6fe4e-40bd-7a04-54d2-38edb56346e9@xen.org>
Date: Thu, 27 Feb 2020 22:51:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226160848.1854-3-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/3] libxl: make creation of xenstore
 suspend event channel node optional
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8wMi8yMDIwIDE2OjA4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gVGhlIHB1cnBv
c2UgYW5kIHNlbWFudGljcyBvZiB0aGUgbm9kZSBhcmUgZXhwbGFpbmVkIGluCj4geGVuc3RvcmUt
cGF0aHMucGFuZG9jIFsxXS4gSXQgd2FzIG9yaWdpbmFsbHkgaW50cm9kdWNlZCBpbiB4ZW5kIGJ5
IGNvbW1pdAo+IDE3NjM2ZjQ3YTQ3NCAiVGVhY2ggeGNfc2F2ZSB0byB1c2UgZXZlbnQtY2hhbm5l
bC1iYXNlZCBkb21haW4gc3VzcGVuZCBpZgo+IGF2YWlsYWJsZS4iLiBOb3RlIHRoYXQsIGJlY2F1
c2UsIHRoZSB0b3AtbGV2ZWwgZnJvbnRlbmQgJ2RldmljZScgbm9kZSB3YXMKPiBjcmVhdGVkIHdy
aXRhYmxlIGJ5IHRoZSBndWVzdCBpbiB4ZW5kLCB0aGVyZSB3YXMgbm8gbmVlZCB0byBleHBsaWNp
dGx5Cj4gY3JlYXRlIHRoZSAnc3VzcGVuZC1ldmVudC1jaGFubmVsJyBub2RlIGFzIHdyaXRhYmxl
IG5vZGUuCj4gCj4gSG93ZXZlciwgbGlieGwgY3JlYXRlcyB0aGUgJ2RldmljZScgbm9kZSBhcyBy
ZWFkLW9ubHkgYnkgdGhlIGd1ZXN0IGFuZCBzbwo+IGV4cGxpY2l0IGNyZWF0aW9uIG9mIHRoZSAn
c3VzcGVuZC1ldmVudC1jaGFubmVsJyBub2RlIGlzIG5lY2Vzc2FyeSB0byBtYWtlCj4gaXQgdXNh
YmxlLiBUaGlzIHVuZm9ydHVuYXRlbHkgaGFzIHRoZSBzaWRlLWVmZmVjdCBvZiBtYWtpbmcgc29t
ZSBvbGQKPiBXaW5kb3dzIFBWIGRyaXZlcnMgWzJdIGNlYXNlIHRvIGZ1bmN0aW9uLiBUaGlzIGlz
IGJlY2F1c2UgdGhleSBzY2FuIHRoZSB0b3AKPiBsZXZlbCAnZGV2aWNlJyBub2RlLCBmaW5kIHRo
ZSAnc3VzcGVuZCcgbm9kZSBhbmQgZXhwZWN0IGl0IHRvIGNvbnRhaW4gdGhlCj4gdXN1YWwgc3Vi
LW5vZGVzIGRlc2NyaWJpbmcgYSBQViBmcm9udGVuZC4gV2hlbiB0aGlzIGlzIGZvdW5kIG5vdCB0
byBiZSB0aGUKPiBjYXNlLCBlbnVtZXJhdGlvbiBjZWFzZXMgYW5kIChiZWNhdXNlIHRoZSAnc3Vz
cGVuZCcgbm9kZSBpcyBvYnNlcnZlZCBiZWZvcmUKPiB0aGUgJ3ZiZCcgbm9kZSkgbm8gc3lzdGVt
IGRpc2sgaXMgZW51bWVyYXRlZC4gV2luZG93cyB3aWxsIHRoZW4gY3Jhc2ggd2l0aAo+IGJ1Z2No
ZWNrIGNvZGUgMHg3Qi4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBib29sZWFuICdzdXNwZW5kX2V2
ZW50X2NoYW5uZWwnIGZpZWxkIGludG8KPiBsaWJ4bF9jcmVhdGVfaW5mbyB0byBjb250cm9sIHdo
ZXRoZXIgdGhlIHhlbnN0b3JlIG5vZGUgaXMgY3JlYXRlZCBhbmQgYQo+IHNpbWlsYXJseSBuYW1l
ZCBvcHRpb24gaW4geGwuY2ZnIHdoaWNoLCBmb3IgY29tcGF0aWJpbGl0eSB3aXRoIHByZXZpb3Vz
Cj4gbGlieGwgYmVoYXZpb3VyLCBkZWZhdWx0cyB0byB0cnVlLgo+IAo+IFsxXSBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj1kb2NzL21pc2MveGVuc3Rv
cmUtcGF0aHMucGFuZG9jO2hiPUhFQUQjbDE3Nwo+IFsyXSBodHRwczovL2FjY2Vzcy5yZWRoYXQu
Y29tL2RvY3VtZW50YXRpb24vZW4tdXMvcmVkX2hhdF9lbnRlcnByaXNlX2xpbnV4LzUvaHRtbC9w
YXJhLXZpcnR1YWxpemVkX3dpbmRvd3NfZHJpdmVyc19ndWlkZS9zZWN0LXBhcmEtdmlydHVhbGl6
ZWRfd2luZG93c19kcml2ZXJzX2d1aWRlLWluc3RhbGxpbmdfYW5kX2NvbmZpZ3VyaW5nX3RoZV9w
YXJhX3ZpcnR1YWxpemVkX2RyaXZlcnMtaW5zdGFsbGluZ190aGVfcGFyYV92aXJ0dWFsaXplZF9k
cml2ZXJzCj4gCj4gTk9URTogV2hpbGUgYWRkaW5nIHRoZSBuZXcgTElCWExfSEFWRV9DUkVBVEVJ
TkZPX1NVU1BFTkRfRVZFTlRfQ0hBTk5FTAo+ICAgICAgICBkZWZpbml0aW9uIGludG8gbGlieGwu
aCwgdGhpcyBwYXRjaCBjb3JyZWN0cyB0aGUgcHJldmlvdXMgc3RhbnphCj4gICAgICAgIHdoaWNo
IGVycm9uZW91c2x5IGltcGxpZXMgaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gaXMgYSBmdW5jdGlv
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
Cj4gLS0tCj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENj
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICB8ICA3
ICsrKysrKysKPiAgIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICB8IDEzICsrKysrKysrKysr
Ky0KPiAgIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICB8IDEyICsrKysrKysrKy0tLQo+ICAg
dG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDEgKwo+ICAgdG9vbHMveGwveGxfcGFyc2Uu
YyAgICAgICAgIHwgIDMgKysrCgpZb3UgbWF5IHdhbnQgdG8gdXBkYXRlIHhlbnN0b3JlLXBhdGhz
LnBhbmRvYyBhcyB0aGUgZG9jdW1lbnQgbWVudGlvbiB0aGUgCm5vZGUgd2lsbCBiZSBjcmVhdGVk
IGJ5IHRoZSB0b29sc3RhY2suCgo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcuNS5wb2Qu
aW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPiBpbmRleCAwY2FkNTYxMzc1Li41ZjQ3NmYx
ZTFkIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbgo+ICsrKyBiL2RvY3Mv
bWFuL3hsLmNmZy41LnBvZC5pbgo+IEBAIC02NjgsNiArNjY4LDEzIEBAIGZpbGUuCj4gICAKPiAg
ID1iYWNrCj4gICAKPiArPWl0ZW0gQjxzdXNwZW5kX2V2ZW50X2NoYW5uZWw9Qk9PTEVBTj4KPiAr
Cj4gK0NyZWF0ZSB0aGUgeGVuc3RvcmUgcGF0aCBmb3IgdGhlIGRvbWFpbidzIHN1c3BlbmQgZXZl
bnQgY2hhbm5lbC4gVGhlCj4gK2V4aXN0ZW5jZSBvZiB0aGlzIHBhdGggY2FuIGNhdXNlIHByb2Js
ZW1zIHdpdGggb2xkZXIgUFYgZHJpdmVycyBydW5uaW5nCj4gK2luIHRoZSBndWVzdC4gSWYgdGhp
cyBvcHRpb24gaXMgbm90IHNwZWNpZmllZCB0aGVuIGl0IHdpbGwgZGVmYXVsdCB0bwo+ICtCPHRy
dWU+LgoKSW4gdGhlIG5leHQgcGF0Y2ggeW91IGFyZSBnb2luZyB0byBtYWtlIGRldmljZS8gcncu
IERvIHlvdSBzZWUgYW55IGlzc3VlIAp3aXRoIGp1c3Qgbm90IGNyZWF0aW5nIHRoZSBub2RlIGZv
ciBldmVyeW9uZT8gQXJlIFBWIGRyaXZlcnMgYWxsb3dlZCB0byAKYXNzdW1lIGEgbm9kZSB3aWxs
IGJlIHByZXNlbnQ/CgpNeSBrbm93bGVkZ2Ugb2YgeGVuc3RvcmUgaXMgbGltaXRlZCwgc28gSSB0
aG91Z2h0IEkgd291bGQgYXNrIHRoZSAKcXVlc3Rpb25zIHRvIHVuZGVyc3RhbmQgYSBiaXQgbW9y
ZSBob3cgc3RhYmxlIHRoZSBBQkkgaXMgbWVhbnQgdG8gYmUuIDopLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
