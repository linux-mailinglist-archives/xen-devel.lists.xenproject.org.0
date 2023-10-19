Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2667CF8EB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619301.964143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtS9p-0004Ow-T3; Thu, 19 Oct 2023 12:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619301.964143; Thu, 19 Oct 2023 12:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtS9p-0004MQ-PW; Thu, 19 Oct 2023 12:29:45 +0000
Received: by outflank-mailman (input) for mailman id 619301;
 Thu, 19 Oct 2023 12:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtS9o-0004MG-9N
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:29:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dfa7808-6e7b-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 14:29:43 +0200 (CEST)
Received: from DUZPR01CA0207.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::9) by DB3PR08MB8890.eurprd08.prod.outlook.com
 (2603:10a6:10:43a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 12:29:40 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::e3) by DUZPR01CA0207.outlook.office365.com
 (2603:10a6:10:4b6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Thu, 19 Oct 2023 12:29:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26 via Frontend Transport; Thu, 19 Oct 2023 12:29:39 +0000
Received: ("Tessian outbound 470906b1fe6c:v215");
 Thu, 19 Oct 2023 12:29:39 +0000
Received: from 4d0112cf81cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E690228F-06DB-4D7B-A869-99AE22EA8009.1; 
 Thu, 19 Oct 2023 12:29:33 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d0112cf81cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 12:29:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA6PR08MB10663.eurprd08.prod.outlook.com (2603:10a6:102:3c9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 12:29:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 12:29:31 +0000
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
X-Inumbo-ID: 2dfa7808-6e7b-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvNjs8hdm554H2pPkmD66Oy4Zng7ZkFKQkpphr69qd0=;
 b=zGt3EE+XwRI81CD4RScyFvzH/ydjHWsqcuPN4CSV7FHJ1+POn4PBcNp4ZVO6Vw9u1eY2XkhfLTAXluopuAxYTTvGAk5rUHI0dPQFJVQLhNma+m61VQVqi4FzlLT6yySOYpCh1IkRCcTonAbfWaef/c/2XI+USXYLRLYeamY+TKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 701d8caa9ee9e0c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmUuj4CIsDm4U6Gmy6RX/7MaMXFr1Av5cUCfL+HgrEcDMd+7xV5k7v3rWj85wjYRyhpw0fDrdi8abq+kRurzHQW9aXIKrV8XvHTCbsRLClly0BNcyP1M8vJtER3apM/thFcgMP2KK+WPX+7tJ8NTX7XUtp08q4dO/3dJBYLuHMYGOrnK4xBaO3oDwsCGTtomLF/tCiee0zX2uR+L62mnxSzpOhey8/hfwVHohNgKI0uyysvJQVNTIjTlWBvaR8C5LFBMWseILsmWDFX5zO6K++CycdouBXheSrymOox6SMgP3/iZntEcGrAUvlvhhrXhOC1VrW89bNaGJMfKITQI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvNjs8hdm554H2pPkmD66Oy4Zng7ZkFKQkpphr69qd0=;
 b=OCQWRDmd3VzxPG2qBnJ+EjPZNML7gyQQgmx/iwhbKH8uvS2YdYeSvQ6JTt0ECtk/VWAC8sAAA68tbXYWAcqkOcv5BUnvNusmYxewUfPIQdwiIxQN9aECcebGcPJN96GEnsvKe2qV7DDGM2g9zLPawmEgScAwReozCXu77RK7c6kAGOehlRrp1ns9AatCa0+o5JZlnpf0mWSjBUMA6xqQ0WZBw7FPrcgGk+mQfAxM6Lr8KFez8R4DVK2EqjsEvx2GnsXW9a507S1oCHJq9FswOlqRlFSUfVZIfBTbweYnWXRu2CsST7fLVpVoAIbY/yHl0GcH6+4qfXL2lZAwgmsE0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvNjs8hdm554H2pPkmD66Oy4Zng7ZkFKQkpphr69qd0=;
 b=zGt3EE+XwRI81CD4RScyFvzH/ydjHWsqcuPN4CSV7FHJ1+POn4PBcNp4ZVO6Vw9u1eY2XkhfLTAXluopuAxYTTvGAk5rUHI0dPQFJVQLhNma+m61VQVqi4FzlLT6yySOYpCh1IkRCcTonAbfWaef/c/2XI+USXYLRLYeamY+TKA=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] EFI: reduce memory map logging level
Thread-Topic: [PATCH for-4.18] EFI: reduce memory map logging level
Thread-Index: AQHaAoUDv9e4z7RTDkOyNBvOs3xAR7BRBsUAgAAD9oA=
Date: Thu, 19 Oct 2023 12:29:31 +0000
Message-ID: <19C3E926-CA38-437F-85AB-3D2273DD6F27@arm.com>
References: <16a32be2-6982-2463-3d71-383a21d7e074@suse.com>
 <514d207c-fc27-405e-a71a-6ac24bf4184e@citrix.com>
In-Reply-To: <514d207c-fc27-405e-a71a-6ac24bf4184e@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA6PR08MB10663:EE_|DBAEUR03FT039:EE_|DB3PR08MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: a8082d7d-8863-4cde-85d3-08dbd09f1073
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DouXAARd9/A7OKIr3VNCxfsDS6sESmjd4BhZ02CcQIR0l1rxx97JQPurUntO5Y7SU6PzBjImOMAYwf5dAOZcKMzCeLX1tuzA+lsOPC/Ls2peUICbjRcy+IXm9KbPMVsp69bz6kozyuBPqXqSx2ixvkUXsUZCF5gO9uY5DyiEbThY22hxPh2fjFDDujwSxHjkeFjrUti0/iEujb9DRskES5Kvv1IzWncLqCaxurdKg10rlWbaZ9SfJSlO9tRBGNumWZJSyvrLYN8oy7SasRhj5Ds95ZC9iEbLO2ZJ67uLxrxtY1o8lSKabIDvD2uq1kQZRA5Sv43kneP82uchA7MZXbMNwiYm6x8tWqxTmbwk8yM5qleJpmQHUKo7WxBpsOoH6vVEZF8RBSyvWhbny0EHjxzLHtYLUTdwn9cledJVHUXdxInFx3pzGR5I/1KyOKFQzv1up4rY2XBMwew8N6IFlDd/XKl5QfJPhdRWXuUG5u45BQ3k+99c7uIz+rh1uBTx6O6QYU/PSzTeNQVp/kgxrOODPaU8QzZ6sJamm2VpzB5EjGxQxm66tNm5KZGmGB6kHPfo6xQfUuGN4VZ6Zkq67KGdUv/Px9xvg24t1RZ4MJC3/nejtInoqbB6lQNQNZamqD++rBBZ70B+hYnW94UNLg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(33656002)(26005)(2616005)(86362001)(4326008)(8936002)(41300700001)(5660300002)(122000001)(8676002)(38070700005)(36756003)(38100700002)(6512007)(6506007)(53546011)(66946007)(478600001)(6486002)(71200400001)(6916009)(66556008)(76116006)(66476007)(66446008)(91956017)(64756008)(316002)(54906003)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D51A5C70D9422E4DB25A4A2DC17E96E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10663
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9df7ba86-6b13-435e-130a-08dbd09f0bb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uPSCzsqJUgSbPs51H+a80rUdsOGfiKfCWa23EE5v0WGut4sHckUJzzCzIej4a3yNhrV4nWcLE0K96jjFoY5pE1Grz1Q0FYhAX3mtgJz1ishpHa4dkNu4kJtstFqrDcJm/R4sjiuFSuMHdrtGrnhrlt3RER2hPRueeHwbxcj/7WHfMSizhPcNbogxzMGrYOl5RJjZr+2QrJlM75vY9AVvigmuJfmHuFO7YMx3GJdf1oRWIJx8e1q6iKKD+riJcOlHMm+/OeomkONe2Pyx6DNBj25XJHZ93S+EWHhGJaqLR58vEKn8cs5ybOHzffQtmY54jfatA3MQ0R1meNpFjT4I6I9dKpZ0i4kigo8yoX+RyaFTi4Dh3uOtTlhqMHOvAGLQJXkm88vk3jNRM3rWlKO3Daiqcns3dzKwh+n09LeFlh0xXQnDgyNBHEVTgY8e+n9TAOzD3yeasz8JXKuktGRVPqDNc7Mww6sNXfMTbdqROr59pOvBY2aEwfh3chLFUdq3YOUXSZsWA+Tjr+OxfH4xvASbs6VeVQGN0a+sI5/K/7J5I37Kcexgip94+1Ch3aw1rkFW2D2bPQcGON43eF6ibf6fnR+xiIdUX78aOVILAUK+eoyowbuIkWwNv9Ub9O889TmTlQi5FjBo2LIMarBTdpPAk2cU6Vwu9ZuWo046a5F7SQ9RBoza5GAPVmNA4RptFVmgHc8T3c8V/P+qxqT4aA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(46966006)(36840700001)(36756003)(33656002)(40480700001)(356005)(54906003)(81166007)(82740400003)(336012)(86362001)(47076005)(36860700001)(2616005)(26005)(53546011)(6506007)(6512007)(4744005)(6486002)(478600001)(2906002)(70206006)(70586007)(316002)(4326008)(41300700001)(8676002)(6862004)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 12:29:39.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8082d7d-8863-4cde-85d3-08dbd09f1073
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8890

Hi Andrew, Jan,

> On Oct 19, 2023, at 20:15, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 19/10/2023 1:08 pm, Jan Beulich wrote:
>> With the release build default now being INFO, the typically long EFI
>> memory map will want logging at DEBUG level only.
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

