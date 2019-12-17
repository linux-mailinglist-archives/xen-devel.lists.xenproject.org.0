Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D7C123290
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:33:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFlA-0001R9-84; Tue, 17 Dec 2019 16:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VK9c=2H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihFl8-0001R2-NY
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:31:42 +0000
X-Inumbo-ID: b0029da4-20ea-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0029da4-20ea-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 16:31:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u2so3897420wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 08:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OKnD3NNwqa1/uXhMSQhtsR6DGL7qKvamkx5g7fNU7kY=;
 b=JvmRAl6YZz/LAlF3dtM8p4LYqKdh2iR6QGIZfCUPRbNSouhhaaddGGSli6ezTjcMS1
 FU+bZxdoKb2BV1AvymiAvoQSGT0xsfc1nsWLZtf/bQtXi2YS8fJTc77q0yrrIvKMp1WY
 hCQ4TP9p2wAr2XTJbqM8QM6JeM0a+wd+p6t6IU+A5RamEs1Xm3gaGEOeJADJIA4fUMzW
 bwI6z2jzsVPDUHQX9EopiGzd87rBvAa9BSOnvd9S+fuKm/Zw++8EwAXibN8Qd/at/sc+
 QhPIScTCnVCzJhMZ812DSVjQOZQY9lzWiVlx5p0dXISH4iBCWyqYtXUmcmCBYTRw7W8f
 mDpA==
X-Gm-Message-State: APjAAAXQLsXXXatRB09wp2mRR6+NyLabno1tGzJEgtHBTL3rruRu7XGE
 c0gVmhvyRhb2b7paa+8p43Rl0G/C
X-Google-Smtp-Source: APXvYqy5T2tXaVQnPe5xzt7Vr88/QLHPuR0TDg2k+dnUNpUSl6iOVEqpWDbDYcI5ZYlr29CMv3bBog==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr6332672wma.106.1576600293003; 
 Tue, 17 Dec 2019 08:31:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id s3sm3463451wmh.25.2019.12.17.08.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 08:31:32 -0800 (PST)
To: Andre Przywara <andre.przywara@arm.com>
References: <20191202084924.29893-1-tiny.windzz@gmail.com>
 <86d52917-1ba3-a660-2502-56b9657086b9@xen.org>
 <20191203143818.09e74f25@donnerap.cambridge.arm.com>
 <796e5014-9eee-a084-714c-eab63021f65b@xen.org>
 <20191204092725.0ccab913@donnerap.cambridge.arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4b387ee5-6f5d-da93-b0f5-103e9969c11b@xen.org>
Date: Tue, 17 Dec 2019 16:31:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191204092725.0ccab913@donnerap.cambridge.arm.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: Basic support for sunxi/sun50i h6
 platform.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNC8xMi8yMDE5IDA5OjI3LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBUdWUs
IDMgRGVjIDIwMTkgMTY6NTI6NDUgKzAwMDAKPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PiB3cm90ZToKPiAKPiBIaSwKPiAKPj4gT24gMDMvMTIvMjAxOSAxNDozOCwgQW5kcmUgUHJ6eXdh
cmEgd3JvdGU6Cj4+PiBPbiBUdWUsIDMgRGVjIDIwMTkgMTE6Mzk6NTggKzAwMDAKPj4+IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOgo+Pj4KPj4+IEhpLAo+Pj4gICAgCj4+Pj4g
KCtBbmRyZSkKPj4+Pgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gQEFuZHJlLCBJSVJDIHlvdSBvcmlnaW5h
bGx5IGFkZGVkIHRoZSBzdXBwb3J0IGZvciBzdW54aSBpbiBYZW4uIENvdWxkCj4+Pj4geW91IGhh
dmUgYSBsb29rIGF0IHRoaXMgcGF0Y2g/Cj4+Pgo+Pj4gTG9va3MgYWxyaWdodCwgYW5kIGluZGVl
ZCB0aGUgSDYgbmVlZHMgaXQuIEV2ZW4gdGhvdWdoIEFsbHdpbm5lciB0b3RhbGx5IHJlLWFycmFu
Z2VkIHRoZSBtZW1vcnkgbWFwLCB0aGV5IG1pc3NlZCB0aGUgb3Bwb3J0dW5pdHkgdG8gcHV0IGVh
Y2ggZGV2aWNlIGF0IGxlYXN0IGluIHRoZWlyIG93biA0SyBwYWdlLgo+Pj4KPj4+IFJldmlld2Vk
LWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KPj4KPj4gVGhhbmsg
eW91IGZvciB0aGUgcmV2aWV3IQo+Pgo+Pj4KPj4+IElmIHlvdSBjYW4gd2FpdCB0aWxsIHRoaXMg
ZXZlbmluZywgSSBjYW4gZXZlbiB0ZXN0IGl0Lgo+Pgo+PiBJIGNhbiB3YWl0IHVudGlsIHRvbW9y
cm93IGJlZm9yZSBjb21pdHRpbmcgdGhlIHBhdGNoLgo+IAo+IEkgYm9vdGVkIFhlbiA0LjEyLjEg
dG8gdGhlIERvbTAgcHJvbXB0IG9uIHRoZSBQaW5lIEg2NCwgYW5kIHNhdyBhbGwgdGhlIHNlcmlh
bCBkZXZpY2VzIGluIC9zeXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL3NvYy4gVGhlbiBJIGFw
cGxpZWQgdGhlIHBhdGNoLCBhbmQgdGhlIHNlcmlhbCBkZXZpY2VzIHdlcmUgZ29uZS4gQW5kIHll
cywgYWxsIHRoZSBmb3VyIG1haW4gc2VyaWFsIHBvcnRzIHNoYXJlIG9uZSA0SyBwYWdlIG9uIHRo
ZSBINi4KPiAKPiBUZXN0ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0u
Y29tPgoKVGhhbmsgeW91IGZvciB0aGUgdGVzdGluZyEKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPgoKSSBoYXZlIGFsc28gY29tbWl0dGVkIGl0LgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
