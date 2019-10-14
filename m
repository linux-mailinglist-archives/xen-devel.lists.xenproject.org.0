Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A318D610D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 13:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJyEH-0007em-FI; Mon, 14 Oct 2019 11:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TRx6=YH=kernel.org=shawnguo@srs-us1.protection.inumbo.net>)
 id 1iJyEF-0007eg-8J
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 11:09:31 +0000
X-Inumbo-ID: 1820ba38-ee73-11e9-8aca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1820ba38-ee73-11e9-8aca-bc764e2007e4;
 Mon, 14 Oct 2019 11:09:30 +0000 (UTC)
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 912D420650;
 Mon, 14 Oct 2019 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571051370;
 bh=IGUjFKwdFvBuHDUBTTMUkHOqWN+qrspmIFd3EP+r5D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u6lV4BvTYW8QqsNve4UmSk9Z5IRL6ls+Ne+fUJeDqE/2kdCy6p2B3zszdb8a3CGfJ
 zIUWNfhvJGX46ZQKGt0ADXS2mmtAPaMYHIMnAOQtJjH2drVoNnJIyH6+M8bbZA9fir
 CCH+HHdvDRmqPLE15mDMW7UZttO+u5rVp++pF3JE=
Date: Mon, 14 Oct 2019 19:09:12 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Message-ID: <20191014110911.GL12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
 <20191014082847.GH12262@dragon>
 <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH 07/11] dts: arm64: layerscape: add
 dma-ranges property to qoric-mc node
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTI6MDA6MjVQTSArMDIwMCwgTmljb2xhcyBTYWVueiBK
dWxpZW5uZSB3cm90ZToKPiBPbiBNb24sIDIwMTktMTAtMTQgYXQgMTY6MjggKzA4MDAsIFNoYXdu
IEd1byB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDA4OjEyOjM4UE0gKzAyMDAs
IE5pY29sYXMgU2FlbnogSnVsaWVubmUgd3JvdGU6Cj4gPiA+IHFvcmlxLW1jJ3MgZHBtYWNzIERN
QSBjb25maWd1cmF0aW9uIGlzIGluaGVyaXRlZCBmcm9tIHRoZWlyIHBhcmVudCBub2RlLAo+ID4g
PiB3aGljaCBhY3RzIGEgYnVzIGluIHRoaXMgcmVnYXJkLiBTbyBmYXIgaXQgbWFrZWQgYWxsIGRl
dmljZXMgYXMKPiA+ID4gZG1hLWNvaGVyZW50IGJ1dCBubyBkbWEtcmFuZ2VzIHJlY29tbWVuZGF0
aW9uIGlzIG1hZGUuCj4gPiA+IAo+ID4gPiBUaGUgdHJ1dGggaXMgdGhhdCB0aGUgdW5kZXJseWlu
ZyBpbnRlcmNvbm5lY3QgaGFzIERNQSBjb25zdHJhaW50cywgc28KPiA+ID4gYWRkIGFuIGVtcHR5
IGRtYS1yYW5nZXMgaW4gcW9yaXEtbWMncyBub2RlIGluIG9yZGVyIGZvciBEVCdzIERNQQo+ID4g
PiBjb25maWd1cmF0aW9uIGNvZGUgdG8gZ2V0IHRoZSBETUEgY29uc3RyYWludHMgZnJvbSBpdC4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVu
emp1bGllbm5lQHN1c2UuZGU+Cj4gPiAKPiA+IFVwZGF0ZWQgc3ViamVjdCBwcmVmaXggYXMgJ2Fy
bTY0OiBkdHM6IC4uLicsIGFuZCBhcHBsaWVkIHRoZSBwYXRjaC4KPiAKPiBIaSBTaGF3biwKPiB0
aGVzZSB0d28gcGF0Y2hlcyBhcmUgbm8gbG9uZ2VyIG5lZWRlZC4gVGhpcyBzZXJpZXMgaGFzIGJl
ZW4gc3VwZXJzZWRlZCBieSB0aGlzCj4gcGF0Y2hbMV0gOTUxZDQ4ODU1ZCAoJ29mOiBNYWtlIG9m
X2RtYV9nZXRfcmFuZ2UoKSB3b3JrIG9uIGJ1cyBub2RlcycsIGF2YWlsYWJsZQo+IGluIGxpbnV4
LW5leHQpIHdoaWNoIGZpeGVkIHRoZSBpc3N1ZSBkaXJlY3RseSBpbiBPRiBjb2RlLgo+IAo+IFNv
cnJ5IGZvciB0aGUgbm9pc2UuCgpPa2F5LCB0aGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4gIERy
b3BwZWQgdGhlbS4KClNoYXduCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
