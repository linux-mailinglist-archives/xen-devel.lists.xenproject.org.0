Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00C18A0DC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 17:49:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEboW-0002Ee-2k; Wed, 18 Mar 2020 16:45:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oAGh=5D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jEboU-0002EZ-4E
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 16:45:02 +0000
X-Inumbo-ID: cf2bd39a-6937-11ea-bb1a-12813bfff9fa
Received: from mail-il1-f195.google.com (unknown [209.85.166.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf2bd39a-6937-11ea-bb1a-12813bfff9fa;
 Wed, 18 Mar 2020 16:45:01 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id k29so24332121ilg.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 09:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdRKS4xmjJ8QMOfvlPjKEiSBUMfaUEPC/p3SzH6vLRI=;
 b=ML/BSb2uH2rzTYZgrCv/onpJKqOixAWAc8wbL2+naj0Xne0ZZ4ifwG1yBAOamtSKqR
 KaVsXGeZ7S2Vod7lx8JofztJr7ay5V/3rEOqsOjL2GajRt90yO/FLjLM/iGrftEfd0JG
 zvTe9VrBa5C6B8ZcC1CS+y9AIS5MCuSr+IomFESS+H9cvGRUETaWb4WZOiO2tk762Fa0
 0sYXDcJFg3zSbdtAK7qQ+jZKvnnQH0oNRWol9fIc+7u3UPAFDsoCYgDiCvM/dzveEp/H
 XRhSuZk3DCAEwZUsUZl7pWETTFgyaZAfZ/F0AiTdVpoELC+BxK40oWMaN4OyCPMD3NoT
 OKHA==
X-Gm-Message-State: ANhLgQ1zxwowiJYI+6hV72M5yqy4ElECQntlU3aRlK7sBfCaZNEX8f2R
 I0C6Qzw5qGR5j+iJIfF1VbzCZDQb6YY=
X-Google-Smtp-Source: ADFU+vtN5Ipj2k2ExopRubAI8uPWUiPOCgtp3KOqL0zmz33xevJx9bZOv+gM3kyy5mbjJGIca8rpHw==
X-Received: by 2002:a92:d4d0:: with SMTP id o16mr4987881ilm.40.1584549899976; 
 Wed, 18 Mar 2020 09:44:59 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id g78sm2881419ild.36.2020.03.18.09.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 09:44:52 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Mar 2020 10:44:50 -0600
Message-Id: <20200318164450.122932-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] travis: add mem_sharing compile test
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGNvbXBpbGUgdGVzdCBmb3IgbWVtX3NoYXJpbmcgdG8gYXZvaWQgZnV0dXJlIGJyZWFrYWdl
IGdvaW5nIHVubm90aWNlZC4KClNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNA
dGtsZW5neWVsLmNvbT4KLS0tCiAudHJhdmlzLnltbCAgICAgICAgICB8IDMgKysrCiBzY3JpcHRz
L3RyYXZpcy1idWlsZCB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhLy50cmF2aXMueW1sIGIvLnRyYXZpcy55bWwKaW5kZXggMTVjYTllOTA0Ny4u
OTA4ZDIwNWQyNyAxMDA2NDQKLS0tIGEvLnRyYXZpcy55bWwKKysrIGIvLnRyYXZpcy55bWwKQEAg
LTM2LDYgKzM2LDkgQEAgbWF0cml4OgogICAgICAgICAgIGVudjogWEVOX1RBUkdFVF9BUkNIPWFy
bTY0IENST1NTX0NPTVBJTEU9YWFyY2g2NC1saW51eC1nbnUtIFhFTl9DT05GSUdfRVhQRVJUPXkg
UkFORENPTkZJRz15IGRlYnVnPW4KICAgICAgICAgLSBjb21waWxlcjogZ2NjCiAgICAgICAgICAg
ZW52OiBYRU5fVEFSR0VUX0FSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRT1hYXJjaDY0LWxpbnV4LWdu
dS0gZGVidWc9eQorICAgICAgICAtIGNvbXBpbGVyOiBnY2MKKyAgICAgICAgICBlbnY6IFhFTl9U
QVJHRVRfQVJDSD14ODZfNjQgWEVOX0NPTkZJR19FWFBFUlQ9eSBNRU1fU0hBUklORz15IGRlYnVn
PXkKKwogYWRkb25zOgogICAgIGFwdDoKICAgICAgICAgc291cmNlczoKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvdHJhdmlzLWJ1aWxkIGIvc2NyaXB0cy90cmF2aXMtYnVpbGQKaW5kZXggMGNiMTVhODll
NC4uYjkyNDM3ZTkyZSAxMDA3NTUKLS0tIGEvc2NyaXB0cy90cmF2aXMtYnVpbGQKKysrIGIvc2Ny
aXB0cy90cmF2aXMtYnVpbGQKQEAgLTUsNiArNSw5IEBAICRDQyAtLXZlcnNpb24KICMgcmFuZG9t
IGNvbmZpZyBvciBkZWZhdWx0IGNvbmZpZwogaWYgW1sgIiR7UkFORENPTkZJR30iID09ICJ5IiBd
XTsgdGhlbgogICAgIG1ha2UgLUMgeGVuIEtDT05GSUdfQUxMQ09ORklHPXRvb2xzL2tjb25maWcv
YWxscmFuZG9tLmNvbmZpZyByYW5kY29uZmlnCitlbGlmIFtbICIke01FTV9TSEFSSU5HfSIgPT0g
InkiIF1dOyB0aGVuCisgICAgZWNobyAiQ09ORklHX01FTV9TSEFSSU5HPXkiID4geGVuLy5jb25m
aWcKKyAgICBtYWtlIC1DIHhlbiBvbGRkZWZjb25maWcKIGVsc2UKICAgICBtYWtlIC1DIHhlbiBk
ZWZjb25maWcKIGZpCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
