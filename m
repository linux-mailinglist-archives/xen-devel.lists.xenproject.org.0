Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A331311AD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 12:58:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioQzi-0005Y2-61; Mon, 06 Jan 2020 11:56:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XhR8=23=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ioQzg-0005Xk-Hk
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 11:56:24 +0000
X-Inumbo-ID: 85ccddf6-307b-11ea-aaf5-12813bfff9fa
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85ccddf6-307b-11ea-aaf5-12813bfff9fa;
 Mon, 06 Jan 2020 11:56:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d73so14679628wmd.1;
 Mon, 06 Jan 2020 03:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PgKqOL7/ITotbP+OTRruXAJYTN53gJxjqs3yvni/cSc=;
 b=STIaK+DhudtC4VMIDENQeufo4gYH5Hs/bitiCHiUzh2IAen3S5pE8IWpbVOMVGJ9Yk
 Q6ABl0U89ywPAZkBKaDEIfurXLN4WuM9S9rlHJWsMe9X6W4wUjsKrZnq3TLtqNFWDAJF
 7x+iLPFPzLSedKxDSrLnG8c34tqcV28nVwyYosAA8qRS1fhxI+xEHEzM5xdFIXRkKFaY
 7xoDzQmuZmgOWc6cKxruPBjS+1yy6o/KRAO/DatQC38ZmiqHGJdRjoh8agEdVzVyQ239
 w3cvxEwhBfQp7GsNnUGbFi/GN1X0oOKQrB0pw5kgegp0CFS6SYDhb10OHgPlYHJaYFYU
 36Dg==
X-Gm-Message-State: APjAAAVCVoievPT16abujzdeuuzsbp9+1L27SW6DsRnLvZCIhcfQxKsp
 pCud6+rP2QHe/Ak+aoTVyH4=
X-Google-Smtp-Source: APXvYqwAtltoqJD2FtMesg1fYeA+UJeem2g6v0lUPoAClspBy5FfLqvrN/Lvty7b2LKcFP7I7EwHnA==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr33943745wmd.23.1578311766812; 
 Mon, 06 Jan 2020 03:56:06 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id n3sm70962791wrs.8.2020.01.06.03.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 03:56:06 -0800 (PST)
To: Lars Kurth <lars.kurth@citrix.com>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <5C9AFAA2-DCA1-4D55-9C0F-8D37C7A280E9@citrix.com>
 <CBE71BF8-C791-4C73-9E29-27113B8208A0@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <af648cb2-abee-9361-3864-a40f039e3470@xen.org>
Date: Mon, 6 Jan 2020 11:56:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CBE71BF8-C791-4C73-9E29-27113B8208A0@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [Minios-devel] Setting up a monthly Xen Project
 dinner/pub-meeting
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8xMi8yMDE5IDExOjAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+IEFuZCB0aGlzIHRp
bWUgd2l0aCB0aGUgY29ycmVjdCBsaXN0LiBSZWFsbHkgZGVzcGFpcmluZyB3aXRoIE91dGxvb2sg
Cj4gd2hpY2gga2VlcHMgYWRkaW5nIHJhbmRvbSBvbGQgY29udGFjdHMgdG8gbXkgYWRkcmVzcyBi
b29rIGFuZCBwdXRzIHRoZW0gCj4gaW4gZnJvbnQgb2YgZnJlcXVlbnRseSB1c2VkIGVudHJpZXMg
KHNpZ2gpCj4gCj4gKkZyb206ICpMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4g
KkRhdGU6ICpXZWRuZXNkYXksIDExIERlY2VtYmVyIDIwMTkgYXQgMTA6MzEKPiAqVG86ICoieGVu
LWRldmVsQGxpc3RzLnhlbnNvdXJjZS5jb20iIDx4ZW4tZGV2ZWxAbGlzdHMueGVuc291cmNlLmNv
bT4sIAo+ICJtaXJhZ2Vvcy1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIgCj4gPG1pcmFnZW9z
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPiwgCj4gIndpbi1wdi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZyIgPHdpbi1wdi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4sIAo+ICJtaW5p
b3MtZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciIDxtaW5pb3MtZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gKlN1YmplY3Q6ICpTZXR0aW5nIHVwIGEgbW9udGhseSBYZW4gUHJvamVjdCBk
aW5uZXIvcHViLW1lZXRpbmcKPiAKPiBIaSBhbGwsCj4gCj4gd2l0aCBxdWl0ZSBhIGZldyBwZW9w
bGUgd29ya2luZyBvbiBYZW4gUHJvamVjdCBhY3Jvc3MgZGlmZmVyZW50IAo+IGNvbXBhbmllcyBh
bmQgb3JnYW5pc2F0aW9ucyB0aGVzZSBkYXlzLCBJIHdhcyB3b25kZXJpbmcgd2hldGhlciB3ZSAK
PiBzaG91bGQgc2V0IHVwIGEgcmVndWxhciBtb250aGx5IGdldC10b2dldGhlci4gSSB3b3VsZCBs
aWtlIHRvIGdldCBhIAo+IHNlbnNlIGFzIHRvCj4gCj4gIDEuIFdobyB3b3VsZCBiZSB3aWxsaW5n
IHRvIHR1cm4gdXAg4oCTIG5lZWQgdG8gZ2V0IGEgc2Vuc2Ugb2YgbnVtYmVycywKPiAgICAgYmVj
YXVzZSB3ZSBuZWVkIHRvIHNlZSB3aGV0aGVyIGl0IGlzIG5lY2Vzc2FyeSB0byBib29rIGEgdGFi
bGUKPiAgMi4gV2hhdCBkYXkgd291bGQgYmUgYmVzdCBhbmQgd2hhdCB3ZWVrIG9mIHRoZSBtb250
aAo+ICAzLiBXaGV0aGVyIHdlIHdvdWxkIGFsd2F5cyBjaG9vc2UgdGhlIHNhbWUgdmVudWUg4oCT
IHdoaWNoIEkgZ3Vlc3MgcGFydGx5Cj4gICAgIGRlcGVuZHMgb24gdGhlIGFuc3dlciB0byBhKS4g
SWYgdGhlIGNvcmUgZ3JvdXAgYXR0ZW5kaW5nIGlzIGxhcmdlcgo+ICAgICB0aGFuIDggcGVvcGxl
LCB3ZSBwcm9iYWJseSBuZWVkIHRvIGJvb2sgYSB0YWJsZSwgd2hpY2ggaXMgZWFzaWVyIGlmCj4g
ICAgIHdlIGNob29zZSB0aGUgc2FtZSB2ZW51ZQoKU28gZmFyIHdlIGhhZCBhZC1ob2MgbWVldGlu
ZyBpbiBIYXltYWtlcnMgZHVyaW5nIFhTQXMgcGVyaW9kIChvZnRlbiAKb3JnYW5pemVkIGJ5IEFu
ZHJldykuCgpJdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBtb250aGx5IG1lZXRpbmcgZm9yIG90
aGVyIHRoYW4gWFNBIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
