Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D643C54F3FC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 11:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351212.577785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o280M-00005q-Eu; Fri, 17 Jun 2022 09:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351212.577785; Fri, 17 Jun 2022 09:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o280M-0008Ux-8m; Fri, 17 Jun 2022 09:11:02 +0000
Received: by outflank-mailman (input) for mailman id 351212;
 Fri, 17 Jun 2022 09:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhX=WY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o280K-0008T4-9L
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 09:11:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65c88d88-ee1d-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 11:10:58 +0200 (CEST)
Received: from DB6PR0501CA0046.eurprd05.prod.outlook.com (2603:10a6:4:67::32)
 by DBBPR08MB5900.eurprd08.prod.outlook.com (2603:10a6:10:200::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 09:10:55 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::73) by DB6PR0501CA0046.outlook.office365.com
 (2603:10a6:4:67::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 09:10:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 09:10:54 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Fri, 17 Jun 2022 09:10:54 +0000
Received: from 6c1c159030a3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8A341FA-B39D-4D0F-8721-6D657E6A6B30.1; 
 Fri, 17 Jun 2022 09:10:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c1c159030a3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 09:10:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7025.eurprd08.prod.outlook.com (2603:10a6:20b:34c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 09:10:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%7]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 09:10:47 +0000
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
X-Inumbo-ID: 65c88d88-ee1d-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FJVcRNHN87rBZdUHtodJHr6hzKrbEFjN+LB13qqgEv9e8szT0jsTveX7jKV7e6OqBwDvyZE3DnqzN5pfTJaivyEA0TSE1FrY7OEEksK6ph7XJS0GP9s7vIanEliEN/FRq7CTPA8vEvHDMZmpoSoP9mUCpPZrro7k5Pr1nOSB40m6jnEmpfCdpF5zAF2ABGzk7GfVNsemNokh4wVUW4xsT/mmMmeoJEMqSbSjrPFOIOtEwMeeynGKBhjzIO2q+A1SaEsvfaCiLV6yUuuM0bIWBsvTyTRLoUwv12XWb+5SRQe1uX6wDbJHI7KToLqnC12l4MBSxyATIKvdnq+8gXnQaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6/3qIlKtdAn4aw+vT17R/j1Fx80o58vgW1a2Swb+lA=;
 b=B1RWD7xAwOokwrUozjzAl+27AMsVf5of7q+q4RnmNgpg4Z1y97EMdUJaEpYNp9lsRP08Z/JD9IT1xrPzIKCXpJRXwePopJcbLc/VQASRAm813CsVV1/e0AcntLEtioB0cKoUPBLrybvQM9yuijKRRNsStgYXePx/Mnis1VNVsvN6OMRTUchePBxGBHw1M3eu+VUUHDZ4RiZJD/d5/2vrQNCLqXgs6Dg8ein6cK7FuXZnAuRvVUgE3L/QVSv/B9mFImdCpwDTveQkw+sn6/D/gTcjg76cnBxjl1pan8KfGfAYDTdiLmS3DMHfGyT29+cx8jeEiUrNTHbzRjIIjibaeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6/3qIlKtdAn4aw+vT17R/j1Fx80o58vgW1a2Swb+lA=;
 b=ELSi8ehZ/pEBA81h5YF6SPSi4kzDwEJDjGxSWiIMqHttSKgMTNVmmUaXMg3EboTQ/wd5nHvuLf7NeU8bWWIKkLmqlEXfDmosRD3t7ECzznz/GEtJ48NJGD4af49UFYXPkPq3fNKyw0G/Vix/voCpB5xJwOv5v4BFXUMaWJHu0SU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfKWpF0tbj3v/GHoDoK8WA+t9/3roN37zg2Gbi94UZIz3rCQDVTfeLBNdl+pKyhyRvd/eVqlbLWXAy24VItz00hlf8JulcUTIsHBGbMYOT3Z/txZQHdK6vmtZaSQ+pl1UFXmndn+gJk+ZIV3joB1M5KBKa4xP8OZvsZ4QN2xXU9fNcAkNyFmNbL1cLylETV4VZmGvg9n5CAvluRBzCCiGQgiqBnEYa1H7N6zK9pkPCqHBD4AK9ata/AcHWA3h/r6NBkZ8nT1sMLt3fg+VccrIV9fKJOtvkSDqwj9zmHu7DVPJ+M2Yaxj4NNRIE9+b+0nkUvaeokqOHtSsp5GQDL6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6/3qIlKtdAn4aw+vT17R/j1Fx80o58vgW1a2Swb+lA=;
 b=H718lRy3LXeJg3ev5mzNJ1pBD8IWiCltzV2maNEOyYC3FJdrfCpXPp4qWnjdxySC1wMyRCQ4jf7H3JtzNXqdme1mivObW2DWbTMYH4IAbpfuZPLR6FqEIfgaIciXmc/17mAg0WaI3fxRfPnKJI9iaoaoiRbjhTCkHNJmSU+032zdxaGcIwPnvW4IRciMSh9ty3sEdRhpLPBe5hO7+l/2fwvrWgDoCH0pX31GjlOJNLeR8f/6aklHat2I6SvNQvhVwfh6TdLgpMR1T9Hst9zwtoyWaq8TnDYjQfqO2Fc+0ioOZ8wHYIvQogZosnJQYd3DPj60FDmJBiPz+5avnOrziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6/3qIlKtdAn4aw+vT17R/j1Fx80o58vgW1a2Swb+lA=;
 b=ELSi8ehZ/pEBA81h5YF6SPSi4kzDwEJDjGxSWiIMqHttSKgMTNVmmUaXMg3EboTQ/wd5nHvuLf7NeU8bWWIKkLmqlEXfDmosRD3t7ECzznz/GEtJ48NJGD4af49UFYXPkPq3fNKyw0G/Vix/voCpB5xJwOv5v4BFXUMaWJHu0SU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiamei Xie <Jiamei.Xie@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early
 uart
Thread-Topic: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early
 uart
Thread-Index: AQHYZNkcOiKSsWrCWE+HAY/+6cemHa0hxzQAgDFVPLCAAGXSgIAABzuQ
Date: Fri, 17 Jun 2022 09:10:46 +0000
Message-ID:
 <AS8PR08MB799161072CDA77146D5AF5FE92AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-2-wei.chen@arm.com>
 <46f6a909-2f77-021c-a069-6a8f827e53fc@xen.org>
 <AS8PR08MB79912A6797514E583095CBFC92AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <8c03895e-4134-53c5-2248-e8afe4be7b25@xen.org>
In-Reply-To: <8c03895e-4134-53c5-2248-e8afe4be7b25@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A9BFB2A4AFBB7E49B42049F134C1A677.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 30b51604-f4f9-47a6-486c-08da50414899
x-ms-traffictypediagnostic:
	AS8PR08MB7025:EE_|DBAEUR03FT017:EE_|DBBPR08MB5900:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB59005FF5F56C9E4A12C30D7C92AF9@DBBPR08MB5900.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C31YVjFUJxikyI2BnswadPpteXWC4GyHDgT7Q3E4c26BZMtd1FKpQKtyC+F2IYmEyPU6wHsHUSgmmeadwgheQy4B5G3tH9svmXWFhB1QCHL1TSekqeNBTG6J9QL+R1WpTyHcSauWEoRbYI+u6OHQ03xGx4Nha4Nfd2suVK2w43s8NCbiPPSStNHEYVhNH/sskIu2lZTEJ0Auea5psIA3exG35E9YW21TonwMCvtbkzgW0BJs72mbxotV05Un7QgISVOOA1boi/SI5bCT/s7Ea3ATEQmsvzu6xbqFHjLZL2qV91tWO8l5uWth6R+0wdV73x9f5wMF0sbsLUX11xT12f/nkjOFIzbCk4QhHotPLOPsJjF8mSuUgoIJ8Y2KkroHCEHRdlJ/Vsj6SoJ0XcTdDbJDgRtAF8ZTl5I3VAOPkUFRQK88awnYueWnXAGOj213aLyehbAvKD5qO/WBUQMcPYoNMpp+LDFbR9UxfjqAO1+/XxBryrMJSxZdmAlHGxTLN0iu+0/x6k7gg8cg/QON1UXRo2PRMNlUeeGG7vAigPaAijtZHdnr9EOWqCWguwucgjL7P/SyOQvoveyLIxV7L6/FCY/M8XbEZ0ArHAHCLykTX11paUoKA6+0Vm3ZYgFunb9X2WgzOpRGDCQROWyRGH4SzyVAg4nSXWqWYZGSYJnaXIGroAmRa0vhAPdPN8ysy0uHV+hf61eJepG8Bvl3hQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(71200400001)(38100700002)(8676002)(110136005)(8936002)(66556008)(86362001)(5660300002)(66476007)(7696005)(186003)(6506007)(53546011)(498600001)(9686003)(26005)(316002)(76116006)(66946007)(54906003)(2906002)(66446008)(33656002)(4744005)(52536014)(122000001)(38070700005)(4326008)(64756008)(83380400001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ca51468-9373-45df-5eb2-08da504143f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zCwhJuth/2cEIrUJKMsNruT04BFGKpdI/t1+uJVTUfiGcqC3izt3bUSpS8jJdFoxCLm5UpeP2LmFqHb8Q/JK4Az2fqHlHk/psD88Ptaro4lOoyrICdiEmh/+BQuEd3CJ+L3KVglFPwBM7JZ2K657iVY2LXvhNJgYTV9H/9dY/OIZADLivDUPgFEKhi/4+vj7/SVlF6Ejat5AVrcHnPlcMG/jD4rDwfxjrhfivqgWhWtq4ouvcgkJLQABQK4qi8PUDsUv3MQ7Wf2pLZMgeLHmOU0w9x9FKRZ8ukYoSi4bKv0+NfOiafM3rskHqxiZhP6xXoCfID75IAHmxw5tiGNA01y3sv81Z3VXWMQXa235jExRbaH8UoRmCKRdWWaA9VLONMHP51py/i5017gf6KzMDZOZqrbuD/hoDxwghqnQwQ/hiRrbvYDns0EMpX+6Byhi5IvhPux3zQES7iok9oKQd0eK+A8ttqEp3Hh5b61tI+/YmWxTRF6lWAwxOl+mK0Uekp20DqUZLfEWi2U51hZ4OvfCsrAQ68oWGD20WQCBFp9RH9FoKEcWXSNwe+WcOVxJSDzpfPjyxx3V2w3PbOClCTCHSv5aL8lBed3vj/WQSi9Llw8tx/FYTDNPiPxvPD22zucryOx9BbDS0TAJ84TWOs5Ol9Os8nynyQ3cK4+Kzbk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(8936002)(54906003)(316002)(356005)(6506007)(82310400005)(2906002)(81166007)(86362001)(83380400001)(107886003)(52536014)(40460700003)(36860700001)(26005)(4744005)(9686003)(8676002)(70586007)(508600001)(70206006)(55016003)(4326008)(7696005)(336012)(110136005)(5660300002)(47076005)(53546011)(33656002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 09:10:54.7291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b51604-f4f9-47a6-486c-08da50414899
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5900

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IE9uIDE3LzA2LzIwMjIgMDQ6MjcsIEhlbnJ5IFdh
bmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiBIaSBIZW5yeSwNCj4gPj4NCj4gPj4gSGksDQo+
ID4+DQo+ID4+IEkgaGF2ZSBjb21taXR0ZWQgdGhpcyBwYXRjaC4NCj4gPj4NCj4gPj4gUGF0Y2gg
IzMgbG9va3MgdG8gYmUgc3VpdGFibHkgYWNrZWQgYnV0IEkgYW0gbm90IHN1cmUgd2hldGhlciBp
dCBjYW4gYmUNCj4gPj4gY29tbWl0dGVkIGJlZm9yZSAjMi4gU28gSSBkaWRuJ3QgY29tbWl0IGl0
Lg0KPiA+Pg0KPiA+PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgaXQgY2FuIGJlLg0KPiA+DQo+ID4g
SUlVQywgdGhlIGxhdGVzdCBzZXJpZXMgKHY2KSBbMV0gaXMgcHJvcGVybHkgYWNrZWQgYW5kIHJl
dmlld2VkIGZvciB0aGUNCj4gd2hvbGUNCj4gPiBzZXJpZXMsIHNvIEkgdGhpbmsgdjYgb2YgdGhp
cyBzZXJpZXMgaXMgcmVhZHkgdG8gYmUgbWVyZ2VkLiBTZW5kaW5nIHRoaXMgYXMgYQ0KPiA+IGdl
bnRsZSByZW1pbmRlciA6KQ0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuIE15IGNvbW1l
bnQgYWJvdmUgd2FzIHNwZWNpZmljYWxseSByZWZlcnJpbmcgdG8NCj4gcGF0Y2hlcyBpbiB2My4g
SWYgdGhlIHBhdGNoZXMgYXJlIGZyb20gYSBuZXcgdmVyc2lvbiwgY2FuIEkgc3VnZ2VzdCB0bw0K
PiBwaW5nIG9uIHRoZSBleGFjdCB2ZXJzaW9uPw0KDQpPaCBvZiBjb3Vyc2UsIG15IGJhZCAtIEkg
dGhvdWdodCB0aGF0IGVtYWlsIGRpZG4ndCByZWNlaXZlZCByZXBseSBzbyBJIHRyaWVkIHRvDQpj
b250aW51ZSB0aGUgZGlzY3Vzc2lvbiB0aGVyZS4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEg
SSB3aWxsIGtlZXAgdGhhdCBpbg0KbWluZCBmcm9tIG5vdyA6KSkNCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

