Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8F1327EB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:40:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iop4R-00065d-Rz; Tue, 07 Jan 2020 13:38:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXEJ=24=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iop4Q-00065V-IW
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:38:54 +0000
X-Inumbo-ID: 0b9743ea-3153-11ea-ac06-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b9743ea-3153-11ea-ac06-12813bfff9fa;
 Tue, 07 Jan 2020 13:38:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so18982633wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 05:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CTrSritfo9SxBMOwj5stKF17c+9M4b9pjlKgzUR8i4A=;
 b=XE8IXNGcZin/oxlht2wYvZdTOMUQh/hGMqgdGw/2ATMIIOvfqRjNIjl0JtP+gewrVd
 2VTsuc/p5HQRozzVkdIBjzkoJOZ9x59NcaVSd3nnTv2rkTdr6fytv1s6zeZc4PsS1lrc
 JO/EZntVLGMLNZdmWNYfeEVTudjF38qaeUhDd+U8FRIMixIERauK7JY5CDFQyggQ1d2n
 Mr2mdbX3SLUSuzizIxJQ66Oy7/GvLRb3AlLyZdofMGaqtnfJxeLlinZ9MEt5a/1ZCu7H
 J/o07em8bqwzit2f6VxthNXa11uzkvKLEw/VBXp/GNPOEKFjf4DxrapyniwyQZk+lEqI
 yv0w==
X-Gm-Message-State: APjAAAUPg6scHEJIRjwgwuBBfSrekSpIEkaGFuVxXU0SYn6bO6wy2vus
 T3gu08olVGz6aFZhJsIunyY=
X-Google-Smtp-Source: APXvYqyOqJCsyM0goVKzMF9rGtOHTqMxTIR0CBaCgN5QDddE844f6cqRoRlZh/+1kWw8183dz+eXMQ==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr37743579wmb.41.1578404333157; 
 Tue, 07 Jan 2020 05:38:53 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id e18sm77189368wrw.70.2020.01.07.05.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 05:38:52 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200107120243.222183-1-george.dunlap@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <20e1f608-65c1-4d46-7fd1-51b7b13b416c@xen.org>
Date: Tue, 7 Jan 2020 13:38:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107120243.222183-1-george.dunlap@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: Document how to handle
 unexpected conditions
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMDcvMDEvMjAyMCAxMjowMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBJ
dCdzIG5vdCBhbHdheXMgY2xlYXIgd2hhdCB0aGUgYmVzdCB3YXkgaXMgdG8gaGFuZGxlIHVuZXhw
ZWN0ZWQKPiBjb25kaXRpb25zOiB3aGV0aGVyIHdpdGggQVNTRVJUKCksIGRvbWFpbl9jcmFzaCgp
LCBCVUdfT04oKSwgb3Igc29tZQo+IG90aGVyIG1ldGhvZC4gIEFsbCBtZXRob2RzIGhhdmUgYSBy
aXNrIG9mIGludHJvZHVjaW5nIHNlY3VyaXR5Cj4gdnVsbmVyYWJpbGl0aWVzIGFuZCB1bm5lY2Vz
c2FyeSBpbnN0YWJpbGl0aWVzIHRvIHByb2R1Y3Rpb24gc3lzdGVtcy4KPiAKPiBQcm92aWRlIGd1
aWRlbGluZXMgZm9yIGRpZmZlcmVudCBvcHRpb25zIGFuZCB3aGVuIHRvIHVzZSB0aGVtLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
PiAtLS0KPiB2NDoKPiAtIHMvZ3Vlc3Qgc2hvdWxkL2d1ZXN0cyBzaG91bGRuJ3QvOwo+IC0gQWRk
IGEgbm90ZSBhYm91dCB0aGUgZWZmZWN0IG9mIGRvbWFpbl9jcmFzaCgpIGZ1cnRoZXIgdXAgdGhl
IHN0YWNrLgo+IHYzOgo+IC0gQSBudW1iZXIgb2YgbWlub3IgZWRpdHMKPiAtIEV4cGFuZCBvbiBk
b21haW5fY3Jhc2ggYSBiaXQuCj4gdjI6Cj4gLSBDbGFyaWZ5IG1lYW5pbmcgb2YgIm9yIiBjbGF1
c2UKPiAtIEFkZCBkb21haW5fY3Jhc2ggYXMgYW4gb3B0aW9uCj4gLSBNYWtlIGl0IGNsZWFyIHRo
YXQgQVNTRVJUKCkgaXMgbm90IGFuIGVycm9yIGhhbmRsaW5nIG1lY2hhbmlzbS4KPiAKPiBDQzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+Cj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
Q0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDQzogS29ucmFkIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
