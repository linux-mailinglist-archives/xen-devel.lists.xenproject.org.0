Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A8183A80
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 21:19:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCUFi-0007sg-1m; Thu, 12 Mar 2020 20:16:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xLcY=45=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCUFg-0007sb-DN
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 20:16:20 +0000
X-Inumbo-ID: 54e6bdbc-649e-11ea-b21d-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54e6bdbc-649e-11ea-b21d-12813bfff9fa;
 Thu, 12 Mar 2020 20:16:19 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so9087095edb.10
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2020 13:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=18f2Ug7RVO2BfaFT4FtGITj6ePCK4cgaHYx09WLkPYw=;
 b=YL5R7s6JHYJu/VqO6C63UZAKzqNZprMnJ6TIEr8hm1tkc0trDL3FP+HsVPpUlr+HJQ
 KdNbovZC76TJ6kQ7JIZ1Hg1+My9jHWxqM6Xa2RPCozsoqn6KD1HXtJDJoUwUHiYWIYtO
 wQtEbQzCr07WX6TwodcjfFT4fJtoxyFQ6XFxk3vnG5Hw1yXR2MPJitHzx/lDTRGQYsE9
 j0UXMeXX/CZWDNndQIk2Ttpc3Gic7VS9vID8xYhUDSTD8mG7+Qm4LWurmHC50Rt1vLjQ
 U2QQHTtHyhxjCVk1FvSjANi9M9ChAHb/tjmEPRJW6a2SXeSCkaGDuFsxidFIT3IxWxrE
 IuCw==
X-Gm-Message-State: ANhLgQ3oFGb7LMhMVbBa7GnsGpNGyd8Nqi36F4kQe8n+SRpUuCa7bA7B
 tPaYt5rVlWFCXaLY7kV58Y8=
X-Google-Smtp-Source: ADFU+vsusHuxSlYUQNX6KiFge4kgXwIZleIch9oV1+tXd2hSKN0b7WInZxFxy85rzCDgiaeoUbNfhw==
X-Received: by 2002:a50:c199:: with SMTP id m25mr9452504edf.254.1584044178715; 
 Thu, 12 Mar 2020 13:16:18 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id n6sm1929645ejy.23.2020.03.12.13.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 13:16:17 -0700 (PDT)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <7720f54e-7ef7-9dae-dfdb-38b89a0892a6@xen.org>
 <20200311152613.GJ2152@perard.uk.xensource.com>
 <a3bf47e1-2abb-f663-8f38-70c70d9c6114@xen.org>
 <20200311173854.GK2152@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7fce23cc-1781-c904-c48b-7144c7240b98@xen.org>
Date: Thu, 12 Mar 2020 20:16:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311173854.GK2152@perard.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wMy8yMDIwIDE3OjM4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBPbiBXZWQs
IE1hciAxMSwgMjAyMCBhdCAwNToyMToyNFBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
IE9uIDExLzAzLzIwMjAgMTU6MjYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gT24gV2VkLCBN
YXIgMTEsIDIwMjAgYXQgMDI6MTg6MjBQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+
PiArY29uZmlnIEVBUkxZX1VBUlRfQkFTRV9BRERSRVNTCj4+Pj4+ICsJZGVwZW5kcyBvbiBFQVJM
WV9QUklOVEsKPj4+Pj4gKwloZXggIkVhcmx5IHByaW50aywgcGh5c2ljYWwgYmFzZSBhZGRyZXNz
IG9mIGRlYnVnIFVBUlQiCj4+Pj4+ICsJZGVmYXVsdCAweDg3ZTAyNDAwMDAwMCBpZiBFQVJMWV9Q
UklOVEtfVEhVTkRFUlgKPj4+Pgo+Pj4+IFlvdSBhcmUgYWxsb3dpbmcgRUFSTFlfUFJJTlRLX1RI
VU5ERVJYIHRvIGJlIHNlbGVjdGVkIG9uIEFybTMyIHBsYXRmb3JtIGJ1dAo+Pj4+IHRoZSBhZGRy
ZXNzIGlzIGFib3ZlIDRHLiBJIHN1c3BlY3QgdGhpcyB3b3VsZCBicmVhayByYW5kY29uZmlnIGJ1
aWxkLgo+Pj4KPj4+IGdjYyBkb2Vzbid0IHNlZW1zIHRvIGNvbXBsYWluIDotKS4KPj4KPj4gSSB3
YXMgZXhwZWN0aW5nIEdBUyB0byB0aHJvdyBhbiBlcnJvciBiZWNhdXNlIHRoZSA2NC1iaXQgdmFs
dWUgZG9lcyBub3QgZml0Cj4+IGluIGEgMzItYml0IHJlZ2lzdGVyLiBCdXQuLi4gaXQgbG9va3Mg
bGlrZSBHQVMgd2lsbCBzaWxlbnRseSB0cnVuY2F0ZSB0aGUKPj4gdmFsdWUgdG8gMHgyNDAwMDAw
MCA6KC4KPj4gCQo+Pj4gKEkgbWVhbiAiYXJtLW5vbmUtZWFiaS1nY2MgKEFyY2ggUmVwb3NpdG9y
eSkgOS4yLjAiKQo+Pj4KPj4+IEJ1dCBJIGNhbiBoYXZlIHRodW5kZXJ4IGRlcGVuZHMgb24gYXJt
XzY0Lgo+PiBJcyB0aGVyZSBhIHdheSB0byBjb25zdHJhaW5zdCB0aGUgYWRkcmVzcyBpbiBLY29u
ZmlnPwo+IAo+IFRoZXJlIGlzISBJIGNhbiBhZGQgInJhbmdlIDB4MCAweGZmZmZmZmZmIGlmIEFS
TV8zMiIuCj4gQnV0IEtjb25maWcgZG9lc24ndCBzYXkgYW55dGhpbmcgaWYgYSBkZWZhdWx0IHZh
bHVlIGlzIHRvbyBoaWdoLCBhbmQKPiBzaWxlbnRseSBzZXQgdGhlIHZhbHVlIHRvIHRoZSBtYXhp
bXVtLgoKTG92ZWx5LiBJdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBmcm9tIEtjb25maWcgdG8gd2Fy
biB5b3UgaWYgdGhlIGRlZmF1bHQgCmlzIG5vdCBpbiB0aGUgcmFuZ2UuIE1heWJlIGEgZnV0dXJl
IGltcHJvdmVtZW50PwoKPiBTdGlsbCwgaXQncyBiZXR0ZXIuIEkganVzdCBuZWVkIHRvIGFkZCBk
ZXBlbmRzIG9uIEFSTV82NCBmb3IgdGh1bmRlcngsCj4gYW5kIHRoYXQgc2hvdWxkIGJlIGZpbmUu
CgpJIGFncmVlIHRoYXQgdGhpcyB3b3VsZCBtYWtlIHRoaW5ncyBiZXR0ZXIuCgo+IEFuZCB0aGF0
IHByZXZlbnQgdXNlcnMgZnJvbSBzZXR0aW5nIGEgdG9vIGhpZ2h0IHZhbHVlLCBhcyBrY29uZmln
IHdpbGwKPiBub3QgYWNjZXB0IGEgdmFsdWUgb3V0c2lkZSB0aGUgcmFuZ2UuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
