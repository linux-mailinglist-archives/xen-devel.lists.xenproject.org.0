Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D3A1249C7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:34:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaLW-0003EO-JH; Wed, 18 Dec 2019 14:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihaLV-0003EJ-Lb
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:30:37 +0000
X-Inumbo-ID: da617f1c-21a2-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da617f1c-21a2-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 14:29:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so2128174wmf.2;
 Wed, 18 Dec 2019 06:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8dyGOXFKXvU66oYm8mY8a7mqX05VWpF461QSbX+/X0=;
 b=Yj5pocjdJz3FvNlCExa0f4Z4b29LNjFKIwqK8DgE7d+lJFl+5Q4+hTQw5TG39v/mBH
 sGpYajMav/8ctWOnQpIycGp7u+HDulRlQsZK0btXNSQP6p5m8n2PIg3uZrETWrrYn4Aj
 sFZF33EO17qEvv8C/HcdhSnQEbwd/s+LKAAC02u5IDydJvzRQQN6K0TTLGLND/jZZnsa
 XJ7Q6qBHQf11lZbquJlnbOez338bsG0Gt9Z/ux41LyYJkXZfogAyYLO7ttjOEjkKXB4H
 h4KH9GCM2td4XvVHJwfPLTurO51sQMx02Ja14pTi6OyrzH8g383FjpzusnmMmQEwiO6d
 yiMg==
X-Gm-Message-State: APjAAAV24IK2fnRwDdVdWWMlelinOheynqavOkeYsFc/oTI2aezFavvB
 7MuBUBXWBORPU/U/3flAzJM=
X-Google-Smtp-Source: APXvYqyJVMU2riP/VsS3Mwu9JDJ4kE5gytUSBbyKtdXki0Sgju2KNHRE7makk7yAmJPFrHvymZ7CUg==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr3741503wmi.46.1576679391742;
 Wed, 18 Dec 2019 06:29:51 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id x11sm2618981wmg.46.2019.12.18.06.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 06:29:51 -0800 (PST)
To: Lars Kurth <lars.kurth@xenproject.org>, xen-devel@lists.xenproject.org
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
Date: Wed, 18 Dec 2019 14:29:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDEyLzEyLzIwMTkgMjE6MTQsIExhcnMgS3VydGggd3JvdGU6Cj4gKyMjIyBX
b3JrZmxvdyBmcm9tIGFuIEF1dGhvcidzIFBlcnNwZWN0aXZlCj4gKwo+ICtXaGVuIGNvZGUgYXV0
aG9ycyByZWNlaXZlIGZlZWRiYWNrIG9uIHRoZWlyIHBhdGNoZXMsIHRoZXkgdHlwaWNhbGx5IGZp
cnN0IHRyeQo+ICt0byBjbGFyaWZ5IGZlZWRiYWNrIHRoZXkgZG8gbm90IHVuZGVyc3RhbmQuIEZv
ciBzbWFsbGVyIHBhdGNoZXMgb3IgcGF0Y2ggc2VyaWVzCj4gK2l0IG1ha2VzIHNlbnNlIHRvIHdh
aXQgdW50aWwgcmVjZWl2aW5nIGZlZWRiYWNrIG9uIHRoZSBlbnRpcmUgc2VyaWVzIGJlZm9yZQo+
ICtzZW5kaW5nIG91dCBhIG5ldyB2ZXJzaW9uIGFkZHJlc3NpbmcgdGhlIGNoYW5nZXMuIEZvciBs
YXJnZXIgc2VyaWVzLCBpdCBtYXkKPiArbWFrZSBzZW5zZSB0byBzZW5kIG91dCBhIG5ldyByZXZp
c2lvbiBlYXJsaWVyLgo+ICsKPiArQXMgYSByZXZpZXdlciwgeW91IG5lZWQgc29tZSBzeXN0ZW0g
dGhhdCBoZTtwcyBlbnN1cmUgdGhhdCB5b3UgYWRkcmVzcyBhbGwKCkp1c3QgYSBzbWFsbCB0eXBv
OiBJIHRoaW5rIHlvdSBtZWFudCAiaGVscHMiIHJhdGhlciB0aGFuICJoZTtwcyIuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
