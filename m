Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851D23474D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:04:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Vdv-0001mT-BQ; Fri, 31 Jul 2020 14:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1Vdt-0001mL-M5
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:04:13 +0000
X-Inumbo-ID: b5eaaf96-d336-11ea-abbb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5eaaf96-d336-11ea-abbb-12813bfff9fa;
 Fri, 31 Jul 2020 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596204252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JbvmWHPnHyFXzuWdV85iadLyRKIgc4icLLHssKEOtHI=;
 b=TlDwgyPZMOWCsx+HtOITZVXMOoomxgftjvvBJ9v+SKGd14G8ryTg5PyM
 VEF+ZgiZxfix9z+0qThVFQ+AuwUJdNOtu0sfAsAB9Pn1ulGN/Zbiwr/YI
 aZpvBHcxzfwrYzaNtPqlwF2Z/OK2XqGbefbzvfmwSPtePeB+trbnGq1lD o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JSRjncnjuG1XpqS77FBF4RGbiPcvqHM+AjXFI7YLCNBKDP2yyt2oSaM+izJkuD7PE7AJfSzAxN
 SKU0eKgC9oY9ruZnxgcwyflgufMzMGJIilWc8mUUiXRRHmI8ek1fcyFX2rTem1gH7cpkVJwEEB
 2ghtBbY3u1lS/H/4gYWTdsUlH9gNCNfvgk0voX/21ZeruZyLTK4Lqxgeu0GfE6w4DQ+El6kntV
 RKkcvKqyc9WqSws8nI45aM/3smaz/S6Ms4C5ejygsF7KesfjPhjDOOvd+QkT5HQbj99frSpeAv
 CWM=
X-SBRS: 3.7
X-MesageID: 23953025
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23953025"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 41/41] duration_estimator: Clarify
 recentflights query a bit
Thread-Topic: [OSSTEST PATCH v2 41/41] duration_estimator: Clarify
 recentflights query a bit
Thread-Index: AQHWZzI+XEyk28m8zUGjw7HVjV9ik6khlv4A
Date: Fri, 31 Jul 2020 14:04:09 +0000
Message-ID: <0E9B6793-7B13-418C-8E8B-7F5CA38520D3@citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
 <20200731113820.5765-42-ian.jackson@eu.citrix.com>
In-Reply-To: <20200731113820.5765-42-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C35978B494756E40BBA332AC7BD54BDF@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Jul 31, 2020, at 12:38 PM, Ian Jackson <ian.jackson@eu.citrix.com> wro=
te:
>=20
> The condition on r.job is more naturally thought of as a join
> condition than a where condition.  (This is an inner join, so the
> semantics are identical.)
>=20
> Also, for clarity, swap the flight and job conditions round, so that
> the ON clause is a series of r.thing =3D otherthing.
>=20
> No functional change.
>=20
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


