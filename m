Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA7D583728
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 04:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376557.609423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGtWO-0004Wd-A1; Thu, 28 Jul 2022 02:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376557.609423; Thu, 28 Jul 2022 02:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGtWO-0004Ua-6c; Thu, 28 Jul 2022 02:45:08 +0000
Received: by outflank-mailman (input) for mailman id 376557;
 Thu, 28 Jul 2022 02:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EL8I=YB=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oGtWM-0004UU-Dx
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 02:45:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47db2a6b-0e1f-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 04:45:03 +0200 (CEST)
Received: from DB6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::12) by
 AM6PR08MB3639.eurprd08.prod.outlook.com (2603:10a6:20b:51::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Thu, 28 Jul 2022 02:45:00 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::11) by DB6P191CA0002.outlook.office365.com
 (2603:10a6:6:28::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 02:45:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 28 Jul 2022 02:44:59 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 28 Jul 2022 02:44:59 +0000
Received: from 121d2fc0c062.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 116B3332-6463-4F1C-A18A-CBF1943C4118.1; 
 Thu, 28 Jul 2022 02:44:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 121d2fc0c062.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 02:44:54 +0000
Received: from AS8PR08MB7322.eurprd08.prod.outlook.com (2603:10a6:20b:441::18)
 by PR2PR08MB4779.eurprd08.prod.outlook.com (2603:10a6:101:1e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Thu, 28 Jul
 2022 02:44:51 +0000
Received: from AS8PR08MB7322.eurprd08.prod.outlook.com
 ([fe80::913a:db53:869e:6f8a]) by AS8PR08MB7322.eurprd08.prod.outlook.com
 ([fe80::913a:db53:869e:6f8a%5]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 02:44:51 +0000
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
X-Inumbo-ID: 47db2a6b-0e1f-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iYQEMQCHmUDj9Yyvr/K0bjzasMkRyOYd3n+lcvTYFb956wKuCfBdtWHQV0njVYWWIxpgu4wmGXpFW+moErvNlZDVRJyMRQzjjg+fKDmg+wHMo5GjunC0sAziSvLc9mu8+EtJugv4wmCY01v1RU5yXU1AszsWB7eH4F9ZOpXYlZo7y9Ph/162NCVbhuozp7uRndAJRfILNsgCClbpDsbDrKw1lkUB58pI/ggo8wsNbfVcBO99quX+gHz92LXajmQasIw7omumkmoC//3ctRIDBaGZE/eCGmgVbxIZD8Pmetf06S46orXvh6X1EvJcAROWtCo6OdPyqrHfkhb2jJlaDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2zw1EPhTDzuVVdza3X2TteNN3V3EcL5T8D0q2uXB90=;
 b=m4i8qizd5nA6GH0iP6XoEGO8unuio1EOnW6jgRorijKbkt1oqWsdf+JjiwNPfPls/dXLpuUUyRskdfD+RgcaBH+Af3AJ3Fosn8cGex0LiIbQyvNju8uNinBU7uwADfSObiKoI2aDuKpWuLkycOSa8Z6qxN0MzssRAAJkCiUMq+uzEUTD+Wp9nV9iGd2O+q6I4UCSTSMUpqPrGusWIOlqW6ieqaTpThHZvCz/4hS8tIF3G1yRFJXnrKrnQWxuUbTJHamXV4a/luk4ExBZ+j38rkoBgu3/i5cEI5796oZaKVPmFCdQ0CoXmNpdhvbrf7mi3wkJ57qaXlGbVsFRGv7+XQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2zw1EPhTDzuVVdza3X2TteNN3V3EcL5T8D0q2uXB90=;
 b=1LcG9xg2l6h5LtP/mF+b0d8ldsa35AD+tQi7PSaKIV06AgOVDeUdAShGrhZaFUd2YYSXTLw/MVBnQr8gTRZlRN0wIn1XeiWIkCRpB7mJgrhQk0RCmtXTJ+RP/EhLLFVNOkEWZpt5PuHSU8jL4fJQxj9RJhrpj288BNxoqbFb4uI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUW7aBBgzkzU/vFRM+y5J0t7ivr4yPdV+oQMRdvX06yEncIBKwhm0lRGK6OLkTzJN5dKyWi8PoBTT5MaOzRvEvb8pRrobhQ6vdbu53g6C5EV/c6XITqTzakx6572CENe9iAPV1GH/uuoyTAImzbPkBIg5OqzDJMu2h9OPxbEjyGw90gxSCXzmOMA2C5lmM/Ba2AlIczqfI2rZT2tEu/U2okOd0twZRZ5LGMxkKiBQsRBI3M9P+SDXMWnihjKMQJv2ORhUaAninTfzeetQZbyiWj13UD08Qx8Dik+hXVJFwRFzexB7eIQ1sz1XPIw7b82lCLIb8pbMPa4BbwiQ9JSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2zw1EPhTDzuVVdza3X2TteNN3V3EcL5T8D0q2uXB90=;
 b=nV2f+XelH2lTZihm0ky4SysGt3+hQ+YY0oN3qL+qFKmjSwghbrOOcBnHVXXxv11f5vZAWXH3+U6Zc9Hd9KkKUuV6DxTQezrMinb5WPWgagyAZNDRwrGgY1wKxrhh9l4IAy4q/5oyAjSCsRKaSuHT/jK2bWe6AgeLg5BUfq11UNVUiuO2i/FOor7BRBwBL4+Puc2Kj1yBXGwcZqPbYRkUZnT4EaWJAsg9m35vfiyLXnVXKSYLYoS1p+jEsgQRKt9lq83E9deIMC6gl0QATIkcHfrEKfpzTSEBt2hx7J9cyeG47islBmjeodohaivetx3DVLk3qz97kfW1NM99r5SkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2zw1EPhTDzuVVdza3X2TteNN3V3EcL5T8D0q2uXB90=;
 b=1LcG9xg2l6h5LtP/mF+b0d8ldsa35AD+tQi7PSaKIV06AgOVDeUdAShGrhZaFUd2YYSXTLw/MVBnQr8gTRZlRN0wIn1XeiWIkCRpB7mJgrhQk0RCmtXTJ+RP/EhLLFVNOkEWZpt5PuHSU8jL4fJQxj9RJhrpj288BNxoqbFb4uI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v2 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Thread-Topic: [PATCH v2 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Thread-Index: AQHYoSMC2K2+YPID60uDh7r2pIYcLK2TFTgg
Date: Thu, 28 Jul 2022 02:44:51 +0000
Message-ID:
 <AS8PR08MB73226670D7687D5B87093A43F7969@AS8PR08MB7322.eurprd08.prod.outlook.com>
References: <20220726190701.1048824-1-burzalodowa@gmail.com>
 <20220726190701.1048824-3-burzalodowa@gmail.com>
In-Reply-To: <20220726190701.1048824-3-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D3627F4B9637BB42AA8A3C15FC2D4EA3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 663e599e-df94-47aa-fa91-08da70432a2a
x-ms-traffictypediagnostic:
	PR2PR08MB4779:EE_|DBAEUR03FT015:EE_|AM6PR08MB3639:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +OX4aEKPG57udGOF21U4ncYg4qY0Z/a/12qaAKPEXqnaoH0lx39NrLfokP6pp1/YuGghZjOzAZBi1V3mO1UtmQZL8l9dUpOGYFiWAMOP4JWzswlspdP/XYMwK45gO3kW3D7TiSWsJUuW+ut+U/bbZZ7YJB0r11o0Yg6rod74sXRkJtkwmhVFt+Uxr3JGFJJsrosr+H/NVaYBeZ2tmme2bZLs+oX7v5j7T6wNSjTscxuepaW02WzsAXyRMNAMfS2L4us75I3xjftw5wBHW7mCFrc5NXY9uCaudP3CBa9TSXGamsCstaZarh1bZk6kLbh6MApnLibd/lhjaz82WoGEyfvpuLf8dIVKtSYgMu3cxrR55zzuWsxKtQE1Smf0Li8kfyOcDKzOLygmCSbpcpX7fJqzwUMwq22wht/8vldo/F15C6UbAlZ+18atlCYsQKxh7AsdWVTpA/H9PksYdVcfA9EbUPrWVDuw+1OAcQwTNjr/CdjqGzTZHStWuGOBwKGFuhcXG54i2ZEkBicfq02lrXYY0lmm8UY6itLiQFmGba4uuVPMhc4Z3f/YALrn9exCq9+IuL0QN6oVhLjvsuygoaic931CWf5tFRoi0876rgBkyClHIHkURlAqGhTSrk6fUsOS4cxPrHjbxnuzy7gHsGr5rbsPW8uu9WKgsnrUCC1vBhsNXe3HeMojNYrFHJgPzazcEHT+aVPtXxAOlINMaHR5fj+ailHMC+yzt+cWesM/aOxJ3ApEjGTX5p1zerlGozTDznc9GfZpKCAZ2/JGDn/bfnAaqQ8T4e4kDPxBALhi5bEv+Mgh+CdYgW65MaDQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7322.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(55016003)(53546011)(26005)(38100700002)(478600001)(86362001)(6506007)(7696005)(9686003)(66476007)(41300700001)(71200400001)(2906002)(122000001)(38070700005)(52536014)(83380400001)(8936002)(54906003)(4326008)(316002)(8676002)(66556008)(66446008)(110136005)(64756008)(186003)(5660300002)(76116006)(66946007)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4779
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63691bbc-562f-4590-8fc3-08da70432503
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CZ7F+/O3aIB2N2Olm6xC1Q9x2fO9tWeSPyG7LOViavo7kV10UqcUKbsIpT/B3QVFDQaxonSGg4FQeQc9W0IEtqk1OkwcKIbjyQBS1LpcsJZDXx6EBiFU4HPLBukkkLbgdc1uZvi6LTLcmM9+w7bqVhmkit4S1bldVvPPC66dIwWhgxAkLRBcpoS/IRnBlGJtG/4Ek3nN/DY13p/wPvzq2fzeHO8JhVutfv0XOtqXYbx5CP4jla6vpvHAdFdTi56pal24YUrs6l3uMx9G2/CfYJallLqHXm3vyekvTYIniW2eeno8PZV0/oM3yWTZEimLUzgIpNqVcP45zvMXO5bhbn/AYXF459e6VgqJhxxUsVqeZaN0N7zFEyfXPL7fBZ6FAlOnTJdc6fVVYQYmokxH+quYhtl7UZIh9NlRWumCO0nLuJBF1m3dT/T7Kc22AQyaJftd09BlJajh1hF5PjL/OnfglNVNAmUqiCmMMXTcnxnSo8SPqxfzGZLmOmpAl2BaewXlKutUNzK3O+su+NR8yT/wzPn0iuHhTfwEikLbdTWh7PlivN5twP3Fe7sAshZs9Mfy4KVVUWzgnjQpQF7ydH7wlqsQDNqSES0BCh60F4NnPscW5MbpWA2q3ZlLbFHOl9K+uVrQulPwN0yyKHQLdlVYITFTqfl7+44BRCehKEKFwiXZtTq2yj5PrqGGKhTgzUEnAOayVpTTYSlvKQxo1i/5qDjSNHsvDJg/hswlW5HEqr/u6A0zsXX7MVdi8YSqJKxkA51SDHHs+TwnbToBHvbsDK2hBb1L8VTU84PIxnXES+wL9nbl8CYIl7Ip17yL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(40470700004)(46966006)(55016003)(316002)(52536014)(40480700001)(36860700001)(5660300002)(33656002)(53546011)(82740400003)(4326008)(82310400005)(70206006)(70586007)(356005)(2906002)(81166007)(336012)(8936002)(186003)(8676002)(54906003)(107886003)(26005)(86362001)(40460700003)(110136005)(6506007)(47076005)(41300700001)(7696005)(83380400001)(9686003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 02:44:59.8925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663e599e-df94-47aa-fa91-08da70432a2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3639

Hi Xenia

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Xenia Ragiadakou
> Sent: Wednesday, July 27, 2022 3:07 AM
> To: xen-devel@lists.xenproject.org
> Cc: Doug Goldstein <cardoe@cardoe.com>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH v2 2/2] automation: arm64: Create a test job for testing
> static allocation on qemu
>=20
> Enable CONFIG_STATIC_MEMORY in the existing arm64 build.
>=20
> Create a new test job, called qemu-smoke-arm64-gcc-staticmem.
>=20
> Adjust qemu-smoke-arm64.sh script to accomodate the static memory test
> as a new test variant. The test variant is determined based on the first
> argument passed to the script. For testing static memory, the argument is
> 'static-mem'.
>=20
> The test configures DOM1 with a static memory region and adds a check in
> the init script.
> The check consists in comparing the contents of the /proc/device-tree
> memory entry with the static memory range with which DOM1 was
> configured.
> If the memory layout is correct, a message gets printed by DOM1.
>=20
> At the end of the qemu run, the script searches for the specific message =
in
> the logs and fails if not found.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Penny Zheng <penny.zheng@arm.com>

> ---
>=20
> Changes in v2:
> - enable CONFIG_STATIC_MEMORY for all arm64 builds
> - use the existing qemu-smoke-arm64.sh with an argument passed for
>   distinguishing between tests, instead of creating a new script
> - test does not rely on kernel logs but prints a message itself on succes=
s
> - remove the part that enables custom configs for arm64 builds
> - add comments
> - adapt commit message
>=20
>  automation/gitlab-ci/test.yaml         | 18 +++++++++++
>  automation/scripts/build               |  8 +++++
>  automation/scripts/qemu-smoke-arm64.sh | 42
> ++++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 3 deletions(-)
>=20
>=20

---
Cheers,
Penny Zheng


