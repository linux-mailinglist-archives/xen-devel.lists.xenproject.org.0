Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2A13DF8F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:06:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7cw-0008Ud-Do; Thu, 16 Jan 2020 16:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=03Je=3F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1is7cu-0008UV-Nn
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:04:08 +0000
X-Inumbo-ID: d17f9670-3879-11ea-876f-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d17f9670-3879-11ea-876f-12813bfff9fa;
 Thu, 16 Jan 2020 16:04:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d73so4331135wmd.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jv/ieQf2M9v5ZrXDhNkoyelhDU0LlYBqWjM8/xQ6Nes=;
 b=duclfqBczu5FERfwvtuCmrwhdUr/dci3AHc2ntW1rnVRG0cuApVLKAN05t94gAIgzV
 jz0gabA46NCyYUUqULvQ4DtMuIinlguKxSJzaKkb/5kc6/Lf6cfblY9FjMo5XjeRol0U
 9fNl/B5CcH5zQrKSTEexvDzpxZM0/W5xJD29c1eTFTDeoMpBIU2nro3PhONl40XF1aZ8
 iEwBfq+Ou/IHdwDtcFiI3SuSRD2Neiu/rkoqbDal7z6AIM0uzIVVU7R1DDaAqejPmuR1
 lnIiU1zJf7i0J/yBYZjZlTq1GMTQu78Sc5L3E5GB1iXoIjaZd95Yzw3+Lh6ekBTXaCAe
 rTyQ==
X-Gm-Message-State: APjAAAWWouIgeWfx839wnxqDRyYRvkQnw7VbKpNW5R3lvzKnV2K50Tdv
 bKdiIr8joUuqqFFGXm8ums0=
X-Google-Smtp-Source: APXvYqwJfwTBtaGcQ9M5NnqKRgKNsOGFo316DOP4ELiKzlTsz11tH5wkdcx51msQfqeQunrp+WG9Zw==
X-Received: by 2002:a1c:151:: with SMTP id 78mr98793wmb.182.1579190644085;
 Thu, 16 Jan 2020 08:04:04 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id m10sm29898642wrx.19.2020.01.16.08.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 08:04:03 -0800 (PST)
To: Lars Kurth <lars.kurth@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89248aebf252aaabf5fce44ef4cffc7e3da38212.1578691030.git.lars.kurth@citrix.com>
 <8885FB4A-0DDA-4B72-93D3-E64FBC836458@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2076db4d-eaba-e91a-2043-ec961d4ef7cc@xen.org>
Date: Thu, 16 Jan 2020 16:04:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8885FB4A-0DDA-4B72-93D3-E64FBC836458@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] get-maintainer.pl: Dont fall over when L:
 contains a display name
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
Cc: "jgross@suse.com" <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE1LzAxLzIwMjAgMTg6MTEsIExhcnMgS3VydGggd3JvdGU6Cj4gSSBzaG91
bGQgaGF2ZSBhZGRlZCBtb3JlIHBlb3BsZSB0byB0aGlzIGNoYW5nZS4gVGhlIGlzc3VlIHdpdGhv
dXQgdGhpcyBmaXggaXMgdGhhdCBlbnRyaWVzIHN1Y2ggYXMKPiAKPiBMOiB4ZW4tZGV2ZWwgPHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiAKPiBicmVhayBnZXRfbWFpbnRhaW5lci5w
bCBhbmQgdGh1cyBhZGRfbWFpbnRhaW5lcnMucGwKPiAKPiBMYXJzCj4gCj4g77u/T24gMTAvMDEv
MjAyMCwgMjE6MTksICJMYXJzIEt1cnRoIiA8bGFycy5rdXJ0aEB4ZW5wcm9qZWN0Lm9yZz4gd3Jv
dGU6Cj4gCj4gICAgICBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4g
ICAgICAKPiAgICAgIFByaW9yIHRvIHRoaXMgY2hhbmdlIGUtbWFpbCBhZGRyZXNzZXMgb2YgdGhl
IGZvcm0gImRpc3BsYXkgbmFtZQo+ICAgICAgPGVtYWlsPiIgd291bGQgcmVzdWx0IGludG8gZW1w
dHkgb3V0cHV0LiBBbHNvIHNlZQo+ICAgICAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAxL21zZzAwNzUzLmh0bWwKPiAgICAgIAo+ICAg
ICAgU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpDaGVlcnMsCgo+ICAgICAg
LS0tCj4gICAgICBDQzogamdyb3NzQHN1c2UuY29tCj4gICAgICAtLS0KPiAgICAgICBzY3JpcHRz
L2dldF9tYWludGFpbmVyLnBsIHwgMiArLQo+ICAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICAgICAgCj4gICAgICBkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKPiAgICAgIGlu
ZGV4IDJlNjYxZjQ3ZDguLjQ4ZTA3MzcwZTggMTAwNzU1Cj4gICAgICAtLS0gYS9zY3JpcHRzL2dl
dF9tYWludGFpbmVyLnBsCj4gICAgICArKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCj4g
ICAgICBAQCAtMTA3Myw3ICsxMDczLDcgQEAgc3ViIGFkZF9jYXRlZ29yaWVzIHsKPiAgICAgICAJ
ICAgIG15ICRwdHlwZSA9ICQxOwo+ICAgICAgIAkgICAgbXkgJHB2YWx1ZSA9ICQyOwo+ICAgICAg
IAkgICAgaWYgKCRwdHlwZSBlcSAiTCIpIHsKPiAgICAgIC0JCW15ICRsaXN0X2FkZHJlc3MgPSAk
cHZhbHVlOwo+ICAgICAgKwkJbXkgKCRsaXN0X25hbWUsICRsaXN0X2FkZHJlc3MpID0gcGFyc2Vf
ZW1haWwoJHB2YWx1ZSk7Cj4gICAgICAgCQlteSAkbGlzdF9hZGRpdGlvbmFsID0gIiI7Cj4gICAg
ICAgCQlteSAkbGlzdF9yb2xlID0gZ2V0X2xpc3Rfcm9sZSgkaSk7Cj4gICAgICAgCj4gICAgICAt
LQo+ICAgICAgMi4xMy4wCj4gICAgICAKPiAgICAgIAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
