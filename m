Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDA18F323
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:49:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGKbh-0002Yn-UB; Mon, 23 Mar 2020 10:46:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPxt=5I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGKbg-0002Yg-Nj
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:46:56 +0000
X-Inumbo-ID: 9d203b4c-6cf3-11ea-82a8-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d203b4c-6cf3-11ea-82a8-12813bfff9fa;
 Mon, 23 Mar 2020 10:46:56 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b18so15665882edu.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 03:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tjhv5UGjYXXSb/gNxIMPBhxzBwKJPxMwLzcVmXA/Om0=;
 b=IQ1ZRoAV8+beUVa6r8TBa6sqBp6ab/KS63RFzNKTyyJ1pFomfK2vmtHNZXPN9EfXgJ
 qY/EqFI0YU5RddxmlpfYADe/RDT2jkT0nwuHbhTRlbowamr6Ta/tt6xw7bXhuZ6h7j7g
 8WnqvfZqa7+gxM3J3TaySGb7jQV4o80eJd9wlIHeil7+lCCZWB+qTLpf3uGrVAZUkjvl
 hwXpgu07vI2gS2QDfvQ/+KQpSpe/OJm8vzip/P1Kv5n05EpIOjw/jPIs2qvomWg+l+T/
 KLgKSuuPzHzedBa3PsVP4Qb3u2k+DzE4CDbqb+CZlPQ01DudTc93+0oB7BrYy1tHmVZY
 eFtw==
X-Gm-Message-State: ANhLgQ25mE4yTzJBmz/7A+D1pYdZRSHsFd0UEe72MRmwj4TuXhxnqPPL
 PVQR5KF/YpBG4ziU0+rmiXg=
X-Google-Smtp-Source: ADFU+vsm74DgRNFGOmBuT1MfSJ0cD7rXrv7a+j9hfOLa8Es535EXByE5UAFWEZI4Y3LvZSvyyvY2xA==
X-Received: by 2002:a17:906:4807:: with SMTP id
 w7mr19556549ejq.93.1584960415344; 
 Mon, 23 Mar 2020 03:46:55 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id s2sm735783edx.18.2020.03.23.03.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 03:46:54 -0700 (PDT)
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200318111144.12894-1-paul@xen.org>
 <20200318111144.12894-2-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c63bdb0d-9c5e-9a96-258a-25a3c41cb52f@xen.org>
Date: Mon, 23 Mar 2020 10:46:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318111144.12894-2-paul@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/2] docs/designs: Add a design document
 for non-cooperative live migration
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wMy8yMDIwIDExOjExLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gRnJvbTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IAo+IEl0IGhhcyBiZWNvbWUgYXBwYXJl
bnQgdG8gc29tZSBsYXJnZSBjbG91ZCBwcm92aWRlcnMgdGhhdCB0aGUgY3VycmVudAo+IG1vZGVs
IG9mIGNvb3BlcmF0aXZlIG1pZ3JhdGlvbiBvZiBndWVzdHMgdW5kZXIgWGVuIGlzIG5vdCB1c2Fi
bGUgYXMgaXQKPiByZWxpZXMgb24gc29mdHdhcmUgcnVubmluZyBpbnNpZGUgdGhlIGd1ZXN0LCB3
aGljaCBpcyBsaWtlbHkgYmV5b25kIHRoZQo+IHByb3ZpZGVyJ3MgY29udHJvbC4KPiBUaGlzIHBh
dGNoIGludHJvZHVjZXMgYSBwcm9wb3NhbCBmb3Igbm9uLWNvb3BlcmF0aXZlIGxpdmUgbWlncmF0
aW9uLAo+IGRlc2lnbmVkIG5vdCB0byByZWx5IG9uIGFueSBndWVzdC1zaWRlIHNvZnR3YXJlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IC0tLQo+IENj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgoKTXkgY29tbWVudHMgb24gdjYgWzFdIGRvbid0IHNlZW0gdG8gYmUgYWRkcmVzc2VkIG9yIGV4
cGxhaW5lZCB3aHkgdGhleSAKd2VyZSBub3QgYWRkcmVzc2VkLiBDYW4geW91IGhhdmUgYSBsb29r
PwoKQ2hlZXJzLAoKWzFdIDwxN2ViOGI1ZS0xNDE5LTNhN2ItZjc5Ni1kMDE0ZjkzN2VkZGFAeGVu
Lm9yZz4KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
