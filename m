Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46B58A47A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 03:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380770.615140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJmD9-0000Z7-Vr; Fri, 05 Aug 2022 01:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380770.615140; Fri, 05 Aug 2022 01:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJmD9-0000X8-Pz; Fri, 05 Aug 2022 01:33:11 +0000
Received: by outflank-mailman (input) for mailman id 380770;
 Fri, 05 Aug 2022 01:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gnX=YJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oJmD9-0000Ww-5Y
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 01:33:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f309f25-145e-11ed-bd2d-47488cf2e6aa;
 Fri, 05 Aug 2022 03:33:08 +0200 (CEST)
Received: from AM6PR0502CA0071.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::48) by AM6PR08MB3493.eurprd08.prod.outlook.com
 (2603:10a6:20b:4a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Fri, 5 Aug
 2022 01:33:06 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::c8) by AM6PR0502CA0071.outlook.office365.com
 (2603:10a6:20b:56::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Fri, 5 Aug 2022 01:33:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Fri, 5 Aug 2022 01:33:05 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 05 Aug 2022 01:33:05 +0000
Received: from f8c1308e3b1e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A33EF3E3-C16E-478D-9717-FB093285186C.1; 
 Fri, 05 Aug 2022 01:32:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8c1308e3b1e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 01:32:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB5996.eurprd08.prod.outlook.com (2603:10a6:10:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 5 Aug
 2022 01:32:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5482.016; Fri, 5 Aug 2022
 01:32:51 +0000
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
X-Inumbo-ID: 8f309f25-145e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WMxFI2C5j445AvanYL7hDbIfMWLTePEiTqU8KCr315yYpTqo71htspOZQJfJAZguG8bk5Lw3zKSKgeFvJ8n4eKJKcn9LFOGmj9D2Rtt5QYpf1VQhqMwvIhR3pQXpfuCCanMwv7U0NiQ88vuKJrGSckDfuDfDSQIPI1uKD/LOsO3VERbiWocl6LJ7nY5Ak7ptYjWEhmQpixOJTFGQOHFedmWVhdAqWBxRQVVX8B6bYEdE5XKCweXsYFtrSeJrMmxSQTzgboW6DLq5G+phCelMijrK8+kJdrus7GnWIuiDp5NG9Y87QX7M14qJTzccbIkbTIsOwA+cBaEX86FdGIsd7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+n0mnQXgMXkdJeCu2MrGCabPZBW3bi2vdRX8mOZcUI=;
 b=UTZmAzMMRuWXPTlo5khG5AHfF38KJ9jXLrxUKCcRvC6+8DS1dCwI3EUeC4MnRYOm0E1g6W+pR+TY4ucarMIl1dhuqYCjZglqqL4KZPGH0n1MN/2b4tdenR4U0kZbY/fO/1zBQ+PM4azanKwCrzWI/48iXi8uyK8Ll1PAnkJRNS8VY1rMJYbE5sulAobsyWt23UQIUO4Ukav7bzuskeB1rwJNplxBCbffk1Mn+2fZDhPh40H/AORcrmJAcWZu297GHni2PQBDPxv9f7T4mdXvcRNaz3p0TLFajtsdKJGKzElovSCrwOtpDFPiRgi4IAMfRnr+XuuM4zpSoEzxHL9nzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+n0mnQXgMXkdJeCu2MrGCabPZBW3bi2vdRX8mOZcUI=;
 b=Atv8kBR6d/bD69LDcHU9KAtTm/Pg+Wlayz9cJRpqxsQLOdXzj0WiG4Sz+043OOjaRTEylN6mN7A96pWTnrxjCr4a7+7YBVGRR+CFCo573jrV2ja3BVZOm09355LU6tCFcYUgfD7sC/cAhWHIoUJC3fE9mDQU8lRE17y3PJqpuPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDMz8EgFOZsqFWpd3xQzRvvMijyT35do1FmVfWPXCM4B/0Ohiato0ntGDIaHWlRZkGsg50UxMzUybrXcesbEgNf7sNpaxVNzkppRdOd85xsC6R4UJlZet1UVt6GSYwO7LxpYjBkdWYlR6WXKjvvFMXWwlsghKzOKJdLeez8sWnuQvQZs0KpuowGDfTsHVEaY/9m0tI2Iqu/qdKAzJeckBuptEUSlWSbfwblhY7fXEHbCs5JTJo9//Zp8P90aW5GPzlr60uC6Uy4cp3auGHU88xNRJcCnEBd15+KCfGPEM/lqywqEgtgkT5VNCBlrQuPC8VJg9u/VWhJ7X6WoD/Wmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+n0mnQXgMXkdJeCu2MrGCabPZBW3bi2vdRX8mOZcUI=;
 b=oNS5w8omEQzT1UtaJukirHBgFJg9CJNgehBVr3R5jUi0A2/0OJztrBalVftBQ1tm+wOpDgGuFd5OzL5ZWhPY7HzC9hQBkmVtVRG9u0OrI71KZMdT0YqhnutGgBQ0mqEFCLJzWyrW+GQYnd2LSba1s5FqAy8GjfOF0MSmGlICdXXDHtyF0NY/NkVia3HuWwwjqOqaOKZrEwokPANOo5XfKmEZONzZeC0vRjnm8dNbPhMlIO1b6P3WLn6f0UDsYkepxFzR9PJbTUWQARhx3079oRbuYn/8ogp2ftShbxTT0M5Nx9/JHlYeHomCmIPAbb0gSPHKcJoEC9WTKLiBfvz/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+n0mnQXgMXkdJeCu2MrGCabPZBW3bi2vdRX8mOZcUI=;
 b=Atv8kBR6d/bD69LDcHU9KAtTm/Pg+Wlayz9cJRpqxsQLOdXzj0WiG4Sz+043OOjaRTEylN6mN7A96pWTnrxjCr4a7+7YBVGRR+CFCo573jrV2ja3BVZOm09355LU6tCFcYUgfD7sC/cAhWHIoUJC3fE9mDQU8lRE17y3PJqpuPE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "community.manager@xenproject.org" <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] ChangeLog: mention IOMMU superpage support
Thread-Topic: [PATCH] ChangeLog: mention IOMMU superpage support
Thread-Index: AQHYqBZ6+GfIBQbXT0yruY52m6X4cK2fhh6Q
Date: Fri, 5 Aug 2022 01:32:51 +0000
Message-ID:
 <AS8PR08MB7991C6716925E518A4029761929E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <961b9bed-29a0-30ae-09a2-001698453be4@suse.com>
In-Reply-To: <961b9bed-29a0-30ae-09a2-001698453be4@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7F41F57D801B784DB306DD1B1AB773E2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fd4cea3c-a88e-4fc5-aa33-08da768271f7
x-ms-traffictypediagnostic:
	DBBPR08MB5996:EE_|VE1EUR03FT016:EE_|AM6PR08MB3493:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pOL1VGJgXIjUexVobdd4tCQ+Zp7N2PdpYdIvjW+CyHkuAcbScIUQ9dpB4NUo2u2n2lMacx9944ae94mY7kvLjJao1G/Um8tmskFirUeEce+JZ3XwgnSUc7Lin/htgM9zfbdEVU55ggi4Z2qlzKgfdJOFq/sL5NvhKSbsIRlfBHc4xbwokL5CHOcqtgxubdE3UQ6Td9X98drjOC7tDvY4hL74zoz+YWfh634TUb7x68lrA/NymsKaYCIVbqbg2PS/IICn8HAn7RGwzKkOU8pQ0O2Dx0ssMeFuUTDjOQgLiR/xw0GSD3vP++iD2PJta8VL7GV180tzCOfgFnN1xt4BQTqDMHqwf+UUJTUZtZQJHGHdnYaLCwf/cGr9JoV5XJJ6At1PV9FI6cHLKjsNxOI4d1ZABvauPxtB7ZFVdofbT5hjW5erQcGY7uDmAZz4FbYk0DsxmtZDCG5R+Xl7XfJ+4Ium6XsypiYOXeIxmqYXNW31n4k25MqEg7GOHuxFpLp/8j9hoRMrp34JLYmfAiyPUikvbbuVFF47LanhVb5FHeHk7LMJtz8Efm9zuT4ndcE8HSs60X0lh+tBWMPsIdA78QSqB+q6GC2+fh52n9UX1gXTZWgW/W5at+OOqbjQIW+HTublBMZ8dDHLPguKsJ/fdPX3CSUtWxbpR8x9JbZA6xbsb0jNWme5Rh99eKMugFBOmTwez0E5Jl6Xww5bcZh9MrCvfxOwYK1HMCrob2pY0KG93Y0WR4QpShOD0zz1aE2OAW9jMM/REtn7pkK56AWnsd0fifNt+jw4SrtNAngzA7stPuodOHb9KF1VjqF5nxkLoyXxDdliGrRlzLYUu3f2rAaVT0GB4eN3gKBddZOoQJLmgQrFFlSu1d/pZL8PdPDL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(558084003)(71200400001)(41300700001)(9686003)(38100700002)(478600001)(38070700005)(26005)(6506007)(186003)(7696005)(33656002)(83380400001)(54906003)(4326008)(76116006)(66946007)(64756008)(55016003)(316002)(66446008)(5660300002)(66556008)(8676002)(66476007)(52536014)(6916009)(86362001)(2906002)(8936002)(122000001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5996
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7e664bf-a121-42de-b686-08da76826973
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J8UbjyaYv91cgnDhBm9MX1KdH3FzYv8RG62lht3EE7mG+rjlVHu4GFC2PMpDCa4WUigh3ZcwHTjsVQEfNPcX+nGsIGrd7D+m7s39DdvC3B76DBQwPz5M6kOofk8dqA0l7k1X8Av2Q5a4lLiD9asF1GPm++sQZ89DXPeNm4xAL3pqzyqO8fJdCy/nOHIl7QvpSFdmo9yVRJLuwJJG+m9Sf4UH4kGv2JlcY4kfCVpO16JT7gY+zuvX4GfFWwlj8ECJS4mwSXPk1fNAwWWSMiKP4GENSdx/5/+yWB7uSRHOeRzqYPJtxMaW/em+P3zUa/ky8dX5d+3wZNB1BqpuDsf2QBseAvFfawSmxshQ/NMEDV3CU4Dfw5oFx1SSpvK0an8BWvYzNrvsH66eNSUFkU5A4K7aK+YHR2RzrtsKYRXLjWfTCG2Ql9Pb+oavrVXiwPU7e6TK1OAB9+8n9krOrG5JrxRs0nI2AiffeyBZIbhUSuhFqS/ESmoy+lw26pIVqH89d+RuGlnksJdOdbl4M0S9fEKJVzIYugQmUtM4hJxZCxdz3WTj8MmlJ/r6j3Hz18iiYMv/WnHvIOIN6VimdTc3NlRwUccXzU5tpt3LE+oiNjjT+jmE3stYGFV5gVsiJT4oABTiB0GHVfM8vG4qWlBUxAiBbh6HSi7orKqCUVjm9w/yTY81kaYlivNipoMCy9g7QFWs3OCllR3j/RsrU7RyzkWtnyhADz78Awgb0mDFSrlUmw5po/oAiT4rvRNZDrDPmTU6UYhyr3BIr7nwJ4onlwxl2VHWPCkvgrdhTQ/wRpBrA72GrGzLcGx3exrafWLhzyIx9J2IKwX22M4X7BHPVS5/TOhNfH22jyfYBUlQBHRmULO9ENsGH4zXU6OLbz+I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(40470700004)(46966006)(40460700003)(356005)(55016003)(41300700001)(36860700001)(82740400003)(2906002)(316002)(70206006)(83380400001)(40480700001)(186003)(336012)(70586007)(8676002)(47076005)(81166007)(4326008)(478600001)(5660300002)(86362001)(9686003)(7696005)(82310400005)(8936002)(52536014)(6506007)(6862004)(54906003)(26005)(558084003)(33656002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 01:33:05.4978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4cea3c-a88e-4fc5-aa33-08da768271f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3493

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBDaGFuZ2VMb2c6IG1l
bnRpb24gSU9NTVUgc3VwZXJwYWdlIHN1cHBvcnQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2gsDQoNCkFj
a2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywN
CkhlbnJ5DQogDQo=

