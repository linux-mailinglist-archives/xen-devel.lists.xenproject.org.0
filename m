Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D531145264
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 11:17:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuD26-00010M-MY; Wed, 22 Jan 2020 10:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cJAe=3L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuD25-00010H-JO
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 10:14:45 +0000
X-Inumbo-ID: 02b8c880-3d00-11ea-bc0e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02b8c880-3d00-11ea-bc0e-12813bfff9fa;
 Wed, 22 Jan 2020 10:14:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so6530109wmf.2
 for <xen-devel@lists.xen.org>; Wed, 22 Jan 2020 02:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YVuRre6RhlsGncz3Y6cXDbi5oMZdILKVJx3Z3eNG4vE=;
 b=a8QYWE2OFjsJIKz/iVHGZAXIKHuQNDEEjtL4qM59F8JB71WG1kKRx/QAh60HdsZTDr
 pbuOd2bXcheNCGUwE14b7hbelbqU3HmLwscCcrD86waKblA51hrwY0E6Hch6F/AjrrLn
 jdbwGFr8f7ilzbFQNvyoaKdI3K05sgDkUfDAPRoiYvn/THgbNfYBqnLpjrmcQ00n5343
 Udv9EKLU3Hy2vuaUJokgwO6ZmF2iRLTshvot0Y/mNQSuRp44AwuuM5Gt6ZHplhSeoEGv
 L7bhwWPTYPf9h/fZG14M+nf2O077hCxCTRYjiO8qGm1Oer4mrDfSfZTUTTGH/Ciy2eQt
 R4Qg==
X-Gm-Message-State: APjAAAXMbCmaRxO/u+uDlf+xeYgpaViMV4G+0MGDMWknJRnd3q1uW8Ph
 5Xd9DCuqdlwda8DChaFXbOQ=
X-Google-Smtp-Source: APXvYqze0OXweuyq7CbgXalzC9i50em2SZ+6GwmqLAX4D8s5wRSKTCIfN199fAyw8DqJPJSbGQpjMQ==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr2113466wma.138.1579688083952; 
 Wed, 22 Jan 2020 02:14:43 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id x14sm3226518wmj.42.2020.01.22.02.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 02:14:43 -0800 (PST)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
Date: Wed, 22 Jan 2020 10:14:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMi8wMS8yMDIwIDEwOjAxLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+IE9uIDIwLzAxLzIw
MjAgMTA6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJn
ZXkgRHlhc2xpIHdyb3RlOgo+Pj4gdjIgLS0+IHYzOgo+Pj4gLSBSZW1vdmUgaHZtbG9hZGVyIGZp
bHRlcmluZwo+Pgo+PiBXaHk/IFNlZWluZyB0aGUgcHJpb3IgZGlzY3Vzc2lvbiwgaG93IGFib3V0
IGFkZGluZyBYRU5WRVJfZGVuaWVkIHRvCj4+IHJldHVybiB0aGUgImRlbmllZCIgc3RyaW5nLCBh
bGxvd2luZyBjb21wb25lbnRzIHdoaWNoIHdhbnQgdG8gZmlsdGVyCj4+IHRvIGtub3cgZXhhY3Rs
eSB3aGF0IHRvIGxvb2sgZm9yPyBBbmQgdGhlbiByZS1hZGQgdGhlIGZpbHRlcmluZyB5b3UKPj4g
aGFkPyAoVGhlIGhlbHAgdGV4dCBvZiB0aGUgY29uZmlnIG9wdGlvbiBzaG91bGQgdGhlbiBwZXJo
YXBzIGJlCj4+IGV4dGVuZGVkIHRvIG1ha2UgdmVyeSBjbGVhciB0aGF0IHRoZSBjaG9zZW4gc3Ry
aW5nIHNob3VsZCBub3QgbWF0Y2gKPj4gYW55dGhpbmcgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBi
ZSByZXR1cm5lZCBieSBhbnkgb2YgdGhlIFhFTlZFUl8KPj4gc3ViLW9wcy4pCj4gCj4gSSBoYWQg
dGhlIGZvbGxvd2luZyByZWFzb25pbmc6Cj4gCj4gMS4gTW9zdCByZWFsLXdvcmxkIHVzZXJzIHdv
dWxkIHNldCBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkc9IiIgYW55d2F5Lgo+IAo+IDIuIEZpbHRl
cmluZyBpbiBETUkgdGFibGVzIGlzIG5vdCBhIGNvbXBsZXRlIHNvbHV0aW9uLCBzaW5jZSBkZW5p
ZWQKPiBzdHJpbmcgbGVha3MgZWxzZXdoZXJlIHRocm91Z2ggdGhlIGh5cGVyY2FsbCAoUFYgZ3Vl
c3RzLCBzeXNmcywgZHJpdmVyCj4gbG9ncykgYXMgQW5kcmV3IGhhcyBwb2ludGVkIG91dCBpbiB0
aGUgcHJldmlvdXMgZGlzY3Vzc2lvbi4KPiAKPiBPbiB0aGUgb3RoZXIgaGFuZCwgU01CaW9zIGZp
bHRlcmluZyBzbGlnaHRseSBpbXByb3ZlcyB0aGUgc2l0dWF0aW9uIGZvcgo+IEhWTSBkb21haW5z
LCBzbyBJIGNhbiByZXR1cm4gaXQgaWYgbWFpbnRhaW5lcnMgZmluZCBpdCB3b3J0aHkuCgpXaGls
ZSBJIGFtIG5vdCBhIG1haW50YWluZXIgb2YgdGhpcyBjb2RlLCBteSBjb25jZXJuIGlzIHlvdSBp
bXBvc2UgdGhlIApjb252ZXJzaW9uIGZyb20gImRlbmllZCIgdG8gIiIgdG8gYWxsIHRoZSB1c2Vy
cyAoaW5jbHVkZSB0aG9zZSB3aG8gd2FudHMgCnRvIGtlZXAgImRlbmllZCIpLgoKSWYgeW91IHdl
cmUgZG9pbmcgYW55IGZpbHRlcmluZyBpbiBodm1sb2FkZXIsIHRoZW4gaXQgd291bGQgYmUgYmVz
dCBpZiAKdGhpcyBpcyBjb25maWd1cmFibGUuIEJ1dCB0aGlzIGlzIGEgYml0IHBvaW50bGVzcyBp
ZiB5b3UgYWxyZWFkeSBhbGxvdyAKdGhlIHVzZXIgdG8gY29uZmlndXJlIHRoZSBzdHJpbmcgYXQg
dGhlIGh5cGVydmlzb3IgbGV2ZWwgOikuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
