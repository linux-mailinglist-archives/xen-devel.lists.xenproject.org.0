Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5A17752E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 12:17:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j95Vs-0006YF-EC; Tue, 03 Mar 2020 11:15:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wYci=4U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j95Vr-0006XS-7G
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 11:14:59 +0000
X-Inumbo-ID: 379b0f6c-5d40-11ea-a10b-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 379b0f6c-5d40-11ea-a10b-12813bfff9fa;
 Tue, 03 Mar 2020 11:14:58 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id c7so3856208edu.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 03:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HgyNrkA38kkMcpUItzd+55aUakCxIS2yjPOM5gT64uY=;
 b=DldYpFZk2b6sM8X7F9lSqaqJpJdpCHugDPXtjgbl2X34EWLcfwkoXUO/+bS+uZefic
 RUWQw99tq71DtRsJ/bogYJSerCD8JxWS4kiPOnLScneYB9Ue7V2zkL6HDvegJPcEcFIl
 x0Lb46sOJ2r86gbzqR0NI5eXwE4R6DWWQip7WM0mwVDw7QTlISzb1c8g2eLa4Xottz/K
 lE41bBLLwhW+6KL8ZJNZ4g6dx/7dbGuuDjQcgbSxm0wZFxz3PSNXlXQi9C564v/rM7sV
 Kfw1Gp3UVjisfYpfSeaht5y/N6kfn7lZtJ43OdlUpS/yKNo9KYETKf4luzxFLzQKLsue
 CVbA==
X-Gm-Message-State: ANhLgQ0BA+oTg6LKfh95+VH5MAbmrDe+/usbeWhAhyXuDnvenRFgCuHu
 8S6ayhtpRuMWymHzNMkiEvQ=
X-Google-Smtp-Source: ADFU+vsCvF7RyrSM+Hizn8SRTQrJPmVHOlW3JgVKpR5w179PN4xxXnh9dcme/loJ47xiC2AXH4JIWA==
X-Received: by 2002:a05:6402:a51:: with SMTP id
 bt17mr3576182edb.262.1583234097745; 
 Tue, 03 Mar 2020 03:14:57 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id n10sm983543ejk.67.2020.03.03.03.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 03:14:57 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9731ee51-33ac-d916-3ae4-3126756a76c9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d345966d-8b57-ee1f-70a9-980e034de5bc@xen.org>
Date: Tue, 3 Mar 2020 11:14:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9731ee51-33ac-d916-3ae4-3126756a76c9@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Paul to co-maintain
 vendor-independent IOMMU code
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wMy8yMDIwIDExOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBIYXZpbmcganVzdCBh
IHNpbmdsZSBtYWludGFpbmVyIGlzIG5vdCBoZWxwZnVsIGFueXdoZXJlLCBhbmQgY2FuIGJlCj4g
YXZvaWRlZCBoZXJlIHF1aXRlIGVhc2lseSwgc2VlaW5nIHRoYXQgUGF1bCBoYXMgYmVlbiBkb2lu
ZyBxdWl0ZSBhIGJpdAo+IG9mIElPTU1VIHdvcmsgbGF0ZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKPiAKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBi
L01BSU5UQUlORVJTCj4gQEAgLTMyMyw2ICszMjMsNyBAQCBGOgl4ZW4vYXJjaC94ODYvY3B1L3Zw
bXVfaW50ZWwuYwo+ICAgCj4gICBJT01NVSBWRU5ET1IgSU5ERVBFTkRFTlQgQ09ERQo+ICAgTToJ
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ICtNOglQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+Cj4gICBTOglTdXBwb3J0ZWQKPiAgIEY6CXhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoLwo+ICAgWDoJeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kLwo+IAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
