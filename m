Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F75ACEAC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398655.639554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Fs-0004cJ-Q9; Mon, 05 Sep 2022 09:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398655.639554; Mon, 05 Sep 2022 09:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Fs-0004Zu-N3; Mon, 05 Sep 2022 09:18:56 +0000
Received: by outflank-mailman (input) for mailman id 398655;
 Mon, 05 Sep 2022 09:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oV8Fr-0004Za-1V
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:18:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2f3aa30-2cfb-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 11:18:54 +0200 (CEST)
Received: from DB7PR03CA0089.eurprd03.prod.outlook.com (2603:10a6:10:72::30)
 by DBBPR08MB6138.eurprd08.prod.outlook.com (2603:10a6:10:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 09:18:52 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::73) by DB7PR03CA0089.outlook.office365.com
 (2603:10a6:10:72::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 09:18:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 09:18:52 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 05 Sep 2022 09:18:51 +0000
Received: from 75bc5b9e03e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8586AD73-D807-4FF1-B977-CE33A47864FB.1; 
 Mon, 05 Sep 2022 09:18:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75bc5b9e03e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 09:18:44 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS2PR08MB8362.eurprd08.prod.outlook.com (2603:10a6:20b:545::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 09:18:43 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:18:43 +0000
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
X-Inumbo-ID: c2f3aa30-2cfb-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kop3AoSVgR10dFWQaqbw2NqFzeR9dryr6dN9X4dgdx6j6OgnxypM7ZXV/ROj8Oa/hRIeSwdXb852sNIxnRlXgOieBbgJv2oKzStEbyQ1ce+TQZzJkwVa39tgT6Rfof4u1IqNOjM4ltBGBgd27rRa4XbI4Egx/QI2q50N9vE8/tv958HO/ou7Jzsub6+o5Ng5OKJvKUJscNyuY3eV4IRsvnOZB8EaMcgCqjpYAMYDSehB1cuvCCKUrmWoOHvbyki813V95UAfOtWUcKzWu3+ZNV+hz3OVC/vUpC72cZ6q5dnO1m5oNCswaBCkAUYMH+uqgvhpMBdde6bnW8vM6emDvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWAw9AizrppWbMqtmNqglZxSrRobWCsQT9g/gRle4DY=;
 b=EwK6M4hv/UHsvTf6BpRA/8HdXKEmlJ6r6yPuQ2lEwbln/AFdiBgd5yofAVO2IzWFgE1TnbmX/qeye/A1jI+L/OlpfT/iRyr9gtwyVoOvSpRpevzg25RsppI0RIvd8oahRZ5hfRGnaaKZ6o/7rMfjQi84d1ysbnIwIOgQv5eyCV3ukz921rPs5J64ivqunI9c11jLvX4WGPz/cw5iP8ss9xVh/uOTkv1dbmmDhINEujzI1zFqTdCOsclkpFA3aKzAhPpIWo04pKKUAnJY5elBhm2uwTilHFDKT4qbbVct7L1WejcDpAT6WrLy2ElOuZ3YtqNcIuMZpWt7JrbECAj0JQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWAw9AizrppWbMqtmNqglZxSrRobWCsQT9g/gRle4DY=;
 b=H1R5NxOSo/vw4HFAxe5ncgIRN6d/r4K0JQw0plVTfqnXDib87XSF6ktCKXaIGrQHqOQ8BkwnwCzH99ur4LVdSU7OMPpZkh3Ywakj9lh0qtPCRJkeo6hhE/I19VsTVnoFqpmkGK0GFsbGQW12sXMAJNsFZwcwEM0zebquhU2sDcs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9209b7d0169f453
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwoLB8XQ2OtWeSXu3z6yZISZoBXdcUITQ5BL8t+XVzzvxaiUqsHGwa2uaAeP4QpzEygCFIvkVYjZRnGJJk+whfnYXiWs/bp4eFSzI6m5q3p7laeEfus0hR20UEfRij7/74/RqhZuA3Eox3MjYaqVj3wPLibbg8k2/8son6a30CRwIKHatyqeGK25hbMVF5BxC8dQSmeQrgO3//UvXSzvbsgS2HPyJNoqBWB9jqac7OWi2rhPtNDi85gz6LCUo25ftKzMPB+7y6rjMl6nRsb2PkCx4gw5KvVYuNwdHlqy2L+ytXWiEFNEYJu9y21/8sYuY+M6WjEAhUjCr20QAhYevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWAw9AizrppWbMqtmNqglZxSrRobWCsQT9g/gRle4DY=;
 b=Hg67Eo6/eCsUBnJLa4N2R1FcWSY/5Ll+6594HDfcTit/Qb+osMgy1zft1WwFM8dWoWgPrzVtaEG3gofghYhpJ2mdOHCt0OyN5KY4AkE4dR0Rg02BenUOLalvdN3wCQ7H3unDdJ/8vhku9LszRBqnqQ2hYJpcpxiseOw9T2LIg4YpI/DkYM6jlx5zYdBR+rUiqhv54kGnYrDCBcXxVG1e0UyUXqRW5OaPCdKbKNpSWdSoXlSg3h2/ecYWHJpol5BjJKTM33Ujw6Zun0GXu3mmdwKBFp39iSqsfrXpH3vA3eP+eWhexgl2NNzv4a3XQbc4ljGxA2LMVMbkmhXN+5MiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWAw9AizrppWbMqtmNqglZxSrRobWCsQT9g/gRle4DY=;
 b=H1R5NxOSo/vw4HFAxe5ncgIRN6d/r4K0JQw0plVTfqnXDib87XSF6ktCKXaIGrQHqOQ8BkwnwCzH99ur4LVdSU7OMPpZkh3Ywakj9lh0qtPCRJkeo6hhE/I19VsTVnoFqpmkGK0GFsbGQW12sXMAJNsFZwcwEM0zebquhU2sDcs=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Zhou Wang <wangzhou1@hisilicon.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Will Deacon
	<will@kernel.org>
Subject: Re: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Topic: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Index: AQHYvtEAJSRg4g4gWEG/XWmXvqw9I63Mx8YAgAPLkwA=
Date: Mon, 5 Sep 2022 09:18:43 +0000
Message-ID: <FB788985-2DE3-406D-9282-56B8C9E4B1C1@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 56e40c8c-ac96-49e4-af76-08da8f1fa624
x-ms-traffictypediagnostic:
	AS2PR08MB8362:EE_|DBAEUR03FT007:EE_|DBBPR08MB6138:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4aAZ0YnWTRzupsOJUim7FD49cJ/ur0UpQtDHdxp8/mTLG7Zjg8zC1YCW5moxxDr7L3CqQ/wi636UGJk1Qsy39ldDCTN8aJyjtywyH02rQWPXnOKNnM4XeE/4wnGvrdpC1KrAmVxsacpkhf81xXo2s7bGHVdh0JVpctEObOsOPP7bgMnPr4gPQwZO0Pw3u/iaVnNboyK0A2MnjkWerrA7pIkavwnvCiJawx4KnUSGcqv+KUbZ43g1qXIvAKHpS+wbtjAtU9GCHG0G4lb6qNUU7pJ5mMVc4hQAqQwVSiHjDNepuE2P4ug8lBWErdDA+qQmkDOoUlJ2DJ0WCt1NUBmh21GpD6HFqW4HHIXkDYGPvjGMrkZ+nnqttB5Oy9nqtau3FbbcHdRcxxFVwNFEECm66lyp1XdpP8H/fug+iLJMOWR1QgQqrFZyJVWAgX2Z7yKT0KWv8eWKN18UOD6TCFsVtNHDDbPlAIEirn1m0Ngfvljq3Q7UAWmWzGjbOs47Fuuh800m3qj0omu0v1mQv+dR1PAlVWwYVag2Zepf+4d/Vtk3JHOTbQ4fW4StGPUlN0tTfR+gSTfQyuqeDLzgLv8+la4PuBVA93SmZFXSgVYwsZs686VoXUqSf5fo6kOnbuVb3rMQlIjSY/1KvH8Zx9upju8r3nUBmOcyw5jANyfpv4wpho3DJ9kE2JCxfOQU9KloLE4cUZfakQDnPqGm2Vs5WlWaVt7FxE4uyg2RfTLSlHxB2w19XaXRpHg43Lb0SEEwRsvUYcrQGwTCJCRFuBpcmIx5tkLIg0w1UaCkF12HKqSRxTZFSqoYTVVOdAlpzrvAxkr79YZZRIrICFwVJlH+lw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(5660300002)(478600001)(66446008)(122000001)(83380400001)(36756003)(38070700005)(33656002)(8936002)(316002)(2906002)(26005)(966005)(53546011)(71200400001)(2616005)(66476007)(6506007)(91956017)(66556008)(66946007)(76116006)(186003)(6512007)(4326008)(8676002)(54906003)(6916009)(41300700001)(86362001)(38100700002)(64756008)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D493D9C904317343B669C5AAF2DB1E2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8362
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1452d54-4967-4e11-98cc-08da8f1fa0f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WkcP7cwMlY1Yrgk/czK7chH/3H2Kq1iiUXDxF4RY1f0o/FKGfzyFl4fk+SA0UmMUupvajAt+1FZfC/4BiWyIhSFveSTLOwxlwEf8J3wU/f5F5VUS8ceSEjPv7ifO2q2z0dHir1urcZl7WyxG/8I+OJIb1kSdFerOkXFnt2iqF9uCxKv4oCIUgYTwOnnLtbt2Z0dFzioyp530pD7lU8y10uch+LmXRsqsN1wEpVpyYbUHsnytYSNO/4OAjc0dfC6LNv9nFaZ0mR0PZJZGsP5+nh8jsW0U6ViP+pvWHzijGbjQrJaOmn2pw9EjdPchMc4sUBVl1/qaK0T6WXr7qky87LqSGweqnASknSAZpg3jh3+AETHCgxYpoSzTogEHwHA4a8gwpL3gfRXH4NfiMQdsxlu7IaHhyCXEfkW+NHqu5XiS7AujZQES46cH5bQPqdRExlIW71Aa2GE2VtK6Ued3rvHoZajgTqDiADIMb38Vmw9ZJfThFhK96RChk/PmZuCK278Ik/SMXwYwzGX+JvnnireGYgPSz4+rFn2DN/w9Z7EZ6VQBfs3TPz4rPgUQ4NUuqakodi3tDSOq1FlDdvPX6zhjdmfccbgEXVtCeh/bTqQSXB1LE/GjNWy6FKJZt8zlGa3Q5V8QGzi1r7LLaiA8VgHpVfz0ZxQLCZK0hUBSuTrP8NeaGAPtrE+/mIUl1VjPEdBG73dWK2pXtTLCq1TgYEwUSgc5OYfOrN7O11pA9YpgGcouSFuQoQuk0NNzi5BWXr/Z8QqLCDOqhcQ/Ehwv00LvsHnqxiMSc5sW5lPFL8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(36756003)(40460700003)(54906003)(316002)(82310400005)(40480700001)(6512007)(356005)(81166007)(82740400003)(2906002)(86362001)(36860700001)(6862004)(8936002)(5660300002)(83380400001)(33656002)(4326008)(8676002)(47076005)(70206006)(70586007)(336012)(966005)(6486002)(41300700001)(2616005)(186003)(6506007)(107886003)(478600001)(26005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:18:52.0370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e40c8c-ac96-49e4-af76-08da8f1fa624
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6138

Hi Stefano,

> On 3 Sep 2022, at 12:21 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Fri, 2 Sep 2022, Rahul Singh wrote:
>> From: Zhou Wang <wangzhou1@hisilicon.com>
>>=20
>> Backport Linux commit a76a37777f2c. This is the clean backport without
>> any changes.
>>=20
>> Reading the 'prod' MMIO register in order to determine whether or
>> not there is valid data beyond 'cons' for a given queue does not
>> provide sufficient dependency ordering, as the resulting access is
>> address dependent only on 'cons' and can therefore be speculated
>> ahead of time, potentially allowing stale data to be read by the
>> CPU.
>>=20
>> Use readl() instead of readl_relaxed() when updating the shadow copy
>> of the 'prod' pointer, so that all speculated memory reads from the
>> corresponding queue can occur only from valid slots.
>>=20
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>> Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangz=
hou1@hisilicon.com
>> [will: Use readl() instead of explicit barrier. Update 'cons' side to ma=
tch.]
>> Signed-off-by: Will Deacon <will@kernel.org>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 a76a37777f2c
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v2:
>> - fix commit msg
>> - add _iomb changes also from the origin patch
>> ---
>> xen/arch/arm/include/asm/system.h     |  1 +
>> xen/drivers/passthrough/arm/smmu-v3.c | 11 +++++++++--
>> 2 files changed, 10 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/as=
m/system.h
>> index 65d5c8e423..fe27cf8c5e 100644
>> --- a/xen/arch/arm/include/asm/system.h
>> +++ b/xen/arch/arm/include/asm/system.h
>> @@ -29,6 +29,7 @@
>> #endif
>>=20
>> #define smp_wmb()       dmb(ishst)
>> +#define __iomb()        dmb(osh)
>=20
> We don't have any other #define starting with __ in system.h.
> I wonder if we should call this macro differently or simply iomb().
=20
I think either iomb() or dma_mb() will be the right name.
Please let me know your view on this.

Regards,
Rahul=

