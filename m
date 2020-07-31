Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDF2347A4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:21:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Vub-0003qs-Sm; Fri, 31 Jul 2020 14:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1Vua-0003qM-7L
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:21:28 +0000
X-Inumbo-ID: 1e777d76-d339-11ea-8e4a-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e777d76-d339-11ea-8e4a-bc764e2007e4;
 Fri, 31 Jul 2020 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596205286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SafftgoayHAnHb15nG5Edak7dqbBFqff/CHbv1T2iLs=;
 b=hCDIny1mvTK3tzkElUyNVk9K3iTlf0H7JIUT7zYwrUqSOw5/h29lPCjL
 ZgvEu8xnHbuehv0E47Xv5I5Dmq4wGuRSSzDEB36nAe32Br5fOXj1Diexz
 YsOiaSmXkzMDida4iSQ5nHxXEQrwg5Nq6F8WlvDHN6X2gCcnXLMvy7Klu 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rsUxuyQPNnXVk7MgZUD3od0Dw/CdEDO2LVUhHiV7bWM5rSRasc2Dla3iAP83zsmiJcYV259hyb
 Yxm9HB0H1g0+n3f7n+YsGtshAJzzF8aVWFjAvz8CSjO2VK5+uhoJ26jQ+EcrZotbloX96zmemH
 /x+EKBEsb3qa3gcsiZtf+BEzkIf8eOL5CVVVG8jX9/XoTJurU+HKxCYfdJSNgR5jbrSj8cu5vc
 aDdWJEE3QYgbe/kG1TDAdH8npKlUbuR3CXwIwqpJ0bTMbRSreEHnGUebeYgi+5mlb+ijJ5bAxH
 My8=
X-SBRS: 3.7
X-MesageID: 24508979
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24508979"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/41] schema: Provide indices for
 sg-report-flight
Thread-Topic: [OSSTEST PATCH v2 07/41] schema: Provide indices for
 sg-report-flight
Thread-Index: AQHWZy8fK8s8vZ3fmUmSnUsHUP7xn6khm9aA
Date: Fri, 31 Jul 2020 14:21:23 +0000
Message-ID: <05461545-D39A-4B98-BC27-3560C367FE25@citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
 <20200731113820.5765-8-ian.jackson@eu.citrix.com>
In-Reply-To: <20200731113820.5765-8-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51CFC83B5620394FAEF50EE1006261FC@citrix.com>
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



> On Jul 31, 2020, at 12:37 PM, Ian Jackson <ian.jackson@eu.citrix.com> wro=
te:
>=20
> These indexes allow very fast lookup of "relevant" flights eg when
> trying to justify failures.
>=20
> In my ad-hoc test case, these indices (along with the subsequent
> changes to sg-report-flight and Executive.pm, reduce the runtime of
> sg-report-flight from 2-3ks (unacceptably long!) to as little as
> 5-7s seconds - a speedup of about 500x.
>=20
> (Getting the database snapshot may take a while first, but deploying
> this code should help with that too by reducing long-running
> transactions.  Quoted perf timings are from snapshot acquisition.)
>=20
> Without these new indexes there may be a performance change from the
> query changes.  I haven't benchmarked this so I am setting the schema
> updates to be Preparatory/Needed (ie, "Schema first" as
> schema/README.updates has it), to say that the index should be created
> before the new code is deployed.
>=20
> Testing: I have tested this series by creating experimental indices
> "trial_..." in the actual production instance.  (Transactional DDL was
> very helpful with this.)  I have verified with \d that schema update
> instructions in this commit generate indexes which are equivalent to
> the trial indices.
>=20
> Deployment: AFter these schema updates are applied, the trial indices
> are redundant duplicates and should be deleted.
>=20
> CC: George Dunlap <George.Dunlap@citrix.com>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

I have no idea if building an index on a LIKE is a good idea or not, but it=
 certainly seems to be useful, so:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


