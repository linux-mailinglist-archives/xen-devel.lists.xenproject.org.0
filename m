Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41775142A58
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:16:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVw5-0000MV-Oq; Mon, 20 Jan 2020 12:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itVw4-0000MQ-VZ
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:13:41 +0000
X-Inumbo-ID: 48cf4f17-3b7e-11ea-b959-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48cf4f17-3b7e-11ea-b959-12813bfff9fa;
 Mon, 20 Jan 2020 12:13:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DC023B1B4;
 Mon, 20 Jan 2020 12:13:35 +0000 (UTC)
To: Peter.Kurfer@gdata.de
References: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
 <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
 <5d912751441542ce841c5c4c2f9b7758@gdata.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adc62139-1330-ea1c-92fa-33939ceb14ac@suse.com>
Date: Mon, 20 Jan 2020 13:13:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5d912751441542ce841c5c4c2f9b7758@gdata.de>
Content-Language: en-US
Subject: Re: [Xen-devel] Host freezing after "fixing" recursive fault
 starting in multicalls.c
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxMzowOSwgUGV0ZXIuS3VyZmVyQGdkYXRhLmRlIHdyb3RlOgo+IEkgd2ls
bCBlbmFibGUgZGVidWcgbG9ncyBvbiB0d28gaG9zdHMgdG9kYXkgdG8gc2VlIGlmIEkgY2FuIGNv
cnJlbGF0ZSB0aGUgYWZvcmVtZW50aW9uZWQgZXJyb3IgbWVzc2FnZSB3aXRoIHNvbWUgZGVidWcg
bG9ncy4KPiBBbnl0aGluZyBJIHNob3VsZCBjb25zaWRlciB0byBlbnN1cmUgdGhhdCBldmVyeXRo
aW5nIHJlcXVpcmVkIGlzIGluY2x1ZGVkPwoKImxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbCIg
c2hvdWxkIGJlIHBhcnQgb2YgeW91ciBYZW4gY29tbWFuZCBsaW5lLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
