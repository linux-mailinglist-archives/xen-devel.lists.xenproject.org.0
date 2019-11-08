Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5CF448F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:34:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1YK-0004rh-OC; Fri, 08 Nov 2019 10:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BnoG=ZA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iT1YJ-0004qw-6r
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:31:39 +0000
X-Inumbo-ID: f2137e62-0212-11ea-a1d4-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2137e62-0212-11ea-a1d4-12813bfff9fa;
 Fri, 08 Nov 2019 10:31:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w30so6496240wra.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2019 02:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LqFc/pHClLoeeOlaEPj6qCVoaPhPlX++LYunn+9f9R0=;
 b=DQEPBT5AjBCOvxjM2o4pVhU+cej3Dbea4YmuAkFEM9zr3MrGbpikbwjNHzlOff/Gm6
 g723vDotkCrqKw3WeKHQWjhr7pioxDXQdX9rAYrkbeSiAx7QzRUxodf7RSGyPFuFYwML
 snqvcYsRFfw5jKPz7n1j6BchgWZwtCc38izIpIvn2nosc+AG7HJAgpwfhN0AbkcD61Te
 23VOnTL0vn3MvXpROj2bBzKEeiPpfZAT4T93KdOK63amWZ6OniJ0ucTRbqbP31zp68YI
 eq5JtVpuoVBDb88TF3bdSCw+mZ7t+gbHdDMvmB5dD5o5WCWitlTyECc++jBdYzvTM19C
 nPdQ==
X-Gm-Message-State: APjAAAWtUM6AK89qsFLj6uD5/5k+tvs58ghX8Q/0jleVPerA2Jw42p87
 DOceuYL7EyGJqXW9+s2WThE=
X-Google-Smtp-Source: APXvYqzOzCQnQ3kwliprhISUUCORoP5/kvxSzkjDjFCMHFtEiSmZaRpOFcAuHygj2YhMpbD/FgygDw==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr3290887wrv.176.1573209097916; 
 Fri, 08 Nov 2019 02:31:37 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id v128sm8475158wmb.14.2019.11.08.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 02:31:37 -0800 (PST)
Date: Fri, 8 Nov 2019 10:31:36 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Message-ID: <20191108103136.aqxuzk23p2uofxlx@debian>
References: <1573206153-22090-1-git-send-email-paul@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573206153-22090-1-git-send-email-paul@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3] tools/hotpug: only attempt to call 'ip
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDk6NDI6MzNBTSArMDAwMCwgcGF1bEB4ZW4ub3JnIHdy
b3RlOgo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBUaGUg
dmlmLXJvdXRlIHNjcmlwdCBzaG91bGQgb25seSBjYWxsICdpcCByb3V0ZScgd2hlbiAnaXBjbWQn
IGhhcyBiZWVuCj4gc2V0LCBvdGhlcndpc2UgaXQgd2lsbCBmYWlsIGR1ZSB0byBhbiBpbmNvcnJl
Y3QgY29tbWFuZCBzdHJpbmcuCj4gCj4gVGhpcyBwYXRjaCBhbHNvIGFkZHMgcm91dGVzIGZvciAn
dGFwJyAoaS5lLiBlbXVsYXRlZCkgZGV2aWNlcyBhcyB3ZWxsIGFzCj4gJ3ZpZicgKGkuZS4gUFYp
IGRldmljZXMuIEVtcGlyaWNhbGx5IG9mZmxpbmUvb25saW5lIGNvbW1hbmRzIHJlbGF0ZSB0bwo+
ICd2aWYnIGRldmljZXMsIGFuZCBhZGQvcmVtb3ZlIGNvbW1hbmRzIHJlbGF0ZSB0byAndGFwJyBk
ZXZpY2VzLiBIb3dldmVyLAo+IHRoaXMgcGF0Y2ggdHJlYXRzIHRoZW0gZXF1YWxseSBhbmQgdXNl
cyAke3R5cGVfaWZ9IHRvIGRpc3Rpbmd1aXNoLiBCeQo+IGFkZGluZyBjYXNlcyBmb3IgYWRkL3Jl
bW92ZSB0aGUgY29tbWFuZCBsaXN0IGJlY29tZXMgZXhoYXVzdGl2ZSBhbmQgaGVuY2UKPiAnaXBj
bWQnIGlzIGd1YXJhbnRlZWQgdG8gYmUgc2V0Lgo+IAo+IFJvdXRlcyBmb3IgJ3RhcCcgYW5kICd2
aWYnIGRldmljZXMgYXJlIGRpc3Rpbmd1aXNoZWQgYnkgYSByb3V0ZSBtZXRyaWMuCj4gRW11bGF0
ZWQgZGV2aWNlcyBhcmUgdXNlZCBieSBIVk0gZ3Vlc3RzIHVudGlsIHRoZXkgYXJlIHVucGx1Z2dl
ZCwgYXQgd2hpY2gKPiBwb2ludCB0aGUgUFYgZGV2aWNlIGJlY29tZXMgYWN0aXZlLiBUaHVzICd0
YXAnIGRldmljZXMgc2hvdWxkIGdldCBhIGhpZ2hlcgo+IHByaW9yaXR5IChpLmUuIGxvd2VyIG51
bWJlcmVkKSBtZXRyaWMgdGhhbiAndmlmJyBkZXZpY2VzLgo+IAo+IFRoZXJlIGlzIGFsc28gb25l
IHNtYWxsIHdoaXRlc3BhY2UgZml4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKQ2Mg
SnVlcmdlbgoKSSB0aGluayB0aGlzIGlzIGEgY2FuZGlkYXRlIGZvciA0LjEzLgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
