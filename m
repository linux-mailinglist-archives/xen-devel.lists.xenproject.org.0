Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F5012EA13
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:51:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in5X0-00065G-L5; Thu, 02 Jan 2020 18:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3gH+=2X=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1in5Wz-00065A-7V
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:49:13 +0000
X-Inumbo-ID: 90c838ec-2d90-11ea-a3bb-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90c838ec-2d90-11ea-a3bb-12813bfff9fa;
 Thu, 02 Jan 2020 18:49:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so40244439wrq.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 10:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zcWR0f3Cs7ynzIl3VFr8UECpC73M7YGROO/j0WCVkn8=;
 b=sEU9qKv/YTcq8B6V0MaKTL5EBlKvSGPZuQ8ceUmsBXkQYuySGVYxzzuEjvyTx/QqQn
 YWDlkdlfNO1JR2KdnYe9VbAXvGMxlgASeP72vP/D7fK6HA1kL21TT1uNssvhvMu2UP5q
 aGzy9Sg9UkdKbaaNHomNP97Fnr7sfd/rVTUb+nlGyiHKlPqW+BG8biDkcPHNzpUOUNel
 VPY6O6BrLtksqclx0ekWLDWezB0kOm46XsvWwM5I5j2MUhpy66JgTzBPI8Jjhqgq0ZT6
 3H43RZgIZs3R0HagZgYSuN3uLu4pG9nTanb5O45V7Pr7socXNcZWg8nrRY58Kal+nKEJ
 ESzA==
X-Gm-Message-State: APjAAAWCpxb9jYWv+NxRArmYj+iQyaNcRZY0G/9fXmgnuRTxaTdt1QPl
 6Dyw2Hz4zdYPpFfFPXeb30Y=
X-Google-Smtp-Source: APXvYqx7IXwJ1JjPx70fyVAZwcx19BrkitcyKUzW6ENllYrV8JYnJ6SNevYg5X6z85tsAE94fsKmqA==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr87220949wrn.274.1577990951295; 
 Thu, 02 Jan 2020 10:49:11 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z124sm9756036wmc.20.2020.01.02.10.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 10:49:10 -0800 (PST)
Date: Thu, 2 Jan 2020 18:49:09 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20200102184909.7de6hh7dj7f7dr64@debian>
References: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [OSSTEST PATCH] Switch to linux-4.19 by default
 (from 4.14)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDY6MDQ6MzNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBhZmZlY3RzIG9ubHkgeDg2IGFuZCBvbmx5IHRoZSBicmFuY2hlcyB0aGF0IGFy
ZW4ndCBsaW51eC0qLCBzaW5jZQo+IG9idmlvdXNseSB0aGUgbGF0dGVyIHVzZSB3aGF0ZXZlciB2
ZXJzaW9uIHRoZXkgYXJlIHVzaW5nLgo+IAo+IEkgY29tcGFyZWQgdGhlIG1vc3QgcmVjZW50IGxp
bnV4LTQuMTkgcmVzdWx0cyB3aXRoIHRoZSBtb3N0IHJlY2VudAo+IGxpbnV4LTQuMTQgb25lcywg
YW5kIHRoZXJlIHdhcyBvbmx5IG9uZSBuZXcgZmFpbHVyZSAoaW4gMTQzODQxKToKPiAgIHRlc3Qt
YW1kNjQtaTM4Ni1xZW11dS1yaGVsNmh2bS1pbnRlbCAxMiBndWVzdC1zdGFydC9yZWRoYXQucmVw
ZWF0IGZhaWwgUkVHUi4gdnMuIDE0MzkxMQo+IAo+IFRoaXMgc3RlcCBoYXMgZmFpbGVkIHR3aWNl
IGluIHRoZSB3ZWItdmlzaWJsZSBoaXN0b3J5IG9mIHRoaXMgam9iIG9uCj4gNC4xOTsgYW5kIG9u
Y2UgcmVjZW50bHkgaW4gNC4xNC4gIEJlY2F1c2Ugb2YgdGhlIGxvdyB1cGRhdGUgcmF0ZSBvZgo+
IHRoZXNlIHRyZWVzIG5vd2FkYXlzLCB0aGVzZSB0ZXN0cyBhcmUgYSB3aGlsZSBhZ28gYW5kIHdl
IGRvbid0IGhhdmUKPiB0aGUgbG9ncyBhbnkgbW9yZS4KPiAKPiBJIHRoaW5rIGdpdmVuIHRoYXQg
aXQncyBhbHJlYWR5IG5vdCBwZXJmZWN0IHRoaXMgaXMgbm90IGEgYmxvY2tlciBhbmQKPiB3ZSBz
aG91bGQgdXBkYXRlIG9zc3Rlc3QgdG8gNC4xNC4KPiAKPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8
cm95Z2VyQEZyZWVCU0Qub3JnPgo+IENDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDQzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KCgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCk9uIGEgcmVs
YXRlZCBub3RlLCB0aGUgbW9zdCByZWNlbnQgTGludXggTFRTIGlzIDUuNC4gSXQgd291bGQgYmUg
Z3JlYXQKaWYgd2Ugc3RhcnQgdGVzdGluZyBpdCBpbiBPU1NUZXN0IGFuZCBldmVudHVhbGx5IHN3
aXRjaCB0byBpdC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
