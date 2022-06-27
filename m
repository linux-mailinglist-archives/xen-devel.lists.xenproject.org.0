Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93B55BA34
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 16:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356747.585042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pIP-0003rK-8m; Mon, 27 Jun 2022 14:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356747.585042; Mon, 27 Jun 2022 14:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pIP-0003pX-5R; Mon, 27 Jun 2022 14:00:57 +0000
Received: by outflank-mailman (input) for mailman id 356747;
 Mon, 27 Jun 2022 14:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8b=XC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o5pIN-0003pR-K6
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 14:00:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20086.outbound.protection.outlook.com [40.107.2.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f5887ef-f621-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 16:00:54 +0200 (CEST)
Received: from AM6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::32)
 by GV1PR08MB7802.eurprd08.prod.outlook.com (2603:10a6:150:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 14:00:50 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::4) by AM6P191CA0019.outlook.office365.com
 (2603:10a6:209:8b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Mon, 27 Jun 2022 14:00:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 14:00:49 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 27 Jun 2022 14:00:49 +0000
Received: from cf96ba6acd44.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F45EDAFF-1E1B-4612-BF2E-C1C2F99FC221.1; 
 Mon, 27 Jun 2022 14:00:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf96ba6acd44.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jun 2022 14:00:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6594.eurprd08.prod.outlook.com (2603:10a6:20b:36a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 14:00:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Mon, 27 Jun 2022
 14:00:40 +0000
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
X-Inumbo-ID: 8f5887ef-f621-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P7RqHL4/mo6aC47eFDLm29W/KlJ81zKHE4L6GqGccx+3+i34RPwckwCYqY7zBku4z1VnaoVxlWviEUI9u8RNtoVO3CLVmO2pOATHfjLxfkQ6sXgHv3SxyDrPssiAyWKXKYHyTw8HOzkYgSsgoyA95vjBsohbqlOhEytIbWt5fh76bD5LM0z7ZmUGqNf252TBjun8lHgSfdCYL20jqNJlr7rVuajr13kBHVrTDRYfkjdimwC4KZ2E3OLvitdhKp/PJTRX8YCMW5rXDXVwO3eH4E+jgPY1I8OFyBM442lu9nfgsBXpqS/3iozx2xZY1jWDMd3EercKiuFhZCS+9VXqkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw/a06kpE9QmGdv1iXE6qe/tbKTvHBbhcSF5ltAIUnY=;
 b=VsuwpigZGgZ0OmX+2LhUlujvdHIbfBFZPCogcDIGmasGk2Vm+uCwbJKVEUQKrOVCapdMUmjLqR3VblAAEOfwD4Xycvx4+JPq0TxsqcAwTUqQZT+IywDiXxTBlpvSd6FkXjFI5l6M4PvVRSmXz1ENubIlKVzKeAnVRSgbqqjceeQidbdrSrUTp59/ylSL7YZDDy/5xJwTWIarIJFMn47aG2rCYWKYAQkbgjYmq3bPqZCBFlEkxgsujXjlV/tyhk05xh1WiYUscivAAFg+HDG5wIP01+IgcI1aTZM3pYs3saowKiqjP2pkdEQtWdUJn8BXSH0nC3Pz9k7e6EmLPKMaxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw/a06kpE9QmGdv1iXE6qe/tbKTvHBbhcSF5ltAIUnY=;
 b=rERTFDeuHc8tTmHzvFEMmooeJRRmwPntPlnJm/E0+ELVinato+6NxbHJy+FPC4DJt2nwE3wQ82rGwv1PtJbJzLdf7dECLQ244MIJ38lAErpUTtyU2VeDZ4bLS+zMQzDPZs730E8+piaG7PQM+YP8URx9fk01pM5b+3icEcIRzI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53ac89e7dd038888
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k109H30vt1Xtlhw+BXY9DIyoM7p6A+lVCBQkBoc8DXEyCwlvLbajZvDM9W0Phzx+54zoZCaQK6RvteN7q6rbWqFgoDHUdrhRwDNpLsJ1GuFz2O/hRf74QXEOaDJephB1JvyAGSbeODdG4A31KOoceq/mr1hDWHMyNkDUuJU6RWbWgoOl3wAGaWk1xmFASMZ5W1/9PtFjGSc0Ra7jtqYyfbuu9kdq6zQtk7MRLsuH8bCXtHNvkJ153I8gBjTcWwc/72A+4qntXrMro2qR84mFZvaTI6gtPdSDywg20pX6CpsG3CDQuHdV7cLzHH0S42C/lxfXARdSpknkjkLoWfqqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw/a06kpE9QmGdv1iXE6qe/tbKTvHBbhcSF5ltAIUnY=;
 b=K3xgx/i/GdNkwPr7qYQZD27NejfstKIfPL7grHLeCe1qSqAx3mwyFCXEuWQ1Y1k4OR1XgS/dCdWFuAsard/Uaz+4o2ZMlY9On1zIgJbfuS0Fn970NqXJaeY0Zygzq6TOKdwtbeT5UT+fVg1NdFvpc/jzThacaJNgz6KeViSu7ubSQ/HPkSH6mJAg3cCkYx4w4PlfiStDbaTRq8uezPnSRA2LamjNbQecTf+GVsbxf2hYA/pJCVkVtzmgotdNLnJrJI2NTwwFux+YTDI6XLpkHzRdgLqEFTNB91xc6s5e9HDuJfSX7MZ8CU34XX9BjbFD77lj87zWbku+M4I5BvMiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw/a06kpE9QmGdv1iXE6qe/tbKTvHBbhcSF5ltAIUnY=;
 b=rERTFDeuHc8tTmHzvFEMmooeJRRmwPntPlnJm/E0+ELVinato+6NxbHJy+FPC4DJt2nwE3wQ82rGwv1PtJbJzLdf7dECLQ244MIJ38lAErpUTtyU2VeDZ4bLS+zMQzDPZs730E8+piaG7PQM+YP8URx9fk01pM5b+3icEcIRzI0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/arm: head: Add missing isb after writing to
 SCTLR_EL2/HSCTLR
Thread-Topic: [PATCH 3/7] xen/arm: head: Add missing isb after writing to
 SCTLR_EL2/HSCTLR
Thread-Index: AQHYh6p3WB7MoRj1SkKsSuzOQQLxTq1jTTwA
Date: Mon, 27 Jun 2022 14:00:40 +0000
Message-ID: <ED856863-B44D-44D2-9161-5878AB72F2C2@arm.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-4-julien@xen.org>
In-Reply-To: <20220624091146.35716-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1c04eecc-7611-4f06-127a-08da58457109
x-ms-traffictypediagnostic:
	AM8PR08MB6594:EE_|AM5EUR03FT042:EE_|GV1PR08MB7802:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G5YmvvfSXh64Hr1jj79Ey6AuBr2FL8/Ka1Z9Eoiyf4tgvokV8zzM/bBSYrlUYcms8T5/pjC4Qy32tv8cfEs8rY9v0zuJcKrvQeXUaZghJSAmn1x3GDyx/2PR4mS6YKFQcso8TQ0tEWsMVDOSXr4LXw15IurGXogO+MGD9wEQQxwrq9IvAt0+TxNUWxncjmoGwboCNkCx4dlrOzYsWsP0xDFQgaTy1a3Dm+DHPK5Wlvx2N+U8lBkfPwt3ISD3O3yrdzvbsoAph3eoNd5J/FdYpad15yRqgzIW8LRr+C5vgEsc6Q2KuBHKGkXUhc/l1bTJ7XtXjUmd9tlgQ+EIgB1f8zxMw7sCjU7xiN5pbrgUWKXD0F2dZJYKz59hoyIkzju9D8pz/eqzrlagGBD31/cfHodeqBWsSRemSJUxpw1gE0w6ZfmCRpvqKLQ8r+5Dlxrgj4Vd5DgGYy7GhEChj1pP4KNny80I3gFq1UuBdrL3l2G7HjTXcqfBOQUaP+jEDq8FZbyICenR8ovX0qFFv7ZafkpnxFPzddL112LhD0z+jjClnr40AoHzY+8c+ckOfWf1XtaR0OJIZnTURr470ZD0D1fNCxidAe7b8PCv9l/+KP+LajTxjXZKDmuZKUE/9ntuQ3eQiFE4AWn/SdYc2RMqIFQFb2gKIaoIQttU04OYECuAvuFBZgXJu3gtxlk6gwK4Gx402MyjINBm8Efv061d06Z155SFWRrNOY+sL0kjScXAe+wA0y3G14zph77sADg76KJZy11XrVIgKNPzcR5Jbp7wNJIFOarinRIeOZaJ4i85qe9HyiN9ld+mmXjKJEVtaBPYrgRVjBVF/qu4DDGRpg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(38100700002)(71200400001)(66446008)(4326008)(41300700001)(66476007)(122000001)(54906003)(66556008)(316002)(38070700005)(33656002)(478600001)(53546011)(8936002)(76116006)(6506007)(8676002)(86362001)(2616005)(6486002)(4744005)(36756003)(26005)(2906002)(6512007)(66946007)(91956017)(64756008)(186003)(5660300002)(6916009)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D0C47D382EFB247B659B3FC72B53BB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b11ac74-9a49-413e-714e-08da58456b6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/p3D0rwG7Z6Ymyv8/2WpXmIYlntxWxyDfZibdD3+o7fTa/DOYJ6vAmhB8w6Tgjfz4VkKUCqZdL4PbMgKOjyBgRxwZSbZrtMhaqKUp06ZTr5yK+iC+YFdkl6y7BjpM5MEnXtnI3HuV/GAtnksPfDDy9cZLrtQg5xTpmvZ5BrWqJ1O5sXcBoKcpCXQk3sSurodVgfD+iaH/hSPxOB5mj3c9iEJIdIqId3UyaFr7mGmugHUzIezeDLGjWt33jgD5pXLnxx/x+d0a/BERH9Hhc5n8kr7b39ituROmnWMNxUvZkdCJ0kf/dgkvT4xEYBsA0s9+p2cNx3LSrn6hLYGJ7wRhdNKhtvKAKGLaRktGYEjB0GgXKsGjYmp8Z4PS7AaKGFv9HrC1qYnLw7TOoYVw8eoyVO0tw+Lirmxr/teOWawUErb6EdjoEtC48ZDaAK+azpzdch0wme/dA6znkz3adziYtywFxqi7uk2ltkJXSn/IwSy0y6Lf7qwsVeADg0kcQmdUR0UppgB8SLG05vp3Cv9vlGCi7INt814XD7q0a2Ig8TjSQW44BuCHmaNq3chXmrdBCx2+rLmu2o0IxHkHQfEz79FZsZPjx15uXt7WdjUHzp+xj7TolPK6DFnttzffiewFktjKtAD+/SMj9QhNFZ3FY6diamEtsrOLBkgamJzeukDF1FQ+LThk7xUepFKEKqKBodOAFcH78d8ScIc5qzw4/8M6KmHK91ZjhgAL5qaY6k9TuN8TFxibeC227CA4taw6Bx97P0nrIAs1+KK9gRUUpURDlxfysdxPw29e30Jve3f/q+RB5T5gp5pmYhoOUEV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(40470700004)(36840700001)(46966006)(6862004)(86362001)(8936002)(5660300002)(336012)(53546011)(47076005)(83380400001)(40460700003)(356005)(4326008)(6512007)(6506007)(33656002)(8676002)(26005)(70586007)(41300700001)(70206006)(107886003)(4744005)(2906002)(2616005)(36756003)(6486002)(54906003)(40480700001)(81166007)(82310400005)(316002)(186003)(36860700001)(478600001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 14:00:49.8129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c04eecc-7611-4f06-127a-08da58457109
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7802

Hi Julien,

> On 24 Jun 2022, at 10:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Write to SCTLR_EL2/HSCTLR may not be visible until the next context
> synchronization. When initializing the CPU, we want the update to take
> effect right now. So add an isb afterwards.
>=20
> Spec references:
>    - AArch64: D13.1.2 ARM DDI 0406C.d
>    - AArch32 v8: G8.1.2 ARM DDI 0406C.d
>    - AArch32 v7: B5.6.3 ARM DDI 0406C.d
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


