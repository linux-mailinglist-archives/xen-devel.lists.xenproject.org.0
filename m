Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB811327F1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:40:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iop3X-00062A-H4; Tue, 07 Jan 2020 13:37:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iop3W-000623-Om
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:37:58 +0000
X-Inumbo-ID: e58ef224-3152-11ea-bf56-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e58ef224-3152-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 13:37:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so53979241wru.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 05:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WhIKH0Q9+XEv4L9Cz/ZbiB3pXVPwtgtiqwwT5XQG8po=;
 b=OCBAHan93agdmisdWwLY2ulG1Og5XcMIfBxmTLwFg5+9cP8VSgNZIhwb8PY11XCv0U
 GVxtrLpw/MiEphCQmOAB3v2Sm6eEu3Z67awXVNvD4iCIES75l46Awx44jI3cqMWwC/Go
 t9ThmYMXZ5huYWhhzdCt8RleHabUuc1nar2Bcceq7BGYChP8eJlsQXket46A1KYcFT5t
 rL8H5/6SfXyaF7gEDeXgn5UTT06MSvyEh0y26Isgw2xmTNEOc8i+uQce4wBeVPjOBOtk
 L5if84VAv/u70muz6X0hwOjX3pxZA2jVZD3Ya8llVOGt2Da4toBovHhdngudjNbTH3CJ
 Lz8A==
X-Gm-Message-State: APjAAAU+xd+IBKGdMwfeEZ5sEqNVIRfxzaKexjtO/dTiNsqwo+EQCFUd
 Xj1swxbIrgXrpOzsQyVTsUw=
X-Google-Smtp-Source: APXvYqwS4RbchI4klvgJd//nOfssBbylscaAV1TpJ0KisHt5jq0bpks0ruVjFEDe6bv1wI0e5BjbOw==
X-Received: by 2002:adf:df8e:: with SMTP id
 z14mr107739516wrl.190.1578404269365; 
 Tue, 07 Jan 2020 05:37:49 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id n3sm27548381wmc.27.2020.01.07.05.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 05:37:48 -0800 (PST)
Date: Tue, 7 Jan 2020 13:37:47 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200107133747.sebt5sjzukjhyelt@debian>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
 <20200107121335.nqb3kx4eos3yfiwb@debian>
 <3a9b7abc-6898-968b-a202-446e5d8cdc41@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a9b7abc-6898-968b-a202-446e5d8cdc41@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86: move some xen mm function
 declarations
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDI6MDk6MDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMDEuMjAyMCAxMzoxMywgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFu
IDA3LCAyMDIwIGF0IDEyOjA2OjQzUE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOgo+ID4+IEZy
b206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4KPiA+PiBUaGV5IHdlcmUgcHV0
IGludG8gcGFnZS5oIGJ1dCBtbS5oIGlzIG1vcmUgYXBwcm9wcmlhdGUuCj4gPj4KPiA+PiBUaGUg
cmVhbCByZWFzb24gaXMgdGhhdCBJIHdpbGwgYmUgYWRkaW5nIHNvbWUgbmV3IGZ1bmN0aW9ucyB3
aGljaAo+ID4+IHRha2VzIG1mbl90LiBJdCB0dXJucyBvdXQgaXQgaXMgYSBiaXQgZGlmZmljdWx0
IHRvIGRvIGluIHBhZ2UuaC4KPiA+Pgo+ID4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+PiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gCj4gPiBJIHdpbGwgY29t
bWl0IHRoaXMgdHJpdmlhbCBwYXRjaCBzb29uLWlzaCB0byByZWR1Y2UgSG9ueWFuJ3MgcGF0Y2gg
cXVldWUKPiA+IGxlbmd0aC4KPiAKPiBMb29rcyBsaWtlIEkgc2ltcGx5IGZvcmdvdCBldmVyeSB0
aW1lIEkgd2VudCB0aHJvdWdoIG15IGxpc3Qgb2YKPiBwZW5kaW5nIChmb3IgdGhlIHZhcmlvdXMg
c3RhZ2VzIG9mIHByb2Nlc3NpbmcpIHBhdGNoZXMuIEkgZ3Vlc3MKPiBwYXRjaGVzIDMgYW5kIDQg
YXJlIGFsc28gaW5kZXBlbmRlbnQgb2YgcGF0Y2ggMiBhbmQgaGVuY2UgY291bGQKPiBnbyBpbiBh
cyB3ZWxsLgoKU3VyZS4gSSBwdXNoZWQgYWxsIHRocmVlIHBhdGNoZXMgKDEsIDMgYW5kIDQpLgoK
V2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
