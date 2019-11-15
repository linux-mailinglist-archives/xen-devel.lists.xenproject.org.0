Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D327EFDBD2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:57:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZEu-0005CB-1t; Fri, 15 Nov 2019 10:54:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVZEs-0005C2-P7
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:54:06 +0000
X-Inumbo-ID: 3d7c9cd4-0796-11ea-a264-12813bfff9fa
Received: from mail-wr1-f52.google.com (unknown [209.85.221.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d7c9cd4-0796-11ea-a264-12813bfff9fa;
 Fri, 15 Nov 2019 10:54:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l7so10468022wrp.6
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 02:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HF2ZIGtcREbvCEj78ZjJeJNqG3dlp8gcl17zZeAVToI=;
 b=QeF7hqg9w7jiXjMPeRUxwROH5HFYmZbJ5v0wNj+/94ZqpDgfifcW57iKuCjbv5qpQd
 Mp4paeD9wrZmt5o7UQ538y6MQXkj/XE4YkiRKoW6Trt0fmyf7N72A60cuFGCfzGzdRuj
 l7ZrUrqbcroZ6A1qv2iKGy6Y3kkIv9W+nBX0b9K7/cHyg/J4weqdI9+sTcjHdXyzu0/s
 vnkQfm/l2nBFvZ8T8XP+dNXgE59PIBBnCf6YQw8Uj5yxPUmawwwZMcwgtNUP1fD7Auiz
 llWKp33BV6psLYtXyNRXFI7Zc5sU+uv/hJKGF1ym3vbtawLhYOkoJ3eEv0rDlkOQPJmA
 eEwA==
X-Gm-Message-State: APjAAAXTptcp5glr1ne1S8voD0LS3RDA66weIG5fjQcU+iifWLX3Szfj
 F+pBDoHSV9tuOSRzKpcvImM=
X-Google-Smtp-Source: APXvYqz418iZJgbQon6BI84eoL9UqVIf3O99qJLy90edEca42Wf4NLklUYdwJDuGuSMbvHk98pYRxg==
X-Received: by 2002:adf:9786:: with SMTP id s6mr1469547wrb.188.1573815244320; 
 Fri, 15 Nov 2019 02:54:04 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id u7sm12301172wre.59.2019.11.15.02.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 02:54:03 -0800 (PST)
Date: Fri, 15 Nov 2019 10:54:02 +0000
From: Wei Liu <wl@xen.org>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20191115105402.p5kzzsy4pydykiex@debian>
References: <921F6581-B12A-4EC0-B0E2-91FE61C3D48D@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <921F6581-B12A-4EC0-B0E2-91FE61C3D48D@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Call for new Release Manager for Xen 4.14+
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul =?utf-8?B?RHVycmFudMKg?= <pdurrant@amazon.com>,
 Brian Woods <brian.woods@xilinx.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTA6Mjk6MzBQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBEZWFyIENvbW11bml0eSBNZW1iZXJzLCAKPiAKPiBKdWVyZ2VuIHdpbGwgYmUgc3RlcHBp
bmcgZG93biBhcyBSZWxlYXNlIE1hbmFnZXIgYWZ0ZXIgWGVuIDQuMTMgaGFzCj4gYmVlbiBkZWxp
dmVyZWQsIGZvbGxvd2luZyB0aGUgNC4xMSBhbmQgNC4xMiByZWxlYXNlLiBSZWxlYXNlIG1hbmFn
ZXJzCj4gcHJpb3IgdG8gSnVlcmdlbiB3ZXJlIEp1bGllbiBHcmFsbCwgS29ucmFkIFdpbGssIFdl
aSBMaXUgYW5kIEdlb3JnZQo+IER1bmxhcC4gV2UgYXJlIGxvb2tpbmcgZm9yIGFjdGl2ZSBjb21t
dW5pdHkgbWVtYmVycyB0byBmb2xsb3cgaW4KPiBwcmV2aW91cyByZWxlYXNlIG1hbmFnZXJzIGZv
b3RzdGVwcy4gSSBhbHNvIHdhbnRlZCB0byB0aGFuayBKdWVyZ2VuCj4gZm9yIHBlcmZvcm1pbmcg
dGhlIHJvbGUuIAo+IAo+IFdlIGhhdmUgZGlzY3Vzc2VkIHdpdGggYSBudW1iZXIgb2YgcGVvcGxl
LCBob3dldmVyIFdlaSBtYWRlIHRoZSB2ZXJ5Cj4gdmFsaWQgcG9pbnQgdGhhdCB3ZSBzaG91bGQg
bWFrZSBhbiBhbm5vdW5jZW1lbnQgYWJvdXQgdGhlIHJvbGUgb24gdGhlCj4gbGlzdC4gIEluIHRl
cm1zIG9mIGVmZm9ydCwgdGhlIGVmZm9ydCByZXF1aXJlZCBwcmlvciB0byB0aGUgcmVsZWFzZSBp
cwo+IHJlbGF0aXZlbHkgbG93ICgxLTIgZGF5cyBhIG1vbnRoKSwgaG93ZXZlciBpbiB0aGUgbGFz
dCB0d28gbW9udGhzIG9mCj4gdGhlIHJlbGVhc2UgZ29lcyB1cCB0byAxLTIgZGF5cyBwZXIgd2Vl
ay4gVHlwaWNhbGx5IHJlbGVhc2UgbWFuYWdlcnMKPiBtYW5hZ2UgMi0zIHJlbGVhc2VzLgo+IAo+
IFdoYXQgaXMgaW52b2x2ZWQgaW4gdGhlIHJvbGUgaXMgZGVzY3JpYmVkIGhlcmU6Cj4gaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj1kb2NzL3Byb2Nlc3Mv
eGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2M7aD1kNmFiYzkwYTAyNDhiNzY5MTYxYmNlNzll
OGRjNjkwNGM2NTQ5MDRhO2hiPUhFQUQKClRoZSBzZWN0aW9uIGFib3V0IHJlbGVhc2UgY3ljbGUg
aW4gdGhlIGRvYyBpcyBvdXQtZGF0ZWQuCgpMZXQgbWUgc2VlIGlmIEkgY2FuIGZpbmQgc29tZSBj
b3Bpb3VzIGZyZWUgdGltZSB0byBmaXggdGhhdCBzZWN0aW9uLgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
