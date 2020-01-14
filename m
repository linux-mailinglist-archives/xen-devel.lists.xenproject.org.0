Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC213A8AB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 12:51:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irKgt-0001zY-SK; Tue, 14 Jan 2020 11:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eDHu=3D=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1irKgs-0001zT-Jx
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 11:48:58 +0000
X-Inumbo-ID: d42dd592-36c3-11ea-b89f-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d42dd592-36c3-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 11:48:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so11875246wrq.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 03:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xGO+xYsPTFAuTehtPFl20dXmzu0gym3fHK3k+GiDoko=;
 b=KltYsrEl9p14xsLjuVAcrEJok1h29yDEyRv8mciS05OzEX4UXvXVJcJe9O3I2iQe10
 VTadfIMrxbhkViVTKANWakv/ZaxvqKk5n1segksqdhqLzPY/TgMV5jHkwdBlU0JMscHq
 2TROFXRgXU31at+QuF64K7TXxdmMW6L0OI+dDaDpYh5rlZZ6HgSpQY5w5xiCDpPmAS8z
 F4oAxXvaaOAl6y3OBeaxt4SCox61Ymz+/Lm5dJRsJph3cBf8IXH4FkDgbNlQvaYtgm5s
 PrdB56amexLTRRhYPTCbk2JnefSa0Uj8lg9JBbQUg0Rc0kieEs0SJ0XA4MkGlDbJ4+3B
 u27A==
X-Gm-Message-State: APjAAAVId3q/lMKD+gdw6XEur1gxCLHe9bBUIJCax9edLDCCYNVHlWwB
 tf+13mL0iZyhEBBc8OXvUBk=
X-Google-Smtp-Source: APXvYqygtFFp1z1HPco27Uwech8evaS28/bZCjDBdGn/fKnbssif8Ey+X2KqaX8Y3xLkVdyg+kfohw==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr23134077wru.297.1579002529124; 
 Tue, 14 Jan 2020 03:48:49 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id r6sm19707167wrq.92.2020.01.14.03.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 03:48:48 -0800 (PST)
Date: Tue, 14 Jan 2020 11:48:46 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200114114846.r6vjosh23asr4gwk@debian>
References: <20200110023052.21159-1-tamas@tklengyel.com>
 <20200110023052.21159-2-tamas@tklengyel.com>
 <0e418ebe-18fb-e76a-21b1-55d35e95fa34@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e418ebe-18fb-e76a-21b1-55d35e95fa34@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/2] Remove undocumented and unmaintained
 tools/memshr library
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
Cc: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDU6NTk6NDRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMC8wMS8yMDIwIDAyOjMwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBU
aGUgbGlicmFyeSBoYXMgYmVlbiBsYXJnZWx5IHVudG91Y2hlZCBmb3Igb3ZlciBhIGRlY2FkZSBh
dCB0aGlzIHBvaW50LCBpdCBpcwo+ID4gdW5kb2N1bWVudGVkIGFuZCBpdCdzIHVuY2xlYXIgd2hh
dCBpdCB3YXMgb3JpZ2luYWxseSB1c2VkIGZvci4gUmVtb3ZlIGl0IGZyb20KPiA+IHRyZWUsIGlm
IGFueW9uZSBuZWVkcyBpdCBpbiB0aGUgZnV0dXJlIGl0IGNhbiBiZSBjYXJ2ZWQgb3V0IGZyb20g
Z2l0IGhpc3RvcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1h
c0B0a2xlbmd5ZWwuY29tPgo+IAo+IEhtbSAtIHRoaXMgaXMgYSBsaXR0bGUgYXdrd2FyZC7CoCBZ
b3UgcmVtb3ZlIHlvdXJzZWxmIGFzIG1haW50YWluZXIgb2YKPiB0aGlzIGNvZGUsIHRoZW4gZGVs
ZXRlIGl0Lgo+IAo+IEkgc3VzcGVjdCB3aGF0IHlvdSB3YW50IHRvIGRvIGlzIGhhdmUgcGF0Y2gg
MSBzaW1wbHkgYWRkIHRvb2xzL3Rlc3QKPiBzYXlpbmcgImluY2x1ZGUgb3RoZXIgbWVtc2hyIGNv
bnRlbnQiLCBhbmQgdGhpcyBwYXRjaCBkZWxldGUKPiB0b29scy9tZW1zaHIgaW5jbHVkaW5nIHRo
ZSBlbnRyeSBpbiB0aGUgbWFpbnRhaW5lcnMgZmlsZS7CoCAoQ2FuIGJlIGZpeGVkCj4gdXAgb24g
Y29tbWl0IG9mIGNvdXJzZSwgc2VlaW5nIGFzIHRoaXMgaXMgdGhlIG9ubHkgaXNzdWUuKQo+IAo+
IE92ZXJhbGwsIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlLCBidXQgaXQgd2lsbCBuZWVkIGEgdG9v
bHMgYWNrLgo+IAoKSSBtb3N0bHkgYWdyZWUgd2l0aCBUYW1hcycgYXNzZXNzbWVudC4gTm8gcG9p
bnQgaW4ga2VlcGluZyBkZWFkIGFuZAp1bnVzZWQgY29kZSBpbiB0cmVlLgoKQWNrZWQtYnk6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CgpXZWkuCgo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
