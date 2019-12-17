Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDAB122E82
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:22:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDhh-00029O-EB; Tue, 17 Dec 2019 14:20:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7KW0=2H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihDhf-00029E-OC
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:19:59 +0000
X-Inumbo-ID: 4dea5923-20d8-11ea-8eda-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dea5923-20d8-11ea-8eda-12813bfff9fa;
 Tue, 17 Dec 2019 14:19:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so3083189wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 06:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yvbg8hUyki9YURd+laNu3iCbsp7i7ppaHuRqokBuG2Q=;
 b=Y/CPe6g5TuAiDDM4R8zO4+3Ml4NY9PcR/X+a74UXdIdGBtkSlFM0c88Opb1LfGknpL
 stJ5aMlxArP+M55I9c0S13yu43pbPz/bQRi4LOEm9AZldDh6D0cJRWPt1qx3rQiAXBWr
 OKUMO7iRMc8b2xVJV/jwYZ9duqShT8spDhv24Q8pfkH5DNE5+SWWYh7XVMYkRJzDM8rY
 8Va0YeOjm3LEGQGoztmGbUsUiyRll2RdfkFI2DpKsrCPO9FDQX4tLTBxJ4HJslqllqGI
 hzpUAWbbHGemH+DtGfA1izLcSuiW9nZ3Adygb1nvU1MjbXKJf55lcJ6elVVw9isnJJlM
 /+Kw==
X-Gm-Message-State: APjAAAVmF8x+DQT1NRuFRrQTZpI4fGRl1b2zF6KolBaAHyx1s1iA2/Nb
 Ee+t0VcIgI4t9N+17DNX0PQ=
X-Google-Smtp-Source: APXvYqy+3oCDlTJEAGW7ojtmlRnxJ3i8HOepI1nloW2KeMjfFCciAmp5C6tLMbcV5nGhtHxFs69dFw==
X-Received: by 2002:a1c:e007:: with SMTP id x7mr5546532wmg.3.1576592397928;
 Tue, 17 Dec 2019 06:19:57 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id o1sm26260489wrn.84.2019.12.17.06.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:19:57 -0800 (PST)
Date: Tue, 17 Dec 2019 14:19:55 +0000
From: Wei Liu <wl@xen.org>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20191217141955.7mjbspyo647nr6bs@debian>
References: <cover.1576209614.git.netwiz@crc.id.au>
 <8b561c819ecad2bde8601057b34dfcd70e256c4f.1576209614.git.netwiz@crc.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b561c819ecad2bde8601057b34dfcd70e256c4f.1576209614.git.netwiz@crc.id.au>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/2] Use ip for bridge related functions
 where brctl is not present
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDM6MDg6MzVQTSArMTEwMCwgU3RldmVuIEhhaWdoIHdy
b3RlOgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4KPiAt
LS0KPiAgdG9vbHMvaG90cGx1Zy9MaW51eC9jb2xvLXByb3h5LXNldHVwICAgICAgfCAzMCArKysr
KysrKysrKysrKysrKy0tLS0tLQo+ICB0b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1icmlkZ2UgICAg
ICAgICAgICB8IDE5ICsrKysrKysrLS0tLS0tCj4gIHRvb2xzL2hvdHBsdWcvTGludXgvdmlmMiAg
ICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKy0tCj4gIHRvb2xzL2hvdHBsdWcvTGludXgveGVu
LW5ldHdvcmstY29tbW9uLnNoIHwgMTUgKysrKysrKysrLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2hvdHBsdWcvTGludXgvY29sby1wcm94eS1zZXR1cCBiL3Rvb2xzL2hvdHBsdWcvTGludXgvY29s
by1wcm94eS1zZXR1cAo+IGluZGV4IDk0ZTIwMzQ0NTIuLmNiZDViNzczYzYgMTAwNzU1Cj4gLS0t
IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9jb2xvLXByb3h5LXNldHVwCj4gKysrIGIvdG9vbHMvaG90
cGx1Zy9MaW51eC9jb2xvLXByb3h5LXNldHVwCj4gQEAgLTc2LDEwICs3NiwxNyBAQCBmdW5jdGlv
biB0ZWFyZG93bl9wcmltYXJ5KCkKPiAgCj4gIGZ1bmN0aW9uIHNldHVwX3NlY29uZGFyeSgpCj4g
IHsKPiAtICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgZGVsaWYgJGJyaWRnZSAkdmlmbmFtZQo+
IC0gICAgZG9fd2l0aG91dF9lcnJvciBicmN0bCBhZGRiciAkZm9yd2FyZGJyCj4gLSAgICBkb193
aXRob3V0X2Vycm9yIGJyY3RsIGFkZGlmICRmb3J3YXJkYnIgJHZpZm5hbWUKPiAtICAgIGRvX3dp
dGhvdXRfZXJyb3IgYnJjdGwgYWRkaWYgJGZvcndhcmRiciAkZm9yd2FyZGRldgo+ICsgICAgaWYg
WyAteCAiL3Vzci9zYmluL2JyY3RsIiBdOyB0aGVuCgpJIGFncmVlIHdpdGggdGhlIGdlbmVyYWwg
ZGlyZWN0aW9uIG9mIHRoaXMgcGF0Y2gsIHRoYW5rcyBmb3IgcHV0aW5nCnRvZ2V0aGVyIHRoaXMg
cGF0Y2guCgpJbnN0ZWFkIG9mIHNwZWNpZnlpbmcgZnVsbCBwYXRoIGhlcmUsIHBsZWFzZSB1c2Ug
YHdoaWNoIGJyY3RsYCBsaWtlIHdlCmRpZCBpbiB4ZW4tbmV0d29yay1jb21tb24uc2guCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
