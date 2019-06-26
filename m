Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2356EE8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 18:36:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgArY-0004lL-JX; Wed, 26 Jun 2019 16:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/wmC=UZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hgArX-0004lG-0f
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 16:33:35 +0000
X-Inumbo-ID: 216b13f2-9830-11e9-a6f2-97ee68388a69
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 216b13f2-9830-11e9-a6f2-97ee68388a69;
 Wed, 26 Jun 2019 16:33:30 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c66so2790793wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2019 09:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iZh3w2u8PFK7Dod5ZIB0ldjSPsnuMgSHRGfrNFbLKYc=;
 b=C6f/JZ5Jip+iUM19d3DHZsKSKcznvptGwJel9DLkdXL3PuUs0kss+Q8gkn8dfWyIOA
 N59v3BGHpL7m5TyTN/D8zK++364/fve58gg3I9Szq59zdxD7g8eUdLjI9pkr8cHiDOSu
 yzc/Z/WWw6Jb6VO++L0DgI9Ck6rr2ovnjSSv5jVzi2c/nhOfasYtrAss8eiKfNA4xqri
 4s7Q8/OkXwSLBVF1NSN1FSsXuhWT+IN//kWKP4dgKJ09FfBdrFFBJAvQnKX4Z0gX0dk9
 xHCMZtcpq9bOOUguepJhGkuh8NiGNkxzJ0LVjcWxaxqNVeNPFkLcNSXwR2Vnw3xZ50GH
 KE2Q==
X-Gm-Message-State: APjAAAXeQnYYfZAsmTpJWD+maB967DQI2qIokr7X23TOHdOZqb2o7xJ0
 BkOFGyBcXfIgnmUc5Ozg6G4=
X-Google-Smtp-Source: APXvYqwvyf8+K4PcgEigi7rJKepMhXqfmHsIKg7mbuDmzxrm/cBGLlJMCA3NLN1UP2hojuKv9lgnGg==
X-Received: by 2002:a1c:2302:: with SMTP id j2mr3239503wmj.174.1561566809460; 
 Wed, 26 Jun 2019 09:33:29 -0700 (PDT)
Received: from debian ([213.31.248.216])
 by smtp.gmail.com with ESMTPSA id t6sm2956668wmb.29.2019.06.26.09.33.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 09:33:28 -0700 (PDT)
Date: Wed, 26 Jun 2019 17:33:27 +0100
From: Wei Liu <wl@xen.org>
To: Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <20190626163327.aio7pwlvpsmxkcb4@debian>
References: <20190626102732.27872-1-nicolas.belouin@gandi.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626102732.27872-1-nicolas.belouin@gandi.net>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q0MgR2VvcmdlCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAxMjoyNzozMlBNICswMjAwLCBOaWNv
bGFzIEJlbG91aW4gd3JvdGU6Cj4gVGhlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bCBtaXNzIGZ1bmN0
aW9ucyBmcm9tIGxpYnhsX3V0aWxzLCBsZXRzIHN0YXJ0Cj4gd2l0aCB0aGUgc2ltcGxlIGxpYnhs
X2RvbWlkX3RvX25hbWUgYW5kIGl0cyBjb3VudGVycGFydAo+IGxpYnhsX25hbWVfdG9fZG9taWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2Fu
ZGkubmV0Pgo+IC0tLQo+ICB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHRfdXRpbHMuZ28g
fCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHRfdXRpbHMuZ28KPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hl
bmxpZ2h0X3V0aWxzLmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0X3V0aWxzLmdv
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hYjdhNTg1ZWM3Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodF91dGls
cy5nbwo+IEBAIC0wLDAgKzEsNjEgQEAKPiArLyoKPiArICogQ29weXJpZ2h0IChDKSAyMDE5IE5p
Y29sYXMgQmVsb3VpbiwgR2FuZGkgU0FTCj4gKyAqCj4gKyAqIFRoaXMgbGlicmFyeSBpcyBmcmVl
IHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKPiArICogbW9kaWZ5IGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYwo+ICsgKiBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOwo+ICsg
KiB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZS4KPiArICoKPiArICogVGhpcyBsaWJyYXJ5IGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4gKyAqIGJ1
dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mCj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS4gIFNlZSB0aGUgR05VCj4gKyAqIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuCj4gKyAqCj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNv
cHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKPiArICogTGljZW5zZSBhbG9uZyB3
aXRoIHRoaXMgbGlicmFyeTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+Lgo+ICsgKi8KPiArcGFja2FnZSB4ZW5saWdodAo+ICsKPiArLyoKPiArI2NnbyBMREZMQUdT
OiAtbHhlbmxpZ2h0IC1seWFqbCAtbHhlbnRvb2xsb2cKPiArI2luY2x1ZGUgPHN0ZGxpYi5oPgo+
ICsjaW5jbHVkZSA8bGlieGxfdXRpbHMuaD4KPiArKi8KPiAraW1wb3J0ICJDIgo+ICsKPiArLyoK
PiArICogT3RoZXIgZmxhZ3MgdGhhdCBtYXkgYmUgbmVlZGVkIGF0IHNvbWUgcG9pbnQ6Cj4gKyAq
ICAtbG5sLXJvdXRlLTMgLWxubC0zCj4gKyAqCj4gKyAqIFRvIGdldCBiYWNrIHRvIHN0YXRpYyBs
aW5raW5nOgo+ICsgKiAjY2dvIExERkxBR1M6IC1seGVubGlnaHQgLWx5YWpsX3MgLWx4ZW5nbnR0
YWIgLWx4ZW5zdG9yZSAtbHhlbmd1ZXN0IC1seGVudG9vbGxvZyAtbHhlbmV2dGNobiAtbHhlbmN0
cmwgLWx4ZW5mb3JlaWdubWVtb3J5IC1seGVuY2FsbCAtbHogLWx1dWlkIC1sdXRpbAo+ICsgKi8K
PiArCj4gK2ltcG9ydCAoCj4gKwkidW5zYWZlIgo+ICspCj4gKwo+ICsvL2NoYXIqIGxpYnhsX2Rv
bWlkX3RvX25hbWUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkKTsKPiArZnVuYyAoQ3R4
ICpDb250ZXh0KSBEb21pZFRvTmFtZShpZCBEb21pZCkgKG5hbWUgc3RyaW5nKSB7Cj4gKwljRG9t
TmFtZSA6PSBDLmxpYnhsX2RvbWlkX3RvX25hbWUoQ3R4LmN0eCwgQy51aW50MzJfdChpZCkpCj4g
KwluYW1lID0gQy5Hb1N0cmluZyhjRG9tTmFtZSkKPiArCXJldHVybgo+ICt9Cj4gKwo+ICsvL2lu
dCBsaWJ4bF9uYW1lX3RvX2RvbWlkKGxpYnhsX2N0ICpjdHgsIGNvbnN0IGNoYXIgKm5hbWUsIHVp
bnQzMl90ICpkb21pZCkKPiArZnVuYyAoQ3R4ICpDb250ZXh0KSBOYW1lVG9Eb21pZChuYW1lIHN0
cmluZykgKGlkIERvbWlkLCBlcnIgZXJyb3IpIHsKPiArCWNuYW1lIDo9IEMuQ1N0cmluZyhuYW1l
KQo+ICsJZGVmZXIgQy5mcmVlKHVuc2FmZS5Qb2ludGVyKGNuYW1lKSkKPiArCj4gKwl2YXIgY0Rv
bUlkIEMudWludDMyX3QKPiArCj4gKwlyZXQgOj0gQy5saWJ4bF9uYW1lX3RvX2RvbWlkKEN0eC5j
dHgsIGNuYW1lLCAmY0RvbUlkKQo+ICsJaWYgcmV0ICE9IDAgewo+ICsJCWVyciA9IEVycm9yKC1y
ZXQpCj4gKwkJcmV0dXJuCj4gKwl9Cj4gKwo+ICsJaWQgPSBEb21pZChjRG9tSWQpCj4gKwo+ICsJ
cmV0dXJuCj4gK30KPiAtLSAKPiAyLjIyLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
