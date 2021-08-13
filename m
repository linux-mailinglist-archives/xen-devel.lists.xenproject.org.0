Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923813EB16A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 09:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166657.304210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mERbA-000209-3B; Fri, 13 Aug 2021 07:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166657.304210; Fri, 13 Aug 2021 07:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mERb9-0001wP-W3; Fri, 13 Aug 2021 07:27:23 +0000
Received: by outflank-mailman (input) for mailman id 166657;
 Fri, 13 Aug 2021 07:27:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9ox=NE=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mERb8-0001vz-Qv
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 07:27:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5824f84-fc07-11eb-a260-12813bfff9fa;
 Fri, 13 Aug 2021 07:27:21 +0000 (UTC)
Received: from AM6P193CA0113.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::18)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 07:27:18 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::73) by AM6P193CA0113.outlook.office365.com
 (2603:10a6:209:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Fri, 13 Aug 2021 07:27:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 07:27:18 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Fri, 13 Aug 2021 07:27:18 +0000
Received: from 3e75efe2cdfa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDD021DD-1193-4EAD-B16E-31F1BFCDE3C4.1; 
 Fri, 13 Aug 2021 07:27:12 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e75efe2cdfa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Aug 2021 07:27:12 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6092.eurprd08.prod.outlook.com (2603:10a6:10:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 07:27:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 07:27:10 +0000
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
X-Inumbo-ID: e5824f84-fc07-11eb-a260-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cqbnegvR/6xcObDdwBgtdl9A518y7RmQ6eyBVXMuio=;
 b=gtfmwDpZhK0Qj2hvNRHJrXk63H8hPF62sP0wvjc1SSbp+paFTGJdK4KfG8h58ktGuwRDHAaybR9OO2nef+W/ZDoj7Os4R2iCm1mnPBJtCSPAfoGn6+gD7hmPxAdlOojH3xhbFGj+arfEZ8/tmv96YPrIQLV/+DCQysZ1j+dCYAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTqmwmxuqwpnvdQ7VmzHeT/batrebaWAt6zabAcTdcfQO5/as65EQusKtKo7Vw8oiI3yHi52bGjagybNpZ8kgA8xW/4o9YQvYlZKS3zjob8mZWxjUeA6WQDguqLmldYrWtWn6HzmX9dKrWK+g9Y4BqknO0XyJRMc6kT/xM9aOo/3Uz7zuHzE3xc0n7HuFJxTSnW38U2aGMv6IMdIKPhW3fQmVTx2ig7TPQay1aBj3LyPAxHsiOjALk7+K0iDdJc0EDXy9hrlelZvYKPXT7G0tvbIaziNntBJdWL1sIgOlZ8h+NrikVi0XVUQNDeHTsoGe6oPBhhPcvV0CoJxFoM6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cqbnegvR/6xcObDdwBgtdl9A518y7RmQ6eyBVXMuio=;
 b=F4ATw9aVe/FZfAN8zDY0Npp8zCuOwsYMu+GWnTOk8DZe4Y404y1wwrBoBNSj9yP4imn5DSt3fvPZbz8NaXCgp2e/I0KJTzSaRFdrXbT886n9KGdCpgciqhJm60xSUZcjXqmv03ZXKFAqpREi/a8b3BWRuVm+cHhy/s+/Zylcv6yC83S0aCu9FTkYM+ZAEMNP3us1/uj7h4gWHclRzAXvcubKoUe1fjLV9ScV4yEkEJXKIPDx0iXCBRAXWFs2mxtoCptWO9AeE5NVy8SBd8rkhUh+eWwid3QtXOaaaRfeBYes+z2Ra+8CcMCbaXrWyeokk0naLBX3UnlTG2ctgMsP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cqbnegvR/6xcObDdwBgtdl9A518y7RmQ6eyBVXMuio=;
 b=gtfmwDpZhK0Qj2hvNRHJrXk63H8hPF62sP0wvjc1SSbp+paFTGJdK4KfG8h58ktGuwRDHAaybR9OO2nef+W/ZDoj7Os4R2iCm1mnPBJtCSPAfoGn6+gD7hmPxAdlOojH3xhbFGj+arfEZ8/tmv96YPrIQLV/+DCQysZ1j+dCYAA=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
Thread-Topic: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
Thread-Index: AQHXjpsj2PxHFai2b0GMDOvdzCQyuqtwAoUAgAEJbcA=
Date: Fri, 13 Aug 2021 07:27:10 +0000
Message-ID:
 <DB9PR08MB6857006E5EC6F5D0B0ED9EA39EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-7-wei.chen@arm.com>
 <d7d52c5e-6c55-4491-3794-681b0e8df9ab@suse.com>
In-Reply-To: <d7d52c5e-6c55-4491-3794-681b0e8df9ab@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6C27AE4672ECDC4FAA9333F11AA97773.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 28c3852d-9e4f-4bfb-5f4e-08d95e2bc841
x-ms-traffictypediagnostic: DBBPR08MB6092:|AM6PR08MB4471:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4471B438675104DC3E3A18689EFA9@AM6PR08MB4471.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lbthCzgPOI1nkHM3l4Pqy5t7i9smftPF/wPdfvcb9ZoOyCx6bSZwmWRkjR8G0EW8kFT2ZNKygs8ZAnSRDOJjVyFZuRyigo0OFv/sHPOSNA9Li+xaxP8BrLjhzzkZox5pkWmfp85P61AfwNzb0v/e36A3VBgz5LaG7cGN7KHnKuBbZrUClg7XMez3xUyZCZMHw6py9ji6qe9pnKW1ICxFyoetED53HWXB7yMYP2CrPGia8d4zh10Cf6uN7cNdpObiuaeSvZBn1J2P8JWSo2AeWCxC/IMemOuZF2rtAalwaO3fpC0E7NaECF101qihw1sGOSC2B3vrqS7bDy1B4IV7IiQlc5T3xipelxe681CQL4aKJx5i+6uL/0TsWCMIR2YoRALSU/mi+BMk50zNXwwLwrm4oqWU+aMbifFB6LDSK0mBbwONYDTR26A8vOoow2lHOA7jfGVaSHbT8Zq2CfEp/fnEYCIIXWuiA+A5LMQOzxyIJ/BpsRWJ5X6aCh8o3M40rXBRwJSBnuReQId1cuYrga7e7Rlv3dDOS9Uz1+LDYQpxw/KjuoEHu9oyq6ZQeDgyFHU6/Gzj3FopZwFegnXY1XDnk4KVXu6+2JiuUr9EWUqsZi803nyrcxdL/qj53qdhLYy3aunhHtm5wz663vYevX7Gjr+e4ycPuJ9ihwcjBv2BVNpERYUmU4EnrS9luB00FiJBWXoWIqUDHNETRMxrFQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(4744005)(26005)(7696005)(38100700002)(5660300002)(122000001)(55016002)(33656002)(86362001)(4326008)(9686003)(38070700005)(186003)(2906002)(8676002)(6506007)(8936002)(53546011)(478600001)(52536014)(71200400001)(76116006)(54906003)(66476007)(66556008)(64756008)(66446008)(66946007)(6916009)(316002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmRaMGgyM0ZTLzZya0ZEQm5lRStnNGkrVVpwcHhITm1RZWVxZEdhUVJjRWVq?=
 =?utf-8?B?UXE0eU9qU1dkSm8rV0NYazBCSjY2Y0tReDNzWnlVenVMYllSMHg1cE1GcXRV?=
 =?utf-8?B?MStpSEhTaXg3emltb1N0VVpNRVRjSWRnOE5kWXVrMUlTanY5YU02RjZsWHAz?=
 =?utf-8?B?RFlmNXFsVnNiNE5jbklTYTc1NGN6UFVqN3pyN1BieWFGbXpPZytMMS80R2I4?=
 =?utf-8?B?dHAyUjM4YXJ0bk0xd2hFeU5uU0IyS2p5Y2xlQVNiTmc0U0RnelZxOTBNeThx?=
 =?utf-8?B?ejhrUDIrUWE4NHdFU1BvZDVCcjZPdlpBMWJvU0NXZFhlVVNqWnlON1hYblZR?=
 =?utf-8?B?TkVhSkdQMmZ4Q3lhb28weGtqanlsblNwdmZaM3UrY1I2cTg0Rk9aOGwyeEZ0?=
 =?utf-8?B?RGxUWURZSUFXZnQ1OTBObFJSU1Vob3J0WkFzM1BrU2JkWlg3dDM3L3Q2cW5G?=
 =?utf-8?B?ck5ta3NDc3BhbnhRbXV5V3dVb0gvL3psViszbWJLWnVhbXdzN3N5VFJDVTZr?=
 =?utf-8?B?MkR4WTZFd05hL29lVUorU2I5QlpISHgvOUo1aXVMaHVuRFhsam1tZll2OFJz?=
 =?utf-8?B?VENiMDE3eWwyTittb09NNS9LSG1nOEtJU1MxbGJMQjFuZFEwOHlsVmNPTEV6?=
 =?utf-8?B?SW5QcmJxbVBac3VobFlMSGliMmNwR2NicFZsQUpFbW9LcGxVQlh3Mytoalhj?=
 =?utf-8?B?Wi8rZ2tVWVlCS2FRV1hEaXE2dzg3T0JPV1J5S21reFN2N2ZtOS9UeVVEc1dR?=
 =?utf-8?B?eHc5ek9UcGtSOTl4VHdtWW1ZbS94bmZzVlZUVzZ6d0hmMlpGV3Vvank0QWMz?=
 =?utf-8?B?UHhyOEZBTTVGSGVJZXV3cE5KeGw0M0RWck05S1B5OTgyT3BpSTloMGFZRnFY?=
 =?utf-8?B?U2ZVTGtnZTNLQjRUUTk4NTZ1NVhLNHcxREt4RU80UFBoejZYS1BvUVRPY2d0?=
 =?utf-8?B?TFFuN2xsUTdvODFsbFZNNVJwTUdkTnhIdGp4WTJCdkZ6aWl6ZVZhcU5vV0xW?=
 =?utf-8?B?Smp3OFNGSVNLSllacTdMQVZXeG9kM1UrT1pMK1VrVWhEZTduRXM5cjA3Tnln?=
 =?utf-8?B?VHYyMXJvOUkwcURKZno2U1JqbnRIb20vZWxiK0s3YWdVZEtVQmpWVGpiLzM1?=
 =?utf-8?B?Q2srTjBKN093MVNqT0xWT0RHMWsyUzdqT2JnNVRIVmVyazhiSU9sTHZwUmow?=
 =?utf-8?B?SFhpdUx6MzBEeUt6a0graS9nNkU5Z05rNUZQMWFoT29RWkQ0VDcyM1h3NXk2?=
 =?utf-8?B?TzVuMnk3ODEwZTVUVmpGMlF0T0xFdHB4MU5ISVlUREhOR0tRWHphT3JOVlpQ?=
 =?utf-8?B?TUhYZWpCNEl0SFUwZ21nb3VSdFl0WlRJeXFSZGo5emNJR29sbWg2MmNFM3dZ?=
 =?utf-8?B?SGYxRXRKWWl2T1dIRmtwQkxneXdEalc0N01scEtZalJkcHFnb003cFNLeFBP?=
 =?utf-8?B?bzVvNzNaaDdGVUxrZm10Qm9pa3A3Q2QxSzlMQXNodFd3SlZHbkVuZFNKU2xW?=
 =?utf-8?B?cGkzN2Y5c3VIbDF5NU9aMXd5cXdMZ3BiU1BrcXlXSlRwaFRNdFlqN0JidlFS?=
 =?utf-8?B?U2daU25XTE9OcVhoNFZwWVJDdFZCQXZwZktJWFJBWTA1YTVNd1JZd2UyWjI2?=
 =?utf-8?B?RVZvbGZmL0RTc2tBcTZKR3BqUUtEQ3Z0TWxuRVk2cFVvQTBpczdVMk9HVG9Q?=
 =?utf-8?B?V1pkS2lQOURQdWd6UlVLZXY0ZkFXRGh2RjZ0ckJTbDYyczA2YnhaNk5rMDRa?=
 =?utf-8?Q?/uJ/wqaBkYC7U/kuziyCT500cnAkzn+Eooj8wpq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6092
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fe9df52-0c02-4c66-345a-08d95e2bc398
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NM5Oq5i7/Y4/ZNT6LCqZhHel2ye/M27NkJNS+3uquXw0eDwIhLwgzMjp6qVC++dHeYR1ti/zgj4tCBFyF/wrB6DvEB3snbJHXpbUD4c+/nlLGvackNFvejXEy1y43uDc9n6VpxRS/s+/NRn1WkTgSr0OLtcUTddWVW5pmxwo85dHxgFfJlmXfUHjbYfPGKHKgaQ8y/MVdcJitM1G2BX/aiBMv1tRIWF0HFVfTC2tUYhBo2WDysWplthVLwVRHs+Kg2spmi4KYCcbWN/03Jd6yJCikvEqQfDBgxZYmcP1He71jtyEjlvINFpeRfLyBR3JgdmquDpNurOQImg9ArzGBgozmemlDVp+BVWxQFaGjvtZpRfiCm7X4Rkgf4Nn2ndLKED7jhBin1pIwauXezRIcp7J17M6G4ZTyNmD9bJC00rZ7nKswULWsj3CkmmuT29mDlkkW0SnlAjBIzGQvG6E6joHqypetAPQdGBI+lYVxc6dv7q41dg0EJYczKi+W49lro0RefQC97xdsPcY2TRYUCLywm+UvT5ufJi4r25e47m9wtO4KsVCp3rJSqwJWgAvO+Y6xs0RyE00z2RFt3CD4RMTYtonXkWWYM9knY3IzzdqwVhG5hvvILT0I18dE2e5Ks6aiJXW/cUERwa9nVcNYNCfeU9X+C17rCYWcDV+Spo+O/HWwGedHq6Pa3A8Ohqrj9fJ3Js6/l0s25xx4GQEfw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(46966006)(36840700001)(356005)(8936002)(82310400003)(52536014)(4326008)(70206006)(33656002)(70586007)(478600001)(8676002)(9686003)(6862004)(81166007)(54906003)(53546011)(6506007)(316002)(55016002)(26005)(86362001)(83380400001)(186003)(4744005)(36860700001)(47076005)(336012)(7696005)(5660300002)(2906002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 07:27:18.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c3852d-9e4f-4bfb-5f4e-08d95e2bc841
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgxMuaXpSAyMzozNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDYvNDBdIHhlbjogZGVjb3VwbGUgTlVNQSBmcm9tIEFDUEkg
aW4gS2NvbmZpZw0KPiANCj4gT24gMTEuMDguMjAyMSAxMjoyMywgV2VpIENoZW4gd3JvdGU6DQo+
ID4gLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvS2Nv
bmZpZw0KPiA+IEBAIC0yNCw3ICsyNCw3IEBAIGNvbmZpZyBYODYNCj4gPiAgCXNlbGVjdCBIQVNf
VUJTQU4NCj4gPiAgCXNlbGVjdCBIQVNfVlBDSSBpZiBIVk0NCj4gPiAgCXNlbGVjdCBORUVEU19M
SUJFTEYNCj4gPiAtCXNlbGVjdCBOVU1BDQo+ID4gKwlzZWxlY3QgQUNQSV9OVU1BDQo+IA0KPiBX
ZSB0cnkgdG8ga2VlcCB0aGlzIGFscGhhYmV0aWNhbGx5IHNvcnRlZCwgc28gcGxlYXNlIG1vdmUg
dXAgdGhlDQo+IHJlcGxhY2VtZW50IGxpbmUuIFRoZW4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQoNClRoYW5rcywgSSB3aWxsIGRvIGl0IGluIG5l
eHQgdmVyc2lvbi4NCg0KPiBKYW4NCg0K

