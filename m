Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF154E3B20
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 09:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293330.498276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWaAy-0007FL-CV; Tue, 22 Mar 2022 08:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293330.498276; Tue, 22 Mar 2022 08:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWaAy-0007Ci-93; Tue, 22 Mar 2022 08:47:36 +0000
Received: by outflank-mailman (input) for mailman id 293330;
 Tue, 22 Mar 2022 08:47:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+x7=UB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nWaAw-0007Cc-HP
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 08:47:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a4f5bf-a9bc-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 09:47:33 +0100 (CET)
Received: from AM6P194CA0044.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::21)
 by DB8PR08MB4044.eurprd08.prod.outlook.com (2603:10a6:10:a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 08:47:29 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::fd) by AM6P194CA0044.outlook.office365.com
 (2603:10a6:209:84::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Tue, 22 Mar 2022 08:47:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 08:47:27 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 22 Mar 2022 08:47:27 +0000
Received: from e5c498a212ff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 799B4C8D-74F0-407E-9DD7-B7C32013009C.1; 
 Tue, 22 Mar 2022 08:47:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5c498a212ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 08:47:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5362.eurprd08.prod.outlook.com (2603:10a6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 08:47:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:47:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b6a4f5bf-a9bc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p60v/VkvLCsfeYXQT6nMBBnC1vwmjgLLZJu/KBsKGOc=;
 b=NCDxi8CdRm1ufbBAAF14r6r5bSe9n7bG8M4w82mSwTRToWuJaC8Djq5vjvc56HwgqIvmOcoehZuUXIUf0qbcRs/jiDMZrZYqYSK/kuE8E/gs1bVimEsQBQp5x3CTrA/DDpLd880706/ypY42wrJsfn573fXZUyBGpLIK3hG/kOg=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f85ed14ade700e5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeOgSj04jaCuAgegly3iftuCe4zh+VVodX7SxHP8M4/ROa+eHslFkjjx2+zT0MchsZziFDi0EosjWN+Fmuuq+wBQ+hSq6Sy+M96PLJGI/UeylCiw6NxSWZ40YBimQAfRmikkyTqu6QLMsYjkDHv2bwtpg+yfyhso8qRePjv9eC3uS9AO169nE13T8imC/8AfF2UsxLS3Xm36BzViipTrSSfowgNTqYj63UGRA47fq/lBKAy4v/deAHNmkjgVwIV4ieSfUXec7wGPfcLHNPZIdifeI5CiPCfNvrjdiYrc8keQZgmkpfBJBFh3dL8MD9Wu4kvXFu9yNIBjEJ79e18xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p60v/VkvLCsfeYXQT6nMBBnC1vwmjgLLZJu/KBsKGOc=;
 b=LtY6tqbHBXygXqzwK6l1m/4lAsgnlpcYGiKNLkOWo3fem9XfzEvreg3MHHlMpTsahLr5eHfzJukMgQfakN4Vnl+4Yj2jJ2K0R0cXfOXhO4dR2ctilELCJw4Teflq7vCFGBeN7sZjhMhe21Mr/kRZiaD+FAjK4/7L6JhK+JfocSVfrADjJmK9RBnRChTQJ0DlWFLUotyY21tRKlVrx6xwm8bXqizYQNWlCIcAebujNYauXRDm6m+7yt2dpbqZnNeGiJC6734fllr8iurMc+gkE9okp/SYvEEPA4TggwwxH3cK3t9DSv8Z8tO9pkegQKcKH8Z2o2YVEGAmcM99Gg2PIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p60v/VkvLCsfeYXQT6nMBBnC1vwmjgLLZJu/KBsKGOc=;
 b=NCDxi8CdRm1ufbBAAF14r6r5bSe9n7bG8M4w82mSwTRToWuJaC8Djq5vjvc56HwgqIvmOcoehZuUXIUf0qbcRs/jiDMZrZYqYSK/kuE8E/gs1bVimEsQBQp5x3CTrA/DDpLd880706/ypY42wrJsfn573fXZUyBGpLIK3hG/kOg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYOtyBwlLK7ts4vEKxgpEPsRlgQ6zFUCoAgASzLwCAAAp/AIAADB+AgAAHFICAAPi1AIAAA2QA
Date: Tue, 22 Mar 2022 08:47:16 +0000
Message-ID: <1EAD6570-B893-4759-BA71-A1F9535E374F@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
 <108443e0-c7d7-af6d-2183-b1bd48b0f288@xen.org>
 <9ABBD292-A77F-4CDC-B096-546516114D42@arm.com>
In-Reply-To: <9ABBD292-A77F-4CDC-B096-546516114D42@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7947d07d-9d14-40ec-cf8d-08da0be09802
x-ms-traffictypediagnostic:
	AM0PR08MB5362:EE_|AM5EUR03FT027:EE_|DB8PR08MB4044:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4044ADB18A4C69D25A6D45209D179@DB8PR08MB4044.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ih8Q13tLD40NidiPIAixyD46RVclnBfZCUjEmGrasEGv10GKJI380cGo1Iezvm3ngNgRfxCd+5oRRJz1qA5kpgd2JcJ6MG6M2ED1lfig0a61nyfthmLDIMumnh8K1wIx9Rh/nocbEh+wahBrE47biOVf8PMLFms3Pj+Mm2FintSoBOxfvKFJgsUwbaP+4CWqqPuY6kyOvG/pVYIsHlk/vMkktZt6AzQYIJtrc6TqwidmxuZSZX5Rvdcdn+iNgHWt8IrSGY9166CV5YKNIpzYsZLjlRNF4rdTF26FXY0jB4HV8YHpIblCd38ajD5XkQGEyxUJT0Bv5AbgNsn3u7fHJJaUyNTegchiy5huqAvm5qtJAwV0mjtlADzxlbMnazRm2rE0Ep14DOWTS6ajjOp6xZyR46LL0U6gf53BZjnxkUH8WUt79DuXVYUk4Uov9Tp2NsbGwyc55oWDY3GlO/obNdM90BandiZ4dNegvKFFX2p2v0b51BUXaleYSCDWOTjwO8Rr5HRDVEVxzGuKPlXGperdCodVZ3Ac7LO3+Of37MonuUtSiWm6kGga0p3+QgbW1h0lilIeU1cy2fcWuiSkZasnq62p63guKoy6vVs82jXrx3d0EQ7xDpT2fOppFD0zt86uC9cEc+haQYduwYpx0bDsNtNw8ydX8kyzu36nXy2RMnOc/PHrIPgMtkuoDS05G3JDGv/G9PpIn6+apCwrvaTBXYZWvZtWGT4eJSTw6FWRwmbiA2B8iEVFd+Z5Qu09
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(122000001)(508600001)(71200400001)(6486002)(54906003)(6916009)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(4326008)(91956017)(76116006)(8936002)(7416002)(83380400001)(5660300002)(6512007)(6506007)(53546011)(186003)(26005)(2616005)(38100700002)(33656002)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1CBDD68BC6D0345A0CF9DFFE390AF2B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82c13e5a-ffc8-4b42-30f3-08da0be09165
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LS6elfUWSGlnc8klBpRYrtPel1da3/ufb9WnUJtD6ezqJmCWtd1O/Oiy+/l0d2jWHjHj+Yvs3+By800Gs6wEmqNMjJeLJzd9Scn2AqmQa+MWcQS6GBQ4NeDe3MjTr4MDc1Wf6qk4E2akEEImxIuIUNXtSD3cKO7UyHq6X7ZKB66FS+XXYhwmgAzbpGS3zmORGD9eKuWKioF+I4grArQkye4T8XxDfQCs/cVUIKQAAI2utkcldtTnfb2owK4jiZnwJaeDZYtzqF7zS4SdRGd0uetDSDaQfyg2jUuGWxAQ2i/VUxX/NXYrR+CYe2aWbI9U/86k+mZ0FqdG0KYLg28zstkfDK+rf6n7xvodcWES5Tn72iwEWojdrWPQ9oGI8sBNmFv192baIfq03FdJPr67HFp0QIhgFFyjbUv2IpxAKeePz7ETczyfnHHTztK6c7GDJ6pi6C0CaKrDrgOughDqCPNjqQVWy1IhFNmp+QEHvDDDh6mVXzUCszTDt4fctxD7YPABlBuansJwvu8Jjsq8GWzAjekr+B9jhmAj2M8Rq7P2FOAnm/gKmuY5aqvbDt2F1DMn9TBeLxZcyTxlIOrZmPT07j0i9Ft1htWvbHGFirUZa9mNPq2QGC8qsagszI3kBaMzfXxIUqdyeCRj9yj1cAhoyuWTogpNrG9EHl/TV5/LU829EtjWX9VtNXWyeGwrAZJfgX6DEjr9gB5XMrkAWw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(6486002)(63350400001)(63370400001)(4326008)(6862004)(5660300002)(2906002)(70206006)(70586007)(6506007)(33656002)(53546011)(6512007)(82310400004)(107886003)(186003)(26005)(336012)(508600001)(86362001)(8936002)(2616005)(40460700003)(47076005)(356005)(54906003)(316002)(8676002)(36860700001)(36756003)(81166007)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:47:27.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7947d07d-9d14-40ec-cf8d-08da0be09802
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4044

SGkgSnVsaWVuLA0KDQo+IE9uIDIyIE1hciAyMDIyLCBhdCAwOTozNSwgQmVydHJhbmQgTWFycXVp
cyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4g
DQo+PiBPbiAyMSBNYXIgMjAyMiwgYXQgMTg6NDQsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPj4gDQo+PiBIaSBCZXJ0cmFuZCwNCj4+IA0KPj4gT24gMjEvMDMvMjAyMiAx
NzoxOSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gT24gMjEgTWFyIDIwMjIsIGF0IDE3
OjM2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+IFNvIEkgZG9u
4oCZdCBrbm93IHdoeSBvbiB4ODYgd2UgbXVzdCBoYXZlIGNwdTAgaW4gY3B1cG9vbDAsIG1heWJl
IHg4NiBtYWludGFpbmVyIGhhdmUgbW9yZSBrbm93bGVkZ2UgYWJvdXQgdGhhdCBhbmQNCj4+Pj4+
IEkgY2FuIHB1dCBhIGNvbW1lbnQgaGVyZS4NCj4+Pj4gDQo+Pj4+IE9uIEFybSwgd2UgYXJlIG5v
dCB5ZXQgc3VwcG9ydGluZyBhbGwgdGhlIENQVSBmZWF0dXJlcyB0aGF0IHg4NiBzdXBwb3J0cyAo
ZS5nLiBDUFUgaG90cGx1Zywgc3VzcGVuZC9yZXN1bWUuLi4pLiBTbyBJIGEgYW0gYml0IGNvbmNl
cm5lZCB0aGF0IHRoZSByZXN0cmljdGlvbiBpcyBqdXN0IG5vdCB0aGVyZSB5ZXQgKG9yIHBvc3Np
Ymx5IGhpZGRlbikuDQo+Pj4+IA0KPj4+PiBUaGVyZWZvcmUsIGJlZm9yZSBsaWZ0aW5nIHRoZSBy
ZXN0cmljdGlvbiBvbiBBcm0gKGFuZCBvdGhlciBhcmNoKSwgSSB3b3VsZCBsaWtlIHVzIHRvIHVu
ZGVyc3RhbmQgd2h5IGl0IGlzIG5lY2Vzc2FyeSBvbiB4ODYuDQo+Pj4+IA0KPj4+PiBXZSBtYXkg
bm90IGhhdmUgdGhlIGFuc3dlciBxdWlja2x5LCBzbyBpcyBpdCBnb2luZyB0byBiZSBhIHByb2Js
ZW0gdG8ga2VlcCB0aGUgcmVzdHJpY3Rpb24gb24gQXJtPw0KPj4+IEkgYW0gb2sgdG8ga2VlcCB0
aGUgbGltaXRhdGlvbiB0byBoYXZlIGRvbTAgYWx3YXlzIHJ1bm5pbmcgb24gY3B1MC4NCj4+PiBP
bmx5IGxpbWl0YXRpb24gSSBjYW4gc2VlIGlzIHRoYXQgb24gYSBiaWcgbGl0dGxlIHN5c3RlbSwg
ZG9tMCBuZWVkcyB0byBzdGF5IG9uIHRoZSB0eXBlIG9mIGNvcmUgb2YgdGhlIGZpcnN0IGJvb3Rl
ZCBjb3JlLg0KPj4gDQo+PiBXaGVyZSBkb2VzIHRoaXMgbGltaXRhdGlvbiBjb21lIGZyb20/DQo+
IA0KPiBJZiBkb20wIG11c3QgcnVuIG9uIGNvcmUwIGFuZCBjb3JlMCBpcyBMaXR0bGUgdGhlbiB5
b3UgY2Fubm90IGJ1aWxkIGEgc3lzdGVtIHdoZXJlIGRvbTAgaXMgcnVubmluZyBvbiBiaWcgY29y
ZXMuDQo+IElmIHRoZSBsaW1pdGF0aW9uIGlzIG5vdCB0aGVyZSwgeW91IGNhbiBidWlsZCBzdWNo
IGEgY29uZmlndXJhdGlvbiB3aXRob3V0IGFueSBkZXBlbmRlbmN5IHRvIHRoZSBib290IGNvcmUg
dHlwZS4NCg0KVGhpcyBtaWdodCBub3QgYmUgY29tcGxldGVseSBjbGVhciBzbyBsZXQgbWUgcmVw
aHJhc2U6DQpJbiB0aGUgY3VycmVudCBzeXN0ZW06DQotIGRvbTAgbXVzdCBydW4gb24gY3B1cG9v
bC0wDQotIGNwdXBvb2wtMCBtdXN0IGNvbnRhaW4gdGhlIGJvb3QgY29yZQ0KLSBjb25zZXF1ZW5j
ZTogZG9tMCBtdXN0IHJ1biBvbiB0aGUgYm9vdCBjb3JlDQoNCklmIGJvb3QgY29yZSBpcyBsaXR0
bGUsIHlvdSBjYW5ub3QgYnVpbGQgYXMgc3lzdGVtIHdoZXJlIGRvbTAgcnVucyBvbmx5IG9uIHRo
ZSBiaWcgY29yZXMuDQpSZW1vdmluZyB0aGUgc2Vjb25kIGxpbWl0YXRpb24gKHdoaWNoIGlzIG5v
dCByZXF1aXJlZCBvbiBhcm0pIGlzIG1ha2luZyBpdCBwb3NzaWJsZS4NCg0KUmVnYXJkcw0KQmVy
dHJhbmQNCg0K

