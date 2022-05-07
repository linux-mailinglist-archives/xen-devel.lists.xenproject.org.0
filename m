Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB651E56D
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 10:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323629.545376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnFRI-00062c-Fr; Sat, 07 May 2022 08:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323629.545376; Sat, 07 May 2022 08:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnFRI-0005zQ-Bw; Sat, 07 May 2022 08:05:20 +0000
Received: by outflank-mailman (input) for mailman id 323629;
 Sat, 07 May 2022 08:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJZu=VP=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nnFRG-0005zK-Px
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 08:05:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d275660-cddc-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 10:05:15 +0200 (CEST)
Received: from AS9PR06CA0298.eurprd06.prod.outlook.com (2603:10a6:20b:45a::6)
 by DU2PR08MB7343.eurprd08.prod.outlook.com (2603:10a6:10:2f2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sat, 7 May
 2022 08:05:11 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::15) by AS9PR06CA0298.outlook.office365.com
 (2603:10a6:20b:45a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Sat, 7 May 2022 08:05:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Sat, 7 May 2022 08:05:10 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Sat, 07 May 2022 08:05:10 +0000
Received: from cc4782ae7878.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B5EC9F4-4945-4F3E-9806-1DF314DF1D0F.1; 
 Sat, 07 May 2022 08:05:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc4782ae7878.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 07 May 2022 08:05:00 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM8PR08MB6371.eurprd08.prod.outlook.com (2603:10a6:20b:363::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Sat, 7 May
 2022 08:04:58 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%4]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 08:04:57 +0000
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
X-Inumbo-ID: 6d275660-cddc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GAO0ZtIuxRpuO+8bhf9sAe+tev9Bi9o8n4kXJKh7O5xq51EAglIkqywNtxm1ZpAPEGpsH+/xiv4qqPIK04Jawo52mLBeAXANa67saHlJ8NkrFCiWhJmk5Cp007H+UkyXTx9ortVR4ABQpDfOIUSHEs0oDw32AFcH9AwJgY4kG3yAYjF4O2/GMSKmuM8AOcbRraWyZAHWY5g1/gX19KVhkbMstsy2YWcf0vlgRrkuzuLgg06vh1fjJzFKUUlSlrH6G3hIg21XZoN28vFfSxjHCHUogJ+GL2IXwhercYK9kOOA0L/tBeT2JaoS5+yB2K4y2xjVRuTGf89/kLbKGtlMvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtoGPaGTeUDaR/NHaU+hBPzcM8I0IL7vUBR/US4uTO0=;
 b=XEHgwHKojvNia1m1O3aIAr6+nk5UUPLvMtApOKUYvucVvezXCBrQuKGO3UBZAHu+Ay+T/DDNcwws8xA6adg2W5Lb73Py9CU30/mVn+e5U7Dp42NNfPbDIoLqqGJc67QidQmUhuVZE+OoRRVY7N7jZKMrdhUarYctPGbfpOaIYdykVIyg+iXauYXpDnBoO/UFe8yz8G73VMYtpMff+bGnAHAYXJHC2Aqj07D+kuM3JVdSSqmaQygdEXusnV+eSP1dOynuK3ijafNs89KKYdJYXSx9w57JW2bo+Z+Dzgc5xDy0wv+lJOxEP6xcX5vVv/nZLUmwoJ5udlybz85Q0qjvuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtoGPaGTeUDaR/NHaU+hBPzcM8I0IL7vUBR/US4uTO0=;
 b=qMSMBPALrlWjiYxPw7gQVM/zyWuAeybzOKp1TYyU5KxAJuXAF3qe/1f0Gc9naG0tx8IsBfseAKtHPm8hPOYUqmmgWsUI2pIz2IxgfF2YV6/YW4IRcwQniHCNDCC5JoUGgQZhiGNx9y/J1s8Oorotcqnm0T1C555U+et+7DJINbI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An/P7SyRCiQ7XgWRDgqPLLJ1wSCWoviTsZ9gGzEeSQaJgPxSP/mFg+m8ZMaj4OVhlO6Ed7s7sY8QpKEpAknHQQcAy1GvM+XZ+r2XbLZLgd4Tyol5XT4Xh1qaLeCANBl9N2dkhY5yCl1xOUfiysco+LfaxKj53VcalGiLoeExIgNSI4yln30xXlOT5dbeFvSbw3gWihn37h9PJyI/WYlXUEpMKqXVK6pwzjwHI2RFAPy2F87QsBAi7Gsp+LlFnYWIrpJh6qfiZJpN5ARmr+qzWCtIIQyuscWZBugtGMsMSq9DvnUYrARgWn/vmHHaOKkF55GGb8kMGKdsCpIydi3hGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtoGPaGTeUDaR/NHaU+hBPzcM8I0IL7vUBR/US4uTO0=;
 b=nBjnb/ookbKqFHny3fMpjuJIAJcjCSgbUJ0ASp/NN0YgngaKhRtMpYlyh/YHRi5rgzMS7zJ4Jepg0Y9Gqk0amHMua3xxS3lWZ7K5dSH48Hnak7TSxXuXzO7PLoLws6jEmSf63KN5NaB6vXGKytWI0k0eprC/51pMD+IMLx2Sgoe2xampclSqPxhVN3tO4ysCKhN1LxtsRI6bRACo2TXyihq/2lIPyRr4VWGnbsfHa4EBEp1uHKrYZz+JdDYnUBAH3JyXu3jznXQfG2eX8B238zZ8NfQGtxbWU92vMCdlmgzbjQMCO2Q5n+OjOYxKe9aUrURoW2wC9sS3jChiYoc9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtoGPaGTeUDaR/NHaU+hBPzcM8I0IL7vUBR/US4uTO0=;
 b=qMSMBPALrlWjiYxPw7gQVM/zyWuAeybzOKp1TYyU5KxAJuXAF3qe/1f0Gc9naG0tx8IsBfseAKtHPm8hPOYUqmmgWsUI2pIz2IxgfF2YV6/YW4IRcwQniHCNDCC5JoUGgQZhiGNx9y/J1s8Oorotcqnm0T1C555U+et+7DJINbI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 4/9] xen/arm: introduce put_page_nr and get_page_nr
Thread-Topic: [PATCH v2 4/9] xen/arm: introduce put_page_nr and get_page_nr
Thread-Index: AQHYYRqQd1unnA/4u0udLI/iXEbzaa0Sm9cAgABx6kA=
Date: Sat, 7 May 2022 08:04:57 +0000
Message-ID:
 <DU2PR08MB73255A68E4FB00430263D832F7C49@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-5-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2205061713070.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205061713070.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3D1BC52727CD0542A602F215BAAD2E68.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be9d3cf0-ff83-462f-a314-08da30004f04
x-ms-traffictypediagnostic:
	AM8PR08MB6371:EE_|AM5EUR03FT059:EE_|DU2PR08MB7343:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB73436374216BF6E870FFDF32F7C49@DU2PR08MB7343.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IvpnA0NVS+ILGIM9emkqq3zY0pBRbepvWMCcwwb0/h5aigQTYraZojV9IfZM8PA3fMlmfd+dTJgle3p37GqApVtDcJx7L9fs2AOhANBJighkcA4u+Vz+vIFS3pqIGtNUOcetYoZWUdDwBQeMS16GpaA4/GhEApZhew7eLT9lSQ99accEcD3yUCdqhTXdhMZ/0EVzcmOdY9DtxfN6CVNqWv+jM9XYpU6tr4pcz1a0nwqiqecjCotkut6NtjestLj/fInnLD7MqHpzwmsQyKjxba5heWIegAQmI5m4KJyXslhmRS5Y0ub0iPvqtYzR+7syAAd5gdxOI0yqje/npPpX93sI7cMjhfbShF1rbw6dsbiKID/SEIc1ellG10xWwyBlSM4PAQbgzsnAgQT43v0JhDHTo87DDm1K1trLkmoGMODh1KAH6i6LgzXLuFW1fCa/kb4PQPuwoH81thLM08lcAHVMlJrJ1TaKSd+xo31MglYxFEU4i9H6J1XzW8YH9f67vZSqOo7jFs2teiLnrhQOmxUhYQ5XoWPG2tV3qf8/GfTB3Tnf1MogZeEXT18X/cmK57o2545kbKNr/CJuds+PKrkYr/aKvSpeNOgB7W1Z6bkr6SYtU8M8szuFOqOrGDt1rnmTg3i5DPO5nWUbsd0KdF+Ze8I+U9Vwu6wKcu6qzixz5lajvw8AObbO6obf8UL0ht8kzfcCwER5OkGUjz5+0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(8936002)(52536014)(122000001)(6916009)(66446008)(186003)(4326008)(76116006)(53546011)(71200400001)(54906003)(316002)(2906002)(9686003)(26005)(508600001)(7696005)(55016003)(33656002)(5660300002)(6506007)(66946007)(83380400001)(86362001)(66476007)(64756008)(66556008)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6371
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	057e0d5d-487c-461a-3c30-08da3000472c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvGXdslT5VkKd5WKsDkuNm6p7Opa7WL0sTVv43QVKwI//3lU7L02Sh+/i0Bs1awSk63NyXxB4QiIYTQlN6hwtWKbexTQLDyyCorQ50hSsIgh+mL23tThxOHnmtvKKDYqzimw0gsZWgRA7flG+mp77mvPr1ROr7JzDVQ4dxo/Rjb/WEU7gvQoQBrR2KUIxqdbgvYWuv8pMJ0DEw09kipfsP4RhY4+TAh43lEZEp88ancHZjAw/v0tEGLal9vowX0pUrVivOBI/oTES1Ps5AREQoEwv0zY+etHEJZKVwtxVjWWhDtpqGu7db05otmphhAk6Xi3cPi+fh9CE/jAbHVOyqZhYd6ZsSKdTx0Uf9lBcq9BtZhq+OfYCz7Ym/e97Ue3rTVIWaqN0ZRMS40nCY0zjDnv8JZA5etS+K9ETQpk+I6lAdPKeaCLRto3lED8eb79t+X8TjipGq9NnxWGPMJw6XuoDr37Z2FJx6vK+LctIYhTNoPPsYGQ1ZzOZyD3zruaUFHA3c+N9JaEBBehz66+uD4Ah9JbYAiY+0beDn1uTE/oADZMgzNgohoMEIjh+AkUEAresnUaWifsvO54xGpPskHcRJE3gQTNM0o6pX4GeNuHmLHl7dyRSPAk0YyjPFxiQvJIpe/7HRucsS201E6P5ZpZ4vVUqXgG1EDmye38pdEs5zg7h8GfmKA72d6vPxhi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(55016003)(33656002)(36860700001)(2906002)(7696005)(81166007)(53546011)(8936002)(52536014)(508600001)(6506007)(40460700003)(186003)(47076005)(336012)(83380400001)(107886003)(82310400005)(316002)(356005)(54906003)(70206006)(70586007)(86362001)(4326008)(26005)(9686003)(6862004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 08:05:10.9420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be9d3cf0-ff83-462f-a314-08da30004f04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7343

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Saturday, May 7, 2022 9:09 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertr=
and
> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v2 4/9] xen/arm: introduce put_page_nr and get_page_n=
r
>=20
> On Fri, 6 May 2022, Penny Zheng wrote:
> > Later, we need to add the right amount of references, which should be
> > the number of borrower domains, to the owner domain. Since we only
> > have
> > get_page() to increment the page reference by 1, a loop is needed per
> > page, which is inefficient and time-consuming.
> >
> > To save the loop time, this commit introduces a set of new helpers
> > put_page_nr() and get_page_nr() to increment/drop the page reference by
> nr.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> > v2 change:
> > - new commit
> > ---
> >  xen/arch/arm/include/asm/mm.h |  4 ++++
> >  xen/arch/arm/mm.c             | 36 +++++++++++++++++++++++++----------
> >  2 files changed, 30 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/arch/arm/include/asm/mm.h
> > b/xen/arch/arm/include/asm/mm.h index 424aaf2823..c737d51e4d 100644
> > --- a/xen/arch/arm/include/asm/mm.h
> > +++ b/xen/arch/arm/include/asm/mm.h
> > @@ -347,6 +347,10 @@ void free_init_memory(void);  int
> > guest_physmap_mark_populate_on_demand(struct domain *d, unsigned
> long gfn,
> >                                            unsigned int order);
> >
> > +extern bool get_page_nr(struct page_info *page, const struct domain
> *domain,
> > +                        unsigned long nr); extern void
> > +put_page_nr(struct page_info *page, unsigned long nr);
> > +
> >  extern void put_page_type(struct page_info *page);  static inline
> > void put_page_and_type(struct page_info *page)  { diff --git
> > a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c index 7b1f2f4906..e565979f3c
> > 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -1537,7 +1537,8 @@ long arch_memory_op(int op,
> XEN_GUEST_HANDLE_PARAM(void) arg)
> >      return 0;
> >  }
> >
> > -struct domain *page_get_owner_and_reference(struct page_info *page)
> > +static struct domain *page_get_owner_and_nr_reference(struct page_info
> *page,
> > +                                                      unsigned long
> > +nr)
> >  {
> >      unsigned long x, y =3D page->count_info;
> >      struct domain *owner;
> > @@ -1545,13 +1546,14 @@ struct domain
> *page_get_owner_and_reference(struct page_info *page)
> >      do {
> >          x =3D y;
> >          /*
> > +         * Consider the minimum case(nr =3D 1):
> >           * Count =3D=3D  0: Page is not allocated, so we cannot take a=
 reference.
> >           * Count =3D=3D -1: Reference count would wrap, which is inval=
id.
> >           */
> >          if ( unlikely(((x + 1) & PGC_count_mask) <=3D 1) )
> >              return NULL;
> >      }
> > -    while ( (y =3D cmpxchg(&page->count_info, x, x + 1)) !=3D x );
> > +    while ( (y =3D cmpxchg(&page->count_info, x, x + nr)) !=3D x );
> >
> >      owner =3D page_get_owner(page);
> >      ASSERT(owner);
> > @@ -1559,36 +1561,50 @@ struct domain
> *page_get_owner_and_reference(struct page_info *page)
> >      return owner;
> >  }
> >
> > -void put_page(struct page_info *page)
> > +struct domain *page_get_owner_and_reference(struct page_info *page) {
> > +    return page_get_owner_and_nr_reference(page, 1); }
> > +
> > +void put_page_nr(struct page_info *page, unsigned long nr)
> >  {
> >      unsigned long nx, x, y =3D page->count_info;
> >
> >      do {
> > -        ASSERT((y & PGC_count_mask) !=3D 0);
> > +        ASSERT(((y - nr) & PGC_count_mask) >=3D 0);
>=20
> Why this change? The original ASSERT is to check that we enter the loop o=
nly
> when count_info is greater than 0. It should still apply even for put_pag=
e_nr
> without modifications?
>=20
>=20

Oh, I understand wrongly about the ASSERT. I thought it was to
check the result count_info after the loop will be not smaller than 0.

Do you think we still need to ensure that? Maybe ASSERT( ((y & PGC_count_ma=
sk) !=3D 0) && (((y - nr) & PGC_count_mask) >=3D 0)); ?

>=20
> >          x  =3D y;
> > -        nx =3D x - 1;
> > +        nx =3D x - nr;
> >      }
> >      while ( unlikely((y =3D cmpxchg(&page->count_info, x, nx)) !=3D x)=
 );
> >
> >      if ( unlikely((nx & PGC_count_mask) =3D=3D 0) )
> > -    {
> >          free_domheap_page(page);
> > -    }
> >  }
> >
> > -bool get_page(struct page_info *page, const struct domain *domain)
> > +void put_page(struct page_info *page)
> >  {
> > -    const struct domain *owner =3D page_get_owner_and_reference(page);
> > +    put_page_nr(page, 1);
> > +}
> > +
> > +bool get_page_nr(struct page_info *page, const struct domain *domain,
> > +                 unsigned long nr)
> > +{
> > +    const struct domain *owner =3D
> > +page_get_owner_and_nr_reference(page, nr);
> >
> >      if ( likely(owner =3D=3D domain) )
> >          return true;
> >
> >      if ( owner !=3D NULL )
> > -        put_page(page);
> > +        put_page_nr(page, nr);
> >
> >      return false;
> >  }
> >
> > +bool get_page(struct page_info *page, const struct domain *domain) {
> > +    return get_page_nr(page, domain, 1); }
> > +
> >  /* Common code requires get_page_type and put_page_type.
> >   * We don't care about typecounts so we just do the minimum to make it
> >   * happy. */
> > --
> > 2.25.1
> >

