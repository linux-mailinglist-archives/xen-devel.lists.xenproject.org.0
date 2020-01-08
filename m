Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E713474D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 17:11:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDry-0002AL-8p; Wed, 08 Jan 2020 16:07:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipDrx-0002AG-8H
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:07:41 +0000
X-Inumbo-ID: f9e6b2aa-3230-11ea-a38f-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9e6b2aa-3230-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 16:07:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so3087723wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 08:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ukh6GW5zW+M0h1gR7aHPB+k0xVdtqrWPXhgfrmGP66U=;
 b=Zcv8CWU9B90f+xmT1eyJF0NvrjZeXwo1jyWM+xioXTmU+NFPDEtr3l2eGOfd08n0AW
 fMXWo+ljRI2r0+HjzbYu1d30kNvuIRaG8YpqVaB1CzgxdLdKBFZryCr1xLW302B+s2vk
 aBFfpe74EYGmOV/sJpznmYjwAHiAWQ+buFSYj6N8tv1dae7l+XFi6AkMSurRc4t33Yjz
 ROd8sj0Axp1v+qGwu2bfVyl5QqcBb31TfLHEg8cBDmErS7CXuxiFQGcVVKs+IMAv1v6C
 EV/mTuXEM9ojpAkrQasWR4wbKim6V42EZTE+9uw8SJ+r2b//K4yHJ8s7LscKEb5uzaB7
 FHVQ==
X-Gm-Message-State: APjAAAUSw2xFEbXVm6W4MAY64Nwxvk/PJPFXeD8O0w+rGdTEqHAWPqDz
 xTw0V/VIebdAPyiYJHdSrt0=
X-Google-Smtp-Source: APXvYqyjB8G843pgPtLByuAtN6z/Dfebz/O1/M2rlpCasRszRiABeRC/GF/THq3uM2fZXUzetCDtTw==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr4663450wmj.117.1578499651670; 
 Wed, 08 Jan 2020 08:07:31 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id 5sm4811354wrh.5.2020.01.08.08.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 08:07:31 -0800 (PST)
Date: Wed, 8 Jan 2020 16:07:29 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200108160729.khmpffvgcvhamgtj@debian>
References: <20191219144217.305851-1-anthony.perard@citrix.com>
 <20191219144217.305851-3-anthony.perard@citrix.com>
 <20200103142907.ylckq7fh2h536w72@debian>
 <20200106143402.GJ1267@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106143402.GJ1267@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH 2/2] automation: Cache sub-project git
 tree in build jobs
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMDI6MzQ6MDJQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDI6Mjk6MDdQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDE5LCAyMDE5IGF0IDAyOjQyOjE3UE0gKzAwMDAsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBHaXRMYWIgaGF2ZSBhIGNhY2hpbmcgY2FwYWJpbGl0
eSwgc2VlIFsxXS4gTGV0J3MgdXNlIGl0IHRvIGF2b2lkIHVzaW5nCj4gPiA+IEludGVybmV0IHRv
byBvZnRlbi4KPiA+ID4gCj4gPiA+IFRoZSBjYWNoZSBpcyBzZXR1cCBzbyB0aGF0IHdoZW4geGVu
LmdpdC9Db25maWcubWsgaXMgY2hhbmdlZCwgdGhlCj4gPiA+IGNhY2hlIHdpbGwgbmVlZCB0byBi
ZSByZWNyZWF0ZWQuIFRoaXMgaGFzIGJlZW4gY2hvc2VuIGJlY2F1c2UgdGhhdCBpcwo+ID4gPiB3
aGVyZSB0aGUgaW5mb3JtYXRpb24gYWJvdXQgaG93IHRvIGNsb25lIHN1Yi1wcm9qZWN0IHRyZWVz
IGlzIGVuY29kZWQKPiA+ID4gKHJldmlzaW9ucykuIFRoYXQgbWF5IG5vdCB3b3JrIGZvciBxZW11
LXhlbiB0cmVlIHdoaWNoIHVzdWFsbHkgaXMKPiA+ID4gYG1hc3RlcicsIGJ1dCB0aGF0IHNob3Vs
ZCBiZSBmaW5lIGZvciBub3cuCj4gPiA+IAo+ID4gPiBUaGUgY2FjaGUgaXMgcG9wdWxhdGVkIG9m
ICJnaXQgYnVuZGxlIiB3aGljaCB3aWxsIGNvbnRhaW4gYSBtaXJyb3Igb2YKPiA+ID4gdGhlIG9y
aWdpbmFsIHJlcG8sIGFuZCBjYW4gYmUgY2xvbmVkIGZyb20uIElmIHRoZSBidW5kbGUgZXhpc3Qs
IHRoZQo+ID4gPiBzY3JpcHQgaGF2ZSB0aGUgWGVuIG1ha2VmaWxlcyBjbG9uZSBmcm9tIGl0LCBv
dGhlcndpc2UgaXQgd2lsbCBjbG9uZQo+ID4gPiBmcm9tIHRoZSBvcmlnaW5hbCBVUkwgYW5kIHRo
ZSBidW5kbGVzIHdpbGwgYmUgY3JlYXRlZCBqdXN0IGFmdGVyLgo+ID4gPiAKPiA+ID4gV2UgaGF2
ZSBtb3JlIHRoYW4gb25lIHJ1bm5lciBpbiBHaXRMYWIsIGFuZCBubyBzaGFyZWQgY2FjaGUgYmV0
d2Vlbgo+ID4gPiB0aGVtLCBzbyBldmVyeSBidWlsZCBqb2JzIHdpbGwgYmUgcmVzcG9uc2libGUg
dG8gY3JlYXRlIHRoZSBjYWNoZS4KPiA+ID4gCj4gPiA+IFsxXSBodHRwczovL2RvY3MuZ2l0bGFi
LmNvbS9lZS9jaS95YW1sL1JFQURNRS5odG1sI2NhY2hlCj4gPiA+IAo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiA+IAo+ID4g
VGhpcyBpcyBhIGdvb2QgaW1wcm92ZW1lbnQuCj4gPiAKPiA+IEhhdmUgeW91IHJ1biB0aGlzIGlu
IEdpdGxhYiBDST8gQ2FuIHlvdSBwb2ludCBtZSB0byBhIHJ1bj8KPiAKPiBJIGhhdmUgdXNlIHRo
ZSBDSSB0byBkZXZlbG9wIHRoZSBwYXRjaCwgc28geWVzIEkgaGF2ZSBhIHJ1biBvZiBpdC4gQnV0
Cj4gaXQgaXMgYSBydW4gbWFkZSB3aXRoIG15IHdpcCBicmFuY2gsIHN0aWxsIGl0IHNob3VsZCBi
ZSB0aGUgc2FtZSByZXN1bHQKPiBpZiBpdCB3YXMgZG9uZSB3aXRoIHRoZSBmaW5hbCBwYXRjaDoK
PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FudGhvbnlwZXIveGVuL3Bp
cGVsaW5lcy8xMDQzNDM2MjEKClRoaXMgbG9va3MgZ29vZCB0byBtZS4KCj4gCj4gPiA+IGRpZmYg
LS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvcHJlcGFyZS1jYWNoZS5zaCBiL2F1dG9tYXRpb24v
c2NyaXB0cy9wcmVwYXJlLWNhY2hlLnNoCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uMDE3ZjFiOGYwNjcyCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+
ID4gKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2FjaGUuc2gKPiA+ID4gQEAgLTAs
MCArMSw1MiBAQAo+ID4gPiArIyEvYmluL2Jhc2gKPiA+ID4gKwo+ID4gPiArc2V0IC1leAo+ID4g
PiArCj4gPiA+ICtjYWNoZWRpcj0iJHtDSV9QUk9KRUNUX0RJUjo9YHB3ZGB9L2NpX2NhY2hlIgo+
ID4gPiArbWtkaXIgLXAgIiRjYWNoZWRpciIKPiA+ID4gKwo+ID4gPiArZGVjbGFyZSAtQSByCj4g
PiA+ICtyW2V4dHJhcy9taW5pLW9zXT1NSU5JT1NfVVBTVFJFQU1fVVJMCj4gPiA+ICtyW3Rvb2xz
L3FlbXUteGVuLWRpcl09UUVNVV9VUFNUUkVBTV9VUkwKPiA+ID4gK3JbdG9vbHMvcWVtdS14ZW4t
dHJhZGl0aW9uYWwtZGlyXT1RRU1VX1RSQURJVElPTkFMX1VSTAo+ID4gPiArclt0b29scy9maXJt
d2FyZS9vdm1mLWRpcl09T1ZNRl9VUFNUUkVBTV9VUkwKPiA+ID4gK3JbdG9vbHMvZmlybXdhcmUv
c2VhYmlvcy1kaXJdPVNFQUJJT1NfVVBTVFJFQU1fVVJMCj4gPiAKPiA+IERvZXMgdGhpcyBtZWFu
IGlmIGluIHRoZSBmdXR1cmUgd2UgYWRkIG9yIHJlbW92ZSB0cmVlcyB3ZSB3aWxsIG5lZWQgdG8K
PiA+IG1vZGlmeSB0aGlzIHBhcnQgaW4gdGhlIHNhbWUgY29tbWl0Pwo+IAo+IFdlIHdvdWxkIG5l
ZWQgdG8gbW9kaWZ5IHRoZSBzY3JpcHQgd2hlbiB0cmVlcyBhcmUgcmVtb3ZlZCwgYmVjYXVzZSBJ
Cj4gaGF2ZW4ndCB0aG91Z2h0IG9mIHRoYXQuIEJ1dCB3aGVuIHRyZWVzIGFyZSBhZGRlZCwgdGhl
IHNjcmlwdCBjYW4gYmUKPiBjaGFuZ2VkIGluIGEgZm9sbG93LXVwLgo+IAo+IElkZWFsbHksIHdl
IHdvdWxkIHVzZSB0aGUgTWFrZWZpbGVzIHRvIGRpc2NvdmVycyB0aGUgZ2l0IGNsb25lcyB0aGF0
IGNhbgo+IGJlIGNhY2hlZCwgYnV0IHRoYXQncyBub3QgcG9zc2libGUganVzdCB5ZXQuCj4gCj4g
SW4gdGhlIG1lYW4gdGltZSwgSSB0aGluayBJIHNob3VsZCBtYWtlIHRoZSBzY3JpcHQgbW9yZSBy
b2J1c3QgYWdhaW5zdAo+IHJlbW92YWwgb2YgdHJlZXMsIHNvIGl0IGRvZXNuJ3QgaGF2ZSB0byBi
ZSBtb2RpZmllZCBpbiB0aGUgc2FtZSBjb21taXQuCgpPSy4gSSdtIGV4cGVjdGluZyBhIG5ldyB2
ZXJzaW9uIHRoZW4uCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
