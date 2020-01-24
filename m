Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826EA148EFE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 21:01:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv56a-0003uD-UU; Fri, 24 Jan 2020 19:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=REEE=3N=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iv56Z-0003u8-CA
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 19:58:59 +0000
X-Inumbo-ID: f589ab44-3ee3-11ea-8e9a-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f589ab44-3ee3-11ea-8e9a-bc764e2007e4;
 Fri, 24 Jan 2020 19:58:58 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id n7so1524919ybm.5
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 11:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=8rXiqXS7W3pmROf1AVqMWwFDQimfM/HRmcjv3ZRs2RA=;
 b=HEjWgBiG/bjAhkEOzp1c9umHQ8i1j3nCYixm4r4QAa8nfAwGlO/+aTsAgj+/UvPwtn
 Np2z26v3IWZlztkkfKSP+ZNnDMEJEArwooop0nzg6Fr+u7qNX/MUuXbxSryERzwBXxCh
 xq5DGTPhTllg9xWC0USq2lVjjoKN3WXm8v+JunP/BPARJ7TLaRi8bVr7JcqoFw6xy2zy
 5m8HMKJzRDptpwQH0pVFstCc9M4efdc2rYWmn3fkOcBAPeyziPsJFok9kd5K8go5okVo
 k0Hb+y5bW/7MykgCK/tSTam40qrnTuhgBTMSlF8WM7wyLmpMYC+3ZWp5eBRE1dzEfTFR
 vwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=8rXiqXS7W3pmROf1AVqMWwFDQimfM/HRmcjv3ZRs2RA=;
 b=k89D9lcowsed5zhdgxw4qYIrfuIe9cdmes/P6toKzMgnIASRlwz7oQec92/O0rCsvY
 aIqhI4X7krwYRz3zVvd1zfecPAziUDIyx9kCts7eiEq3W+3isX6zMJPR60uDmE18Nqzt
 ROjUa3qKaU6mmuSuvRD8T4Be93sguS1/HLFXCpJYcULHU5Hf6NLeVbZAfhduiUx8F/Xs
 kYQdRkkHVO6MoNcoGDdAgCfduU6npFJK6lbRtA3sEDLwu9KV4KxgW9ImrKKvloFrxxFE
 XWEmELE17DKHvikQ3kSic0ZJ+lEZwoNQIK8IbzRO4aqV8KNa/O/Q5/cFNSDV4IAH2q6f
 Vpeg==
X-Gm-Message-State: APjAAAV2fnCW5i52Irh3vJdundmmH8ThkZcnPwPZ7uRC/Kf54F9oeSo+
 +sq4nv4Cb5hjf9Y8kNKnxZc=
X-Google-Smtp-Source: APXvYqxe/immt3toEAj5jyohP6uF31Q5clltECrfW+nrUNrcsrzr0gFfEsGLqGktuWZsClyk0pgmPQ==
X-Received: by 2002:a25:26c6:: with SMTP id m189mr4070895ybm.33.1579895938270; 
 Fri, 24 Jan 2020 11:58:58 -0800 (PST)
Received: from [100.64.72.94] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id r64sm2741138ywg.84.2020.01.24.11.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 11:58:57 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <117DED83-B87B-4F38-972C-57FAC9F3EBDC@gmail.com>
Date: Fri, 24 Jan 2020 14:58:56 -0500
To: Jason Andryuk <jandryuk@gmail.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
X-Mailer: iPad Mail (17C54)
Subject: Re: [Xen-devel] [PATCH v4 12/16] libxl: use vchan for QMP access
 with Linux stubdomain
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
Cc: Wei Liu <wl@xen.org>, Eric Chanudet <chanudete@ainfosec.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

77u/T24gSmFuIDI0LCAyMDIwLCBhdCAwOTowNywgSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21h
aWwuY29tPiB3cm90ZToKPiAKPiDvu79PbiBUdWUsIEphbiAyMSwgMjAyMCBhdCA2OjQ2IFBNIE1h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQo+IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPiB3cm90ZToKPiAKPj4+PiArCj4+Pj4gKyAgICBzZHNzLT5xbXBfcHJveHlfc3Bhd24udGlt
ZW91dF9tcyA9IExJQlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMDsKPj4+PiAr
ICAgIHNkc3MtPnFtcF9wcm94eV9zcGF3bi5taWRwcm9jX2NiID0gbGlieGxfX3NwYXduX3JlY29y
ZF9waWQ7Cj4+Pj4gKyAgICBzZHNzLT5xbXBfcHJveHlfc3Bhd24uY29uZmlybV9jYiA9IHFtcF9w
cm94eV9jb25maXJtOwo+Pj4+ICsgICAgc2Rzcy0+cW1wX3Byb3h5X3NwYXduLmZhaWx1cmVfY2Ig
PSBxbXBfcHJveHlfc3RhcnR1cF9mYWlsZWQ7Cj4+Pj4gKyAgICBzZHNzLT5xbXBfcHJveHlfc3Bh
d24uZGV0YWNoZWRfY2IgPSBxbXBfcHJveHlfZGV0YWNoZWQ7Cj4+Pj4gKwo+Pj4+ICsgICAgY29u
c3QgaW50IGFycmF5c2l6ZSA9IDY7Cj4+Pj4gKyAgICBHQ05FV19BUlJBWShhcmdzLCBhcnJheXNp
emUpOwo+Pj4+ICsgICAgYXJnc1tucisrXSA9IFNUVUJET01fUU1QX1BST1hZX1BBVEg7Cj4+Pj4g
KyAgICBhcmdzW25yKytdID0gR0NTUFJJTlRGKCItLXN0YXRlLXBhdGg9JXMiLCBzZHNzLT5xbXBf
cHJveHlfc3Bhd24ueHNwYXRoKTsKPj4+PiArICAgIGFyZ3NbbnIrK10gPSBHQ1NQUklOVEYoIiV1
IiwgZG1fZG9taWQpOwo+Pj4+ICsgICAgYXJnc1tucisrXSA9IEdDU1BSSU5URigiJXMvZGV2aWNl
LW1vZGVsLyV1L3FtcC12Y2hhbiIsIGRvbV9wYXRoLCBndWVzdF9kb21pZCk7Cj4+PiBUaGlua2lu
ZyBvZiBPcGVuWFQicyBxbXAtaGVscGVyLCB0aGlzIHBhdGggaXNuJ3QgdXNlZnVsLiAgQnV0IGl0
IGlzCj4+PiBmb3IgdmNoYW4tc29ja2V0LXByb3h5LCBzbyBxbXAtaGVscGVyIGNvdWxkIGp1c3Qg
Y2hhbmdlIHRvIGlnbm9yZSBpdC4KPj4gRm9yIHZjaGFuIHdlIGNvdWxkIHVzZSBhbHNvIGEgcG9y
dCBudW1iZXIgKGFuZCB0aGVuIGl0IHdpbGwgZW5jb2RlIGl0Cj4+IGludG8gYSB4ZW5zdG9yZSBw
YXRoKS4gVGhpcyBpcyBpbiBmYWN0IGhvdyB3ZSB1c2UgbGlidmNoYW4gaW4gUXViZXMuIEkKPj4g
b3B0ZWQgZm9yIGV4cGxpY2l0IHBhdGggb25seSBiZWNhdXNlIG9mIGxhY2sgb2YgaWRlYSBmb3Ig
c29tZSBtZWFuaW5nZnVsCj4+IHBvcnQgbnVtYmVyIDspIEJ1dCBJJ20gb3BlbiBmb3Igc3VnZ2Vz
dGlvbnMuCj4+IEkgZ3Vlc3MgdGhhdCB3b3VsZCBiZSB1c2VmdWwgZm9yIEFyZ28gdmVyc2lvbiB0
aGVuLgo+IAo+IFRoZSBhcmdvIHZlcnNpb24gaGFyZCBjb2RlcyB0aGUgcG9ydCBudW1iZXIsIHNv
IGl0J3Mgbm90IGEgY29tbWFuZAo+IGxpbmUgYXJndW1lbnQuICBUaGUgcG9ydCBudW1iZXIgd291
bGQgbmVlZCB0byBnZXQgcGFzc2VkIHRvIHRoZQo+IHN0dWJkb20gb3IgaXQgd291bGQgbmVlZCB0
byBiZSBzdGFuZGFyZGl6ZWQuCj4gCj4gSSB0aGluayB0aGUgYXJndW1lbnRzIGZvciB2Y2hhbi1z
b2NrZXQtcHJveHkgbWFrZSBzZW5zZS4gIFNpbmNlIGl0J3MKPiB0aGUgb25lIHRoYXQncyBzdWJt
aXR0ZWQgdXBzdHJlYW0sIGl0IG1ha2VzIHNlbnNlIHRvIHVzZSB0aGVtLgo+IAo+IFB1dCBhbm90
aGVyIHdheSwgZG8gd2Ugd2FudCB0aGlzIHRvIHN1cHBvcnQgYWx0ZXJuYXRlIGltcGxlbWVudGF0
aW9ucwo+IGZvciBhIHFtcCBwcm94eT8gIFNob3VsZCB0aGUgYXJndW1lbnRzIGJlIGdlbmVyaWMg
Zm9yIHRoYXQgY2FzZT8KCgpPbmUgYWR2YW50YWdlIG9mIHRoZSBzZXJ2ZXIrY2xpZW50IGFwcHJv
YWNoIG9mIHZjaGFuLXNvY2tldC1wcm94eSBpcyB0aGUgYWJzZW5jZSBvZiBwYXRjaGVzIGZvciBR
ZW11LiAgT3BlblhUIHFtcC1oZWxwZXIgcmVxdWlyZXMgYSBRZW11IHBhdGNoIGZvciBBcmdvIHN1
cHBvcnQuICBJZiB0aGVyZSB3YXMgYSBxbXAgc29ja2V0IHByb3h5IHdpdGggQXJnbyBzdXBwb3J0
LCB1bnBhdGNoZWQgUWVtdSBjb3VsZCBiZSB1c2VkIHdpdGggbGlieGwgYW5kIEFyZ28gYWNjZXNz
IGNvbnRyb2xzLgoKQSBnZW5lcmFsaXplZCBxbXAtc29ja2V0LXByb3h5IG1heSBiZSB1c2VmdWwg
dG8gb3RoZXIgcHJvamVjdHMuICBJdCB3b3VsZCBiZSBnb29kIGlmIHRoZSBkZXNpZ24gc3VwcG9y
dGVkIHNpbmdsZS1wdXJwb3NlIChjbGllbnQgb3Igc2VydmVyKSBiaW5hcmllcywgZS5nLiBjb21t
b24gZnVuY3Rpb25zIGluIGEgbGlicmFyeSBzaGFyZWQgYnkgc2VwYXJhdGUgY2xpZW50IGFuZCBz
ZXJ2ZXIgc291cmNlIGZpbGVzLCB3aXRoIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uIGZvciB2Y2hh
biBhbmQgQXJnbyBpbnRlcmZhY2VzLgoKUmljaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
