Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F073E88E7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 13:58:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPR2A-0008FE-Bf; Tue, 29 Oct 2019 12:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jy4k=YW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iPR28-0008F7-7H
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 12:55:36 +0000
X-Inumbo-ID: 65dbf826-fa4b-11e9-9512-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65dbf826-fa4b-11e9-9512-12813bfff9fa;
 Tue, 29 Oct 2019 12:55:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g24so2448972wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 05:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=okuxcY4hS17AV6fpMJeiBs3PNlDM1D8t+z2RDfOIuI4=;
 b=HxKLTa5DiFedI2yjWIVLjHPLWkU4i8XTMEtZ5ZDw0Mtbnw5zvyZpqgoUFdyvM86lP0
 oAhQPpFISqjQM4j2u7J47q/F8MRh9lhyxR58HGEcAx02ioGzCjeXVsri/mq03VvMn/p4
 Mpu8SKE8Whz2TnINMSdfCgbVjunMku0hgaH7mlJUnYs4HkIesBxD2qZEk2jL9m9TPFCk
 Sv+eCBeGqzPZ3Jo5ZSEvWB5yFY5ZuvnugyWnjvtuCcMi3tguYlLk6lGtRzkvNnuA2plv
 1ZLByNV2dHXTffjGtEJkakheIE/sHPFJUsFkoFRQ3OUYuk5mV/b///CYrxpAWaZpm2Ek
 XczQ==
X-Gm-Message-State: APjAAAWsfzwOW3922mnBZoVRI49JFfl+vKV9uuLqMW7MP43MU+/jbuAw
 z+1OAUdNpntcCnUifKo0jdE=
X-Google-Smtp-Source: APXvYqyJPLCbX6KeBd0w2soJZ8hUWG4gTPsQB2teCCbgDUolieEq8f9k6osbZz8bG7OKXhxJpC59eA==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr3971318wme.115.1572353734680; 
 Tue, 29 Oct 2019 05:55:34 -0700 (PDT)
Received: from debian ([213.31.248.135])
 by smtp.gmail.com with ESMTPSA id x12sm15002557wru.93.2019.10.29.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 05:55:34 -0700 (PDT)
Date: Tue, 29 Oct 2019 12:55:32 +0000
From: Wei Liu <wl@xen.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Message-ID: <20191029125532.uppf63zpvdkxsrqu@debian>
References: <e9520623cacf33574d2f395584f487410aae8934.1572280689.git.ppircalabu@bitdefender.com>
 <CAK9nU=otVy8SGgH8PggNXKaHYqeFYJ9e4uXvAGQMDh_WVAniMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9nU=otVy8SGgH8PggNXKaHYqeFYJ9e4uXvAGQMDh_WVAniMg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] tools/ocaml: Fix build error with Arch
 Linux
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTI6Mzg6MzVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIDI4IE9jdCAyMDE5IGF0IDE2OjM4LCBQZXRyZSBQaXJjYWxhYnUKPiA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4KPiA+IGdjYyAoR0NDKSA5LjIuMCBjb21w
bGFpbnM6Cj4gPgo+ID4geGVudG9vbGxvZ19zdHVicy5jOiBJbiBmdW5jdGlvbiDigJhzdHViX3h0
bF9vY2FtbF92bWVzc2FnZeKAmToKPiA+IHhlbnRvb2xsb2dfc3R1YnMuYzo5MzoxNjogZXJyb3I6
IGluaXRpYWxpemF0aW9uIGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50
ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4gPiAgICA5MyB8
ICB2YWx1ZSAqZnVuYyA9IGNhbWxfbmFtZWRfdmFsdWUoeHRsLT52bWVzc2FnZV9jYikgOwo+ID4g
ICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gPgo+ID4gVGhpcyBwYXRj
aCBjb25zdGlmaWVzIHRoZSBwb2ludGVyIHJldHVybmVkIGJ5IGNhbWxfbmFtZWRfdmFsdWUgaW4g
b3JkZXIKPiA+IHRvIHRoZSBhY2NvbW1vZGF0ZSBuZXdlciB2ZXJzaW9ucyBvZiBPQ2FtbC4KPiA+
IEluIE9DYW1sID49IDQuMDkgdGhlIHJldHVybiB2YWx1ZSBwb2ludGVyIG9mIGNhbWxfbmFtZWRf
dmFsdWUgaXMKPiA+IGRlY2xhcmVkIGNvbnN0Lgo+ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9v
Y2FtbC9vY2FtbC9jb21taXQvNGYwM2ExNDY3ZDI5Y2Y1ODdkZjVhMTkxODMwZjE1MjU1MDZlZTBl
Mwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRk
ZWZlbmRlci5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Cj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gCj4gSSB3
aWxsIHdhaXQgYSBmZXcgZGF5cyBmb3IgQ2hyaXN0aWFuIGFuZCBEYXZpZCB0byBjaGltZSBpbi4g
SWYgSSBkb24ndAo+IGhlYXIgYmFjayBieSBNb25kYXksIEknbSBnb2luZyB0byBjb21taXQgdGhp
cyBwYXRjaCAtLSB0aGlzIGlzIHByZXR0eQo+IG1lY2hhbmljYWwgYW55d2F5Lgo+IAoKQW5kcmV3
IGluZm9ybWVkIG1lIE9PQiB0aGF0IENocmlzdGlhbiBpcyBhd2F5LCBzbyBJIGhhdmUgY29tbWl0
dGVkIHRoaXMKcGF0Y2guCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
