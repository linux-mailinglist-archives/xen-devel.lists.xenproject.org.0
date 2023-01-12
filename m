Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE85666B38
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 07:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475839.737696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFr8A-0000eV-TW; Thu, 12 Jan 2023 06:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475839.737696; Thu, 12 Jan 2023 06:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFr8A-0000ch-Pq; Thu, 12 Jan 2023 06:32:06 +0000
Received: by outflank-mailman (input) for mailman id 475839;
 Thu, 12 Jan 2023 06:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=41ci=5J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFr89-0000cb-84
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 06:32:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2073.outbound.protection.outlook.com [40.107.105.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1d0274c-9242-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 07:32:00 +0100 (CET)
Received: from FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a5::7) by
 AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Thu, 12 Jan
 2023 06:31:59 +0000
Received: from VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a5:cafe::ae) by FR3P281CA0197.outlook.office365.com
 (2603:10a6:d10:a5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Thu, 12 Jan 2023 06:31:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT007.mail.protection.outlook.com (100.127.144.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 06:31:58 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Thu, 12 Jan 2023 06:31:57 +0000
Received: from c44bca52d657.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52929A84-EA63-4D54-8244-C6087760E8A6.1; 
 Thu, 12 Jan 2023 06:31:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c44bca52d657.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Jan 2023 06:31:46 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB3PR08MB9036.eurprd08.prod.outlook.com (2603:10a6:10:430::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 06:31:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 06:31:43 +0000
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
X-Inumbo-ID: d1d0274c-9242-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5MJBmVnVO9Knbigf1UQ+k5MGPHNfykIyXH4ko+N7FY=;
 b=32GgXTe+Q7qy3dr1+nATE7sL+6hsLtI90xcWXKKC1V27j7qDqKDC1amEbec76Xt9CPVb+sqHaxLvzhe2UkT2W+kjp/am7UGWxr9WQm/7ta/GFmXxZphy0bAhgHUQ0TAioLFb7Ec6ye4yivv/jxns6YuY+Gag/qQjOhQxPcjge+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSjZ+2Gsl7jLzWty6iNRC6V5l51MHA50gdDs2QGH4HAvHe8CN/3diACot7xNLE9b3cmE6aKS8ufyIs/xLW46LaHsqRrquh9bRN7euiYNtRXWY1z4ugke6H/86x/EDBsnLh2l5nytUIiOvgAq6k51Dbjl+wvBVSx4SxlKuR4Dn9sm5RFWom6XB14gote+GSUgP0yHE30wzcOT34o7SOucFOR8gxeDaUrxy9BPGxNWpIOwJG7kXUw5/IrXrJDOyh2SCbgAiGBNtU8XTjHtd3y397m+7sg3m3etZJ+XXQX3Sqj7IVmAFjAa7UNK/mC48vYLvAcN+fl6EdXuX8Nr7Bry4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5MJBmVnVO9Knbigf1UQ+k5MGPHNfykIyXH4ko+N7FY=;
 b=agIBrEMm3g5Gyq/nB92jqxg2BBwMXx4kj/dY/w38oxpxIZq4SrHNTw9E1ZGC5lmXEx9cKwKH7aFrPl6ZpH2kexKNUcQYB3vJI/1a9H5IprFfTPbkeZKr1X2Ie4PFj8hR4lNnIYlMOK+Gto5Cup3S5fmBJS8jThz3UJZd42ZCH5WcMknDYpR5KOoOQw/sX5K8zUv8yNqxwYytNdbIiQ4GMPqtFh1Z7QCsWy68TCx3m8FXBXODn+LXLQMhPTvv4UHJFhna0UUtGfky0BKkm+YPEgyRNcVz9Ej0/SKnStPq0uESgJJYw6EKmrlraleoA7pbJe65b4ibPKDLlgguYJyJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5MJBmVnVO9Knbigf1UQ+k5MGPHNfykIyXH4ko+N7FY=;
 b=32GgXTe+Q7qy3dr1+nATE7sL+6hsLtI90xcWXKKC1V27j7qDqKDC1amEbec76Xt9CPVb+sqHaxLvzhe2UkT2W+kjp/am7UGWxr9WQm/7ta/GFmXxZphy0bAhgHUQ0TAioLFb7Ec6ye4yivv/jxns6YuY+Gag/qQjOhQxPcjge+w=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v2 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index: AQHZJNEfrPi0xon1hUWBAoFjpzsCdK6X3MQAgAJ3JNA=
Date: Thu, 12 Jan 2023 06:31:43 +0000
Message-ID:
 <PAXPR08MB7420A4E3DA252F9F37450EDA9EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-4-wei.chen@arm.com>
 <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
In-Reply-To: <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 67DA167C1D11F84C80FB928E26319960.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DB3PR08MB9036:EE_|VI1EUR03FT007:EE_|AM7PR08MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 8699eb11-5d92-4dce-24bc-08daf466b4d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SaV3/Zx6UyY1ayleyg+Lj3YAthMzlvsv7crxDTJs+HkVZ8eGpvt3+rksuI8G89hVan8tMoUetguUR0qPveh7pKR8/KqoowdpSjTajwk5KzviKKqu9Gx9VvK2yB/cRFGdH5JP/yD/kdXmVoBekhzgF2MR3mnxwhBWHRdm3gKDKWyQKtXRLh2cNi+ynncWngHkjW5MYen4bXJwFp5zF3JcdvCL+Kzj3soIEfA0iocxE5aQWiA4uDHF2VHNQ6y/hIxOh31cxdnsnH2M0kePqDaH0qZJuSjKZCtplhR9p6tHjx54gjWXp/fb5heKiyLKK67syDWcnBjh+yjLn+6wH/kZX23LMS1tpaxS4eVSIUM68GbllZhFitpRAe7AFAH2wlhOIxY4ihxGvhnJobaqMyUZZIPE4YPZKA1qFY/yfJJGkOmmg7PJtoHL47Z+9ZjiVh6JPL60okN2+cr4TKHQ36HvFyzRfzyH8ItTUHiCS3pfLt1gC/1rc5zBs5a+ySx/P2w9FwTa8zqUw4UvXoUJqmBPo63LPa10kblW/wwpq16rsxgs9ihigydg6GH+CWvjyNn2GsGsAB9bMvtRrXKSd8rvIUokch85xlyO49n4S+ngvDLvGtxfu9/Vm9LKYZJapWAidwUtS/+BB/W959a84vTKz0YUvDxOorfRxzEcZLdbSMue3Z0VKaM5WyrP+T7JmlDBm81yF6iG7fAikjaiMYDVr9AalvHOS1RvLYbm8Y5QZcM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(2906002)(9686003)(5660300002)(38100700002)(8936002)(33656002)(66556008)(66446008)(64756008)(4326008)(8676002)(41300700001)(76116006)(66946007)(83380400001)(66476007)(52536014)(55016003)(316002)(86362001)(6916009)(71200400001)(186003)(7696005)(122000001)(26005)(54906003)(6506007)(38070700005)(53546011)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9036
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f52fbe73-671b-44d3-72c9-08daf466abe6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	llFdW67WBQNIY/bMXjhHtf+A39xsijzTaYemvmFOLEPq/itJkUKWpbaaf43PiBZy1tAbiUKZj0TtRGqh2QF+ciZuOzPX2dT3RY/Gs8y6dVdr0z5zN3IiBQsnEX0Z6E3sn0lEGAn8YeO5ezw6hQcIiEvqLpOKIMtDpit0Av5dDR2G5sCcVjIs+XZOwnbB6SQbisxv+Y43pPUSzgIp7l+KGjdVnePePoI0dVBVuOjG3aFSyb04ktgVFXXDQxmqmDSLoKhXSSaiwCuYht/2g1W9psbooJOE6AxPtFSz/1lrBx3dztbAlgfbZkPUQ2IB0ZMc569Inc7iyP0mOuEuOpOxLBgsfPFqEd6boMHM02GLXSC9hL4Ml2fOn7YPkQwNo7XjMGcsF8NrYwVXNF6DyOfv5E5DcikFrXHtpFnTuE+pn368oRREj8hO42YFo0OEYXu9H3g7jUcA/9WVfXHS1+xsZ5lqjixJExt+T9UxUROX9js0T5dNfhnVUcTIQN934Ecdm+kzmp6OsFmpKADqkn1n0WzRtalALhhFT/gOiQMEVJA6kBjMNPbluVxOwwaanyLunYvrfHn4cQaJYBW/GVOJX2TV9MOwTgcAxkC1IV7tG4ISV3p2fVtZWOdcIKi2ZS5ZcA5JIGJmN/uQmFR6lteoE/Z4y10XJMUCLOjK9Ye0NYZuvPKby+vnrt3nfGGpvND6RU0ns8HZ/u+H7ceiq2pvU4vN+q1Vbc3HCsxnLkaESkE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(336012)(82740400003)(7696005)(52536014)(86362001)(356005)(33656002)(316002)(40460700003)(9686003)(53546011)(6506007)(186003)(26005)(4326008)(8676002)(54906003)(81166007)(70206006)(70586007)(478600001)(41300700001)(40480700001)(36860700001)(55016003)(5660300002)(47076005)(6862004)(8936002)(2906002)(82310400005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 06:31:58.2714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8699eb11-5d92-4dce-24bc-08daf466b4d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyM+W5tDHmnIgxMeaXpSAwOjQ3DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuDQo+IEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3Jn
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDMvMTddIHhl
bi9hcm06IGltcGxlbWVudCBub2RlIGRpc3RhbmNlIGhlbHBlcnMgZm9yDQo+IEFybQ0KPiANCj4g
T24gMTAuMDEuMjAyMyAwOTo0OSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL251bWEuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9udW1hLmgNCj4gPiBAQCAtMjgsNiArMjgsMjAgQEAgZW51bSBkdF9udW1hX3N0YXR1cyB7DQo+
ID4gICAgICBEVF9OVU1BX09GRiwNCj4gPiAgfTsNCj4gPg0KPiA+ICsvKg0KPiA+ICsgKiBJbiBB
Q1BJIHNwZWMsIDAtOSBhcmUgdGhlIHJlc2VydmVkIHZhbHVlcyBmb3Igbm9kZSBkaXN0YW5jZSwN
Cj4gPiArICogMTAgaW5kaWNhdGVzIGxvY2FsIG5vZGUgZGlzdGFuY2UsIDIwIGluZGljYXRlcyBy
ZW1vdGUgbm9kZQ0KPiA+ICsgKiBkaXN0YW5jZS4gU2V0IG5vZGUgZGlzdGFuY2UgbWFwIGluIGRl
dmljZSB0cmVlIHdpbGwgZm9sbG93DQo+ID4gKyAqIHRoZSBBQ1BJJ3MgZGVmaW5pdGlvbi4NCj4g
PiArICovDQo+ID4gKyNkZWZpbmUgTlVNQV9ESVNUQU5DRV9VREZfTUlOICAgMA0KPiA+ICsjZGVm
aW5lIE5VTUFfRElTVEFOQ0VfVURGX01BWCAgIDkNCj4gPiArI2RlZmluZSBOVU1BX0xPQ0FMX0RJ
U1RBTkNFICAgICAxMA0KPiA+ICsjZGVmaW5lIE5VTUFfUkVNT1RFX0RJU1RBTkNFICAgIDIwDQo+
IA0KPiBJbiB0aGUgYWJzZW5jZSBvZiBhIGNhbGxlciBvZiBudW1hX3NldF9kaXN0YW5jZSgpIGl0
IGlzIGVudGlyZWx5IHVuY2xlYXINCj4gd2hldGhlciB0aGlzIHR5aW5nIHRvIEFDUEkgdXNlZCB2
YWx1ZXMgaXMgYWN0dWFsbHkgYXBwcm9wcmlhdGUuDQo+IA0KDQpGcm9tIEtlcm5lbCdzIE5VTUEg
ZGV2aWNlIHRyZWUgYmluZGluZywgaXQgc2VlbXMgRFQgTlVNQSBhcmUgcmV1c2luZw0KQUNQSSB1
c2VkIHZhbHVlcyBmb3IgZGlzdGFuY2VzIFsxXS4NCg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9u
dW1hLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gQEAgLTIsNyArMiw3IEBA
DQo+ID4gIC8qDQo+ID4gICAqIEFybSBBcmNoaXRlY3R1cmUgc3VwcG9ydCBsYXllciBmb3IgTlVN
QS4NCj4gPiAgICoNCj4gPiAtICogQ29weXJpZ2h0IChDKSAyMDIxIEFybSBMdGQNCj4gPiArICog
Q29weXJpZ2h0IChDKSAyMDIyIEFybSBMdGQNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMg
c2Vuc2UgdG8gY2hhbmdlIHN1Y2ggYWZ0ZXIgdGhlIGZhY3QuIEFuZCBjZXJ0YWlubHkNCj4gbm90
IGluIGFuIHVucmVsYXRlZCBwYXRjaC4NCj4gDQoNCkkgd2lsbCByZXRvcmUgaXQsIGFuZCBhZGQg
YSBTUERYIGhlYWRlci4NCg0KPiA+IEBAIC0yMiw2ICsyMiwxMSBAQA0KPiA+DQo+ID4gIHN0YXRp
YyBlbnVtIGR0X251bWFfc3RhdHVzIF9fcmVhZF9tb3N0bHkgZGV2aWNlX3RyZWVfbnVtYTsNCj4g
Pg0KPiA+ICtzdGF0aWMgdW5zaWduZWQgY2hhciBfX3JlYWRfbW9zdGx5DQo+ID4gK25vZGVfZGlz
dGFuY2VfbWFwW01BWF9OVU1OT0RFU11bTUFYX05VTU5PREVTXSA9IHsNCj4gPiArICAgIHsgMCB9
DQo+ID4gK307DQo+IA0KPiBfX3JvX2FmdGVyX2luaXQ/DQo+IA0KDQpZZXMuDQoNCj4gPiBAQCAt
NDIsMyArNDcsNDggQEAgaW50IF9faW5pdCBhcmNoX251bWFfc2V0dXAoY29uc3QgY2hhciAqb3B0
KQ0KPiA+ICB7DQo+ID4gICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgfQ0KPiA+ICsNCj4gPiAr
dm9pZCBfX2luaXQgbnVtYV9zZXRfZGlzdGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9kZWlkX3QgdG8s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBkaXN0YW5j
ZSkNCj4gPiArew0KPiA+ICsgICAgaWYgKCBmcm9tID49IE1BWF9OVU1OT0RFUyB8fCB0byA+PSBN
QVhfTlVNTk9ERVMgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHByaW50ayhLRVJOX1dBUk5J
TkcNCj4gPiArICAgICAgICAgICAgICAgIk5VTUE6IGludmFsaWQgbm9kZXM6IGZyb209JSJQUkl1
OCIgdG89JSJQUkl1OCINCj4gTUFYPSUiUFJJdTgiXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBm
cm9tLCB0bywgTUFYX05VTU5PREVTKTsNCj4gPiArICAgICAgICByZXR1cm47DQo+ID4gKyAgICB9
DQo+ID4gKw0KPiA+ICsgICAgLyogTlVNQSBkZWZpbmVzIDB4ZmYgYXMgYW4gdW5yZWFjaGFibGUg
bm9kZSBhbmQgMC05IGFyZSB1bmRlZmluZWQNCj4gKi8NCj4gPiArICAgIGlmICggZGlzdGFuY2Ug
Pj0gTlVNQV9OT19ESVNUQU5DRSB8fA0KPiA+ICsgICAgICAgIChkaXN0YW5jZSA+PSBOVU1BX0RJ
U1RBTkNFX1VERl9NSU4gJiYNCj4gDQo+IE5pdDogSW5kZW50YXRpb24uDQo+IA0KDQpPay4NCg0K
PiA+ICsgICAgICAgICBkaXN0YW5jZSA8PSBOVU1BX0RJU1RBTkNFX1VERl9NQVgpIHx8DQo+ID4g
KyAgICAgICAgKGZyb20gPT0gdG8gJiYgZGlzdGFuY2UgIT0gTlVNQV9MT0NBTF9ESVNUQU5DRSkg
KQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHByaW50ayhLRVJOX1dBUk5JTkcNCj4gPiArICAg
ICAgICAgICAgICAgIk5VTUE6IGludmFsaWQgZGlzdGFuY2U6IGZyb209JSJQUkl1OCIgdG89JSJQ
Ukl1OCINCj4gZGlzdGFuY2U9JSJQUkl1MzIiXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBmcm9t
LCB0bywgZGlzdGFuY2UpOw0KPiA+ICsgICAgICAgIHJldHVybjsNCj4gPiArICAgIH0NCj4gPiAr
DQo+ID4gKyAgICBub2RlX2Rpc3RhbmNlX21hcFtmcm9tXVt0b10gPSBkaXN0YW5jZTsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArdW5zaWduZWQgY2hhciBfX25vZGVfZGlzdGFuY2Uobm9kZWlkX3QgZnJv
bSwgbm9kZWlkX3QgdG8pDQo+ID4gK3sNCj4gPiArICAgIC8qIFdoZW4gTlVNQSBpcyBvZmYsIGFu
eSBkaXN0YW5jZSB3aWxsIGJlIHRyZWF0ZWQgYXMgcmVtb3RlLiAqLw0KPiA+ICsgICAgaWYgKCBu
dW1hX2Rpc2FibGVkKCkgKQ0KPiA+ICsgICAgICAgIHJldHVybiBOVU1BX1JFTU9URV9ESVNUQU5D
RTsNCj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogQ2hlY2sgd2hldGhlciB0aGUgbm9k
ZXMgYXJlIGluIHRoZSBtYXRyaXggcmFuZ2UuDQo+ID4gKyAgICAgKiBXaGVuIGFueSBub2RlIGlz
IG91dCBvZiByYW5nZSwgZXhjZXB0IGZyb20gYW5kIHRvIG5vZGVzIGFyZSB0aGUNCj4gPiArICAg
ICAqIHNhbWUsIHdlIHRyZWF0IHRoZW0gYXMgdW5yZWFjaGFibGUgKHJldHVybiAweEZGKQ0KPiA+
ICsgICAgICovDQo+ID4gKyAgICBpZiAoIGZyb20gPj0gTUFYX05VTU5PREVTIHx8IHRvID49IE1B
WF9OVU1OT0RFUyApDQo+IA0KPiBJIGd1ZXNzIHVzaW5nIEFSUkFZX1NJWkUoKSBoZXJlIHdvdWxk
IGJlIG1vcmUgZnV0dXJlLXByb29mLg0KPiANCg0KSSB3aWxsIHVzZSBpdCBpbiBuZXh0IHZlcnNp
b24uDQoNClsxXWh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udW1hLnR4dA0KDQpUaGFua3MsDQpXZWkgQ2hlbg0KDQo+IEphbg0K

