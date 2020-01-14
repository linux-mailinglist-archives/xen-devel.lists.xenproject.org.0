Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3525113A86A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 12:29:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irKJh-0000Cs-GF; Tue, 14 Jan 2020 11:25:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eDHu=3D=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1irKJf-0000Cm-Vr
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 11:25:00 +0000
X-Inumbo-ID: 7d527960-36c0-11ea-8375-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d527960-36c0-11ea-8375-12813bfff9fa;
 Tue, 14 Jan 2020 11:24:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so11780240wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 03:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JTusyvwVLb7892NIX/DUn1Otv/7djAp30RrR45Y0Ym4=;
 b=SnIJlDL/0FqZeYsAz24+/yyro1f4+ccAyVmqveJ6YTL2sSI3+6Gy30D4//J+XpkYLa
 Up1W0FbEBZzTH7v9JrWVyL5/pipCGyg5R36cjqjYsgn+REhW/HgkSujlA2egJj6HcT3n
 MQD3CAuKJEwo3v8oij5DmQWhf4MKakDcxIoFE8cmz/20W3T1nZqaofsdiqx++B7yBBru
 w/u0yB5PLSg/KWykqWu1n/a5lYU8kr47VYZ7CuVU3RWaooOIraoS+mctYzLxwUXrx1hN
 KCmUVTqPhtsd6N5xKSy9rFpXVJAmkvqTs8EBUEL0KTzZi3uYHM15kl49cmZs9KM8lQgH
 OxSA==
X-Gm-Message-State: APjAAAWzP8hE/bEdyw9naRBdWJchQVM55VAqxT+d5eew+Z/nKa0V2r2v
 PbTk0Ba6MSbcX4OBEjn3Mm0=
X-Google-Smtp-Source: APXvYqwo78bqS59StWr3+jXkDUj1XBD5lYETUN7v3jAFp+cbTdZY9yFmLgD7supP+b5sOnIzXpFuMA==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr23847977wrt.70.1579001094869; 
 Tue, 14 Jan 2020 03:24:54 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id b10sm19765857wrt.90.2020.01.14.03.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 03:24:54 -0800 (PST)
Date: Tue, 14 Jan 2020 11:24:52 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200114112452.2uoptlxkws2cl3ye@debian>
References: <20200109111505.12328-1-pdurrant@amazon.com>
 <24088.47498.144066.352751@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24088.47498.144066.352751@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDU6NTE6MDZQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0gdG9vbHMvUnVsZXMubWs6IGZpeCBk
aXN0Y2xlYW4iKToKPiA+IFJ1bm5pbmcgJ21ha2UgZGlzdGNsZWFuJyB1bmRlciB0b29scyB3aWxs
IGN1cnJlbnRseSByZXN1bHQgaW46Cj4gPiAKPiA+IHRvb2xzL1J1bGVzLm1rOjI0NTogKioqIFlv
dSBoYXZlIHRvIHJ1biAuL2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcgb3IgaW5zdGFsbGluZyB0
aGUgdG9vbHMuICBTdG9wLgo+ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgJ2Rpc3RjbGVhbicsICdz
dWJkaXItZGlzdGNsZWFuJScgYW5kICdzdWJkaXItY2xlYW4lJyB0bwo+ID4gbm8tY29uZmlndXJl
LXRhcmdldHMsIHdoaWNoIGFsbG93cyAnbWFrZSBkaXN0Y2xlYW4nIHRvIHJ1biB0byBjb21wbGV0
aW9uLgo+IAo+IFRoaXMgc2VlbXMgc291bmQgdG8gbWUsIGV2ZW4gdGhvdWdoIEkgdGhpbmsgaW4g
dGhlIGNhc2Ugd2hlcmUgaXQgbWFrZXMKPiBhIGRpZmZlcmVuY2UsIGBtYWtlIGRpc3RjbGVhbicg
d2lsbCBlbmQgdXAgc2tpcHBpbmcgbW9zdCBvZiB0aGUgdG9vbHMKPiBzdHVmZiBzaW5jZSB0aGUg
bWFrZWZpbGVzIGFyZW4ndCBwcmVzZW50Lgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKPiBXZWksIGRvIHlvdSBhZ3JlZSB3aXRoIG15IGFu
YWx5c2lzID8KClllcy4KCldlaS4KCj4gCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
