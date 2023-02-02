Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDFE68733A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 03:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488494.756594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNOyQ-0002yZ-3p; Thu, 02 Feb 2023 02:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488494.756594; Thu, 02 Feb 2023 02:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNOyP-0002wv-VY; Thu, 02 Feb 2023 02:05:13 +0000
Received: by outflank-mailman (input) for mailman id 488494;
 Thu, 02 Feb 2023 02:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV5M=56=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pNOyO-0002wg-7c
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 02:05:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05hn20305.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::305])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 040448e0-a29e-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 03:05:08 +0100 (CET)
Received: from AS9PR06CA0389.eurprd06.prod.outlook.com (2603:10a6:20b:460::7)
 by PAWPR08MB10133.eurprd08.prod.outlook.com (2603:10a6:102:35f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 02:05:04 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::cc) by AS9PR06CA0389.outlook.office365.com
 (2603:10a6:20b:460::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 02:05:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 02:05:03 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 02 Feb 2023 02:05:03 +0000
Received: from 131d2ce7d17e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C73D70E6-7536-4C1A-901D-498A9A0CF5D1.1; 
 Thu, 02 Feb 2023 02:04:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 131d2ce7d17e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Feb 2023 02:04:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7944.eurprd08.prod.outlook.com (2603:10a6:20b:541::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 02:04:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 02:04:54 +0000
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
X-Inumbo-ID: 040448e0-a29e-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svshDtxdWN2s21Wp+aLP/i0FD33vykjikRArmQiPEp8=;
 b=jWDtVlsW1PkiLOmvOb6OIdWDio9eoUFjKcSPXB1xZUmrIDZqKoMoJWtxk7oLd297BezPM7cwcx8cNGka2F3CzyQt/sk1dSyu1wHzOLTQza41PZmtxmt33K7NLEUT0kGldqwpDMqqRffhat61Onz2xgmZJerCY0C07Hj3SWHx3lY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFs9hOLp0ntjPwh5Dw9JuJVqXLS6gVJ/31qNW1IPPMBZMJx5tdVaolJRTgHy3dILOGtnfmVTvozZphsaXcvtfKwvS1whDm1QnrJXIcaOc6lSPr1bWCwZlK7765VvukMGI143bD/Dk7juhbfPVVQ8BOyxkOmxyprEPEhDmdoxShR2M1AM9iWHC/ZnLreOv9911EDErS35Mm7wqMMzFlMsEsFVzl/bsgeje0lGbPtkN1WVguus6lCZOyyasntzLNhKn5hbJiIHGfJ4mKAb6XPu9lqpZZNFDNKhI3h1HoYH16UVQcXcEafco8SifjaaL/35s4bb6xSd9hziDHUow4kqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svshDtxdWN2s21Wp+aLP/i0FD33vykjikRArmQiPEp8=;
 b=bBSzF4aP1ISPTRA5xsyIG9DfiihhOYsWk9aWJjS7pJDxp1A7jIvzVmiWy+zzDLnLfWuGvEBeLCQqPpxPz/7q2mlERfriGMFMf4Uy3aGsM55sFDbTOzCtIL/+q9vMmk0Q7nkO+/1DP3hJx/PSKvWyWakuicTXBzVg+Zvt3PUzrupaCqilG47MxoDxofPE2mg206qXLK3CWHfKi2ZTSpyeKsCn/GhrYFJ1ZTHnfX0TaMRe9oa9crNzQeUPPtIk+1AoqIzQ11ow4b9FZ0/1BejFPe8PWlM291GepexJckrQ21+NgOJZLMciSF6H4whMkZMI8kkugWjAwVYvJfYVC8OULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svshDtxdWN2s21Wp+aLP/i0FD33vykjikRArmQiPEp8=;
 b=jWDtVlsW1PkiLOmvOb6OIdWDio9eoUFjKcSPXB1xZUmrIDZqKoMoJWtxk7oLd297BezPM7cwcx8cNGka2F3CzyQt/sk1dSyu1wHzOLTQza41PZmtxmt33K7NLEUT0kGldqwpDMqqRffhat61Onz2xgmZJerCY0C07Hj3SWHx3lY=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@cloud.com>, Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: RE: [PATCH] Changelog: Add details about new features for SPR
Thread-Topic: [PATCH] Changelog: Add details about new features for SPR
Thread-Index: AQHZLRqZNJwiiBkqnku+FjPpsLRxRa6yKKGwgATxtwCAAuUMgIAA90ow
Date: Thu, 2 Feb 2023 02:04:53 +0000
Message-ID:
 <AS8PR08MB7991C8898F8008BB64E4DCB092D69@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230120220004.7456-1-andrew.cooper3@citrix.com>
 <AS8PR08MB79918B0D0329A2B722B773EB92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9abcfc06-1401-cdb7-a1f1-670cd307a593@srcf.net>
 <CA+zSX=ZdQi5RsSUPRTKyY63=--GoXwea-MXyN7xbovKeo9jRug@mail.gmail.com>
In-Reply-To:
 <CA+zSX=ZdQi5RsSUPRTKyY63=--GoXwea-MXyN7xbovKeo9jRug@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5744EA9EC61DB146A3D38AADF5D99964.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7944:EE_|AM7EUR03FT023:EE_|PAWPR08MB10133:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7f153a-b530-431f-1792-08db04c1e5db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/5ZbOihbcrF5JLldV+6iEPuVVjwVkcfoAlvOXzUjf/vLNnPNkQU+SE9B3gXL?=
 =?us-ascii?Q?KSIw/p0I5j0w7mKPWUead9YosExnCm1CKwYUlSlvI50f05BZMT7UJddqA7OH?=
 =?us-ascii?Q?At6MMi+pz9x8lqw8lZ6rnNdTJ3kQHqXjeEii0xMTK9wtXCT+xacrErfjt5vJ?=
 =?us-ascii?Q?XtFynPfVCuq64PYaDT7Nes4IRKSmZaVluZ+5poXQMieq6fI7z/MI1r/HuPw4?=
 =?us-ascii?Q?WQrS+1IoSk44zgk2YD/i0QnUqBoHjznPmISEVqDOzvs01tmbKYloigNG8RQo?=
 =?us-ascii?Q?YwZPcked86ncBsBb47m6fWsKzpR5/TKpYEbH+DyJXZUGkGAi1jjJzRdRYKqY?=
 =?us-ascii?Q?fHp8H9yPRy7GEm91+hZ4pnGV+VxutJ9KNs76sCxRrRwhD52Wyj7g+O9d8YAe?=
 =?us-ascii?Q?wmnsu1wT087fCr9qY0HcjKyCJbA4x6wAPzUe0SHgJpHpSBIuEpn+7qcYh21X?=
 =?us-ascii?Q?p0LkbZgdGAczr2Ou7Wfm+Y2vG3ilB41E23lWXRuVGE3zidLvLKrQRIwsRuBE?=
 =?us-ascii?Q?dO+HpbmR+/VUN6rTlasmaW6pl1n2lIGGFII170CbQAlDZvzkWH5OxEWIvtz0?=
 =?us-ascii?Q?jGDAkTE6gHMMJ9w/mDJMp+WOQxZz6oZLFRMMzSfJJJ+K8AVgNR9/XuPDlk9j?=
 =?us-ascii?Q?FA1egtR9Mj3C4bl+gx+yW9hShdJgUqpuhkDFhYobQVEHG0oKH5OCNh6zR2Pm?=
 =?us-ascii?Q?kU8ar8blBj2MaNbdRH7FW0PMMgDo4eeuU9Z9h6y0lNpCzkgNPfl0nmc2bVuT?=
 =?us-ascii?Q?KcTu1DF6vlTS5UTkmQJGW9PvWm8VOR0qO5fvBIjdFS5daTR4yo9lGtIKVxzr?=
 =?us-ascii?Q?Fuxu+JYjqMc3it95AaOcX21XsPqQAJn483kVOYrHb6lqqygDKFRFtc2Qclso?=
 =?us-ascii?Q?rb8IiMpnlqUcg15dNK8bjtpd4ajGlyURduFJz+OENRZ534y5EI0wPFq4e4+i?=
 =?us-ascii?Q?CfFE5SwuqjK0PsUfz11qYADx5unnQEAAXf+UsUi2rc7jm7qbEH1GfEeFT555?=
 =?us-ascii?Q?yo2WKZEukdUx/08ElnKXnUVGd5qEHa+CrOVxQt6TaSP6WgYHXF3Uj8uUS6lp?=
 =?us-ascii?Q?VfBzexsipRdXs/3RUaQ2VTKXsKHf1y9heBWLewdP7ugXPQpYkhvkWwos+7Ah?=
 =?us-ascii?Q?jJYxWZ018xy/HhUPvs5qB1xaRiMVa9U8g1wUOBOx82HwwpbWshaNmMs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199018)(66899018)(9686003)(83380400001)(38070700005)(2906002)(26005)(186003)(6506007)(86362001)(5660300002)(4326008)(33656002)(41300700001)(71200400001)(7696005)(478600001)(122000001)(55016003)(110136005)(76116006)(66946007)(9326002)(316002)(8676002)(8936002)(52536014)(66556008)(54906003)(66446008)(38100700002)(66476007)(64756008)(71176010)(59356011)(207903002);DIR:OUT;SFP:1501;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB7991C8898F8008BB64E4DCB092D69AS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7944
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8611f22-328d-4c8a-f6e5-08db04c1e01e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkMremlCa29kUytUcXpvQkxLMlhZVnBRL0t1bGNibFRoS3BMME40QW52dzYv?=
 =?utf-8?B?UDdScmhRRCtvWk5LWUNJWVcwemN2cTl0dE1qNGo0UzhEZSt4NDRpVENmQkVo?=
 =?utf-8?B?b21VdHNjdVM3NUlkaEFZeXdBeHBiODlOR3NWNTR3aFVIL2hiVnhHVmFSemhh?=
 =?utf-8?B?VlQxSkEyOGN3dElJTVA4MTBHSk5BV25BMUhrT0VYZy9GZUtidjFrMHVpQXFs?=
 =?utf-8?B?R0QySzY1bTN6Q1R6dFUwNEdtSXV2b1RjUG03dmk2NHlrMzFLSHp3RTBTTWRK?=
 =?utf-8?B?L2MzM2ZGQk1kS3o4SCtvaEluZkpTYXl1bTl4T0dDeXYwcFJteXhwRkNyM2Rq?=
 =?utf-8?B?UEhlSXVEcU5tdjJFeEc0eFBDQ2M0eCtlYWhYcVFJbEs5QWViRHFzM0g4UmFx?=
 =?utf-8?B?bkREMUZxbkJMeGRyVWZQM09xSm9wU2U4aUV0Z29kcEprMGJwM1l0L2NGVTd5?=
 =?utf-8?B?RzZqdDl6cWhON2dIVVgveWx2Z0x6cC9DQUpURXhQd1FSQ1NHWkZtUVluckRN?=
 =?utf-8?B?NVg4Rmh1cEMyaVJ3WXVUNnFrQ1lNQ0VjVGZZQTBUQVF4bTlvY0Fmd1IxWGpB?=
 =?utf-8?B?WVVQbnZNUHNnbk9leUI0dXJnSlN2YVVPczBWK0NhZHBZejdvTHZrSmovckZa?=
 =?utf-8?B?UERQWC9rQkh5ZkF6M0FSK2I3RkxQazVVTVRyMGpyWDhEYThkWDFWMis1dU1m?=
 =?utf-8?B?RndGbksvZUpQLzV6aVBGWFlRWnplOUpJTy9SNzlkbENscUNIK3NERTIza1V2?=
 =?utf-8?B?dXNqWWdYUHVPcGhOR2NIMjZ0cnhncXdnMGh2cUNxWTVZeGc1TERacnhPdkUz?=
 =?utf-8?B?cjBvYXROOXdrUWc2cytlejQyR0M2d2szMmxwQllydjVtSWppZ1NvaDJlbzdR?=
 =?utf-8?B?U0lMenoxRjRPQ2RZc2VMRng3bFJjL0NYc1o2T1hrOTgrMzNCZzY1RTAwL1Bh?=
 =?utf-8?B?SVY2aEZHRytmUE11MGJPbjNXbTZXUmswRUNwejJRdERTR3h1WUk2QjBTd2lJ?=
 =?utf-8?B?MFlES3FXSUw5Q0dFd0taYXJkeUM1dGVFeTdkUDRsTmxnUWNCRmtKR3BjaEd4?=
 =?utf-8?B?bTM1Tm9lTThDYzhkV1BmOUYzRm10aHA2bk41L3RqaGhMSS9HckNMenVvcEZC?=
 =?utf-8?B?MS9KcnExQS9Na3pZWGtjcXo4RUovUVUvWWx1MmRJS3p4TUNPckVHNGY1NkxP?=
 =?utf-8?B?dmJOL20rK3lTR2FoSnliNlhOWFpwYlJlMVpCNVJybDluZFRkSURoRVYzNDFR?=
 =?utf-8?B?Zzd4MmZxaDBRRm9tRWdNVmdBRmNZSThXanVuNEVoalVNVEZSbEJTS0pIZkVT?=
 =?utf-8?B?WnJ4YnNRM2lPaW16TEFYQzZhL0JaS3ZLREFYMUEyc1BMb3AxbXFxZHVWemxC?=
 =?utf-8?B?Zkt3cDJFeVV5akd4SWsybHpXUEYyc2NoL0o2NkIxVWZuVEpYWElGS2V3MVIr?=
 =?utf-8?B?NTNuOExoM3QwRmJVS2lWMEFrWkw4WlR3Y09RTC9ValVtSWRLTHEwb0RCMk5L?=
 =?utf-8?B?Qkl6RXVpZEZXSm53L3cySmllenJQcGRzWlJTNnpKa3pXcThLRWRRUFhIMVRK?=
 =?utf-8?B?M2U3UT09?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:OSPM;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(66899018)(47076005)(83380400001)(36860700001)(6506007)(2906002)(186003)(9686003)(26005)(33964004)(86362001)(8676002)(33656002)(4326008)(82310400005)(41300700001)(7696005)(478600001)(5660300002)(40480700001)(82740400003)(496002)(110136005)(356005)(336012)(70206006)(55016003)(70586007)(316002)(52536014)(54906003)(9326002)(81166007)(40460700003)(8936002)(71196009)(71176010);DIR:OUT;SFP:1501;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 02:05:03.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7f153a-b530-431f-1792-08db04c1e5db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10133

--_000_AS8PR08MB7991C8898F8008BB64E4DCB092D69AS8PR08MB7991eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgR2VvcmdlLA0KDQo+IEZyb206IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2xvdWQu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBDaGFuZ2Vsb2c6IEFkZCBkZXRhaWxzIGFib3V0
IG5ldyBmZWF0dXJlcyBmb3IgU1BSDQo+DQo+IE9uZSBhcHByb2FjaCB3b3VsZCBiZSB0byBoYXZl
IHNvbWVvbmUgLyBzb21ldGhpbmcgKGVpdGhlciB0aGUgcmVsZWFzZSBtYW5hZ2VyLCBvciBhbiBh
dXRvbWF0ZWQgc2NyaXB0KQ0KDQpBbiBhdXRvbWF0ZWQgc2NyaXB0IHdvdWxkIGJlIGJlc3QgaWYg
cG9zc2libGUgSU1ITywgYXMgdGhlIGVtYWlsDQpjb250ZW50IHdvdWxkIGJlIHByZXR0eSBtdWNo
IGZpeGVkL3ByZWRpY3RhYmxlIGFuZCB0aGUgZW1haWwgaXMNCnNlbnQgcGVyaW9kaWNhbGx5Lg0K
DQo+IHBlcmlvZGljYWxseSAobW9udGhseT8gIEJpLXdlZWtseT8pIGVtYWlsIGVhY2ggbWFpbnRh
aW5lciBhIGxpc3Qgb2YgdGhlIGNvbW1pdHMgdW5kZXIgdGhlaXIgcmVtaXQsIHdpdGggYW4gZW5j
b3VyYWdlbWVudCB0byBjb25zaWRlciB3aGF0IGVudHJpZXMgY291bGQgYmUgYWRkZWQgdG8gQ0hB
TkdFTE9HLm1kLiAgaS5lLiwgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4NCj4gODwtLS0NCj4gRGVh
ciAkTUFJTlRBSU5FUl9OQU1FLA0KPg0KPiBEdXJpbmcgdGhlIGxhc3QgJFRJTUVfUEVSSU9ELCB0
aGUgY29tbWl0cyBiZWxvdyBoYXZlIGJlZW4gY2hlY2tlZCBpbnRvIHRoZSB0cmVlIHdoaWNoIG1v
ZGlmeSBjb2RlIHVuZGVyIHlvdXIgbWFpbnRhaW5lcnNoaXAuICBQbGVhc2UgZW5zdXJlIHRoYXQg
bmVjZXNzYXJ5IGNoYW5nZXMgdG8gQ0hBTkdFTE9HLm1kIGhhdmUgYWxzbyBiZWVuIGNvbWl0dGVk
Lg0KPg0KPiBUaGFua3MsDQo+ICRTRU5ERVINCj4NCj4gJEdJVF9MT0cNCj4gLS0tLT44DQo+DQo+
IElkZWFsbHkgdGhpcyB3b3VsZCBwcm9tcHQgbWFpbnRhaW5lcnMgdG8gZ2V0IGludG8gdGhlIGhh
Yml0IG9mIGFsd2F5cyBhc2tpbmcgZm9yIENIQU5HRUxPRyBlbnRyaWVzIHRvIGJlIGFkZGVkIGR1
cmluZyByZXZpZXcgKHdoaWNoIHdvdWxkIGFsc28gZ2V0IGRldmVsb3BlcnMgaW50byB0aGUgaGFi
aXQgb2YgYWx3YXlzIGluY2x1ZGluZyB0aGVtKTsgYXQgd2hpY2ggcG9pbnQgdGhlIG1haW50YWlu
ZXJzIGNvdWxkIGp1c3Qgc2tpbSB0aGUgY29tbWl0cyBpbiB0aGUgZW1haWwgYW5kIG9ubHkgYWRk
IGhlIG9kZCBDSEFOR0VMT0cgdGhhdCB0aGV5IG1heSBoYXZlIGZvcmdvdHRlbi4NCj4NCj4gVGhv
dWdodHM/DQoNCkkgbGlrZSB0aGlzIGlkZWEgdmVyeSBtdWNoIDopIEp1c3QgYSBzbWFsbCBxdWVz
dGlvbjogQXMgYSBkZXZlbG9wZXIsIGl0IGlzDQpub3QgcmVhbGx5IGNsZWFyIHRvIG1lIHRoYXQg
dW5kZXIgd2hhdCBjcml0ZXJpYSB3b3VsZCBhIHBhdGNoL3Nlcmllcw0KZGVzZXJ2ZSBmb3IgYSBj
aGFuZ2Vsb2cgZW50cnkuIFBlcnNvbmFsbHkgSSB3b3VsZCB0cnkgdG8gaW5jbHVkZSB0aGUNCkNI
QU5HRUxPRyBpbnRvIG15IGNoYW5nZXMgaW4gdGhlIGZ1dHVyZSBpZiB0aGlzIGNyaXRlcmlhIGlz
IGNsZWFyZWQuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4NCj4gIC1HZW9yZ2UNCg==

--_000_AS8PR08MB7991C8898F8008BB64E4DCB092D69AS8PR08MB7991eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxARGVuZ1hpYW4i
Ow0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMg
Ki8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBp
bjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
O30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXpl
OjEwLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3Jk
U2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGlu
IDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9z
dHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVk
aXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28g
OV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJl
ZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9o
ZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiIHN0eWxl
PSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+SGkgR2VvcmdlLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7
IEZyb206IEdlb3JnZSBEdW5sYXAgJmx0O2dlb3JnZS5kdW5sYXBAY2xvdWQuY29tJmd0OyA8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgU3ViamVjdDogUmU6IFtQQVRD
SF0gQ2hhbmdlbG9nOiBBZGQgZGV0YWlscyBhYm91dCBuZXcgZmVhdHVyZXMgZm9yIFNQUjxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OzxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBPbmUgYXBwcm9hY2ggd291bGQgYmUgdG8gaGF2
ZSBzb21lb25lIC8gc29tZXRoaW5nIChlaXRoZXIgdGhlIHJlbGVhc2UgbWFuYWdlciwgb3IgYW4g
YXV0b21hdGVkIHNjcmlwdCkNCjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5BbiBhdXRvbWF0ZWQg
c2NyaXB0IHdvdWxkIGJlIGJlc3QgaWYgcG9zc2libGUgSU1ITywgYXMgdGhlIGVtYWlsPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5jb250ZW50IHdvdWxkIGJlIHByZXR0eSBt
dWNoIGZpeGVkL3ByZWRpY3RhYmxlIGFuZCB0aGUgZW1haWwgaXM8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPnNlbnQgcGVyaW9kaWNhbGx5LiA8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+Jmd0OyBwZXJpb2RpY2FsbHkgKG1vbnRobHk/Jm5ic3A7IEJpLXdlZWtseT8pIGVtYWls
IGVhY2ggbWFpbnRhaW5lciBhIGxpc3Qgb2YgdGhlIGNvbW1pdHMgdW5kZXIgdGhlaXIgcmVtaXQs
IHdpdGggYW4gZW5jb3VyYWdlbWVudCB0byBjb25zaWRlciB3aGF0IGVudHJpZXMgY291bGQgYmUg
YWRkZWQgdG8gQ0hBTkdFTE9HLm1kLiZuYnNwOyBpLmUuLCBzb21ldGhpbmcgbGlrZSB0aGlzOjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OzxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyA4Jmx0Oy0tLTxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBEZWFyICRNQUlOVEFJTkVSX05BTUUsPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7PG86cD4mbmJzcDs8L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7IER1cmluZyB0aGUgbGFzdCAkVElNRV9QRVJJT0QsIHRo
ZSBjb21taXRzIGJlbG93IGhhdmUgYmVlbiBjaGVja2VkIGludG8gdGhlIHRyZWUgd2hpY2ggbW9k
aWZ5IGNvZGUgdW5kZXIgeW91ciBtYWludGFpbmVyc2hpcC4mbmJzcDsgUGxlYXNlIGVuc3VyZSB0
aGF0IG5lY2Vzc2FyeSBjaGFuZ2VzIHRvIENIQU5HRUxPRy5tZCBoYXZlIGFsc28gYmVlbiBjb21p
dHRlZC48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDs8bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgVGhhbmtzLDxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyZuYnNwOyRTRU5ERVI8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDs8bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZndDsgJEdJVF9MT0c8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPiZndDsgLS0tLSZndDs4PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mZ3Q7PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7
IElkZWFsbHkgdGhpcyB3b3VsZCBwcm9tcHQgbWFpbnRhaW5lcnMgdG8gZ2V0IGludG8gdGhlIGhh
Yml0IG9mIGFsd2F5cyBhc2tpbmcgZm9yIENIQU5HRUxPRyBlbnRyaWVzIHRvIGJlIGFkZGVkIGR1
cmluZyByZXZpZXcgKHdoaWNoIHdvdWxkIGFsc28gZ2V0IGRldmVsb3BlcnMgaW50byB0aGUgaGFi
aXQgb2YgYWx3YXlzIGluY2x1ZGluZyB0aGVtKTsgYXQgd2hpY2ggcG9pbnQgdGhlIG1haW50YWlu
ZXJzIGNvdWxkDQoganVzdCBza2ltIHRoZSBjb21taXRzIGluIHRoZSBlbWFpbCBhbmQgb25seSBh
ZGQgaGUgb2RkIENIQU5HRUxPRyB0aGF0IHRoZXkgbWF5IGhhdmUgZm9yZ290dGVuLjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OzxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBUaG91Z2h0cz88bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+SSBsaWtlIHRoaXMgaWRlYSB2ZXJ5IG11Y2ggOikgSnVzdCBhIHNtYWxsIHF1ZXN0aW9uOiBB
cyBhIGRldmVsb3BlciwgaXQgaXM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pm5vdCByZWFsbHkgY2xlYXIgdG8gbWUgdGhhdCB1bmRlciB3aGF0IGNyaXRlcmlhIHdvdWxkIGEg
cGF0Y2gvc2VyaWVzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5kZXNlcnZl
IGZvciBhIGNoYW5nZWxvZyBlbnRyeS4gUGVyc29uYWxseSBJIHdvdWxkIHRyeSB0byBpbmNsdWRl
IHRoZTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Q0hBTkdFTE9HIGludG8g
bXkgY2hhbmdlcyBpbiB0aGUgZnV0dXJlIGlmIHRoaXMgY3JpdGVyaWEgaXMgY2xlYXJlZC48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+S2luZCByZWdhcmRzLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+SGVucnk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OzxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyAmbmJzcDstR2VvcmdlPG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_AS8PR08MB7991C8898F8008BB64E4DCB092D69AS8PR08MB7991eurp_--

