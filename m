Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CFE901F2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybdS-00042T-PO; Fri, 16 Aug 2019 12:47:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5V6G=WM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hybdR-00042O-GM
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:47:13 +0000
X-Inumbo-ID: f6440a46-c023-11e9-8bb5-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6440a46-c023-11e9-8bb5-12813bfff9fa;
 Fri, 16 Aug 2019 12:47:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p74so3946073wme.4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 05:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wfwgH9l5mbCYo5TTzkcHQwo0Ylpy4+/f59d5n/i+okk=;
 b=N5IA8SHL0fFeSdKI7GdfcTUBhfZ7L5FTcb4MhKOC5koWJXwr6zP92jlAZoEqgX27pU
 DqTdZlT7cJqGYV80MPd3kGzecTWuLUleH+rB2MDbq69vQpwq0XT4mIc+0rr7Nc7PcGT7
 w3E5DYgtAC5Sl6znfhkzU3WSdcLt4tsPBN33ET75sC51BCfE53PzgkeK6FQFEtIXpedm
 TBunlBEaM+LvGvIeKmMv7kTQfzF+1milHWU2tw8ctv+PHv7tbHsVqhCGtlInMI7EEepA
 LzaqkT4Nk64sq999JcJjvqC0uI2L4CUCVrXn2VSTjHfyQcUwSdUtMLo4cH/bU2wVZtx/
 SPow==
X-Gm-Message-State: APjAAAVnbyk8duvk5PV04csrYrlALF16MVKXDXrdJfQyv+6p7kvThYQC
 2JcEWELZM+O8E37l2TREcV0=
X-Google-Smtp-Source: APXvYqzkZpilMbDJ3CNHJgAsPe5nVCf56VkOOH7PnFm7AOmiq4UiWBEcc2HSQfyaM853MHHavl0RQQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr7508197wml.77.1565959629611;
 Fri, 16 Aug 2019 05:47:09 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id z25sm3636709wml.5.2019.08.16.05.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:47:09 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:47:07 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190816124707.l4qnujnvs5epf3kp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
 <20190813153020.GC1289@perard.uk.xensource.com>
 <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
 <20190813164215.GE1289@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813164215.GE1289@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDU6NDI6MTVQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6NDc6MjNQTSArMDEwMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPiA+IEVycm9yIGJldHdlZW4gdXNlciBhbmQgdGVybWluYWwuIDopCj4g
PiAKPiA+IEknZCBzeW5jJ2QgeGwgYW5kIGxpYnhsLnNvLCBidXQgbm90IGxpYnhsdS5zbwo+IAo+
IEkgYWN0dWFsbHkgbWFkZSB0aGUgc2FtZSBtaXN0YWtlIGZpcnN0IHRpbWUgSSB0cmllZC4KPiAK
PiA+IE9rLCBzbyB0aGF0IGlzIHdvcmtpbmcgbm93LsKgIEkgdGhpbmsgJ2NtZGxpbmUrPSIgZG9t
MD1wdmgKPiA+IGRvbTAtaW9tbXU9bm9uZSInIGlzIHNsaWdodGx5IGxlc3MgdG9ydHVyZWQgc3lu
dGF4LCBidXQgSSBndWVzcyB0aGVyZSBpcwo+ID4gbm8gd2F5IHRoYXQgdGhpcyBpc24ndCBnb2lu
ZyB0byBiZSBob3JyaWJsZS4KPiA+IAo+ID4gQXMgZm9yIHRoZSBnZW5lcmFsIG1lY2hhbmlzbSwg
aG93IHVzYWJsZSBpcyArPSBmb3IgYW55dGhpbmcgb3RoZXIgdGhhbgo+ID4gY21kbGluZT/CoCBN
b3N0IHN0cmluZ3MgaW4gY29uZmlnIGZpbGVzIGNhbid0IHVzZWZ1bGx5IGJlIGV4dGVuZGVkIGlu
Cj4gPiB0aGlzIG1hdHRlciAtIGlmIHRoZXkgbmVlZCBjaGFuZ2luZywgdGhleSBuZWVkIGNoYW5n
aW5nIHdob2xlc2FsZS4KPiAKPiBUaGF0J3MgdHJ1ZSwgYnV0IG9uZSBjb3VsZCBpbWFnaW5nIHNv
bWUgbWF5YmUgYmFkIGV4YW1wbGUgbGlrZSBhZGRpbmcgYQo+IHN1ZmZpeCB0byB0aGUgbmFtZSBv
ZiB0aGUgZ3Vlc3Q6ICJuYW1lKz0nLW92bWYnOyIuCj4gR29pbmcgdGhyb3VnaCBgbWFuIHhsLmNm
ZycsIG1heWJlIGEgZ29vZCBleGFtcGxlIG90aGVyIHRoYW4gY21kbGluZQo+IGNvdWxkIGJlICJj
cHVzKz0nLF4xJyIgYnV0IG1heWJlIGEgc3BhY2UgaXMgZmluZSBoZXJlLCBvciBvbmUgY291bGQg
dXNlCj4gYSBsaXN0IGluc3RlYWQuCj4gT3RoZXIgcG90ZW50aWFsIHVzZXMgY291bGQgYmUgZm9y
ICJQQVRIIiwgYnV0IGluIHRoaXMgY2FzZSBpdCB3b3VsZCBiZQo+IGJldHRlciByZXNldCB0aGUg
c2V0dGluZyByYXRoZXIgdGhhdCBhdHRlbXB0aW5nIHRvIGFkZCBhIHN1ZmZpeCB0byBhbgo+IGV4
aXN0aW5nIG9uZS4KPiAKPiBJIHdvbmRlciBpZiBpbnN0ZWFkIG9mIGRvaW5nICs9IG9uIGFsbCBz
dHJpbmdzLCB3ZSBzaG91bGQgaW5zdGVhZCBoYXZlCj4gYHhsJyB3aGl0ZWxpc3QgdGhlIGZldyBv
cHRpb25zIHdoZXJlICs9IHdvdWxkIG1ha2Ugc2Vuc2UuIChhbmQgYXQgdGhhdAo+IHBvaW50LCBp
dCB3b3VsZCBiZSBlYXN5IHRvIGFkZCBhICcgJyB3aGVyZSBpcyBtYWtlIHNlbnNlLCBsaWtlCj4g
ImNtZGxpbmUicy4gQnV0IHRoZW4sIGhvdyB0byB0ZWxsIHVzZXJzIHRoYXQgaXQgY2FuJ3QgZG8g
Im5hbWUrPSctbmV3JyI/Cj4gYmVjYXVzZSB4bHUgd291bGQganVzdCBwcmludCBhIHdhcm5pbmcs
IGFuZCB4bCB3b3VsZCBrZWVwIGdvaW5nIHdpdGgKPiBuYW1lPSIiLiAgVHJ5ICJ4bCBjcmVhdGUg
bWVtb3J5Kz00MiIgOy0pLgoKTm90IHN1cmUgSSBmb2xsb3cuIENhbiB5b3UgbGltaXQgdGhpcyBp
biB4bD8gSXNuJ3QgKz0gaGFuZGxlZCBpbiBsaWJ4bHUKYWxyZWFkeT8KCldlaS4KCj4gCj4gLS0g
Cj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
