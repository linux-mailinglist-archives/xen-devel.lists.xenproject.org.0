Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6E167D1E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 13:09:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j575Z-0001Xc-Ja; Fri, 21 Feb 2020 12:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aa0I=4J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j575Y-0001XX-Is
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 12:07:24 +0000
X-Inumbo-ID: b842658a-54a2-11ea-8633-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b842658a-54a2-11ea-8633-12813bfff9fa;
 Fri, 21 Feb 2020 12:07:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j575X-0001UI-Ag; Fri, 21 Feb 2020 12:07:23 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j575X-0007I2-1T; Fri, 21 Feb 2020 12:07:23 +0000
Date: Fri, 21 Feb 2020 12:07:20 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200221120720.t7tobrb7n43txoef@debian>
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <20200221112049.3077-3-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221112049.3077-3-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v7 2/6] libxl: modify libxl__logv() to only
 log valid domid values
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTE6MjA6NDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFNvbWUgY29kZS1wYXRocyB1c2UgdmFsdWVzIG90aGVyIHRoYW4gSU5WQUxJRF9ET01J
RCB0byBpbmRpY2F0ZSBhbiBpbnZhbGlkCj4gZG9tYWluIGlkLiBTcGVjaWZpY2FsbHksIHhsIHdp
bGwgcGFzcyBhIHZhbHVlIG9mIDAgd2hlbiBjcmVhdGluZy9yZXN0b3JpbmcKPiBhIGRvbWFpbi4g
VGhlcmVmb3JlIG1vZGlmeSBsaWJ4bF9fbG9ndigpIHRvIHVzZSBsaWJ4bF9kb21pZF92YWxpZF9n
dWVzdCgpCj4gYXMgYSB2YWxpZGl0eSB0ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGlzIHBhdGNoIGlzIG5vdyBpbiBzdGFnaW5nLgoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
