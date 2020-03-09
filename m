Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C217DE37
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:09:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBGEX-0004s0-5o; Mon, 09 Mar 2020 11:06:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OXP8=42=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1jBGET-0004ru-Rx
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:06:03 +0000
X-Inumbo-ID: f56fe094-61f5-11ea-b74d-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f56fe094-61f5-11ea-b74d-bc764e2007e4;
 Mon, 09 Mar 2020 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wt53BYiGxfLwokvgRbECzhRUvjS1RDLy0IIxSnspxVg=; b=LWM2n/Zy3EPp0XaEmn40s2loX6
 sRlGQ9jC9y/gUSMdtOEHCXrLoIU6ZzeKtwQIMANCY/D+1qlX09RKHblvkXPwv4IgFe7j6/AyG24kZ
 J3/1sjqZUMmv5nXuxa/QwGmC4iriMWwEEKSqpy0ISHV4IahTV+lID69GRVYqVp1295iU=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:35679
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1jBGGR-0000tX-OH; Mon, 09 Mar 2020 12:08:04 +0100
To: Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <a8a6764c-fa1d-5a8d-5470-adf149e4dfda@eikelenboom.it>
Date: Mon, 9 Mar 2020 12:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] xen-4.13 tools/xentop.c backport request
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKSWYgSSdtIG5vdCBtaXN0YWtlbiB5b3UgZG8gdGhlIHRvb2xzIGJhY2twb3J0cy4K
CkkganVzdCBub3RpY2VkIHRoYXQgdGhlIHByb2JsZW0gdGhhdCBpcyBmaXhlZCBieSBjb21taXQ6
IAo0YjViNDMxZWRkOTg0YjI2ZjQzYjNlZmM3ZGU0NjVmMzU2MGE5NDllIHRvb2xzL3hlbnRvcDog
Rml4IGNhbGN1bGF0aW9uIG9mIHVzZWQgbWVtb3J5CgppcyBhbHJlYWR5IHByZXNlbnQgaW4gdGhl
IHhlbi00LjEzIGJyYW5jaCAob2xkZXIgcmVsZWFzZXMgYXJlIHVuZWZmZWN0ZWQpLgpVbmZvcnR1
bmF0ZWx5IEkgZGlkbid0IGNoZWNrIGJlZm9yZSwgc28gSSBkaWRuJ3QgaW5jbHVkZSBhICJiYWNr
cG9ydCB0YWciLgoKSWYgaXQgd2Fzbid0IGFscmVhZHkgb24geW91IGJhY2twb3J0IGxpc3QsIHBs
ZWFzZSBjb25zaWRlciB0byBiYWNrcG9ydCAvIGFwcGx5IHRoaXMgb25lLgoKVGhhbmtzIGEgbG90
LgoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
