Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21D1282A6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:17:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiNkQ-0001u1-L5; Fri, 20 Dec 2019 19:15:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DXd/=2K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iiNkP-0001tw-8I
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:15:37 +0000
X-Inumbo-ID: 19a0e88c-235d-11ea-93e3-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19a0e88c-235d-11ea-93e3-12813bfff9fa;
 Fri, 20 Dec 2019 19:15:36 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i16so9334708edr.5
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RLLv5HOaBaxk/j6/4ESw25lI9NoHDlIpg5yRRfHhaQ=;
 b=Co9QJ3wuin8i6b3PlX7UUiNTEg4idf0hSJvu4hBMgtyKFiVZ/Mh820iF0ZaohGvafU
 0tI4V7e7Ux2WNfLiwB1zmyE4w7nj/1E+gw+ie7338Q6QKq+zIwmm4MYYCVxbutftnTty
 E+K5m1wL9nyplFN8LrcVuaEyaMzWb+KN4TJDFBWQ1l5KbSTs2V07OodkklrQl/Y5X2sF
 7qoXCYk+t0Vnccs97JZ3Sc39OfxdBg1Yd44YY+J5DtLfFzYuqtz4zxq80xr/81oRsN1T
 kiBjX0TwH0rjflU2BnfEfohlt9hgXJFRIRAteasCdGgYWqkvd6HxYaDcskOiDIuT6ZoX
 Y4UA==
X-Gm-Message-State: APjAAAWXANttTxTubMfBKEuHrWH/Di1DVFyQXTahwFzCzembQF7nTfR9
 BgWEHIodgUwZ7LSQ/Gw+W7A=
X-Google-Smtp-Source: APXvYqyklkIFyS33hwhoOJvNGAiU04a0cOFZdyhTdZdwMgsMarRvd9lDF1q1wWTkx+89U/iKg6X9eQ==
X-Received: by 2002:a17:906:7cf:: with SMTP id
 m15mr17337773ejc.82.1576869335346; 
 Fri, 20 Dec 2019 11:15:35 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id e24sm1061880edy.93.2019.12.20.11.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 11:15:34 -0800 (PST)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xenproject.org
References: <20191220182339.9094-1-wipawel@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <504cdd44-a977-8dde-d9f3-4210dbc25aa0@xen.org>
Date: Fri, 20 Dec 2019 19:15:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191220182339.9094-1-wipawel@amazon.de>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] livepatch: Fix typos and other errors in
 tests Makefile
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpUaGFuayB5b3UgZm9yIGZpeGluZyB0aGUgYnVpbGQuCgpPbiAyMC8xMi8yMDE5
IDE4OjIzLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGVyZSB3YXMgYSBidW5jaCBv
ZiB0eXBvcyAocy9hY3Rpb25zL2FjdGlvbi8pIGFzIHdlbGwgYXMgb25lIG1pc3NpbmcKPiBjb25m
aWcuaCB0YXJnZXQgZGVwZW5kZW5jeS4gQWxzbywgeGVuX2V4cGVjdGF0aW9uIHRhcmdldCBoYXMK
PiB1bm5lY2Vzc2FyeSBjeWNsZSBkZXBlbmRlbmN5LgoKSSB3b3VsZCBzdWdnZXN0IHRvIG1lbnRp
b24gd2hpY2ggY29tbWl0IHlvdXIgYXJlIGZpeGluZy4gSSBndWVzcyB0aGVyZSAKYXJlIG11bHRp
cGxlIG9uZXMsIGJ1dCB3ZSBjb3VsZCBqdXN0IG1lbnRpb24gdGhlIG1lcmdlIChpdCBpcyBhdCBs
ZWFzdCAKdXNlZnVsIGZvciBzb21ldGhpbmchKS4KCkkgZ3Vlc3MgdGhpcyBjb3VsZCBiZSBmaXhl
ZCBvbiBjb21taXQuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3
aXBhd2VsQGFtYXpvbi5kZT4KClRlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
