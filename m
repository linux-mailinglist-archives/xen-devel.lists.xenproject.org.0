Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E788A60571F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426142.674407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOhe-0000fg-Ml; Thu, 20 Oct 2022 06:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426142.674407; Thu, 20 Oct 2022 06:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOhe-0000cT-Id; Thu, 20 Oct 2022 06:06:50 +0000
Received: by outflank-mailman (input) for mailman id 426142;
 Thu, 20 Oct 2022 06:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIjd=2V=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1olOhc-0000cN-Rb
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:06:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fe4e1b8-503d-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 08:06:45 +0200 (CEST)
Received: from DB6P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::19) by
 DU0PR08MB8019.eurprd08.prod.outlook.com (2603:10a6:10:3e6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.26; Thu, 20 Oct 2022 06:06:42 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::fa) by DB6P193CA0009.outlook.office365.com
 (2603:10a6:6:29::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Thu, 20 Oct 2022 06:06:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Thu, 20 Oct 2022 06:06:41 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Thu, 20 Oct 2022 06:06:41 +0000
Received: from b514b77a992f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2DCA093-2E99-438F-B87B-6E9741050198.1; 
 Thu, 20 Oct 2022 06:06:35 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b514b77a992f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 06:06:35 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AM9PR08MB6708.eurprd08.prod.outlook.com (2603:10a6:20b:30e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 06:06:31 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 06:06:31 +0000
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
X-Inumbo-ID: 5fe4e1b8-503d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZV2V37J1P7U9AVbz7RfOImXEucQqM3/zuWL4DRg8wYa/u6MORBmHcuUDiovEqO7j30oz+2lFLuGA3+4FrkPjx+MH2eE4Eguw6OL66tIudE8OqYdP8RrCa2oNfsFcRzYdeN6Cp4OSlXj3j+HV44eT9OYtOALHhFc+QQVhufuAZJEze3+PbNzaxzBsBmQfTi+s/yxm+LFmrzMNXqQWsOoJvVzWqqsgb807h6zE0wPr9nwZm76whWaB31fUfRBArARc4C6hoVS7zNxhVreTu0nyMyBNBKKScrXwrf5eoXuooq3Tljt3VUzXenh6p8oeVaAVd8JYI9vqDc1GYjxA1pqJpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR8xoKIO59aqd5nvBPcfi+Vb+egPn9X+bVoWkdzuG8w=;
 b=lia6FEKWQ99GcTH5IStQKlN/cRYfBH5Y8Fgl9w3Bq8VLvo9e+xwLEwUiGpoDCCSAIWld/2VtNzn7phR5zUptRlrFgkxaHa4PWnljKzAy6tCIb2qkwR/fOnpuzpJSMauKw5ZyLq8PFb8315A3ASvtO+imRIQklJu1e1A/RMJqfarBwR6lRRLx5L/wxI+f3dLg77I5GCs1zMS9mduXmM7YKZOxz8JgTGVH1bXNsLGNY/7EqI11TlKrP3auljqHg3GEHDmLtlxWpvS4llE5Hxf0pZwT0jdQ5hRbS36CNI6IoF4Niq30ScdX9zxd0Yt6ExkgCsRUQUYkvBz42q6ivW8+YQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR8xoKIO59aqd5nvBPcfi+Vb+egPn9X+bVoWkdzuG8w=;
 b=OxUQ6A3KP1lVHqJVEjGq8Ek0c9Shz6B1R6NLr7Ya/ykWwQUpcNa5iloYYiEnL+Dp4qdRPHiVak9LHkEb+pTwJBLImIR0WX6dw5KgITo1l2uQGc18zVqWQH4YiW1IAzoYHZFJzzS6ECdDkr05uB4jjPwFZqAUWqRw1pEeYWeMUnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NP0nsDDQYbl4QXQ7FnzbGY7Lv3xgpy6w3JbZBCql7W+Yq3j3cywGn16S2zraFHEeqe0O/fc368o4pGAQLTv8u66jHnxszvwk7cSmlYfzNphZYVehRr1aGWhGbTJs+mrIxapE8azVuVY/SrwQFonz5rXV0p6bwv3y1oTTCSAFfM73U8IWbbu63obi6uxRH2rlfSG+ViAsoX0lBGlWTfLa3rZGAZCCMjESeX7NUahgEXXPlkKC9WFOP/rxly0uIf0nuiEfd2fjR3fv3S1FsSqeJ3VmGHVNmiikwSyUBNY+Z/0GjqT7DjLmkVS61jynfRv9gnXZC5G0tfCC2bHaB8d14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR8xoKIO59aqd5nvBPcfi+Vb+egPn9X+bVoWkdzuG8w=;
 b=W/pF6L42BA9V9aArUa5tF8pE+QuX1GbKcuoAsXVD6oWasi2nYyJY/ivLDnzjclKt1jTP5ME0k9hJE034+NwiHvRYihHju/mxn95skGrDn9qVatOlN6yiL8l3b8aEfzee84RAqNRT/h29PxYIkmqrnY4AYc8q5Qy6W9jw/OfFCxbJqx0yNfj054xINWHek+YA2xhlwdChjdgBeDPCqap74jh5sItNJPANmoTiuWE3A9C0RbbX+PkNAvFAabOFdhaP4kXm+nYKHUOQg01eu+nWifT/kZJ6RK6DXRVwjyCZE1iZdIknYlWjA/OuxmxWNocENzT3lG1KdoNZS47c2Svxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR8xoKIO59aqd5nvBPcfi+Vb+egPn9X+bVoWkdzuG8w=;
 b=OxUQ6A3KP1lVHqJVEjGq8Ek0c9Shz6B1R6NLr7Ya/ykWwQUpcNa5iloYYiEnL+Dp4qdRPHiVak9LHkEb+pTwJBLImIR0WX6dw5KgITo1l2uQGc18zVqWQH4YiW1IAzoYHZFJzzS6ECdDkr05uB4jjPwFZqAUWqRw1pEeYWeMUnE=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH] automation: test.yaml: Introduce templates to reduce the
 overhead
Thread-Topic: [PATCH] automation: test.yaml: Introduce templates to reduce the
 overhead
Thread-Index: AQHY49ns8H4XagK8TEuA8KOvVnaQ864WxmAg
Date: Thu, 20 Oct 2022 06:06:31 +0000
Message-ID:
 <AS8PR08MB7696EB037262B58E33209E18922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20221019164246.5487-1-michal.orzel@amd.com>
In-Reply-To: <20221019164246.5487-1-michal.orzel@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6175EA4EE2E65946A8A069A0D8B371C5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|AM9PR08MB6708:EE_|DBAEUR03FT006:EE_|DU0PR08MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 26431547-292c-4a8b-f32e-08dab261420c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 byUQc1YdDOnyr/x8AREuDtelzEzqQUmXMHZlghEcM1huIAm72kEmuoWgwsDsvBbkQzPZSukEQJ2yWq9cb8wFA+GUqnEtvT3jo2l0gyjGYB3o3QfDvB5ZiGkq0TcsNjum2M06ymFEixSvNaHKwLkIFiFLqqyh32Tf7+43rLMh5aSzWRw7zv3uFV1STwqvWniG3hedU/GWPin8MNTHWVfsakDTz3qZM16K3TL7V9/bK+GhlDZmlRX+R4FGumLzU3Lv5YKIlX4CyPdkw69yfiijo/qDXDQU5Y7nnmBDcyqa31hRWLgoGNgMryMz5bmL3cmRSFzcVG42ath9IMFzy6d5W0YamNXs8z5jBN4oYXvbAAhTiE13Th2i6RMs+wkbCkotr70d8rscDQa5svPz8bDzWDEM1Y9EdRTzZRXVsMGvA3s5+Zlwmjh5eVMJqQ5QLeCwY6LAta7YGoo00IIaGXSaQaHmUp/3F8u8l77ABGvj46G48n97ih1Qthe6rLxRP/12VlWAtS8TvPguuIuZaHaE/0qiJauN7uKwKee+gG9fjYjSiLCd6TPkYd3I8qtW3Nx4o0wjlv3O5LlrFoLSCXIqf+LOcXa9GV2Z1UCOxfb/ZN/pLWZhIrbmVheFaQlBmBT+J0d4IbjMefC4K35ky1rhJOw4wf5Qqc7lD1cmUrYv0d0MAzWA427DMyr07JJ82ajUNj/2iTDaXafidqb7yyO50Quxfn0VQrSuk8cKzZcMnLdUep4gZbZLklQkQvOvglACChh6kQSYg2cRqj8cbecFHYkJMLCOXVrXn9zw2VAQTBOWP5kapyuVwboewTTw3ISWnHQd1idjcTnyKNoArKtoTg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199015)(41300700001)(122000001)(53546011)(7696005)(6506007)(38100700002)(8936002)(52536014)(8676002)(55016003)(71200400001)(66446008)(4326008)(66946007)(66556008)(64756008)(66476007)(76116006)(5660300002)(316002)(33656002)(2906002)(110136005)(54906003)(38070700005)(83380400001)(86362001)(478600001)(26005)(9686003)(186003)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b156a8a-91a2-43d2-1c82-08dab2613c10
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MI3wDc6O2jaPkI/vd6/LvhJF4SUmUDigTeyhv5RtvkX2kAlst3Dw+5kigI3PofS+6zlT6hb8nJrOkioSIdI5Qk6NyXzPYhJyhDdsi/pApZuI/Zg050/2o5zvFLxlvemkmFTewI3wHNBJOUu+1pqvMi9quXVA19yIc1L9zUkvxbC5YJIsGYcOiApH6CMuHaueYMMYzag+m+3ih7mPJkiGd9D37jxREW7frWuKoZo/MMFaGzpJ/QuARhNrr3RNynsZQF4BPDtisK75WZjI0DkdC07Jgcjybnq5DnA5wcH81EDaCVzyij0/MU+A8cdZcADgyrO6JYjRTAhJ7zbarO+JGBh7Mm03S0i8n8IxGpvHrP8DU3sUNSdUE48HBwoGmE8ZTyBLGgfdkQjqlPfPtgNNWEbHU6VIObCHtmG2lx/+POM801/YHKP4mbl/WEWsCalg4ZuNrsMTV+KAVyNe2KG7VJMw3tkt1sKQfNUlDqHLp38CCr2UwjTgS0Wz7bLKJzm1Y6MIRYjPBdoN0ehH/9XU2xarEWNkkNCxsLCgxN/OuDCBwYDVW9gfDq1pG6cRgfdDNEzapfiZrpAmUm5E1jnC4VD2SxclqkUTwVlreC3UW9AIY0HknATaMRVLHGQjBanVU39hp1iy+CCIREfvL6Ai8yfh6PsSgq/BvHozhO4L/YY6OqrGmgrV/S7nLIa2n4vJQ6sxYejxZReTMMsmW7IxliVPZDN9CJ5LxglngXAlhMGxWyMqzSfBEVDGivGDt5oFmzYeDClPWQ9pqmUMPJbSI8Yj3Vd2cLCfwkxTrvUgFsWR9B1zwbKIU2tKivDoD1BgunApmt26cMfBAu+EcCK7Nw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(82740400003)(81166007)(82310400005)(83380400001)(356005)(40460700003)(33656002)(86362001)(40480700001)(55016003)(36860700001)(107886003)(70206006)(70586007)(54906003)(316002)(110136005)(5660300002)(53546011)(186003)(966005)(2906002)(6506007)(7696005)(4326008)(8936002)(26005)(52536014)(478600001)(9686003)(336012)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:06:41.6063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26431547-292c-4a8b-f32e-08dab261420c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8019

H Michal,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Michal Orzel
> Sent: Thursday, October 20, 2022 12:43 AM
> To: xen-devel@lists.xenproject.org
> Cc: Michal Orzel <michal.orzel@amd.com>; Doug Goldstein
> <cardoe@cardoe.com>; Stefano Stabellini <sstabellini@kernel.org>
> Subject: [PATCH] automation: test.yaml: Introduce templates to reduce the
> overhead
>=20
> At the moment, we define lots of test jobs in test.yaml, that make use
> of the same configuration sections like variables, tags, artifacts.
> Introduce templates (hidden jobs whose names start with a dot) to
> reduce the overhead and simplify the file (more than 100 lines saved).
> This way, the actual jobs can only specify sections that are unique
> to them.
>=20
> Most of the test jobs specify the same set of prerequisite jobs under nee=
ds
> property with just one additional being unique to the job itself. Introdu=
ce
> YAML anchors for that purpose, because when using extends, the needs
> property
> is not being merged (the parent property overwrites the child one).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> This patch is based on the CI next branch where we already have several
> patches (already acked) to be merged into staging after the release:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/next
>=20
> Tested pipeline:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-
> /pipelines/671114820

Looks good to me.

Reviewed-by: Jiamei.xie@arm.com


